<%@ page language="C#" autoeventwireup="true" inherits="V_Content_EditContent, App_Web_51yxiush" masterpagefile="~/Manage/I/Default.master" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <title>修改内容</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Content">
    <asp:HiddenField ID="nodename" runat="server" />
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#ConInfo" data-toggle="tab">内容信息</a></li>
            <li><a href="#InfoAttr" data-toggle="tab">信息属性</a></li>
            <li><a href="#Process " data-toggle="tab">流程控制</a></li>
            <li><a href="#Reward " data-toggle="tab">悬赏定义</a></li>
            <li style="margin-left:10px;position:relative;top:-5px;" runat="server" id="Remind_Li" visible="false">
                <a href="#InfoAttr" data-toggle="tab" style="border:none;display:block;height:45px;width:40px; background:url(/App_Themes/Guest/images/base_icon.png) no-repeat  -143px 5px;" title="提示：该内容启用了个性模板"></a>
            </li>
        </ul>
        <!--左上 越大则越左,越大则越上-->
        <!--0px为起点位置-->
        <div class="tab-content" style="margin-bottom:30px;">
            <div class="tab-pane active" id="ConInfo" >
                <table class="table table-bordered table_padding0" style="margin-bottom:0;">
                    <tr>
                        <td align="right" style="width:100px;">
                            <asp:Label ID="bt_txt" runat="server" Text="标题"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTitle" style="max-width:715px;background:url(/Images/bg1.gif) repeat-x;" CssClass="form-control" onblur="getstrKeys()" onkeyup="isgoEmpty('txtTitle','span_txtTitle');Getpy('txtTitle','PYtitle')" runat="server" Text=''></asp:TextBox>
                            <span id="span_txtTitle" name="span_txtTitle"></span><span><span style="color: red">*</span></span>
                            <input id="Button3" type="button" value="标题属性" onclick="open_style()" class="btn btn-primary btn-xs" />
                            <asp:HiddenField ID="ThreadStyle" runat="server" />
                            
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtTitle">内容标题必填</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td  align="right">
                            <asp:Label ID="Label7" runat="server" Text="拼音"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="PYtitle" runat="server" Text='' Width="10%" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdbgleft" style="width: 20%" align="right">
                            <asp:Label ID="gjz_txt" runat="server" Text="关键字"></asp:Label>
                            &nbsp;
                        </td>
                        <td class="bqright">
                            <asp:TextBox ID="TxtTagKey" CssClass="form-control pill-left" runat="server" Text='' Width="41%"></asp:TextBox>
                            &nbsp;<span style="color: #0000ff"><input id="Button7" type="button" value="提取关键字"
                                onclick="getstrKeys()" class="C_input" style="width: 110px; margin-left: 8px;" />[</span><a href="javascript:;"
                                    onclick="SelectKey();"> <span style="text-decoration: underline; color: Green;">选择关键字</span></a><span
                                        style="color: #0000ff">]</span> (使用空格分隔每个关键字)
                        </td>
                    </tr>

                    <tr>
                        <td align="right">
                            <asp:Label ID="Label21" runat="server" Text="副标题"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Subtitle" runat="server" Text='' Width="41%" CssClass="form-control pill-left" TextMode="SingleLine"></asp:TextBox>
                        </td>
                    </tr>
                    <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
                    <tr>
                        <td style="width: 20%; line-height: 100px; height: 100px" align="right">
                            <div style="float: left; height: 100px; width: 150px; text-align: center;">
                                <label id="picview" name="picview">
                                </label>
                            </div>
                            <asp:Label ID="Label6" runat="server" Text="附属图片"></asp:Label>
                        </td>
                        <td class="bqright" style="line-height: 100px; height: 100px">
                            <select name="selectpic" id="selectpic" onchange="ShowPic(this.value)" onclick="LoadImg('txt_content')" class="form-control">
                                <option value="" selected="selected">不指定附属图片</option>
                            </select>
                        </td>
                    </tr>
                    <tr id="CreateHTML" runat="server">
                        <td  align="right">
                            <asp:Label ID="Label4" runat="server" Text="生成"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="quickmake" runat="server" Checked="true" Text="是否立即生成" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="tab-pane fade" id="InfoAttr">
                <table class="table table-bordered table_padding0">
                    <tr>
                        <td align="right">
                            <span>录入者</span> 
                        </td>
                        <td>
                            <asp:TextBox ID="txtInputer" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <span>添加时间</span> 
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddTime" CssClass="form-control" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <span>更新时间</span> 
                        </td>
                        <td>
                            <asp:TextBox ID="txtdate" class="form-control" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });"></asp:TextBox>


                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="hits_txt" runat="server" Text="点击数"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNum" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <span>指定个性模板</span> 
                        </td>
                        <td>
                            <asp:TextBox ID="TxtTemplate" CssClass="form-control" runat="server" Columns="50"></asp:TextBox>
                            <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText='+escape('TxtTemplate')+'&FilesDir=',650,480)" class="btn btn-primary btn-xs" />
                        </td>
                    </tr>
                    <tr id="outpdf">
                        <td align="right">
                            <asp:Button runat="server" ID="makePDFBtn" Text="生成PDF" CssClass="btn btn-primary btn-xs" OnClick="makePDFBtn_Click" />
                        </td>
                        <td>
                            <asp:LinkButton runat="server" ID="downPdfHref" ToolTip="点击下载" OnClick="downPdfBtn_Click" Visible="false">
                                <img src="/Plugins/ckfinder/skins/kama/images/icons/16/pdf.gif" style="margin-right:2px;position:relative;top:3px;"/>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="delPdfHref" ToolTip="删除" OnClick="delPdfBtn_Click" OnClientClick="return confirm('确定要删除吗!')" Visible="false">
                                <img src="/App_Themes/AdminDefaultTheme/images/del.png" style="position:relative;top:3px;"/>
                            </asp:LinkButton>
                        </td>
                    </tr>
                    <tr id="outword">
                        <td align="right">
                            <asp:Button runat="server" ID="makeWordBtn" Text="生成Word" CssClass="btn btn-primary btn-primary btn-xs" OnClick="makeWordBtn_Click" />
                        </td>
                        <td>
                            <asp:LinkButton runat="server" ID="downWordHref" ToolTip="点击下载" OnClick="downWordBtn_Click" Visible="false">
                                <img src="/Plugins/Ueditor/themes/default/images/word.gif" style="margin-right:2px;position:relative;top:3px;"/></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="delWordHref" ToolTip="删除" OnClick="delWordBtn_Click" OnClientClick="return confirm('确定要删除吗!')" Visible="false">
                                <img src="/App_Themes/AdminDefaultTheme/images/del.png" style="position:relative;top:3px;height:16px;width:16px;"/></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="tab-pane fade" id="Process">
                <table class="table table-bordered table_padding0">
                    <tr>
                        <td align="right">
                            <asp:Label ID="tj_txt" runat="server" Text="推荐级别"></asp:Label>
                            
                        </td>
                        <td>
                            <asp:CheckBox ID="ChkAudit" Text="推荐" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="zht_txt" runat="server" Text="状态"></asp:Label> 
                        </td>
                        <td>
                            <asp:RadioButtonList ID="ddlFlow" runat="server" RepeatDirection="Horizontal" RepeatColumns="5">
                                <%--      <asp:ListItem Selected="True" Value="99">已审</asp:ListItem>
					            <asp:ListItem Value="0">待审</asp:ListItem>
					            <asp:ListItem Value="-1">退稿</asp:ListItem>--%>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="tab-pane fade" id="Reward">
                <table class="table table-bordered table_padding0">
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label3" runat="server" Text="发布悬赏"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="BidType" CssClass="form-control" runat="server" onchange="changevalue(this.value);">
                                <asp:ListItem Value="0">选择方式</asp:ListItem>
                                <asp:ListItem Value="1">单人中标</asp:ListItem>
                                <asp:ListItem Value="2">记件工资</asp:ListItem>
                            </asp:DropDownList>
                            <div id="changeins" style="display: none">
                                我想要
					            <asp:TextBox ID="pronum" Width="30px" runat="server" CssClass="form-control">0</asp:TextBox>
                                个方案，每个
					            <asp:TextBox ID="bidmoney" Width="30px" runat="server" CssClass="form-control">0</asp:TextBox>
                                元
                            </div>
                        </td>
                    </tr>
                    <tr id="bidmoneytable">
                        <td align="right">
                            <asp:Label ID="Label5" runat="server" Text="项目完成周期"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="proweek" runat="server" Width="60" CssClass="form-control">0</asp:TextBox>天
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="Conent_fix">
        <asp:Button ID="EBtnSubmit" CssClass="btn btn-primary" Text="保存项目" runat="server" OnClick="EBtnSubmit_Click" />
        <asp:Button ID="Button1" CssClass="btn btn-primary" Text="添加为新项目" runat="server" OnClick="Button1_Click" />
        <asp:Button ID="BtnBack" CssClass="btn btn-primary" Text="返回" runat="server" OnClick="BtnBack_Click" UseSubmitBehavior="False" CausesValidation="False" />
        <asp:Button ID="BtnDoc" CssClass="btn btn-primary" runat="server" OnClientClick="return generate('docTitle','docParamValue');" Text="重新生成文档" Visible="false" />
        <asp:HiddenField ID="HdnItem" runat="server" />
        <asp:HiddenField ID="HdnNode" runat="server" />
        <asp:HiddenField ID="docParamValue" runat="server" />
        <asp:HiddenField ID="docTitle" runat="server" />
        <asp:HiddenField ID="isDoc" runat="server" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Dialog.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/chinese.js"></script>
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script>
        $().ready(function () {
            $(".tabbable").find(":input[type=button]").addClass("btn btn-primary btn-xs");
            $("tr").removeClass("tdbg");
        })
        function isgoEmpty(Str, FS_Alert) {
            var Obj = document.getElementById(Str);
            var value = Obj.value.replace(/(^\s*)|(\s*$)/g, "");
            if (value == "") {
                document.getElementById(FS_Alert).innerHTML = "<span style=\"color:Red\">不能为空</span>";
                return false;
            } else {
                var Str_Len = "";
                var Len_Color = "";
                Str_Len = value.length;
                if (Str_Len <= 50) {
                    Len_Color = "006600";
                }
                else if (Str_Len > 50 && Str_Len <= 100) {
                    Len_Color = "3300FF";
                }
                else if (Str_Len > 100) {
                    Len_Color = "FF0000";
                }
                document.getElementById(FS_Alert).innerHTML = "<span>字数：<font style=\"color:#" + Len_Color + ";font-weight:bold;\">" + Str_Len + "</font></span>";
                return true;
            }
        }
        function getstrKeys() {
            document.getElementById("TxtTagKey").value = "";
            var strKeys = "";
            var strkey = "<%=getKey()%>";
        var strTitle = document.getElementById("txtTitle").value;
        var keys = new Array();
        keys = strkey.split(",");
        for (var i = 0; i < keys.length; i++) {
            if (!(strTitle.indexOf(keys[i]) < 0)) {
                if (i == 0) {
                    strKeys = keys[i];
                }
                else {
                    strKeys = strKeys + " " + keys[i];
                }
            }
        }
        var strtxt = document.getElementById("TxtTagKey").value;
        document.getElementById("TxtTagKey").value = strtxt + strKeys;
    }
    $(window).resize(function () { SetEditorByClass(); });
    function open_style() {
        var diag = new Dialog();
        diag.Width = 600;
        diag.Height = 400;
        diag.Title = "设置标题字体<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
        diag.URL = "/Common/SelectStyle.htm";
        diag.show();
        //window.open("../../Common/SelectStyle.htm", "", "width=600,height=400")
    }
    var diag = new Dialog();
    function opentitle(url, title) {
        diag.Width = 1000;
        diag.Height = 750;
        diag.Title = title;
        diag.URL = url;
        diag.show();
    }
    function editnode(NodeID) {
        var answer = confirm("该栏目未绑定模板，是否立即绑定");
        if (answer == false) {
            return false;
        }
        else {
            open_page(NodeID, "EditNode.aspx?NodeID=");
        }
    }
    function closdlg() {
        Dialog.close();
    }
    function open_page(NodeID, strURL) {
        var diag = new Dialog();
        diag.Width = 1000;
        diag.Height = 750;
        diag.Title = "配置节点<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
        diag.URL = strURL + NodeID;
        diag.show();
    }
    function GetPicurl(imgurl) {
        var optlen = document.getElementById("selectpic").options.length;
        var isin = 0;

        for (var i = 0; i < optlen; i++) {
            var doctxt = document.getElementById("selectpic").options.item(i);
            if (doctxt.value.toLowerCase() == imgurl.toLowerCase() || imgurl.toLowerCase().indexOf("http://") > -1) {
                isin = 1;
            }
        }

        if (isin == 0) {
            var option = document.createElement("option");
            option.text = imgurl;
            option.value = imgurl;
            document.getElementById("selectpic").add(option);
        }
    }
    function ShowPic(content) {
        if (content != "") {
            document.getElementById("picview").innerHTML = "<img width=100px height=100px src=" + content + " />";
        } else {
            document.getElementById("picview").innerHTML = "";
        }
    }
    function LoadImg(content) {
        eval("var oEditor = CKEDITOR.instances." + content);

        var contenttxt = $("#" + content).val().toLowerCase();

        var myregexp = /src=\"(.*?).(gif|jpg|png)/img;
        var match = myregexp.exec(contenttxt);
        while (match != null) {
            var picurl = match[0];

            if (picurl.indexOf("http://") == -1) {
                picurl = picurl.replace("src=\"", "")
                GetPicurl(picurl);
            }
            else {
                picurl = picurl.replace("src=\"", "")
                GetPicurl(picurl);
            }
            match = myregexp.exec(contenttxt);
        }
    }
    function SelectKey() {
        window.open('/Common/KeyList.aspx?OpenerText=<%=TxtTagKey.ClientID %>', '', 'width=600,height=450,resizable=0,scrollbars=yes');
	}
    </script>
    <style>
        #txtTitle{ width:715px;}
    </style>
</asp:Content>
