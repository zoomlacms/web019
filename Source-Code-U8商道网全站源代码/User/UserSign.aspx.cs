using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.BLL.User;
using ZoomLa.Common;
using ZoomLa.Components;
using ZoomLa.Model;
using ZoomLa.SQLDAL;


public partial class User_UserSign : System.Web.UI.Page
{
    B_User buser = new B_User();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Sign_Btn_Click(object sender, EventArgs e)
    {
        B_User.CheckIsLogged("/");
        int uid = buser.GetLogin().UserID;
        if (IsSignToday(uid))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('您今日已签到，明天再来!');", true);
        }
        else
        {
            M_UserInfo mu = buser.GetLogin();
            string CreateTime = DateTime.Now.ToString();
            int UserID = mu.UserID;
            int Status = 1;
            string Remind = mu.UserName + "签到";
            Insert(CreateTime, UserID, Status, Remind);
            buser.AddPurse(buser.GetLogin().UserID, 0.05);
        }
    }
    /// <summary>
    /// 今天是否签到
    /// </summary>
    /// <returns>True:已签</returns>
    public bool IsSignToday(int uid)
    {
        DataTable dt = new DataTable();
        //select * from "+TbName+" where DateDiff(dd,createtime,getdate())=0
        string sql = "Select ID From ZL_User_SignIn Where DateDiff(dd,CreateTime,getdate())=0 And UserID=" + uid;
        dt = SqlHelper.ExecuteTable(CommandType.Text, sql);
        return dt.Rows.Count > 0;
    }
    public void Insert(string CreateTime, int UserID, int Status, string Remind)
    {
        SqlParameter[] sp = new SqlParameter[] { new SqlParameter("CreateTime", CreateTime), new SqlParameter("Remind", Remind) };
        SqlHelper.ExecuteSql("Insert ZL_User_SignIn (UserID,UserText,Status,CreateTime,Remind) values (" + UserID + ",''," + Status + ",@CreateTime,@Remind)", sp);
    }
}