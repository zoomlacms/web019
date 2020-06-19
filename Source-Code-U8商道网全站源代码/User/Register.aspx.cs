using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml;
using BDUBLL;
using ZoomLa.API;
using ZoomLa.BLL;
using ZoomLa.Common;
using ZoomLa.Components;
using ZoomLa.DZNT;
using ZoomLa.Model;
using ZoomLa.ZLEnum;
using MySql.Data;
using MySql.Data.MySqlClient;
using ucApi;
using ZoomLa.SQLDAL;
using System.Text.RegularExpressions;
using MSXML2;

namespace ZoomLa.WebSite.User
{
    public partial class User_Register : System.Web.UI.Page, ICallbackEventHandler
    {
        protected string callBackReference;
        protected string result;
        protected string callBackcard;
        protected string callBackParent;

        private B_User buser = new B_User();
        protected B_UserBaseField bmf = new B_UserBaseField();
        protected B_ModelField Fll = new B_ModelField();
        protected B_Model b_Model = new B_Model();
        protected B_Group bgroup = new B_Group();
        protected bool isok = false;
        protected B_Sensitivity sll = new B_Sensitivity();
        protected B_InviteRecord binv = new B_InviteRecord();
        protected B_Redindulgence bred = new B_Redindulgence();
        protected B_Microb bmic = new B_Microb();
        private ApiConfig ApiCfg = new ApiConfig("~/Config/pdo.config");

        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            TxtPassword.Attributes.Add("onKeyUp", "f_checkrank()");
            //TxtPassword.Attributes.Add("");
            if (this.Page.IsPostBack)
            {
                ViewState["SendID"] = base.Request.QueryString["SendID"];
                string mbinv = Request.QueryString["inv"];
                if (!string.IsNullOrEmpty(mbinv))
                {
                    M_Redindulgence mredind = bred.SelectByUrl(mbinv);
                    if (mredind != null && mredind.id > 0 && mredind.isUse == 0)
                    {
                        ViewState["MbInv"] = mbinv;
                        ViewState["SendID"] = mredind.UserId;
                        Session["Mbicroid"] = mredind.id;
                        Session["MicroLogin"] = 1;
                    }
                    else
                    {
                        Response.Write("<script>alert('此邀请函已失效,换一个试试?');location.href='Register.aspx'</script>");
                    }
                }
                string str = base.Request.Form["ControlTreeInfo"];
                if (!string.IsNullOrEmpty(str))
                {
                    string[] strArray = str.Split(new string[] { "$$$$$" }, StringSplitOptions.None);
                    if ((strArray[0] != SiteConfig.UserConfig.RegFieldsMustFill) || (strArray[1] != SiteConfig.UserConfig.RegFieldsSelectFill))
                    {
                        base.Response.Redirect(base.Request.RawUrl);
                    }
                }
            }

            //用户配置中心选择的必填项目
            string[] strArray2 = string.IsNullOrEmpty(SiteConfig.UserConfig.RegFieldsMustFill) ? new string[0] : SiteConfig.UserConfig.RegFieldsMustFill.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
            //用户配置中心选择的选填项目
            string[] strArray3 = string.IsNullOrEmpty(SiteConfig.UserConfig.RegFieldsSelectFill) ? new string[0] : SiteConfig.UserConfig.RegFieldsSelectFill.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
            //必填
            foreach (string str2 in strArray2)
            {
                HtmlTableRow row = this.FindControl("TR" + str2) as HtmlTableRow;
                if (row != null)
                {
                    this.TableRegister.Rows.Remove(row);
                    Literal las = (Literal)this.FindControl("mustTR" + str2);
                    try
                    {
                        las.Text = "<font color=red>*</font>";
                    }
                    catch (Exception) { }
                    this.TableRegisterMust.Rows.Add(row);
                    string dd = this.TableRegisterMust.ToString();// = this.TableRegisterMust.InnerHtml.Replace("{must/}", "<font color=red>*</font>");
                }
                else
                {
                    B_UserBaseField ubf = new B_UserBaseField();
                    DataTable tbles = ubf.Select_Where(" FieldName='" + str2 + "'", "*", "");
                    B_ModelField FLL = new B_ModelField();
                    if (tbles != null && tbles.Rows.Count > 0)
                    {
                        HtmlTableRow r1 = new HtmlTableRow();
                        HtmlTableCell c1 = new HtmlTableCell();
                        string htmls = Fll.GetShowStyleUser(tbles.Rows[0]["FieldID"].ToString(), tbles.Rows[0]["FieldAlias"].ToString(), tbles.Rows[0]["FieldName"].ToString(), DataConverter.CBool(tbles.Rows[0]["IsNotNull"].ToString()), tbles.Rows[0]["FieldType"].ToString(), tbles.Rows[0]["Content"].ToString(), tbles.Rows[0]["Description"].ToString(), 0, 0);
                        htmls = htmls.Replace(" class=\"tdbg\"", "");
                        htmls = htmls.Replace("align=\"right\" class=\"tdbgleft\"", " style=\"width: 15%\" class=\"tdbgleft\"");
                        htmls = htmls.Replace("class=\"tdbgleft\">" + tbles.Rows[0]["FieldAlias"].ToString(), "class=\"tdbgleft\"><b>" + tbles.Rows[0]["FieldAlias"].ToString() + "</b>：*");
                        //htmls = htmls.Replace("<a href=javascript:void(0) onclick=\"SelectValues(20)\">管理选项</a>", "");
                        c1.InnerHtml = htmls;
                        r1.Controls.Add(c1);
                        this.TableRegisterMust.Rows.Add(r1);
                    }
                }
            }
            //选填
            foreach (string str3 in strArray3)
            {
                HtmlTableRow row2 = this.FindControl("TR" + str3) as HtmlTableRow;

                if (row2 != null)
                {
                    this.TableRegister.Rows.Remove(row2);
                    try
                    {
                        Literal las = (Literal)this.FindControl("mustTR" + str3);
                        las.Text = "";
                    }
                    catch (Exception) { }
                    this.TableRegisterSelect.Rows.Add(row2);
                    string dd = this.TableRegisterSelect.ToString();
                }
                else
                {
                    B_UserBaseField ubf = new B_UserBaseField();
                    DataTable tbles = ubf.Select_Where(" FieldName='" + str3 + "'", "*", "");
                    if (tbles != null && tbles.Rows.Count > 0)
                    {
                        HtmlTableRow r1 = new HtmlTableRow();
                        HtmlTableCell c1 = new HtmlTableCell();
                        string htmls = Fll.GetShowStyleUser(tbles.Rows[0]["FieldID"].ToString(), tbles.Rows[0]["FieldAlias"].ToString(), tbles.Rows[0]["FieldName"].ToString(), DataConverter.CBool(tbles.Rows[0]["IsNotNull"].ToString()), tbles.Rows[0]["FieldType"].ToString(), tbles.Rows[0]["Content"].ToString(), tbles.Rows[0]["Description"].ToString(), 0, 0);
                        htmls = htmls.Replace(" class=\"tdbg\"", "");
                        htmls = htmls.Replace("align=\"right\" class=\"tdbgleft\"", " style=\"width: 15%\" class=\"tdbgleft\"");
                        htmls = htmls.Replace("class=\"tdbgleft\">" + tbles.Rows[0]["FieldAlias"].ToString(), "class=\"tdbgleft\"><b>" + tbles.Rows[0]["FieldAlias"].ToString() + "</b>：");
                        //htmls = htmls.Replace("<a href=javascript:void(0) onclick=\"SelectValues(" + tbles.Rows[0]["ModelId"].ToString() + "," + tbles.Rows[0]["FieldID"].ToString() + ")\">管理选项</a>", "");
                        c1.InnerHtml = htmls;
                        r1.Controls.Add(c1);

                        this.TableRegisterSelect.Rows.Add(r1);
                    }
                }
            }
    
            #region bak
            //if (SiteConfig.UserConfig.EnableCheckCodeOfReg)
            //{
            //    this.trVcodeRegister.Visible = true;
            //}
            //else
            //{
            //    this.trVcodeRegister.Visible = false;
            //}

            //string html = bmf.GetHtmlUser();
            //html = html.Replace("<tr class=\"tdbg\">\r\n<td align=\"right\" class=\"tdbgleft\">", "<tr id=\"trTrueName\"><td style=\"WIDTH: 15%\" class=\"tdbgleft\"><b>");
            //lblHtml.Text = html.Replace("</td>\r\n<td>\r\n", "</b></td><td>");
            //string html = bmf.GetHtmlUser();
            #endregion
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ViewState["ruid"] = Request.QueryString["ruid"];
            TxtPassword.Attributes.Add("value", TxtPassword.Text);
            TxtPwdConfirm.Attributes.Add("value", TxtPwdConfirm.Text);
            //Response.Write("asdsd");
            if (Request["SendID"] != null)
            {
                Session["SendID"] = Request["SendID"];
            }
            if (SiteConfig.UserConfig.EnableCheckCodeOfReg)
            {

                this.regVcodeRegister.Visible = true;

            }
            if (SiteConfig.UserConfig.EmailCheckReg)
            {

                this.regEmail.Visible = true;

            }
            if (!this.Page.IsPostBack)
            {
               
                ViewState["Promotion"] = Request.Form["Promotion"];
                this.LitControlTreeInfo.Text = "<input name='ControlTreeInfo' type='hidden' value='" + SiteConfig.UserConfig.RegFieldsMustFill + "$$$$$" + SiteConfig.UserConfig.RegFieldsSelectFill + "'/>";

                if (!SiteConfig.UserConfig.EnableUserReg)
                {
                    this.PnlRegStep0.Visible = true;
                    this.PnlRegStep1.Visible = false;
                    this.PnlRegStep2.Visible = false;
                    this.PnlMRegStep1.Visible = false;
                    this.PnlStep3.Visible = false;
                }
                else
                {

                    this.PnlRegStep0.Visible = false;
                    this.PnlRegStep2.Visible = false;
                    this.PnlMRegStep1.Visible = false;
                    this.PnlStep3.Visible = false;
                    this.callBackReference = this.Page.ClientScript.GetCallbackEventReference(this, "arg", "ReceiveServerData", "context");
                    int userNameLimit = 2;
                    int userNameMax = 20;
                    if (SiteConfig.UserConfig.UserNameLimit > 0)
                    {
                        userNameLimit = SiteConfig.UserConfig.UserNameLimit;
                    }
                    if (SiteConfig.UserConfig.UserNameMax >= userNameLimit)
                    {
                        userNameMax = SiteConfig.UserConfig.UserNameMax;
                    }

                    Literal1.Text = userNameMax.ToString();
                    Literal2.Text = userNameLimit.ToString();
                    this.ValgTextMaxLength.ValidationExpression = @"^[a-zA-Z0-9\u4e00-\u9fa5\@\.]{" + userNameLimit.ToString() + "," + userNameMax.ToString() + "}$";

                    this.ValgTextMaxLength.ErrorMessage = "用户名不能包含特殊字符，且必须大于" + userNameLimit.ToString() + "个字符并且不能超过" + userNameMax.ToString() + "个字符";

                    InitProtocol();
                    B_Group gll = new B_Group();

                    DataTable ss = gll.GetSelGroup();
                    this.UserGroup.DataSource = ss;
                    this.UserGroup.DataValueField = "GroupID";
                    this.UserGroup.DataTextField = "GroupName";
                    this.UserGroup.DataBind();
                    this.UserGroup.AutoPostBack = true;

                    if (ss != null)
                    {
                        if (ss.Rows.Count <= 1)
                        {
                            this.usergroupss.Visible = false;
                            this.UserGroup.SelectedIndex = 0;
                        }
                        else
                        {
                            this.UserGroup.SelectedIndex = 0;
                        }
                    }
                    if (SiteConfig.UserConfig.MobileReg == true)
                    {
                        PnlMRegStep1.Visible = true; 
                    }
                    else
                    {
                        PnlMRegStep1.Visible = false; 
                   
                     if (SiteConfig.UserConfig.Agreement == "3")
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>regload();</script>");
                            this.CheckBox1.Visible = false;
                            this.PnlRegStep1.Visible = true;
                            BtnRegStep1.Text = "同意";
                            BtnRegStep1NotApprove.Text = "不同意";
                        }

                        else if (SiteConfig.UserConfig.Agreement == "2")
                        {
                            BtnRegstep1();
                            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>dispbtn();</script>");
                            this.CheckBox1.Visible = true;
                            this.PnlRegStep1.Visible = false;
                            this.PnlRegStep2.Visible = true;
                            this.Literal3.Visible = false;
                            BtnRegStep1.Text = "注册";
                            BtnRegStep1NotApprove.Text = "返 回";
                        }
                        else if (SiteConfig.UserConfig.Agreement == "1")
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>endbtn();</script>");
                            this.CheckBox1.Visible = false;
                            this.PnlRegStep1.Visible = true;
                            BtnRegStep1.Text = "同 意";
                            BtnRegStep1NotApprove.Text = "不同意";
                        }

                        else if (SiteConfig.UserConfig.Agreement == "0")
                        {
                            BtnRegstep1();
                            this.CheckBox1.Visible = false;
                            this.PnlRegStep1.Visible = false;
                            this.PnlRegStep2.Visible = true;
                            this.Literal3.Visible = false;
                        }
                    }
                }
                this.callBackParent = this.Page.ClientScript.GetCallbackEventReference(this, "argss", "ReceiveServerDataParent", "context");
                this.callBackcard = this.Page.ClientScript.GetCallbackEventReference(this, "args", "ReceiveServerDataID", "context");


