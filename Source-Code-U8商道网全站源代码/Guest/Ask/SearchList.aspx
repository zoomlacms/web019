<%@ page language="C#" autoeventwireup="true" inherits="Guest_SearchList, App_Web_xwzmyvqh" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>问题列表_<%Call.Label("{$SiteName/}"); %></title>
<link href="../../App_Themes/UserThem/style.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/Guest/ask.css" rel="stylesheet" type="text/css" />
<script src="../../JS/jquery.js" type="text/javascript"></script>
<script src="../Plugins/Ckeditor/ckeditor.js" type="text/javascript"></script>
<script charset="utf-8" src="/Plugins/kindeditor/kindeditor.js"></script>
<script src="../JS/base.js" type="text/javascript"></script>
<script src="../JS/Bkpopup.js" type="text/javascript"></script>
<script type="text/javascript" src="/App_Themes/Guest/base.js"></script>
<style type="text/css">
.popb2 { padding: 10px; line-height: 22px;  font-size: 14px;  width: 280px;  height: 230px; margin: 0 auto; }
#rempassItem   { font-size: 12px; color: #F00;  display: none; }
.regButton  {  padding: 2px; height: 25px;  width: 140px; margin: 10px 60px; }
.f12 {  font-size: 12px; }
#rgHandle {  text-align: center; font-weight: bold;  }
.loginItem  {  width: 140px; }
.abstract {  font-size: 13px; font-family: Arial;  line-height: 18px; }
h2 { font-size: 16px;  font-weight: normal; line-height: 20px;  margin: 0; }
.fs {line-height: 25px; font-size: 12px; font-family: Arial;  } 
.f   { font-size: 100%;  line-height: 120%;  padding-left: 15px; width: 45em;  word-wrap: break-word;  }
td  { font-family: Arial; font-size: 9pt;  line-height: 18px; }
.mod-list .abstract {   font-size: 13px; } 
img.down-arrow {  cursor: pointer; border: 1px solid #fff; }
img.down-arrow-hover  {  cursor: pointer;   border: 1px solid #999;  background: #f7f7f7; }
#nav_extra  {  width: 80px;   font-size: 12px;  text-align: left; padding-bottom: 2px;  position: absolute;   z-index: 65535;  }
#nav_extra a {  font-size: 12px;  color: #00c;  }
#nav_extra .top {  width: 77px;  height: 21px; font-size: 12px;  line-height: 18px; text-indent: 5px;  border: 1px solid #999;  border-bottom: none;  background: #fff;  position: absolute; z-index: 65531;  }
#nav_extra .body { width: 77px; line-height: 18px; border: 1px solid #999;  background: #fff; position: absolute;   top: 20px;  z-index: 65530;  }
#nav_extra .body a {  width: 100%; height: 20px;  display: block;  line-height: 20px;  text-indent: 5px;  }
#nav_extra .body a:hover {  background: #e4e4e4;  }
#usrbar #my_home_container  { padding: 0 7px 2px 5px;  }
.btn_top span{ margin-left:20px;}
</style>
<script type="text/javascript">
function show() {
	var div = document.getElementById("show");
	if (div.style.display == "none") {
		div.style.display = "block";
	}
	// else {div.style.display = "none";}

}
function CheckDirty() {
	var oEditor = CKEDITOR.instances.TxtTContent;
	var value = oEditor.getData();
	var TxtTTitle = document.getElementById("TxtTTitle").value;
	var TxtValidateCode = document.getElementById("TxtValidateCode").value;

	if (value == "" || TxtTTitle == "" || TxtValidateCode == "") {
		if (value == "") {
			var obj = document.getElementById("RequiredFieldValidator1");
			obj.innerHTML = "<font color='red'>内容不能为空！</font>";
		}
		else {
			var obj = document.getElementById("RequiredFieldValidator1");
			obj.innerHTML = "";
		}
		if (TxtTTitle == "") {
			var obj2 = document.getElementById("RequiredFieldValidator2");
			obj2.innerHTML = "<font color='red'>留言标题不能为空！</font>";
		}
		else {
			var obj2 = document.getElementById("RequiredFieldValidator2");
			obj2.innerHTML = "";
		}
		if (TxtValidateCode == "") {
			var obj3 = document.getElementById("sp1");
			obj3.innerHTML = "<font color='red'>验证码不能为空！</font>";
		} else {
			var obj3 = document.getElementById("sp1");
			obj3.innerHTML = "";
		}
		return false;
	}
	else {
		var obj = document.getElementById("RequiredFieldValidator1");
		obj.innerHTML = "";
		var obj2 = document.getElementById("RequiredFieldValidator2");
		obj2.innerHTML = "";
		var obj3 = document.getElementById("sp1");
		obj3.innerHTML = "";
		document.getElementById("EBtnSubmit2").click();
	}
}
</script>
</head>
<body>
<div id="Tab"><ul><li><a href="../Default.aspx">留言</a></li><li><a href="../Baike/Default.aspx" >百科</a></li><li  class="hover"><a href="/guest/Ask/Default.aspx">问答</a></li> </ul><div class="clear"></div></div>
<form id="form1" runat="server">
<div class="top">
    <div class="topnav" id="toptab">
        <div class="topleft" >
            <span  style="<%=getstyle()%>"> 您好！<a href="../../user/" target="_blank"><asp:Label runat="server"  ID="user"></asp:Label></a> 欢迎来<%Call.Label("{$SiteName/}"); %>问答系统！ [<a href="<%=ResolveUrl("~/User/logout.aspx") %>?url=/Guest/Ask/Default.aspx">退出登录</a>]</span>
            <span  style="<%=getstyles()%>">[<a  href="../../user/Login.aspx?ReturnUrl=/guest/">请登录</a>] [<a  href="../../user/register.aspx?ReturnUrl=/guest/">免费注册</a>]</span>
        </div>
        <div class="topright">
            <a href="/">返回首页</a>
            <a href="#" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage(location.href);">设为首页</a>
            <a href="#" onclick="window.external.AddFavorite(location.href,document.title)" style="cursor:pointer;color:blue">收藏本站</a>
        </div>
    </div>
</div>
<div class="header">  
    <div class="h_top">
        <div class="logo">
            <a href="/guest/Ask/Default.aspx" title="问答系统" target="_top">
            <img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>问答系统" />
            </a>
        </div> 
        <div class="clr"></div>
    </div>
    <div class="h_mid">
        <div class="h_mid_l"></div>
        <div id="tdh" class="h_mid_m"> 
        <span style="<%=getstyle()%>">   <a href="MyAskList.aspx?QueType=">我的提问</a> <a href="MyAnswerlist.aspx">我的回答</a></span>
            <ul>
                <li class="on"><a title="问答首页" href="Default.aspx">问答首页</a> </li>
                <!-- <li><a title="知识专题" href="Topic.aspx">知识专题</a></li>-->
                <li><a title="问答之星" href="Star.aspx">问答之星</a></li>
                <li><a title="分类大全" href="Classification.aspx">分类大全</a></li>
            </ul>
        </div>
        <div class="h_mid_r"></div>
    </div>
    <div class="clr"></div>
    <div class="h_b">
        <div class="h_b_l"></div>
        <div class="h_b_m">
            <div class="question_count">
                <span class="count">最佳回答采纳率:</span><span class="adopt" ><%=getAdoption() %></span><br />
                <span class="count">已解决问题数:</span><span class="countques" ><% =getSolvedCount() %></span><br />
                <span class="count">待解决问题数:</span><span class="countques" ><% =getSolvingCount() %></span>
            </div>
            <div class="h_b_input">
                <asp:TextBox runat="server" ID="txtAsk" onmouseover="this.focus()" autocomplete="off"
                class="searchinput" Style="vertical-align: middle;" MaxLength="100" TabIndex="1"
                value="" Width="243px"></asp:TextBox>
                <asp:Button runat="server" ID="btnSearch" class="sub" Text=" " OnClick="btnSearch_Click"
                />
                <asp:Button runat="server" ID="btnAsk" class="but" Text=" " OnClick="btnAsk_Click"
                />
                <asp:Button runat="server" ID="btnAnswer" class="answer" Text="" OnClick="btnAnswer_Click"
                />
            </div>
            <div class="sybz">
                <a href="http://help.Zoomla.cn/" title="帮助" target="_blank">使用<br />帮助</a>
            </div>
            <div class="tongji">
                <div id="move">
                    <span class="count">当前在线:</span><%=getLogined() %><br />
                    <span class="count">注册用户:</span><%=getUserCount() %><br />
                </div>
            </div>
            <div class="clr"></div>
        </div>
        <div class="h_b_r"></div>
    </div>
    <div class="clr"></div>
</div><div id="mysite">
<p >您的位置：<a href="/">网站首页</a>>><a href="Default.aspx">问答中心</a>>><a href="SearchList.aspx?strwhere=">搜索列表</a>&nbsp;&nbsp;</p>
</div>
<div id="main" class="rg_inout">

<div class="btn_top">
    <span class="wirte">全部问答</span><span><a href="List.aspx?strWhere=<%=Server.HtmlEncode(Request["strWhere"]) %>&QueType=<%=Server.HtmlEncode(Request["QueType"]) %>">待完善问题</a></span>
</div>

<div class="asklist">
        <asp:Repeater runat="server" ID="repSearch"  OnItemDataBound="repSearch_ItemDataBound" >
            <ItemTemplate>
                <table>
                    <td>
                            <h3>
                            <a target="_self" href="SearchDetails.aspx?ID=<%#Eval("ID")%>"> <%#Eval("Qcontent")%></a>
                            </h3>
                            <div class="abstract"><%#getanswer(Eval("ID","{0}"))%></div>
                            <div class="fs" >  <asp:Label id="Isname" runat="server">  <a href="../../ShowList.aspx?id=<%#Eval("UserID")%>" target='_blank'><%#Eval("UserName") %></a>
                   </asp:Label>- <%#Eval("AddTime", "{0:yyyy-MM-dd}")%>--<a href="#">
<%#gettype(Eval("QueType","{0}"))%></a></div>
                    </td>
            </table>  
            </ItemTemplate>
        </asp:Repeater>
        <div style="padding-left:20px;">共<asp:Label ID="AllNum" runat="server" Text=""></asp:Label>条记录
        <asp:Label runat="server" ID="Toppage"></asp:Label>
        <asp:Label runat="server" ID="Nextpage"></asp:Label>
        <asp:Label runat="server" ID="Downpage"></asp:Label>
        <asp:Label runat="server" ID="Endpage"></asp:Label>
        页次：<asp:Label ID="Nowpage" runat="server"></asp:Label>/<asp:Label ID="PageSize" runat="server" ></asp:Label>页<asp:Label ID="Lable1" runat="server"></asp:Label>条记录/页 转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ></asp:DropDownList>页
            </div>
    </div>
<!-- 版权信息 -->
</div>
<div id="bottom">
<a href="/"><img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>" /></a>
<p>
<script language="javascript" type="text/javascript"> 
<!--
    var year = "";
    mydate = new Date();
    myyear = mydate.getYear();
    year = (myyear > 200) ? myyear : 1900 + myyear;
    document.write(year); 
    --> 
</script>&copy;&nbsp;Copyright&nbsp; <%Call.Label("{$SiteName/}"); %> All rights reserved.</p>
</div>
</form>
</body>
</html>