                //this.UserGroup.Items[0].Attributes.Add("onclick", "alert('asdfsa');");
            }
            if (UserGroup != null && UserGroup.Items.Count > 0)
            {
                this.UserGroup.Items[0].Attributes.Add("onclick", "hidenbtn();");
            }
            string userregrule = SiteConfig.UserConfig.RegRule;
            if (userregrule != null && userregrule != "")
            {
                if (userregrule.IndexOf(',') > -1)
                {
                    string[] rulearr = userregrule.Split(',');
                    for (int ii = 0; ii < rulearr.Length; ii++)
                    {
                        if (rulearr[ii].ToString() == "1")
                        {
                            usertip.Text = "不允许纯数字";
                        }

                        if (rulearr[ii].ToString() == "2")
                        {
                            if (usertip.Text != "")
                            {
                                usertip.Text += "、纯英文";
                            }
                            else
                            {
                                usertip.Text = "不允许纯英文";
                            }
                        }

                        if (rulearr[ii].ToString() == "3")
                        {
                            if (usertip.Text != "")
                            {
                                usertip.Text += "、带有中文";
                            }
                            else
                            {
                                usertip.Text = "不允许带有中文";
                            }
                        }
                    }
                    if (usertip.Text != "")
                    {
                        usertip.Text += ";";
                    }
                }
                else
                {
                    if (userregrule.ToString() == "1")
                    {
                        usertip.Text = "不允许纯数字";
                    }

                    if (userregrule.ToString() == "2")
                    {
                        if (usertip.Text != "")
                        {
                            usertip.Text += "、纯英文";
                        }
                        else
                        {
                            usertip.Text = "不允许纯英文";
                        }
                    }

                    if (userregrule.ToString() == "3")
                    {
                        if (usertip.Text != "")
                        {
                            usertip.Text += "、带有中文";
                        }
                        else
                        {
                            usertip.Text = "不允许带有中文";
                        }
                    }
                    if (usertip.Text != "")
                    {
                        usertip.Text += ";";
                    }
                }
                #region 绑定地区数据
                bind();
                if (Request["action"] == "area")
                {
                    bind1();
                    Response.Write("");
                    Response.Flush();
                    Response.Close();
                }
                if (Request["action"] == "area2")
                {
                    bind2();
                    Response.Write("");
                    Response.Flush();
                    Response.Close();
                }
                #endregion
            }
        }

        /// <summary>
        /// 进入填写详细信息
        /// </summary>
        protected void BtnRegStep1_Click(object sender, EventArgs e)
        {
            BtnRegstep1();
        }

        public void BtnRegstep1()
        {
            B_Group gll = new B_Group();

            DataTable ss = gll.GetSelGroup();
            this.UserGroup.DataSource = ss;
            this.UserGroup.DataValueField = "GroupID";
            this.UserGroup.DataTextField = "GroupName";
            this.UserGroup.DataBind();
            if (ss != null)
            {
                if (ss.Rows.Count <= 1)
                {
                    this.usergroupss.Visible = false;
                }
                else
                {
                    this.UserGroup.SelectedIndex = 0;
                }
            }
            if (UserGroup != null && UserGroup.Items.Count > 0)
            {
                this.UserGroup.Items[0].Attributes.Add("onclick", "hidenbtn();");
            }
            this.ReqTxtAddress.Enabled = this.GetEnableValid("Address");
            this.ReqTxtBirthday.Enabled = this.GetEnableValid("Birthday");
            this.ReqTxtFaceHeight.Enabled = this.GetEnableValid("FaceHeight");
            this.ReqTxtFaceWidth.Enabled = this.GetEnableValid("FaceWidth");
            this.ReqTxtFax.Enabled = this.GetEnableValid("Fax");
            this.ReqTxtHomepage.Enabled = this.GetEnableValid("Homepage");
            this.ReqTxtIDCard.Enabled = this.GetEnableValid("IDCard");
            this.ReqTxtHomePhone.Enabled = this.GetEnableValid("HomePhone");
            this.ReqTxtICQ.Enabled = this.GetEnableValid("ICQ");
            this.ReqTxtMobile.Enabled = this.GetEnableValid("Mobile");
            this.ReqTxtMSN.Enabled = this.GetEnableValid("MSN");
            this.ReqTxtQQ.Enabled = this.GetEnableValid("QQ");
            this.ReqTxtSign.Enabled = this.GetEnableValid("Sign");
            this.ReqTxtTrueName.Enabled = this.GetEnableValid("TrueName");
            this.ReqTxtUC.Enabled = this.GetEnableValid("UC");
            this.ReqTxtUserFace.Enabled = this.GetEnableValid("UserFace");
            this.ReqTxtYahoo.Enabled = this.GetEnableValid("Yahoo");
            this.ReqTxtZipCode.Enabled = this.GetEnableValid("ZipCode");
            this.ReqTxtOfficePhone.Enabled = this.GetEnableValid("OfficePhone");
            this.ReqTxtPHS.Enabled = this.GetEnableValid("PHS");
            this.ReqTxtParentUserID.Enabled = this.GetEnableValid("ParentUserID");

            //if (SiteConfig.UserConfig.EnableCheckCodeOfReg)
            //{
            //    this.trVcodeRegister.Visible = true;
            //}
            this.PnlRegStep1.Visible = false;
            this.PnlRegStep2.Visible = true;
            this.PnlStep3.Visible = false;
            this.PnlMRegStep1.Visible = false;
            ShowModelfield();
            this.callBackReference = this.Page.ClientScript.GetCallbackEventReference(this, "arg", "ReceiveServerData", "context");
        }
        /////////////////////////////////////////////////////////////////////////////////////////////////////
        /// <summary>
        /// 不同意按钮
        /// </summary>
        protected void BtnRegStep1NotApprove_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("~/default.aspx");
        }

        //提交注册
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            int pageid = DataConverter.CLng(Request.QueryString["pid"]);

            if (!SiteConfig.UserConfig.EnableUserReg)
            {
                return;
            }

            #region  注册IP限制
            M_UserRegisterIP UserRegisterIP = B_UserRegisterIP.GetRegisterIPAll();
            if (UserRegisterIP.IsLimit == 0)
            {
                B_User buser = new B_User();
                string RegIP = HttpContext.Current.Request.UserHostAddress;
                DateTime EndTime = DateTime.Now;
                double dhours = UserRegisterIP.LimitTime;
                DateTime BeginTime = DateTime.Now.AddHours(-dhours);
                if (UserRegisterIP.IsIPpart != 0 && UserRegisterIP.BeginIP != null && UserRegisterIP.EndIP != null)
                {
                    string beginIP = UserRegisterIP.BeginIP;
                    string endIP = UserRegisterIP.EndIP;
                    long LbeginIP = IpToInt(beginIP);
                    long LendIP = IpToInt(endIP);
                    long LRegIP = IpToInt(RegIP);
                    if (LRegIP > LbeginIP && LRegIP < LendIP)
                    {
                        if (!buser.GetRegisterIP(RegIP, BeginTime, EndTime))
                        {
                            Response.Write("<script>alert('同一IP不能重复注册！');location.href='Register.aspx';</script>");
                            return;
                        }
                    }
                }
                else
                {
                    if (!buser.GetRegisterIP(RegIP, BeginTime, EndTime))
                    {
                        Response.Write("<script>alert('同一IP不能重复注册！');location.href='Register.aspx';</script>");
                        return;
                    }
                }
            }


            #endregion

            DataSecurity.StartProcessRequest();
            this.CheckUserName();
            this.CheckEmail();
            this.CheckCode();

            this.Checkyes();
            this.CheckPUserName();
            #region 自定义字段信息
            DataTable dt = bmf.Select_All();
            DataTable table = new DataTable();
            table.Columns.Add(new DataColumn("FieldName", typeof(string)));
            table.Columns.Add(new DataColumn("FieldType", typeof(string)));
            table.Columns.Add(new DataColumn("FieldValue", typeof(string)));

            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    //if (DataConverter.CBool(dr["IsNotNull"].ToString()))
                    //{
                    //    if (string.IsNullOrEmpty(this.Page.Request.Form["txt_" + dr["FieldName"].ToString()]) || this.Page.Request.Form["txt_" + dr["FieldName"].ToString()] == "")
                    //    {
                    //        function.WriteErrMsg(dr["FieldAlias"].ToString() + "不能为空!");
                    //        Response.End();
                    //    }
                    //}

                    if (dr["FieldType"].ToString() == "FileType")
                    {
                        string[] Sett = dr["Content"].ToString().Split(new char[] { ',' });
                        bool chksize = DataConverter.CBool(Sett[0].Split(new char[] { '=' })[1]);
                        string sizefield = Sett[1].Split(new char[] { '=' })[1];
                        if (chksize && sizefield != "")
                        {
                            DataRow row2 = table.NewRow();
                            row2[0] = sizefield;
                            row2[1] = "FileSize";
                            row2[2] = this.Page.Request.Form["txt_" + sizefield];
                            table.Rows.Add(row2);
                        }
                    }

                    if (dr["FieldType"].ToString() == "MultiPicType")
                    {
                        string[] Sett = dr["Content"].ToString().Split(new char[] { ',' });
                        bool chksize = DataConverter.CBool(Sett[0].Split(new char[] { '=' })[1]);
                        string sizefield = Sett[1].Split(new char[] { '=' })[1];
                        if (chksize && sizefield != "")
                        {
                            if (string.IsNullOrEmpty(this.Page.Request.Form["txt_" + sizefield]))
                            {
                                function.WriteErrMsg(dr["FieldAlias"].ToString() + "的缩略图不能为空!");
                            }
                            DataRow row1 = table.NewRow();
                            row1[0] = sizefield;
                            row1[1] = "ThumbField";
                            row1[2] = this.Page.Request.Form["txt_" + sizefield];
                            table.Rows.Add(row1);
                        }
                    }
                    DataRow row = table.NewRow();
                    row[0] = dr["FieldName"].ToString();
                    string ftype = dr["FieldType"].ToString();
                    row[1] = ftype;
                    string fvalue = this.Page.Request.Form["txt_" + dr["FieldName"].ToString()];
                    if (ftype == "TextType" || ftype == "MultipleTextType" || ftype == "MultipleHtmlType")
                    {
                        fvalue = sll.ProcessSen(fvalue);
                    }
                    row[2] = fvalue;
                    table.Rows.Add(row);
                }
            }

            #endregion


            #region 自定义模型
            int groupidt = DataConverter.CLng(this.UserGroup.SelectedValue);
            int ModelIDt = DataConverter.CLng(bgroup.GetGroupModel(groupidt));
            string usertablenamet = b_Model.GetModelById(ModelIDt).TableName;
            if (ModelIDt > 0)
            {
                DataTable groupsett = Fll.GetModelFieldListall(ModelIDt).Tables[0];
                DataTable tableregt = new DataTable();
                tableregt.Columns.Add(new DataColumn("FieldName", typeof(string)));
                tableregt.Columns.Add(new DataColumn("FieldType", typeof(string)));
                tableregt.Columns.Add(new DataColumn("FieldValue", typeof(string)));
                //if (groupsett != null && groupsett.Rows.Count > 0)
                //{
                //    foreach (DataRow dr in groupsett.Rows)
                //    {
                //        if (DataConverter.CBool(dr["IsNotNull"].ToString()))
                //        {
                //            if (string.IsNullOrEmpty(this.Page.Request.Form["txt_" + dr["FieldName"].ToString()]))
                //            {
                //                function.WriteErrMsg(dr["FieldAlias"].ToString() + "不能为空!");
                //            }
                //        }
                //    }
                //}
            }
            #endregion

            M_UserInfo info = new M_UserInfo();
            info.UserBase = new M_Uinfo();
            info.UserName = this.TxtUserName.Text.Trim();
            info.UserPwd = this.TxtPassword.Text;
            info.Question = this.DropDownList1.SelectedValue;
            info.Answer = this.TxtAnswer.Text;
            info.Email = this.TxtEmail.Text;
            //info.Tjr = this.TxtTjr.Text;
            info.CheckNum = DataSecurity.MakeRandomString("abcdefghijklmnopqrstuvwxyz0123456789_", 10);
            info.GroupID = DataConverter.CLng(this.UserGroup.SelectedValue);
            info.LastLoginIP = HttpContext.Current.Request.UserHostAddress;
            info.LastLockTime = DateTime.Now;
            info.LastLoginTimes = DateTime.Now;
            info.LastPwdChangeTime = DateTime.Now;
            info.LoginTimes = 0;
            info.RegTime = DateTime.Now;
            info.Purse = SiteConfig.UserConfig.PresentMoney;
            info.UserExp = DataConverter.CLng(SiteConfig.UserConfig.PresentExp);
            info.ConsumeExp = 0;
            info.IsConfirm = 0;
            info.VIP = 0;
            info.UserPoint = SiteConfig.UserConfig.PresentPoint;
            info.RegisterIP = HttpContext.Current.Request.UserHostAddress;
            if (SiteConfig.UserConfig.EmailCheckReg) //邮件认证
            {
                info.Status = 4;
            }
            else if (SiteConfig.UserConfig.AdminCheckReg) //管理员认证
            {
                info.Status = 2;
            }
            else if (SiteConfig.UserConfig.EmailCheckReg && SiteConfig.UserConfig.AdminCheckReg) //邮件认证及管理员认证
            {
                info.Status = 3;
            }
            else if (!SiteConfig.UserConfig.UserValidateType)
            {
                info.Status = 5;
            }
            else
            {
                info.Status = 0;
            }
            if (ViewState["MbInv"] != null && ViewState["MbInv"].ToString() != "")
            {
                info.Status = 0;
            }

            #region 易推广ParentUserID赋值
            //int ParentUserID;
            //int.TryParse(Request["ParentUserID"], out ParentUserID);
            //info.ParentUserID = ParentUserID.ToString();
            M_UserInfo uinfo = new M_UserInfo();
            try
            {
                uinfo = buser.GetUserByName(this.TxtParentUserID.Text);
                if (uinfo.UserID != null && uinfo.UserID > 0)
                {
                    info.ParentUserID = uinfo.UserID.ToString();
                }
            }
            catch
            {
            }
            #endregion

            //会员基本信息
            info.UserBase.Address = this.TxtAddress.Text.Trim();
            info.UserBase.BirthDay = this.TxtBirthday.Text.Trim();
            info.UserBase.FaceHeight = DataConverter.CLng(this.TxtFaceHeight.Text.Trim());
            info.UserBase.FaceWidth = DataConverter.CLng(this.TxtFaceWidth.Text.Trim());
            info.UserBase.UserFace = this.TxtUserFace.Text.Trim();
            info.UserBase.Fax = this.TxtFax.Text.Trim();
            info.UserBase.HomePage = this.TxtHomepage.Text.Trim();
            info.UserBase.ICQ = this.TxtICQ.Text.Trim();
            info.UserBase.HomePhone = this.TxtHomePhone.Text.Trim();
            info.UserBase.IDCard = this.TxtIDCard.Text.Trim();
            info.UserBase.Mobile = this.TxtMobile.Text.Trim();
            info.UserBase.MSN = this.TxtMSN.Text.Trim();
            info.UserBase.OfficePhone = this.TxtOfficePhone.Text.Trim();
            info.UserBase.Privating = this.DropPrivacy.SelectedIndex;
            info.UserBase.PHS = this.TxtPHS.Text.Trim();
            info.UserBase.QQ = this.TxtQQ.Text.Trim();
            info.UserBase.Sign = this.TxtSign.Text.Trim();
            info.UserBase.TrueName = this.TxtTrueName.Text.Trim();
            info.UserBase.UC = this.TxtUC.Text.Trim();
            info.UserBase.UserSex = DataConverter.CBool(this.DropSex.SelectedValue);
            info.UserBase.Yahoo = this.TxtYahoo.Text.Trim();
            info.UserBase.ZipCode = this.TxtZipCode.Text.Trim();
            info.UserBase.HoneyName = "";
            info.UserBase.CardType = "";
            info.UserBase.Province = Request["selprovince"];
            info.UserBase.City = Request["selcity"];
            info.UserBase.County = Request["selcoutry"];
            //info.UserBase.Province = this.Select1.SelectedItem.ToString();
            //info.UserBase.City = this.Select2.SelectedItem.ToString();
            //info.UserBase.County = this.Select3.SelectedItem.ToString();

            string RegMessage = "";

            #region 整合接口处理
            ApiAction api = new ApiAction();
            if (DataConverter.CBool(api.data.config.DisCuzz))
            {
                UserBll.AddDZUser(info, info.UserBase.UserSex);
            }

            if (DataConverter.CBool(api.data.config.Discuz))//启用DZ整合
            {
                string regstr = Func.uc_user_register(this.TxtUserName.Text, this.TxtPassword.Text, this.TxtEmail.Text).ToString();
                if (DataConverter.CLng(regstr) < 0)
                {
                    RegMessage = "<li>注册失败，错误提示：" + regstr + "</li>";
                    RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a></li>";
                }
                if (RegMessage != "")
                {
                    function.WriteErrMsg(RegMessage);
                }
            }

            string[] strArray2 = string.IsNullOrEmpty(SiteConfig.UserConfig.RegFieldsMustFill) ? new string[0] : SiteConfig.UserConfig.RegFieldsMustFill.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
            foreach (string str2 in strArray2)
            {
                if (Request.Form["txt_" + str2] == null || Request.Form["txt_" + str2] == "")
                {
                    B_UserBaseField ubf = new B_UserBaseField();
                    DataTable tbles = ubf.Select_Where(" FieldName='" + str2 + "'", "*", "");
                    //if (tbles != null && tbles.Rows.Count > 0)
                    //{
                    //    function.WriteErrMsg(tbles.Rows[0]["FieldAlias"].ToString() + "不能为空!");
                    //}
                }
            }
            int TuserID = 0;
            if (DataConverter.CBool(api.data.config.ApiEnable))
            {
                api.RegUser(info, info.UserBase.UserSex);
                api.Login(info.UserName, info.UserPwd, 0);

                if (api.data.Status == "0")
                {
                    info.UserPwd = StringHelper.MD5(info.UserPwd);
                    info.Answer = info.Answer;
                    int UserID = buser.Add(info);
                    TuserID = UserID;
                    if (UserID > 0)
                    {
                        M_Microb binfos = new M_Microb();
                        B_Microb mbll = new B_Microb();
                        binfos.id = UserID;
                        binfos.UserId = UserID;
                        binfos.Keywords = "";
                        binfos.MbAdd = "";
                        binfos.MbContent = "";
                        binfos.Mbtitle = info.UserName + "正在使用" + SiteConfig.SiteInfo.SiteName + "微博";
                        binfos.Record = "";
                        binfos.Description = "";
                        binfos.Attention = 0;
                        binfos.BlogURL = "";
                        binfos.Certification = 0;
                        binfos.Comment = 0;
                        binfos.Elect = 0;
                        binfos.Fans = 0;
                        binfos.MicroBoUrl = "";
                        binfos.Reprinted = 0;
                        binfos.Start = 1;
                        binfos.AddTime = DateTime.Now;
                        mbll.GetInsert(binfos);
                        if (Session["Mbicroid"] != null)
                        {
                            int mredid = DataConverter.CLng(Session["Mbicroid"].ToString());
                            bred.DeleteByGroupID(mredid);
                        }
                        //添加基本信息
                        info.UserBase.UserId = UserID;
                        buser.AddBase(info.UserBase);
                        if (table != null && table.Rows.Count > 0)
                        {
                            buser.UpdateUserFile(UserID, table);//添加自定义字段信息
                        }

                        #region 自定义模型
                        int groupid = DataConverter.CLng(this.UserGroup.SelectedValue);
                        int ModelID = DataConverter.CLng(bgroup.GetGroupModel(groupid));
                        string usertablename = b_Model.GetModelById(ModelID).TableName;
                        if (ModelID > 0)
                        {
                            DataTable groupset = Fll.GetModelFieldListall(ModelID).Tables[0];
                            DataTable tablereg = new DataTable();
                            tablereg.Columns.Add(new DataColumn("FieldName", typeof(string)));
                            tablereg.Columns.Add(new DataColumn("FieldType", typeof(string)));
                            tablereg.Columns.Add(new DataColumn("FieldValue", typeof(string)));
                            if (groupset != null && groupset.Rows.Count > 0)
                            {
                                foreach (DataRow dr in groupset.Rows)
                                {
                                    //if (DataConverter.CBool(dr["IsNotNull"].ToString()))
                                    //{
                                    //    if (string.IsNullOrEmpty(this.Page.Request.Form["txt_" + dr["FieldName"].ToString()]))
                                    //    {
                                    //        function.WriteErrMsg(dr["FieldAlias"].ToString() + "不能为空!");
                                    //    }
                                    //}

                                    if (dr["FieldType"].ToString() == "FileType")
                                    {
                                        string[] Sett = dr["Content"].ToString().Split(new char[] { ',' });
                                        bool chksize = DataConverter.CBool(Sett[0].Split(new char[] { '=' })[1]);
                                        string sizefield = Sett[1].Split(new char[] { '=' })[1];

                                        if (chksize && sizefield != "")
                                        {
                                            DataRow row2 = tablereg.NewRow();
                                            row2[0] = sizefield;
                                            row2[1] = "FileSize";
                                            row2[2] = this.Page.Request.Form["txt_" + sizefield];
                                            tablereg.Rows.Add(row2);
                                        }
                                    }

                                    if (dr["FieldType"].ToString() == "MultiPicType")
                                    {
                                        string[] Sett = dr["Content"].ToString().Split(new char[] { ',' });
                                        bool chksize = DataConverter.CBool(Sett[0].Split(new char[] { '=' })[1]);
                                        string sizefield = Sett[1].Split(new char[] { '=' })[1];

                                        if (chksize && sizefield != "")
                                        {
                                            if (string.IsNullOrEmpty(this.Page.Request.Form["txt_" + sizefield]))
                                            {
                                                function.WriteErrMsg(dr["FieldAlias"].ToString() + "的缩略图不能为空!");
                                            }
                                            DataRow row1 = tablereg.NewRow();
                                            row1[0] = sizefield;
                                            row1[1] = "ThumbField";
                                            row1[2] = this.Page.Request.Form["txt_" + sizefield];
                                            tablereg.Rows.Add(row1);
                                        }
                                    }

                                    DataRow row = tablereg.NewRow();
                                    row[0] = dr["FieldName"].ToString();
                                    string ftype = dr["FieldType"].ToString();
                                    row[1] = ftype;

                                    string fvalue = this.Page.Request.Form["txt_" + dr["FieldName"].ToString()];
                                    if (ftype == "TextType" || ftype == "MultipleTextType" || ftype == "MultipleHtmlType")
                                    {
                                        fvalue = sll.ProcessSen(fvalue);
                                    }
                                    row[2] = fvalue;
                                    tablereg.Rows.Add(row);
                                }

                                try
                                {
                                    if (tablereg.Select("FieldName='UserID'").Length == 0)
                                    {
                                        DataRow rowsd1 = tablereg.NewRow();
                                        rowsd1[0] = "UserID";
                                        rowsd1[1] = "int";
                                        rowsd1[2] = UserID;
                                        tablereg.Rows.Add(rowsd1);
                                    }
                                    else
                                    {
                                        tablereg.Rows[0]["UserID"] = UserID;
                                    }
                                }
                                catch (Exception)
                                {

                                }

                                try
                                {
                                    if (tablereg.Select("FieldName='UserName'").Length == 0)
                                    {
                                        DataRow rowsd2 = tablereg.NewRow();
                                        rowsd2[0] = "UserName";
                                        rowsd2[1] = "TextType";
                                        rowsd2[2] = info.UserName;
                                        tablereg.Rows.Add(rowsd2);
                                    }
                                    else
                                    {
                                        tablereg.Rows[0]["UserName"] = info.UserName;
                                    }
                                }
                                catch (Exception) { }
                                try
                                {
                                    if (tablereg.Select("FieldName='Styleid'").Length == 0)
                                    {
                                        DataRow rowsd3 = tablereg.NewRow();
                                        rowsd3[0] = "Styleid";
                                        rowsd3[1] = "int";
                                        rowsd3[2] = 0;
                                        tablereg.Rows.Add(rowsd3);
                                    }
                                    else
                                    {
                                        tablereg.Rows[0]["UserName"] = 0;
                                    }
                                }
                                catch (Exception) { }
                                try
                                {
                                    if (tablereg.Select("FieldName='Recycler'").Length == 0)
                                    {
                                        DataRow rowsd4 = tablereg.NewRow();
                                        rowsd4[0] = "Recycler";
                                        rowsd4[1] = "int";
                                        rowsd4[2] = 0;
                                        tablereg.Rows.Add(rowsd4);
                                    }
                                    else
                                    {
                                        tablereg.Rows[0]["Recycler"] = 0;
                                    }
                                }
                                catch (Exception) { }
                                try
                                {
                                    if (tablereg.Select("FieldName='IsCreate'").Length == 0)
                                    {
                                        DataRow rowsd5 = tablereg.NewRow();
                                        rowsd5[0] = "IsCreate";
                                        rowsd5[1] = "int";
                                        rowsd5[2] = 0;
                                        tablereg.Rows.Add(rowsd5);
                                    }
                                    else
                                    {
                                        tablereg.Rows[0]["IsCreate"] = 0;
                                    }
                                }
                                catch (Exception) { }
                                try
                                {
                                    if (tablereg.Select("FieldName='NewTime'").Length == 0)
                                    {
                                        DataRow rs6 = tablereg.NewRow();
                                        rs6[0] = "NewTime";
                                        rs6[1] = "DateType";
                                        rs6[2] = DateTime.Now;
                                        tablereg.Rows.Add(rs6);
                                    }
                                    else
                                    {
                                        tablereg.Rows[0]["NewTime"] = DateTime.Now;
                                    }
                                }
                                catch (Exception) { }
                            }

                            if (tablereg != null)
                            {
                                buser.InsertModel(tablereg, usertablename);
                            }
                        }
                        #endregion

                        B_UserFriend ufbll = new B_UserFriend();
                        M_UserFriendTable uf = new M_UserFriendTable();
                        //初始化好友分组
                        M_UserFriendGroup ufg = new M_UserFriendGroup();
                        ufg.userID = UserID;
                        ufg.groupName = "黑名单";
                        ufg.blackGroup = 1;
                        ufg.orderID = 99;
                        ufbll.InsertUserFriendGroup(ufg);

                        ufg.userID = UserID;
                        ufg.groupName = "默认分组";
                        ufg.blackGroup = 2;
                        ufg.orderID = 1;
                        ufbll.InsertUserFriendGroup(ufg);
                        //站外邀请、微博邀请 好友处理
                        if (Session["SendID"] != null)//20110921-- ViewState改为了Session
                        {
                            int FID = DataConverter.CLng(Session["SendID"].ToString());//20110921-- ViewState改为了Session
                            int UGID = ufbll.GetFriendGroupMoByUserID(UserID).iD;
                            int FGID = ufbll.GetFriendGroupMoByUserID(FID).iD;
                            //添加好友
                            uf.UserID = UserID;
                            uf.FriendID = FID;
                            uf.GroupID = UGID;
                            uf.Addtime = DateTime.Now;
                            ufbll.InsertUserFriend(uf);
                            uf.FriendID = UserID;
                            uf.UserID = FID;
                            uf.Addtime = DateTime.Now;
                            uf.GroupID = FGID;
                            ufbll.InsertUserFriend(uf);
                        }
                        if (ViewState["Promotion"] != null)
                        {
                            int FID = DataConverter.CLng(ViewState["Promotion"].ToString());
                            int UGID = ufbll.GetFriendGroupMoByUserID(UserID).iD;
                            int FGID = ufbll.GetFriendGroupMoByUserID(FID).iD;
                            //添加好友
                            uf.UserID = UserID;
                            uf.FriendID = FID;
                            uf.GroupID = UGID;
                            uf.Addtime = DateTime.Now;
                            ufbll.InsertUserFriend(uf);
                            uf.FriendID = UserID;
                            uf.UserID = FID;
                            uf.Addtime = DateTime.Now;
                            uf.GroupID = FGID;
                            ufbll.InsertUserFriend(uf);
                        }

                        //发送认证邮件，当需要邮件认证时
                        if (!string.IsNullOrEmpty(info.Email) && SiteConfig.UserConfig.EmailCheckReg)
                        {
                            MailInfo mailInfo = new MailInfo();
                            mailInfo.IsBodyHtml = true;
                            mailInfo.FromName = SiteConfig.SiteInfo.SiteName;

                            string mailurl = info.Email;
                            if (Call.IsMail(this.TxtUserName.Text))
                            {
                                mailurl = this.TxtUserName.Text;
                            }
                            MailAddress address = new MailAddress(mailurl);
                            mailInfo.ToAddress = address;

                            string siteurls = SiteConfig.SiteInfo.SiteUrl;
                            if (siteurls.LastIndexOf("/") == -1)
                            {
                                siteurls = siteurls + "/";
                            }

                            mailInfo.MailBody = SiteConfig.UserConfig.EmailOfRegCheck.Replace("{$UserName}", info.UserName).Replace("{$CheckNum}", info.CheckNum).Replace("{$CheckUrl}", siteurls + "User/RegisterCheck.aspx?UserName=" + HttpUtility.UrlEncode(info.UserName) + "&CheckNum=" + info.CheckNum);
                            mailInfo.Subject = SiteConfig.SiteInfo.SiteName + "网站会员注册验证码";
                            if (SendMail.Send(mailInfo) == MailState.Ok)
                            {
                                RegMessage = "<li>恭喜您已注册成功，请登陆您的邮箱点击验证后就可以开始访问！</li>";
                                RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a></li>";
                            }
                            else
                            {
                                RegMessage = "<li>注册成功，但发送验证邮件失败，请检查邮件地址是否正确，或与网站管理员联系！</li>";
                                RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a></li>";
                            }
                        }

                        if (info.Status == 0) //直接注册成功时
                        {
                            if (!string.IsNullOrEmpty(info.Email) && SiteConfig.UserConfig.EmailTell)
                            {
                                MailInfo mailInfo = new MailInfo();
                                mailInfo.IsBodyHtml = true;
                                mailInfo.FromName = SiteConfig.SiteInfo.SiteName;
                                string mailurl = info.Email;
                                if (Call.IsMail(this.TxtUserName.Text))
                                {
                                    mailurl = this.TxtUserName.Text;
                                }
                                MailAddress address = new MailAddress(mailurl);
                                mailInfo.ToAddress = address;
                                mailInfo.MailBody = SiteConfig.UserConfig.EmailTellContent.Replace("{$UserName}", info.UserName).Replace("{$UserPwd}", this.TxtPassword.Text);
                                mailInfo.Subject = SiteConfig.SiteInfo.SiteName + "_注册成功提醒";
                                if (SendMail.Send(mailInfo) == MailState.Ok)
                                {
                                    RegMessage = "<li>注册基本信息已成功发送到你的注册邮箱，请到邮箱查收并验证！</li>";
                                    RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a></li>";
                                }
                                else
                                {
                                    RegMessage = "<li>注册成功，但发送注册基本信息邮件失败，请检查邮件地址是否正确，或与网站管理员联系！</li>";
                                    RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a></li>";
                                }
                            }
                            else
                            {
                                buser.SetLoginState(info, "Day");
                                if (this.ApiCfg.Discuz == "True")
                                {
                                    ucApi.Func.uc_user_login(info.UserName, this.TxtPassword.Text);
                                }


                                RegMessage = "<li>注册成功！</li>";
                                string mircostr = "";
                                if (Session["MicroLogin"] != null)
                                {
                                    mircostr = "&nbsp;&nbsp;<a href=\"../Microblog/Tindex.aspx?id=" + GetUserID() + "\">进入我的微博</a>";
                                }
                                string id = Request["ReturnUrl"];
                                //throw new Exception(string.IsNullOrEmpty(id).ToString()+" "+id);
                                if (string.IsNullOrEmpty(id))
                                {
                                    RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a>" + mircostr + "&nbsp;&nbsp;<a href=\"default.aspx\">进入会员中心</a>,5秒后系统自动跳转到会员中心!</li>";
                                    hfReturnUrl.Value = "default.aspx";
                                }
                                else
                                {
                                    RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a>" + mircostr + "&nbsp;&nbsp;<a href=\"" + id + "\">进入默认页面</a>,5秒后系统自动跳转到默认页面!</li>";
                                    hfReturnUrl.Value = id;
                                }
                                isok = true;
                            }


                            //审核OBLOG用户
                            if (DataConverter.CBool(api.data.config.ApiEnable) && api.config.Urls.IndexOf("DPOAPI.ashx") > -1)
                            {
                                try
                                {
                                    buser.UpUserLevel(this.TxtUserName.Text);
                                }
                                catch (Exception) { }
                            }
                        }
                        if (info.Status == 2) //等待管理员认证
                        {
                            RegMessage = "<li>注册成功！新注册会员需管理员认证才能有效，请耐心等待！</li>";
                            RegMessage = RegMessage + "<li>若长期没有通过管理员认证，请及时和管理员联系！</li>";
                            RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a></li>";
                        }
                    }
                    else
                    {
                        RegMessage = "<li>注册失败！</li>";
                        RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a>&nbsp;&nbsp;<a href=\"Register.aspx\">重新注册</a></li>";
                    }
                    //base.Response.Redirect("Default.aspx");
                }
                else
                {
                    RegMessage = "<li>" + api.data.Message + "<li>";
                    RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a></li>&nbsp;&nbsp;<a href=\"Register.aspx\">重新注册</a></li>";
                }
            }
            else
            {
                info.UserPwd = StringHelper.MD5(info.UserPwd);
                info.Answer = info.Answer;
                //int count = Convert.ToInt32(buser.SelectTjr(this.TxtTjr.Text));
                int UserID = 0;
                //if (count < 1)
                //{
                //    function.WriteErrMsg("<li>此推荐人不存在！</li>");
                //}
                //else
                //{
                UserID = buser.Add(info);
                TuserID = UserID;
                //}
                if (UserID > 0)
                {
                    M_Microb binfos = new M_Microb();
                    B_Microb mbll = new B_Microb();
                    binfos.id = UserID;
                    binfos.Keywords = "";
                    binfos.MbAdd = "";
                    binfos.MbContent = "";
                    binfos.Mbtitle = info.UserName + "正在使用" + SiteConfig.SiteInfo.SiteName + "微博";
                    binfos.Record = "";
                    binfos.Description = "";
                    binfos.Attention = 0;
                    binfos.BlogURL = "";
                    binfos.Certification = 0;
                    binfos.Comment = 0;
                    binfos.Elect = 0;
                    binfos.Fans = 0;
                    binfos.MicroBoUrl = "";
                    binfos.Reprinted = 0;
                    binfos.Start = 1;
                    binfos.UserId = UserID;
                    binfos.AddTime = DateTime.Now;
                    mbll.GetInsert(binfos);
                    if (Session["Mbicroid"] != null)
                    {
                        int mredid = DataConverter.CLng(Session["Mbicroid"].ToString());
                        bred.DeleteByGroupID(mredid);
                    }
                    //添加基本信息
                    info.UserBase.UserId = UserID;

                    buser.AddBase(info.UserBase);

                    if (table != null && table.Rows.Count > 0)
                    {
                        buser.UpdateUserFile(UserID, table);//添加自定义字段信息
                    }

                    #region 自定义模型
                    int groupid = DataConverter.CLng(this.UserGroup.SelectedValue);
                    int ModelID = DataConverter.CLng(bgroup.GetGroupModel(groupid));
                    string usertablename = b_Model.GetModelById(ModelID).TableName;


                    if (ModelID > 0 && usertablename != "" && usertablename != null)
                    {
                        DataTable groupset = Fll.GetModelFieldListall(ModelID).Tables[0];
                        DataTable tablereg = new DataTable();
                        tablereg.Columns.Add(new DataColumn("FieldName", typeof(string)));
                        tablereg.Columns.Add(new DataColumn("FieldType", typeof(string)));
                        tablereg.Columns.Add(new DataColumn("FieldValue", typeof(string)));
                        if (groupset != null && groupset.Rows.Count > 0)
                        {
                            foreach (DataRow dr in groupset.Rows)
                            {
                                //if (DataConverter.CBool(dr["IsNotNull"].ToString()))
                                //{
                                //    if (string.IsNullOrEmpty(this.Page.Request.Form["txt_" + dr["FieldName"].ToString()]))
                                //    {
                                //        function.WriteErrMsg(dr["FieldAlias"].ToString() + "不能为空!");
                                //    }
                                //}

                                if (dr["FieldType"].ToString() == "FileType")
                                {
                                    string[] Sett = dr["Content"].ToString().Split(new char[] { ',' });
                                    bool chksize = DataConverter.CBool(Sett[0].Split(new char[] { '=' })[1]);
                                    string sizefield = Sett[1].Split(new char[] { '=' })[1];
                                    if (chksize && sizefield != "")
                                    {
                                        DataRow row2 = tablereg.NewRow();
                                        row2[0] = sizefield;
                                        row2[1] = "FileSize";
                                        row2[2] = this.Page.Request.Form["txt_" + sizefield];
                                        tablereg.Rows.Add(row2);
                                    }
                                }

                                if (dr["FieldType"].ToString() == "MultiPicType")
                                {
                                    string[] Sett = dr["Content"].ToString().Split(new char[] { ',' });
                                    bool chksize = DataConverter.CBool(Sett[0].Split(new char[] { '=' })[1]);
                                    string sizefield = Sett[1].Split(new char[] { '=' })[1];
                                    if (chksize && sizefield != "")
                                    {
                                        if (string.IsNullOrEmpty(this.Page.Request.Form["txt_" + sizefield]))
                                        {
                                            function.WriteErrMsg(dr["FieldAlias"].ToString() + "的缩略图不能为空!");
                                        }
                                        DataRow row1 = tablereg.NewRow();
                                        row1[0] = sizefield;
                                        row1[1] = "ThumbField";
                                        row1[2] = this.Page.Request.Form["txt_" + sizefield];
                                        tablereg.Rows.Add(row1);
                                    }
                                }

                                DataRow row = tablereg.NewRow();
                                row[0] = dr["FieldName"].ToString();
                                string ftype = dr["FieldType"].ToString();
                                row[1] = ftype;
                                string fvalue = this.Page.Request.Form["txt_" + dr["FieldName"].ToString()];
                                if (ftype == "TextType" || ftype == "MultipleTextType" || ftype == "MultipleHtmlType")
                                {
                                    fvalue = sll.ProcessSen(fvalue);
                                }
                                row[2] = fvalue;
                                tablereg.Rows.Add(row);
                            }
                            try
                            {
                                if (tablereg.Select("FieldName='UserID'").Length == 0)
                                {
                                    DataRow rowsd1 = tablereg.NewRow();
                                    rowsd1[0] = "UserID";
                                    rowsd1[1] = "int";
                                    rowsd1[2] = UserID;
                                    tablereg.Rows.Add(rowsd1);
                                }
                                else
                                {
                                    tablereg.Rows[0]["UserID"] = UserID;
                                }
                            }
                            catch (Exception)
                            {

                            }

                            try
                            {
                                if (tablereg.Select("FieldName='UserName'").Length == 0)
                                {
                                    DataRow rowsd2 = tablereg.NewRow();
                                    rowsd2[0] = "UserName";
                                    rowsd2[1] = "TextType";
                                    rowsd2[2] = info.UserName;
                                    tablereg.Rows.Add(rowsd2);
                                }
                                else
                                {
                                    tablereg.Rows[0]["UserName"] = info.UserName;
                                }
                            }
                            catch (Exception) { }
                            try
                            {
                                if (tablereg.Select("FieldName='Styleid'").Length == 0)
                                {
                                    DataRow rowsd3 = tablereg.NewRow();
                                    rowsd3[0] = "Styleid";
                                    rowsd3[1] = "int";
                                    rowsd3[2] = 0;
                                    tablereg.Rows.Add(rowsd3);
                                }
                                else
                                {
                                    tablereg.Rows[0]["UserName"] = 0;
                                }
                            }
                            catch (Exception) { }
                            try
                            {
                                if (tablereg.Select("FieldName='Recycler'").Length == 0)
                                {
                                    DataRow rowsd4 = tablereg.NewRow();
                                    rowsd4[0] = "Recycler";
                                    rowsd4[1] = "int";
                                    rowsd4[2] = 0;
                                    tablereg.Rows.Add(rowsd4);
                                }
                                else
                                {
                                    tablereg.Rows[0]["Recycler"] = 0;
                                }
                            }
                            catch (Exception) { }
                            try
                            {
                                if (tablereg.Select("FieldName='IsCreate'").Length == 0)
                                {
                                    DataRow rowsd5 = tablereg.NewRow();
                                    rowsd5[0] = "IsCreate";
                                    rowsd5[1] = "int";
                                    rowsd5[2] = 0;
                                    tablereg.Rows.Add(rowsd5);
                                }
                                else
                                {
                                    tablereg.Rows[0]["IsCreate"] = 0;
                                }
                            }
                            catch (Exception) { }
                            try
                            {
                                if (tablereg.Select("FieldName='NewTime'").Length == 0)
                                {
                                    DataRow rs6 = tablereg.NewRow();
                                    rs6[0] = "NewTime";
                                    rs6[1] = "DateType";
                                    rs6[2] = DateTime.Now;
                                    tablereg.Rows.Add(rs6);
                                }
                                else
                                {
                                    tablereg.Rows[0]["NewTime"] = DateTime.Now;
                                }
                            }
                            catch (Exception) { }
                        }

                        if (tablereg != null && tablereg.Rows.Count > 0)
                        {
                            buser.InsertModel(tablereg, usertablename);
                        }
                    }
                    #endregion

                    //初始化好友分组
                    B_UserFriend ufbll = new B_UserFriend();
                    M_UserFriendTable uf = new M_UserFriendTable();
                    M_UserFriendGroup ufg = new M_UserFriendGroup();
                    ufg.userID = UserID;
                    ufg.groupName = "黑名单";
                    ufg.blackGroup = 1;
                    ufg.orderID = 99;
                    ufbll.InsertUserFriendGroup(ufg);

                    ufg.userID = UserID;
                    ufg.groupName = "默认分组";
                    ufg.blackGroup = 2;
                    ufg.orderID = 1;
                    ufbll.InsertUserFriendGroup(ufg);

                    //站外邀请好友处理
                    if (ViewState["SendID"] != null)
                    {
                        int FID = int.Parse(ViewState["SendID"].ToString());
                        int UGID = ufbll.GetFriendGroupMoByUserID(UserID).iD;
                        int FGID = ufbll.GetFriendGroupMoByUserID(FID).iD;
                        //添加好友
                        uf.UserID = UserID;
                        uf.FriendID = FID;
                        uf.GroupID = UGID;
                        ufbll.InsertUserFriend(uf);
                        uf.FriendID = UserID;
                        uf.UserID = FID;
                        uf.GroupID = FGID;
                        M_Microb micb = bmic.GetSelectUserid(FID); //好友微博
                        if (micb != null && micb.UserId > 0)
                        {
                            micb.Attention = micb.Attention + 1;
                            micb.Fans = micb.Fans + 1;
                            bmic.GetUpdate(micb);
                        }
                        M_Microb userMicb = bmic.GetSelectUserid(UserID); //好友微博
                        if (userMicb != null && userMicb.UserId > 0)
                        {
                            userMicb.Attention = userMicb.Attention + 1;
                            userMicb.Fans = userMicb.Fans + 1;
                            bmic.GetUpdate(userMicb);
                        }
                        ufbll.InsertUserFriend(uf);
                    }

                    //发送认证邮件，当需要邮件认证时
                    if (!string.IsNullOrEmpty(info.Email) && SiteConfig.UserConfig.EmailCheckReg)
                    {
                        MailInfo mailInfo = new MailInfo();
                        mailInfo.IsBodyHtml = true;
                        mailInfo.FromName = SiteConfig.SiteInfo.SiteName;
                        MailAddress address = new MailAddress(info.Email);
                        mailInfo.ToAddress = address;

                        string siteurls = SiteConfig.SiteInfo.SiteUrl;
                        if (siteurls.LastIndexOf("/") == -1)
                        {
                            siteurls = siteurls + "/";
                        }

                        mailInfo.MailBody = SiteConfig.UserConfig.EmailOfRegCheck.Replace("{$CheckNum}", info.CheckNum).Replace("{$CheckUrl}", siteurls + "/User/RegisterCheck.aspx?UserName=" + HttpUtility.UrlEncode(info.UserName) + "&CheckNum=" + info.CheckNum);
                        mailInfo.MailBody = mailInfo.MailBody.Replace("{$UserName}", info.UserName).Replace("{$UserPwd}", this.TxtPassword.Text);
                        mailInfo.Subject = SiteConfig.SiteInfo.SiteName + "网站会员注册验证码";
                        if (SendMail.Send(mailInfo) == MailState.Ok)
                        {
                            RegMessage = "<li>注册验证码已成功发送到你的注册邮箱，请到邮箱查收并验证！</li>";
                            RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a></li>";
                        }
                        else
                        {
                            RegMessage = "<li>注册成功，但发送验证邮件失败，请检查邮件地址是否正确，或与网站管理员联系！</li>";
                            RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a></li>";
                        }
                    }

                    if (info.Status == 0) //直接注册成功时
                    {
                        if (!string.IsNullOrEmpty(info.Email) && SiteConfig.UserConfig.EmailTell)
                        {
                            MailInfo mailInfo = new MailInfo();
                            mailInfo.IsBodyHtml = true;
                            mailInfo.FromName = SiteConfig.SiteInfo.SiteName;
                            MailAddress address = new MailAddress(info.Email);
                            mailInfo.ToAddress = address;
                            mailInfo.MailBody = SiteConfig.UserConfig.EmailTellContent.Replace("{$UserName}", info.UserName).Replace("{$UserPwd}", this.TxtPassword.Text);
                            mailInfo.Subject = SiteConfig.SiteInfo.SiteName + "_注册成功提醒";
                            if (SendMail.Send(mailInfo) == MailState.Ok)
                            {
                                RegMessage = "<li>注册基本信息已成功发送到你的注册邮箱，请到邮箱查收并验证！</li>";
                                RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a></li>";
                            }
                            else
                            {
                                RegMessage = "<li>注册成功，但发送注册基本信息邮件失败，请检查邮件地址是否正确，或与网站管理员联系！</li>";
                                RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a></li>";
                            }
                        }
                        else
                        {
                            buser.SetLoginState(info, "Day");
                            if (this.ApiCfg.Discuz == "True")
                            {
                                ucApi.Func.uc_user_login(info.UserName, this.TxtPassword.Text);
                            }

                            RegMessage = "<li>注册成功！</li>";

                            string mircostr = "";
                            if (Session["MicroLogin"] != null)
                            {
                                mircostr = "&nbsp;&nbsp;<a href=\"../Microblog/Tindex.aspx?id=" + GetUserID() + "\">进入我的微博</a>";
                            }

                            string id = Request["ReturnUrl"];
                            if (string.IsNullOrEmpty(id))
                            {
                                RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a>" + mircostr + "&nbsp;&nbsp;<a href=\"default.aspx\">进入会员中心</a>,5秒后系统自动跳转到会员中心!</li>";
                                hfReturnUrl.Value = "default.aspx";
                            }
                            else
                            {
                                RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a>" + mircostr + "&nbsp;&nbsp;<a href=\"" + id + "\">进入默认页面</a>,5秒后系统自动跳转到默认页面!</li>";
                                hfReturnUrl.Value = id;
                            }
                            isok = true;
                        }
                    }
                    if (info.Status == 2) //等待管理员认证
                    {
                        RegMessage = "<li>注册成功！新注册会员需管理员认证才能有效，请耐心等待！</li>";
                        RegMessage = RegMessage + "<li>若长期没有通过管理员认证，请及时和管理员联系！</li>";
                        RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a></li>";
                    }
                    else
                    {
                        {
                            string mircostr = "";
                            if (Session["MicroLogin"] != null)
                            {
                                mircostr = "&nbsp;&nbsp;<a href=\"../Microblog/Tindex.aspx?id=" + GetUserID() + "\">进入我的微博</a>";
                            }
                            if (!SiteConfig.UserConfig.EmailCheckReg)//未开启邮箱验证，则可以登录
                            buser.SetLoginState(info, "Day");
                            if (this.ApiCfg.Discuz == "True")
                            {
                                ucApi.Func.uc_user_login(info.UserName, this.TxtPassword.Text);
                            }

                            RegMessage = "<li>注册成功！</li>";
                            string id = Request["ReturnUrl"];
                            if (string.IsNullOrEmpty(id))
                            {
                                RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a>" + mircostr + "&nbsp;&nbsp;<a href=\"default.aspx\">进入会员中心</a>,5秒后系统自动跳转到会员中心!</li>";
                                hfReturnUrl.Value = "default.aspx";
                            }
                            else
                            {
                                RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a>" + mircostr + "&nbsp;&nbsp;<a href=\"" + id + "\">进入默认页面</a>,5秒后系统自动跳转到默认页面!</li>";
                                hfReturnUrl.Value = id;
                            }
                            isok = true;
                        }
                    }
                }
                else
                {
                    RegMessage = "<li>注册失败！</li>";
                    RegMessage = RegMessage + "<li><a href=\"/\">返回首页</a>&nbsp;&nbsp;<a href=\"Register.aspx\">重新注册</a></li>";
                }
            }
            #endregion

            #region 推广
            if (ViewState["Promotion"] != null || ViewState["SendID"] != null)
            {
                string UserPromotion = "";
                if (ViewState["Promotion"] != null)
                {
                    UserPromotion = ViewState["Promotion"].ToString();
                }
                if (ViewState["SendID"] != null)
                {
                    UserPromotion = ViewState["SendID"].ToString();
                }
                if (SiteConfig.UserConfig.PromotionType != 0 && !string.IsNullOrEmpty(UserPromotion))
                {
                    M_UserInfo muinfo = buser.GetUserByUserID(DataConverter.CLng(UserPromotion));

                    if (muinfo.UserID > 0)
                    {
                        switch (SiteConfig.UserConfig.PromotionType)
                        {
                            case 1://现金
                                muinfo.Purse = muinfo.Purse + SiteConfig.UserConfig.Promotion;
                                break;
                            case 2://点卷
                                muinfo.UserPoint = muinfo.UserPoint + SiteConfig.UserConfig.Promotion;
                                break;
                            case 3://积分
                                muinfo.UserExp = muinfo.UserExp + SiteConfig.UserConfig.Promotion;
                                break;
                            case 4://虚拟币
                                muinfo.DummyPurse = muinfo.DummyPurse + SiteConfig.UserConfig.Promotion;
                                break;
                        }
                        buser.UpDateUser(muinfo);
                    }
                }
            }
            #endregion

            #region 黄页注册
            //string TableNames = "";
            //int selfmodeid = 0;
            //string defaulttemplate = "";
            //DataTable styletable = b_Model.GetListPage();
            //if (styletable != null && styletable.Rows.Count > 0)
            //{
            //    TableNames = styletable.Rows[0]["TableName"].ToString();

            //    if (TableNames != "")
            //    {
            //        DataTable modetb = Fll.SelectTableName("ZL_Model", "where TableName ='" + TableNames + "'");
            //        if (modetb.Rows.Count > 0)
            //        {
            //            selfmodeid = DataConverter.CLng(styletable.Rows[0]["ModelID"].ToString());
            //            if (styletable.Rows[0]["ContentTemplate"] != null)
            //            {
            //                defaulttemplate = styletable.Rows[0]["ContentTemplate"].ToString();
            //            }
            //            else
            //            {
            //                defaulttemplate = "";
            //            }
            //        }
            //    }

            //    int ModelIDs = selfmodeid;
            //    int HdnModel = ModelIDs;

            //    DataTable dts = this.Fll.GetModelFieldList(ModelIDs).Tables[0];

            //    DataTable tables = new DataTable();
            //    tables.Columns.Add(new DataColumn("FieldName", typeof(string)));
            //    tables.Columns.Add(new DataColumn("FieldType", typeof(string)));
            //    tables.Columns.Add(new DataColumn("FieldValue", typeof(string)));

            //    foreach (DataRow dr in dts.Rows)
            //    {
            //        if (dr["FieldType"].ToString() == "FileType")
            //        {
            //            string[] Sett = dr["Content"].ToString().Split(new char[] { ',' });
            //            bool chksize = DataConverter.CBool(Sett[0].Split(new char[] { '=' })[1]);
            //            string sizefield = Sett[1].Split(new char[] { '=' })[1];
            //            if (chksize && sizefield != "")
            //            {
            //                DataRow row2 = tables.NewRow();
            //                row2[0] = sizefield;
            //                row2[1] = "FileSize";
            //                row2[2] = " ";
            //                tables.Rows.Add(row2);
            //            }
            //        }
            //        if (dr["FieldType"].ToString() == "MultiPicType")
            //        {
            //            string[] Sett = dr["Content"].ToString().Split(new char[] { ',' });
            //            bool chksize = DataConverter.CBool(Sett[0].Split(new char[] { '=' })[1]);
            //            string sizefield = Sett[1].Split(new char[] { '=' })[1];
            //            if (chksize && sizefield != "")
            //            {
            //                if (string.IsNullOrEmpty(this.Page.Request.Form["txt_" + sizefield]))
            //                {
            //                    function.WriteErrMsg(dr["FieldAlias"].ToString() + "的缩略图不能为空!");
            //                }
            //                DataRow row1 = tables.NewRow();
            //                row1[0] = sizefield;
            //                row1[1] = "ThumbField";
            //                row1[2] = " ";
            //                tables.Rows.Add(row1);
            //            }
            //        }

            //        DataRow row = tables.NewRow();
            //        row[0] = dr["FieldName"].ToString();
            //        string ftype = dr["FieldType"].ToString();
            //        row[1] = ftype;
            //        string fvalue = "";
            //        if (ftype == "TextType" || ftype == "MultipleTextType" || ftype == "MultipleHtmlType")
            //        {
            //            fvalue = sll.ProcessSen(fvalue);
            //        }
            //        row[2] = fvalue;
            //        tables.Rows.Add(row);
            //    }

            //    string uname = info.UserName;
            //    DataRow rs1 = tables.NewRow();
            //    rs1[0] = "UserID";
            //    rs1[1] = "int";
            //    rs1[2] = TuserID;
            //    tables.Rows.Add(rs1);

            //    DataRow rs2 = tables.NewRow();
            //    rs2[0] = "UserName";
            //    rs2[1] = "TextType";
            //    rs2[2] = info.UserName;
            //    tables.Rows.Add(rs2);

            //    int styleid = 0;
            //    DataTable pinfo = Fll.SelectTableName("ZL_PageStyle", "where IsDefault=1");
            //    if (pinfo != null)
            //    {
            //        if (pinfo.Rows.Count > 0)
            //        {
            //            styleid = DataConverter.CLng(pinfo.Rows[0]["PageNodeid"].ToString());
            //        }
            //    }

            //    DataRow rs3 = tables.NewRow();
            //    //Styleid|黄页样式ID|数字|0
            //    rs3[0] = "Styleid";
            //    rs3[1] = "int";
            //    rs3[2] = styleid;
            //    tables.Rows.Add(rs3);
            //    M_CommonData CData = new M_CommonData();

            //    CData.NodeID = 0;
            //    CData.GeneralID = 0;
            //    CData.ModelID = ModelIDs;
            //    CData.TableName = TableNames;

            //    CData.Title = info.UserName + "的黄页信息";
            //    CData.Inputer = info.UserName;
            //    CData.EliteLevel = 0;
            //    CData.TagKey = "";
            //    if (SiteConfig.SiteOption.RegPageStart)
            //    {
            //        CData.Status = 0;
            //    }
            //    else
            //    {
            //        CData.Status = 99;
            //    }

            //    CData.Template = "";
            //    CData.InfoID = styleid.ToString();
            //    CData.SpecialID = "";
            //    CData.PdfLink = "";
            //    CData.Titlecolor = "";
            //    CData.Template = defaulttemplate;
            //    B_Content bll = new B_Content();



            //    int newID = bll.AddContent(tables, CData);

            //    M_CommonData cinfoto = bll.GetCommonData(newID);
            //    M_Page pageinfos = new M_Page();
            //    pageinfos.ID = newID;
            //    pageinfos.Best = 0;
            //    pageinfos.BottonWords = "";
            //    pageinfos.CommonModelID = newID;
            //    pageinfos.CreateTime = DateTime.Now;
            //    pageinfos.Description = "";
            //    pageinfos.Domain = "";
            //    pageinfos.HeadColor = "";
            //    pageinfos.HeadHeight = 0;
            //    pageinfos.Hits = 0;
            //    pageinfos.InfoID = cinfoto.ItemID;
            //    pageinfos.KeyWords = "";
            //    pageinfos.LOGO = "";
            //    pageinfos.PageInfo = "";
            //    pageinfos.PageTitle = "";
            //    pageinfos.ParentPageID = pageid;
            //    M_Page pinfods = pll.GetSelectByGID(pageid);
            //    if (pinfods == null || pinfods.ID <= 0)
            //    {
            //        if (HttpContext.Current.Request.Cookies["users"] != null && HttpContext.Current.Request.Cookies["users"]["u"] != null && !string.IsNullOrEmpty(HttpContext.Current.Request.Cookies["users"]["u"].ToString()))  //链接推广
            //        {
            //            pinfods = pll.GetSelectByUserID(DataConverter.CLng(HttpContext.Current.Request.Cookies["users"]["u"]));
            //        }
            //    }
            //    if (pinfods != null && pinfods.ID > 0)
            //    {
            //        pageinfos.ParentUserID = pinfods.UserID;
            //    }
            //    pageinfos.Status = 99;
            //    pageinfos.Style = styleid;
            //    pageinfos.NodeStyle = styleid;
            //    pageinfos.TableName = TableNames;
            //    pageinfos.TopWords = "";
            //    pageinfos.UserID = TuserID;
            //    pageinfos.UserName = info.UserName;
            //    int pid = pll.GetInsert(pageinfos);
            //    buser.UpdatePageId(TuserID, pid);
            //}
            #endregion
            if (SiteConfig.UserConfig.EmailCheckReg)
            {
                this.PnlRegStep2.Visible = false;
                this.LitRegResult.Text = "<div class='emptyDiv'><br/>注册成功! &nbsp;&nbsp;<a href='http://mail." + TxtEmail.Text.Substring(TxtEmail.Text.LastIndexOf('@') + 1) + "' target='_blank'>立即登陆邮箱进行验证>></a><br/></div>";

                this.PnlMRegStep1.Visible = false;
                this.PnlStep3.Visible = true;
                //Response.Write("<script>alert('注册成功，请进行邮箱验证');location.href='login.aspx';</script>");
            }
            else
            {
                //ScriptManager1.Visible = false;
                this.PnlRegStep2.Visible = false;
                this.PnlMRegStep1.Visible = false;
                this.LitRegResult.Text = RegMessage;
                this.PnlStep3.Visible = true;

                if (isok)
                {
                    Redindul(GetUserID());
                    if (this.ApiCfg.Discuz == "True")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<iframe src='/API/SynchroLogin.aspx?username=" + this.TxtUserName.Text.Trim() + "&password=" + this.TxtPassword.Text + "' width='0' height='0'></iframe>");
                    }
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "<script>window.onload=function(){gotouser();}</script>");
                }
            }
        }

        private string GetPath()
        {
            string strPath = "http://" + Request.ServerVariables["HTTP_HOST"] + Request.ServerVariables["PATH_INFO"] + "?" + Request.ServerVariables["QUERY_STRING"];
            if (strPath.EndsWith("?"))
            {
                strPath = strPath.Substring(0, strPath.Length - 1);
            }
            return strPath;
        }

        /// <summary>
        /// 推广注册添加信息
        /// </summary>
        private void Redindul(int userid)
        {
            if (Session["SendID"] != null)  //红包推广
            {
                B_Redindulgence bred = new B_Redindulgence();
                M_Redindulgence mre = bred.SelectByUrl(GetPath());
                //if (mre != null && mre.id > 0)
                {
                    int id = DataConverter.CLng(Session["SendID"]);
                    if (id > 0)
                    {
                        M_InviteRecord minv = binv.GetSelByRuid(userid);
                        if (minv != null && minv.id > 0)
                        {
                            return;
                        }
                        if (minv == null)
                        {
                            minv = new M_InviteRecord();
                        }
                        minv.userid = id;  //推荐用户
                        minv.RecommUserId = userid; //推荐注册用户
                        minv.RegData = DateTime.Now;
                        minv.isReset = 0;
                        minv.isValid = 1;
                        int mid = binv.GetInsert(minv);
                        if (mid > 0)
                        {
                            bred.DeleteByGroupID(mre.id);
                        }
                    }
                }
            }
            if (ViewState["SendID"] != null)
            {
                int id = DataConverter.CLng(ViewState["SendID"]);
                M_InviteRecord minv = binv.GetSelByRuid(userid);
                if (minv != null && minv.id > 0)
                {
                    return;
                }
                if (minv == null)
                {
                    minv = new M_InviteRecord();
                }
                minv.userid = id;  //推荐用户,发推广信息的用户
                minv.RecommUserId = userid; //推荐注册的用户
                minv.RegData = DateTime.Now;
                minv.isReset = 0;
                minv.isValid = 0;
                int bid = binv.GetInsert(minv);
            }
            if (HttpContext.Current.Request.Cookies["users"] != null && HttpContext.Current.Request.Cookies["users"]["u"] != null && !string.IsNullOrEmpty(HttpContext.Current.Request.Cookies["users"]["u"].ToString()))  //链接推广
            {
                M_InviteRecord minv = binv.GetSelByRuid(userid);
                if (minv != null && minv.id > 0)
                {
                    return;
                }
                if (minv == null)
                {
                    minv = new M_InviteRecord();
                }
                minv.userid = DataConverter.CLng(HttpContext.Current.Request.Cookies["users"]["u"]);  //推荐用户.发推广信息的用户
                minv.RecommUserId = userid; //推荐注册用户
                minv.RegData = DateTime.Now;
                minv.isReset = 0;
                minv.isValid = 0;
                int bid = binv.GetInsert(minv);
                if (bid > 0)
                {
                    HttpContext.Current.Response.Cookies["users"]["u"] = "";
                }
            }
            if (HttpContext.Current.Response.Cookies["users"] != null && HttpContext.Current.Response.Cookies["users"]["pageid"] != null && !string.IsNullOrEmpty(HttpContext.Current.Response.Cookies["users"]["pageid"]))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "<script>e_get();</script>");
            }
        }

        /// <summary>
        /// 读取用户协议
        /// </summary>
        private void InitProtocol()
        {
            try
            {
                this.LitProtocol.Text = FileSystemObject.ReadFile(base.Request.MapPath("~/User/Protocol.txt"));
            }
            catch (FileNotFoundException)
            {
                function.WriteErrMsg("<li>Protocol.txt文件不存在</li>", "../Index.aspx");
            }
            catch (UnauthorizedAccessException)
            {
                function.WriteErrMsg("<li>没有权限读取Protocol.txt文件</li>", "../Index.aspx");
            }
        }

        /// <summary>
        /// 检验验证码
        /// </summary>
        private void CheckCode()
        {
            if (SiteConfig.UserConfig.EnableCheckCodeOfReg)
            {
                string vCode = this.Session["ValidateCode"] as string;
                Session["ValidateCode"] = "";
                if (!string.IsNullOrEmpty(vCode) && string.Compare(this.SendVcode.Text.Trim(), vCode, true) != 0)
                {
                    function.WriteErrMsg("<li>您输入的验证码和系统产生的不一致，请重新输入。</li>");
                }
            }
        }

        /// <summary>
        /// 检验邮件Email是否重复
        /// </summary>
        private void CheckEmail()
        {
            if (!string.IsNullOrEmpty(TxtEmail.Text) && !SiteConfig.UserConfig.EnableMultiRegPerEmail && buser.IsExistMail(this.TxtEmail.Text))
            {
                function.WriteErrMsg("<li>Email已被他人注册，请输入不同的Email！</li>");
            }
        }

        /// <summary>
        /// 检测会员名是否有效
        /// </summary>
        private void CheckUserName()
        {
            //判断是否是主站
            //if (SiteConfig.SiteOption.ServerType == "Server")
            //{
                if (StringHelper.FoundInArr(SiteConfig.UserConfig.UserNameRegDisabled, this.TxtUserName.Text, "|"))
                {
                    function.WriteErrMsg("<li>该用户名禁止注册，请输入不同的用户名！</li>");
                }

                if (buser.IsExit(this.TxtUserName.Text))
                {

                    function.WriteErrMsg("<li>该用户名已被他人占用，请输入不同的用户名！</li>");
                }
           // }
            string userregrule = SiteConfig.UserConfig.RegRule;
            if (userregrule != null && userregrule != "")
            {
                if (userregrule.IndexOf(',') > -1)
                {
                    string[] rulearr = userregrule.Split(',');
                    for (int ii = 0; ii < rulearr.Length; ii++)
                    {
                        if (rulearr[ii].ToString() == "1")
                        {
                            string resultString = null;
                            try
                            {
                                resultString = Regex.Match(this.TxtUserName.Text, @"[0-9]*").Value;
                            }
                            catch (ArgumentException)
                            {
                                // Syntax error in the regular expression
                            }


                            if (this.TxtUserName.Text.Trim() == resultString.Trim())
                            {
                                function.WriteErrMsg("用户名不允许纯数字");
                            }
                        }

                        if (rulearr[ii].ToString() == "2")
                        {
                            string resultString = null;
                            try
                            {
                                resultString = Regex.Match(this.TxtUserName.Text, @"[a-zA-Z]*").Value;
                            }
                            catch (ArgumentException)
                            {
                                // Syntax error in the regular expression
                            }

                            if (this.TxtUserName.Text == resultString)
                            {
                                function.WriteErrMsg("用户名不允许纯英文");
                            }

                        }

                        if (rulearr[ii].ToString() == "3")
                        {
                            bool foundMatch = false;
                            try
                            {
                                foundMatch = Regex.IsMatch(this.TxtUserName.Text, @"[\u0391-\uFFE5]$");
                            }
                            catch (ArgumentException)
                            {
                                // Syntax error in the regular expression
                            }

                            if (foundMatch)
                            {
                                function.WriteErrMsg("用户名不允许带有中文");
                            }
                        }
                    }
                }
                else
                {
                    if (userregrule.ToString() == "1")
                    {
                        string resultString = null;
                        try
                        {
                            resultString = Regex.Match(this.TxtUserName.Text, @"[0-9]*").Value;
                        }
                        catch (ArgumentException)
                        {
                            // Syntax error in the regular expression
                        }


                        if (this.TxtUserName.Text.Trim() == resultString.Trim())
                        {
                            function.WriteErrMsg("用户名不允许纯数字");
                        }
                    }

                    if (userregrule.ToString() == "2")
                    {
                        string resultString = null;
                        try
                        {
                            resultString = Regex.Match(this.TxtUserName.Text, @"[a-zA-Z]*").Value;
                        }
                        catch (ArgumentException)
                        {
                            // Syntax error in the regular expression
                        }

                        if (this.TxtUserName.Text == resultString)
                        {
                            function.WriteErrMsg("用户名不允许纯英文");
                        }

                    }

                    if (userregrule.ToString() == "3")
                    {
                        bool foundMatch = false;
                        try
                        {
                            foundMatch = Regex.IsMatch(this.TxtUserName.Text, @"[\u0391-\uFFE5]$");
                        }
                        catch (ArgumentException)
                        {
                            // Syntax error in the regular expression
                        }

                        if (foundMatch)
                        {
                            function.WriteErrMsg("用户名不允许带有中文");
                        }
                    }
                }
            }
        }

        protected bool GetEnableValid(string field)
        {
            return StringHelper.FoundCharInArr(SiteConfig.UserConfig.RegFieldsMustFill, field, ",");
        }

        public string CallBackReference
        {
            get { return this.callBackReference; }
        }
        public string CallBackcard
        {
            get { return this.callBackcard; }
        }
        public string CallBackParent
        {
            get { return this.callBackParent; }
        }
        #region ICallbackEventHandler 成员

        string ICallbackEventHandler.GetCallbackResult()
        {
            return this.result;
        }
        void ICallbackEventHandler.RaiseCallbackEvent(string eventArgument)
        {
            eventArgument = eventArgument.Trim();
            if (string.IsNullOrEmpty(eventArgument))
            {
                this.result = "empty";
            }
            else
            {
                if (SiteConfig.SiteOption.ServerType == "Server")
                {

                    if (StringHelper.FoundInArr(SiteConfig.UserConfig.UserNameRegDisabled, eventArgument, "|"))
                    {
                        this.result = "disabled";
                    }
                    else if (buser.IsExit(eventArgument))
                    {
                        this.result = "true";
                    }
                    else
                    {
                        ApiAction api = new ApiAction();

                        if (DataConverter.CBool(api.data.config.Discuz))//启用DZ整合
                        {
                            //RTN_UserLogin rtnUserLogin = Func.uc_user_login(this.TxtUserName.Text, this.TxtPassword.Text);
                            int regstr = Func.uc_user_checkname(eventArgument);

                            if (regstr < 0)
                            {
                                switch (regstr)
                                {
                                    case -1://用户名不合法
                                        this.result = "error05";
                                        break;
                                    case -2://包含不允许注册的词语
                                        this.result = "error06";
                                        break;
                                    case -3://用户名已经存在
                                        this.result = "error07";
                                        break;
                                }
                            }
                            else
                            {
                                string userregrule = SiteConfig.UserConfig.RegRule;
                                if (userregrule != null && userregrule != "")
                                {
                                    if (userregrule.IndexOf(',') > -1)
                                    {
                                        string[] rulearr = userregrule.Split(',');
                                        for (int ii = 0; ii < rulearr.Length; ii++)
                                        {
                                            if (rulearr[ii].ToString() == "1")
                                            {
                                                string resultString = null;
                                                try
                                                {
                                                    resultString = Regex.Match(eventArgument, @"[0-9]*").Value;
                                                }
                                                catch (ArgumentException)
                                                {
                                                    // Syntax error in the regular expression
                                                }


                                                if (this.TxtUserName.Text.Trim() == resultString.Trim())
                                                {
                                                    this.result = "error01";//用户名不允许纯数字
                                                    //this.result = resultString;
                                                }
                                            }

                                            if (rulearr[ii].ToString() == "2")
                                            {
                                                string resultString = null;
                                                try
                                                {
                                                    resultString = Regex.Match(eventArgument, @"[a-zA-Z]*").Value;
                                                }
                                                catch (ArgumentException)
                                                {
                                                    // Syntax error in the regular expression
                                                }
                                                if (eventArgument == resultString)
                                                {
                                                    this.result = "error02";//用户名不允许纯英文 
                                                }
                                            }

                                            if (rulearr[ii].ToString() == "3")
                                            {
                                                bool foundMatch = false;
                                                try
                                                {
                                                    foundMatch = Regex.IsMatch(eventArgument, @"[\u0391-\uFFE5]$");
                                                }
                                                catch (ArgumentException)
                                                {
                                                    // Syntax error in the regular expression
                                                }
                                                if (foundMatch)
                                                {
                                                    this.result = "error03";//用户名不允许带有中文
                                                }
                                            }
                                        }
                                    }
                                    else
                                    {
                                        if (userregrule.ToString() == "1")
                                        {
                                            string resultString = null;
                                            try
                                            {
                                                resultString = Regex.Match(eventArgument, @"[0-9]*").Value;
                                            }
                                            catch (ArgumentException)
                                            {
                                                // Syntax error in the regular expression
                                            }

                                            if (this.TxtUserName.Text.Trim() == resultString.Trim())
                                            {
                                                this.result = "error01";//用户名不允许纯数字
                                                //this.result = resultString;
                                            }
                                        }

                                        if (userregrule.ToString() == "2")
                                        {
                                            string resultString = null;
                                            try
                                            {
                                                resultString = Regex.Match(eventArgument, @"[a-zA-Z]*").Value;
                                            }
                                            catch (ArgumentException)
                                            {
                                                // Syntax error in the regular expression
                                            }

                                            if (eventArgument == resultString)
                                            {
                                                this.result = "error02";//用户名不允许纯英文
                                            }

                                        }

                                        if (userregrule.ToString() == "3")
                                        {
                                            bool foundMatch = false;
                                            try
                                            {
                                                foundMatch = Regex.IsMatch(eventArgument, @"[\u0391-\uFFE5]$");
                                            }
                                            catch (ArgumentException)
                                            {
                                                // Syntax error in the regular expression
                                            }
                                            if (foundMatch)
                                            {
                                                this.result = "error03";//用户名不允许带有中文
                                            }
                                        }
                                    }
                                }

                                string chestring = null;
                                try
                                {
                                    chestring = Regex.Match(eventArgument, @"[a-zA-Z0-9\u4e00-\u9fa5\@\.]*").Value;
                                }
                                catch (ArgumentException)
                                {
                                    // Syntax error in the regular expression
                                }

                                if (chestring != eventArgument)
                                {
                                    this.result = "error04";//用户名不允许纯数字
                                    //this.result = resultString;
                                }

                                if (SiteConfig.UserConfig.UserNameLimit > eventArgument.Length || eventArgument.Length > SiteConfig.UserConfig.UserNameMax)
                                {
                                    this.result = "error";
                                }
                                else
                                {
                                    this.result = "false";
                                }
                            }

                        }
                        else
                        {
                            if (SiteConfig.UserConfig.UserNameLimit > eventArgument.Length || eventArgument.Length > SiteConfig.UserConfig.UserNameMax)
                            {
                                this.result = "error";
                            }
                            else
                            {
                                if (buser.IsExitcard(eventArgument))
                                {
                                    this.result = "Fidtrue";//身份证存在
                                }
                                else
                                {
                                    bool foundMatch = false;
                                    try
                                    {
                                        foundMatch = Regex.IsMatch(eventArgument, @"^\d{17}([0-9]|X)$");
                                        if (foundMatch)
                                        {
                                            string birth = eventArgument.Substring(6, 8).Insert(6, "-").Insert(4, "-");
                                            DateTime time = new DateTime();
                                            DateTime newDate = DateTime.Now.AddYears(-200);
                                            DateTime now = DateTime.Now;

                                            if (DateTime.TryParse(birth, out time) == false)
                                            {
                                                this.result = "Fyidtrue"; //false 生日验证
                                            }
                                            else
                                            {
                                                DateTime data1 = Convert.ToDateTime(birth);
                                                TimeSpan ts = newDate - data1;
                                                TimeSpan ts2 = data1 - now;
                                                if (ts.Days > 0)
                                                    this.result = "Fcidtrue";//小于当前200年后
                                                else if (ts2.Days > 0)
                                                    this.result = "Fxidtrue";//大于当前时间
                                                else
                                                    this.result = "Fno";//身份证18位且不存在
                                            }
                                        }
                                        else
                                        {
                                            this.result = "Fidtrue2";//身份证格式不正确
                                        }
                                    }
                                    catch (ArgumentException)
                                    {
                                        this.result = "false";
                                        // Syntax error in the regular expression
                                    }
                                }
                            }
                            string chestring = null;
                            try
                            {
                                chestring = Regex.Match(eventArgument, @"[a-zA-Z0-9\u4e00-\u9fa5\@\.]*").Value;
                            }
                            catch (ArgumentException)
                            {
                                // Syntax error in the regular expression
                            }

                            if (chestring != eventArgument)
                            {
                                string[] chr = eventArgument.Split(new char[] { '|' });

                                try
                                {

                                    if (chr.Length > 1)
                                    {
                                        if (buser.IsExit(chr[1]))
                                        {
                                            this.result = "Ptrue";//用户存在
                                        }
                                        else
                                        {
                                            //try
                                            //{ 
                                            //    M_UserInfo uinfo = new M_UserInfo();
                                            //    try
                                            //    {
                                            //        int userid = Convert.ToInt32(this.TxtParentUserID.Text);
                                            //        uinfo = buser.GetUserByUserID(userid);
                                            //        if (uinfo.UserName != null)
                                            //        {
                                            //            this.result = "Ptrue2";//用户存在
                                            //        }
                                            //        else
                                            //        {
                                            //            this.result = "Pno";
                                            //        }
                                            //    }
                                            //    catch
                                            //    {

                                            //        this.result = "Pno";
                                            //    }
                                            //}
                                            //catch
                                            //{ 
                                            this.result = "Pno";
                                            // }//用户不存在
                                        }
                                    }
                                }
                                catch
                                {
                                    //this.result = chr[1];
                                    this.result = "error04";//用户名不允许纯数字
                                    //this.result = resultString;
                                }
                            }


                            string userregrule = SiteConfig.UserConfig.RegRule;
                            if (userregrule != null && userregrule != "")
                            {

                                if (userregrule.IndexOf(',') > -1)
                                {

                                    string[] rulearr = userregrule.Split(',');
                                    for (int ii = 0; ii < rulearr.Length; ii++)
                                    {
                                        if (rulearr[ii].ToString() == "1")
                                        {
                                            string resultString = null;
                                            try
                                            {
                                                resultString = Regex.Match(eventArgument, @"[0-9]*").Value;
                                            }
                                            catch (ArgumentException)
                                            {
                                                // Syntax error in the regular expression
                                            }


                                            if (resultString == eventArgument)
                                            {
                                                if (buser.IsExitcard(eventArgument))
                                                {
                                                    this.result = "Nidtrue";//身份证存在
                                                }
                                                else
                                                {
                                                    bool foundMatch = false;
                                                    try
                                                    {
                                                        foundMatch = Regex.IsMatch(eventArgument, @"^\d{18}$");
                                                        if (foundMatch)
                                                        {
                                                            string birth = eventArgument.Substring(6, 8).Insert(6, "-").Insert(4, "-");
                                                            DateTime time = new DateTime();
                                                            DateTime newDate = DateTime.Now.AddYears(-200);
                                                            DateTime now = DateTime.Now;

                                                            if (DateTime.TryParse(birth, out time) == false)
                                                            {
                                                                this.result = "Nyidtrue"; //false 生日验证
                                                            }
                                                            else
                                                            {
                                                                DateTime data1 = Convert.ToDateTime(birth);
                                                                TimeSpan ts = newDate - data1;
                                                                TimeSpan ts2 = data1 - now;
                                                                if (ts.Days > 0)
                                                                    this.result = "Ncidtrue";
                                                                else if (ts2.Days > 0)
                                                                    this.result = "Nxidtrue";
                                                                else
                                                                    this.result = "Nno";//身份证18位且不存在
                                                            }
                                                        }
                                                        else
                                                        {
                                                            this.result = "Nidtrue2";//身份证格式不正确
                                                        }
                                                    }
                                                    catch (ArgumentException)
                                                    {
                                                        this.result = "error01";  // Syntax error in the regular expression
                                                    }
                                                }
                                                // this.result = "error01";//用户名不允许纯数字
                                                //this.result = resultString;
                                            }
                                        }

                                        if (rulearr[ii].ToString() == "2")
                                        {
                                            string resultString = null;
                                            try
                                            {
                                                resultString = Regex.Match(eventArgument, @"[a-zA-Z]*").Value;
                                            }
                                            catch (ArgumentException)
                                            {
                                                // Syntax error in the regular expression
                                            }


                                            if (eventArgument == resultString)
                                            {
                                                this.result = "error02";//用户名不允许纯英文
                                                //this.result = resultString;
                                            }

                                        }

                                        if (rulearr[ii].ToString() == "3")
                                        {
                                            bool foundMatch = false;
                                            try
                                            {
                                                foundMatch = Regex.IsMatch(eventArgument, @"[\u0391-\uFFE5]$");
                                            }
                                            catch (ArgumentException)
                                            {
                                                // Syntax error in the regular expression
                                            }
                                            if (foundMatch)
                                            {
                                                this.result = "error03";//用户名不允许带有中文
                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    if (userregrule.ToString() == "1")
                                    {
                                        string resultString = null;
                                        try
                                        {
                                            resultString = Regex.Match(eventArgument, @"[0-9]*").Value;
                                        }
                                        catch (ArgumentException)
                                        {
                                            // Syntax error in the regular expression
                                        }


                                        if (resultString == eventArgument)
                                        {
                                            this.result = "error01";//用户名不允许纯数字
                                            //this.result = resultString;
                                        }
                                    }

                                    if (userregrule.ToString() == "2")
                                    {
                                        string resultString = null;
                                        try
                                        {
                                            resultString = Regex.Match(eventArgument, @"[a-zA-Z]*").Value;
                                        }
                                        catch (ArgumentException)
                                        {
                                            // Syntax error in the regular expression
                                        }


                                        if (eventArgument == resultString)
                                        {
                                            this.result = "error02";//用户名不允许纯英文
                                            //this.result = resultString;
                                        }

                                    }

                                    if (userregrule.ToString() == "3")
                                    {
                                        bool foundMatch = false;
                                        try
                                        {
                                            foundMatch = Regex.IsMatch(eventArgument, @"[\u0391-\uFFE5]$");
                                        }
                                        catch (ArgumentException)
                                        {
                                            // Syntax error in the regular expression
                                        }
                                        if (foundMatch)
                                        {
                                            this.result = "error03";//用户名不允许带有中文
                                        }
                                    }

                                }
                            }
                        }
                    }

                }
                else
                {
                    string userregrule = SiteConfig.UserConfig.RegRule;
                    if (userregrule != null && userregrule != "")
                    {
                        if (userregrule.IndexOf(',') > -1)
                        {
                            string[] rulearr = userregrule.Split(',');
                            for (int ii = 0; ii < rulearr.Length; ii++)
                            {
                                if (rulearr[ii].ToString() == "1")
                                {
                                    string resultString = null;
                                    try
                                    {
                                        resultString = Regex.Match(eventArgument, @"[0-9]*").Value;
                                    }
                                    catch (ArgumentException)
                                    {
                                        // Syntax error in the regular expression
                                    }

                                    if (this.TxtUserName.Text.Trim() == resultString.Trim())
                                    {
                                        this.result = "error01";//用户名不允许纯数字
                                        //this.result = resultString;
                                    }
                                }

                                if (rulearr[ii].ToString() == "2")
                                {
                                    string resultString = null;
                                    try
                                    {
                                        resultString = Regex.Match(eventArgument, @"[a-zA-Z]*").Value;
                                    }
                                    catch (ArgumentException)
                                    {
                                        // Syntax error in the regular expression
                                    }


                                    if (eventArgument == resultString)
                                    {
                                        this.result = "error02";//用户名不允许纯英文
                                        //this.result = resultString;
                                    }

                                }

                                if (rulearr[ii].ToString() == "3")
                                {
                                    bool foundMatch = false;
                                    try
                                    {
                                        foundMatch = Regex.IsMatch(eventArgument, @"[\u0391-\uFFE5]$");
                                    }
                                    catch (ArgumentException)
                                    {
                                        // Syntax error in the regular expression
                                    }
                                    if (foundMatch)
                                    {
                                        this.result = "error03";//用户名不允许带有中文
                                    }
                                }
                            }
                        }
                        else
                        {
                            if (userregrule.ToString() == "1")
                            {
                                string resultString = null;
                                try
                                {
                                    resultString = Regex.Match(eventArgument, @"[0-9]*").Value;
                                }
                                catch (ArgumentException)
                                {
                                    // Syntax error in the regular expression
                                }

                                if (this.TxtUserName.Text.Trim() == resultString.Trim())
                                {
                                    this.result = "error01";//用户名不允许纯数字
                                    //this.result = resultString;
                                }
                            }

                            if (userregrule.ToString() == "2")
                            {
                                string resultString = null;
                                try
                                {
                                    resultString = Regex.Match(eventArgument, @"[a-zA-Z]*").Value;
                                }
                                catch (ArgumentException)
                                {
                                    // Syntax error in the regular expression
                                }

                                if (eventArgument == resultString)
                                {
                                    this.result = "error02";//用户名不允许纯英文
                                    //this.result = resultString;
                                }
                            }

                            if (userregrule.ToString() == "3")
                            {
                                bool foundMatch = false;
                                try
                                {
                                    foundMatch = Regex.IsMatch(eventArgument, @"[\u0391-\uFFE5]$");
                                }
                                catch (ArgumentException)
                                {
                                    // Syntax error in the regular expression
                                }
                                if (foundMatch)
                                {
                                    this.result = "error03";//用户名不允许带有中文
                                }
                            }
                        }
                    }

                    if (buser.IsExitcard(eventArgument))
                    {
                        this.result = "idtrue";//身份证存在
                    }
                    else
                    {
                        bool foundMatch = false;
                        try
                        {
                            foundMatch = Regex.IsMatch(eventArgument, @"^\d{17}([0-9]|X)$");
                            if (foundMatch)
                            {
                                string birth = eventArgument.Substring(6, 8).Insert(6, "-").Insert(4, "-");
                                DateTime time = new DateTime();
                                DateTime newDate = DateTime.Now.AddYears(-200);
                                DateTime now = DateTime.Now;

                                if (DateTime.TryParse(birth, out time) == false)
                                {
                                    this.result = "yidtrue"; //false 生日验证
                                }
                                else
                                {
                                    DateTime data1 = Convert.ToDateTime(birth);
                                    TimeSpan ts = newDate - data1;
                                    TimeSpan ts2 = data1 - now;
                                    if (ts.Days > 0)
                                        this.result = "cidtrue";
                                    else if (ts2.Days > 0)
                                    {
                                        this.result = "xidtrue";
                                    }
                                    else
                                    {
                                        this.result = "no";//身份证18位且不存在
                                    }
                                }
                            }
                            else
                            {
                                this.result = "idtrue2";//身份证格式不正确
                            }
                        }
                        catch (ArgumentException)
                        {
                            // Syntax error in the regular expression
                        }

                    }

                }
            }
        }
        #endregion

        /// <summary>
        /// 用户组选择事件
        /// </summary>
        protected void UserGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            B_Model sm = new B_Model();
            //  1-企业用户组    0-个人用户
            ShowModelfield();
            //ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "script", "hidenbtn();", true);
        }

        private void ShowModelfield()
        {
            int gid = DataConverter.CLng(UserGroup.SelectedValue);
            int UserModelID = DataConverter.CLng(bgroup.GetGroupModel(gid));
            ///UserModelID!=0说明绑定了户模型，用要从模型中读取字段，没有绑定就不需要读取字段
            if (UserModelID != 0)
            {
                string reghtmltxt = this.Fll.GetInputHtmlUser(UserModelID, 0, 1);
                reghtmltxt = reghtmltxt.Replace("align=\"right\" class=\"tdbgleft\"", "align=\"left\" class=\"tdbgleft\" style=\"width: 15%;font-weight: bold;\"");
                modelhtml.Text = reghtmltxt;
                reghtmltxt = this.Fll.GetInputHtmlUser(UserModelID, 0, 0);
                reghtmltxt = reghtmltxt.Replace("align=\"right\" class=\"tdbgleft\"", "align=\"left\" class=\"tdbgleft\" style=\"width: 15%;font-weight: bold;\"");
                this.reghtml.Text = reghtmltxt;
                ScriptManager.RegisterStartupScript(UpdatePanel3, UpdatePanel3.GetType(), "", "document.getElementById('checkSelectFill').checked=false;document.getElementById('" + TableRegisterSelect.ClientID + "').style.display='none';", true);
            }
        }

        protected int GetUserID()
        {
            return buser.GetLogin().UserID;
        }

        /// <summary>
        /// IP地址转换成Int数据
        /// </summary>
        private long IpToInt(string ip)
        {
            char[] dot = new char[] { '.' };
            string[] ipArr = ip.Split(dot);
            if (ipArr.Length == 3)
                ip = ip + ".0";
            ipArr = ip.Split(dot);

            long ip_Int = 0;
            if (ipArr.Length > 3)
            {
                long p1 = long.Parse(ipArr[0]) * 256 * 256 * 256;
                long p2 = long.Parse(ipArr[1]) * 256 * 256;
                long p3 = long.Parse(ipArr[2]) * 256;
                long p4 = long.Parse(ipArr[3]);
                ip_Int = p1 + p2 + p3 + p4;
            }
            return ip_Int;
        }

        public string UserNameLimit()
        {
            return SiteConfig.UserConfig.UserNameLimit.ToString();
        }

        public string UserNameMax()
        {
            return SiteConfig.UserConfig.UserNameMax.ToString();
        }

        public void Checkyes()
        {
            if (this.TxtIDCard.Text.Length != 0)
            {
                string eventArgument = this.TxtIDCard.Text;
                if (buser.IsExitcard(eventArgument))
                {
                    function.WriteErrMsg("<li>该身份证号已被注册，请输入不同的身份证号！</li>");//身份证存在
                }
                else
                {
                    bool foundMatch = false;
                    try
                    {
                        foundMatch = Regex.IsMatch(eventArgument, @"^\d{17}([0-9]|X)$");
                        if (foundMatch)
                        {
                            string birth = eventArgument.Substring(6, 8).Insert(6, "-").Insert(4, "-");
                            DateTime time = new DateTime();
                            DateTime newDate = DateTime.Now.AddYears(-200);
                            DateTime now = DateTime.Now;

                            if (DateTime.TryParse(birth, out time) == false)
                            {
                                function.WriteErrMsg("<li>该身份证生日不正确！</li>");
                                //this.result = "yidtrue"; //false 生日验证
                            }
                            else
                            {
                                DateTime data1 = Convert.ToDateTime(birth);
                                TimeSpan ts = newDate - data1;
                                TimeSpan ts2 = data1 - now;
                                if (ts.Days > 0)
                                    function.WriteErrMsg("<li>您超过了200岁？请核对身份证号。</li>");
                                else if (ts2.Days > 0)
                                {
                                    function.WriteErrMsg("<li>您还没出生吧？请核对身份证号。</li>");
                                }
                                else
                                {
                                    // this.result = "no";//身份证18位且不存在
                                }
                            }
                        }
                        else
                        {
                            function.WriteErrMsg("<li>该身份证格式不正确！</li>");//身份证格式不正确
                        }
                    }
                    catch (ArgumentException)
                    {
                        // Syntax error in the regular expression
                    }

                }
            }
        }
        protected void CheckPUserName()
        {
            try
            {
                if (this.TxtParentUserID.Text.Length != 0)
                {
                    bool foundMatch = false;
                    {
                        foundMatch = Regex.IsMatch(this.TxtParentUserID.Text, @"^[0-9]\d*$");
                        if ((foundMatch && buser.IsExit(Convert.ToInt32(this.TxtParentUserID.Text))) || buser.IsExit(this.TxtParentUserID.Text))
                        {
                        }
                        else
                        {
                            function.WriteErrMsg("该推荐人不存在！");
                        }
                    }
                }
            }
            catch
            {
                function.WriteErrMsg("该推荐人不存在！");
            }
        }
        #region 地区选项
        protected void bind()
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("../Common/Area.xml"));
            foreach (XmlNode node in xmlDoc.ChildNodes)
            {
                if (node.Name == "address")
                {
                    foreach (XmlNode province in node)
                    {
                        this.selprovince.Items.Add(province.Attributes["name"].Value);
                    }
                    foreach (XmlNode province in node)
                    {
                        if (province.Attributes["name"].Value == this.selprovince.Value)
                        {
                            foreach (XmlNode city in province.ChildNodes)
                            {
                                this.selcity.Items.Add(city.Attributes["name"].Value);
                            }
                        }
                    }
                    foreach (XmlNode province in node)
                    {
                        if (province.Attributes["name"].Value == this.selprovince.Value)
                        {
                            foreach (XmlNode city in province.ChildNodes)
                            {
                                if (city.Attributes["name"].Value == this.selcity.Value)
                                {
                                    foreach (XmlNode country in city.ChildNodes)
                                    {
                                        this.selcoutry.Items.Add(country.Attributes["name"].Value);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        protected void bind1()
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("../Common/Area.xml"));
            foreach (XmlNode node in xmlDoc.ChildNodes)
            {
                if (node.Name == "address")
                {
                    foreach (XmlNode province in node)
                    {
                        if (province.Attributes["name"].Value == Request["value"])
                        {
                            foreach (XmlNode city in province.ChildNodes)
                            {
                                Response.Write(city.Attributes["name"].Value + "|");
                            }
                        }
                    }
                }
            }
        }
        protected void bind2()
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("../Common/Area.xml"));
            foreach (XmlNode node in xmlDoc.ChildNodes)
            {
                if (node.Name == "address")
                {
                    foreach (XmlNode province in node)
                    {
                        if (province.Attributes["name"].Value == Request["pro"])
                        {
                            foreach (XmlNode city in province.ChildNodes)
                            {
                                if (city.Attributes["name"].Value == Request["city"])
                                {
                                    foreach (XmlNode country in city.ChildNodes)
                                    {
                                        Response.Write(country.Attributes["name"].Value + "|");
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        #endregion


        //protected void PuserID_Changed(object sender, EventArgs e)
        //{
        //    M_UserInfo uinfo = new M_UserInfo();
        //    try
        //    {
        //        int userid = Convert.ToInt32(this.TxtParentUserID.Text);
        //        uinfo = buser.GetUserByUserID(userid); 
        //        if (uinfo.UserName != null)
        //        {
        //            this.TxtParentUser.Text = uinfo.UserName;
        //        }
        //        else
        //        {
        //            this.TxtParentUserID.Text = "";
        //            this.TxtParentUser.Text = ""; 
        //        }
        //    }
        //    catch
        //    {
        //        this.TxtParentUserID.Text = "";
        //        this.TxtParentUser.Text = "";
        //    }
        //}
        //protected void PuserName_Changed(object sender, EventArgs e)
        //{
        //    M_UserInfo uinfo = new M_UserInfo();
        //    try
        //    {
        //        uinfo = buser.GetUserByName(this.TxtParentUser.Text);
        //        if (uinfo.UserID != null && uinfo.UserID>0)
        //        {
        //            this.TxtParentUserID.Text = uinfo.UserID.ToString();
        //        }
        //        else
        //        {
        //            this.TxtParentUserID.Text = "";
        //            this.TxtParentUser.Text = "";
        //        }
        //    }
        //    catch
        //    {
        //        this.TxtParentUserID.Text = "";
        //        this.TxtParentUser.Text = "";
        //    }
        //}
        //public string getReturn()
        //{
        //    string id = Request["ReturnUrl"];
        //    //throw new Exception(string.IsNullOrEmpty(id).ToString()+" "+id);
        //    if (string.IsNullOrEmpty(id))
        //    {
        //        return "default.aspx";
        //    }
        //    else
        //    {
        //        return id;
        //    }
        //}


        /// <summary>
        /// 发送短信调用接口
        /// </summary>
        /// <param name="uid"></param>
        /// <param name="pwd"></param>
        /// <param name="mob"></param>
        /// <param name="msg"></param>
        /// <returns></returns>
        private string SendMsg(string uid, string pwd, string mob, string msg)
        {
            //return "000";
            string Send_URL = "http://service.winic.org/sys_port/gateway/?id=" + uid + "&pwd=" + pwd + "&to=" + mob + "&content=" + msg + "&time=";
            MSXML2.XMLHTTP xmlhttp = new MSXML2.XMLHTTP();
            xmlhttp.open("GET", Send_URL, false, null, null);
            xmlhttp.send("");
            MSXML2.XMLDocument dom = new XMLDocument();
            Byte[] b = (Byte[])xmlhttp.responseBody;
            //string Flag = System.Text.ASCIIEncoding.UTF8.GetString(b, 0, b.Length);
            string andy = System.Text.Encoding.GetEncoding("GB2312").GetString(b).Trim();
            return andy;
        }
        protected string Islimited()
        {
            string str = "";
            if (HttpContext.Current.Request.Cookies["postTime"] == null)
            {
                HttpContext.Current.Response.Cookies["postTime"].Expires = DateTime.Now.AddMinutes(1);
            }
            else
            {
               str="一分钟内只能发送一条信息，请稍后！";
            }
            return str;
        }
        public static string GetRandomString(int length)
        {
            Random rnd = new Random();
            string charPool = "1234567890";
            System.Text.StringBuilder rs = new System.Text.StringBuilder();
            while (length-- > 0)
                rs.Append(charPool[(int)(rnd.NextDouble() * charPool.Length)]);
            return rs.ToString();
        }
        protected void SendMob_Click(object sender, EventArgs e)
        {
            ViewState["mcode"] =  GetRandomString(6);
            if (Page.IsValid)
            {
                string str = Islimited();
                if (str == "")
                {
                    string mob = this.TxtMobile1.Text.Trim();
                    if (string.IsNullOrEmpty(mob))
                    {
                        function.WriteErrMsg("请输入手机号码");
                    }
                    string msg = SiteConfig.UserConfig.MobileRegInfo.Replace("{$CheckNum}", ViewState["mcode"].ToString()).Replace("{$SiteName}", SiteConfig.SiteInfo.SiteName).Replace("{$SiteUrl}", SiteConfig.SiteInfo.SiteUrl);
                    if (string.IsNullOrEmpty(msg))
                    {
                        function.WriteErrMsg("短信内容不能为空");
                    }
                    if (DataSecurity.Len(msg) > 70)
                    {
                        function.WriteErrMsg("短信内容不能超过70个字");
                    }
                    string[] mobarr = mob.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    if (mobarr.Length == 0)
                    {
                        function.WriteErrMsg("请输入手机号码");
                    }
                    else
                    {
                        //if (mobarr.Length > 100)
                        //{
                        //    function.WriteErrMsg("每次只能发送100条短信");
                        //}
                        if (mobarr.Length > 1)
                        {
                            function.WriteErrMsg("每次只能发送一条短信");
                        }
                        else
                        {
                            string req = this.SendMsg(SiteConfig.SiteOption.MssUser, SiteConfig.SiteOption.MssPsw, mob, msg);
                            string[] reqs = req.Split(new char[] { '/' });
                            string res = "";
                            switch (reqs[0])
                            {
                                case "000":
                                    res = "发送成功！";
                                    addMessage();
                                    //res += "发送条数:" + reqs[1].Split(new char[] { ':' })[1] + "<br/>";
                                    //res += "当次消费金额" + reqs[2].Split(new char[] { ':' })[1] + "<br/>";
                                    //res += "总体余额:" + reqs[3].Split(new char[] { ':' })[1] + "<br/>";
                                    //res += "短信编号:" + reqs[4];
                                    break;
                                case "-01":
                                    res = "当前短信接口账号余额不足！";
                                    break;
                                case "-02":
                                    res = "当前短信接口用户ID错误！";
                                    break;
                                case "-03":
                                    res = "当前短信接口密码错误！";
                                    break;
                                case "-04":
                                    res = "参数不够或参数内容的类型错误！";
                                    break;
                                case "-05":
                                    res = "手机号码格式不对！";
                                    break;
                                case "-06":
                                    res = "短信内容编码不对！";
                                    break;
                                case "-07":
                                    res = "短信内容含有敏感字符！";
                                    break;
                                case "-8":
                                    res = "无接收数据";
                                    break;
                                case "-09":
                                    res = "系统维护中..";
                                    break;
                                case "-10":
                                    res = "手机号码数量超长！（100个/次 超100个请自行做循环）";
                                    break;
                                case "-11":
                                    res = "短信内容超长！（70个字符）";
                                    break;
                                case "-12":
                                    res = "其它错误！";
                                    break;
                            }
                            ClientScript.RegisterStartupScript(typeof(string), "script", "<script>alert('" + res + "');window.onload = TimeClose;</script>"); 
                        }
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(typeof(string), "script", "<script>alert('" + str + "');</script>");
                }
            }
        }
        //添加一条信息
        protected void addMessage()
        {
            M_Message messInfo = new M_Message();
            B_User bll = new B_User();
            messInfo.Sender = SiteConfig.SiteInfo.SiteName;
            messInfo.Title = "注册验证手机短信";
            messInfo.PostDate = DataConverter.CDate(DateTime.Now.ToShortDateString());
            messInfo.Content = SiteConfig.UserConfig.MobileRegInfo.Replace("{$CheckNum}", ViewState["mcode"].ToString()).Replace("{$SiteName}", SiteConfig.SiteInfo.SiteName).Replace("{$SiteUrl}", SiteConfig.SiteInfo.SiteUrl);
            messInfo.Receipt = "";
            messInfo.MsgType = 2;
            messInfo.Incept = this.TxtMobile1.Text.Trim();
            B_Message.Add(messInfo);
        }
        protected void BtnMRegStep1_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox1.Text == ViewState["mcode"].ToString())
                {
                    TxtMobile.Text = TxtMobile1.Text;
                    TxtUserName.Text = TxtMobile1.Text;
                    BtnRegStep1.Visible = false;
                    BtnRegStep1.Visible = false;
                    PnlMRegStep1.Visible = false;
                    BtnRegstep1();
                }
                else
                {
                    ClientScript.RegisterStartupScript(typeof(string), "script", "<script>alert('短信验证码错误！');</script>");
                }
            }
            catch{
                ClientScript.RegisterStartupScript(typeof(string), "script", "<script>alert('请重新发送短信验证码！');</script>");
            }
        }
        public string Get(int a)
        {
            switch (a)
            {
                case 0 :
                    return this.TxtUserName.Text;
                case 1 :
                    return this.TxtEmail.Text;
                case 2:
                    {
                        string password = this.TxtPassword.Text.Substring(0, 3);
                        for (int i = 0; i < this.TxtPassword.Text.Length-3; i++)
                        {
                            password+="*";
                        }
                        return password;
                    }
                default:
                    return null;
            }
        }
    }
}