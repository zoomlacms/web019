<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.User.User_Register, App_Web_5pm4gcsi" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<title>用户注册-<%Call.Label("{$SiteName/}"); %></title>
<%Call.Label("{ZL:Boot()/}"); %>
<link href="../App_Themes/UserThem/style.css"rel="stylesheet" type="text/css" />
<link href="<%Call.Label("{$CssDir/}"); %>global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%Call.Label("{$CssDir/}"); %>js/dh_1.js"></script>

<script type="text/javascript" src="/JS/Common.js"></script>
<script src="/JS/calendar.js" type="text/javascript"></script>
<script type="text/javascript" src="/JS/ajaxrequest.js"></script>
<script type="text/javascript" src="/JS/PassStrong.js"></script>
<script src="/JS/DatePicker/WdatePicker.js" type="text/javascript"></script>
<%--<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script> --%>
<script type="text/javascript" src="../JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/JS/FrontPage.js"></script>
<script type="text/javascript">
var ajax1 = new AJAXRequest;
function e_get() {
var url = document.getElementById("hfUrl").value;
var username = document.getElementById("<%= TxtUserName.ClientID %>").value;
var pass = document.getElementById("<%=TxtPassword.ClientID %>").value;
var mail = document.getElementById("<%=TxtEmail.ClientID %>");
url = url + "?username=" + username + "&pass=" + pass + "&mail=" + mail;
ajax1.get(
url,
function (obj) {
var index = 1;
var i = obj.responseText;
if (i == "[Fail]" && index <= 3) {
e_get();
}
}
);
}

var i = 60;//倒计时
function TimeClose() { 
if (i > 0) {
i--;
document.getElementById("sendBtn").value="("+i+"秒后)重发验证码";
document.getElementById("sendBtn").disabled="true";
}
else { 
document.getElementById("sendBtn").value ="重新获取验证码";
document.getElementById("sendBtn").disabled="false";
}
window.setTimeout(function () { TimeClose() }, 1000);
}
function code()
{
v = $("#SendVcode").val();
var flag=codeIsRight(v);
if(!flag)
{
$("#SendVcode").focus();
}
else
{
$("#BtnSubmit").trigger("click");
}
}

</script>
<style type="text/css">

#main{ margin-top:10px;}
body{ background:none}
.tdbgleft{ text-align:right;}
#TxtUserName,#TxtPassword,#TxtPwdConfirm,#TxtAnswer,#TxtEmail,#TxtTrueName,#TxtAddress,#TxtMobile,#DropDownList1{ width:300px; display:inline;}
.reg_sub li{ margin-bottom:10px; line-height:36px;}
.reg_sub tr{ margin-top:10px;}
.emptyDiv{padding-left:10px; height:auto; width:auto}
.reg_sub #userinfo li{ float:left;}
.breadcrumb li {FONT-FAMILY:"Microsoft Yahei", SimSun, Tahoma, Helvetica, Arial, sans-serif;}
</style>
</head>
<body onLoad="SwicthSelectFill()">
<%Call.Label("{ZL.Label id=\"全站头部\" /}"); %>
<div class="container">
<div class="row">
<div  class="col-lg-9 col-md-9 col-sm-9 col-xs-12 padding0" style=" margin-top:10px;border:1px solid #ccc;">
<ol class="breadcrumb" style="margin-top:0;">
<li><strong>新用户注册</strong></li>
<li class="active">1、填写注册信息</li>
<li>2、验证邮箱</li>
<li>3、完成注册</li>
</ol>
<form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
<script type="text/javascript">
function gotouser() {
window.setTimeout("gotouserpage()", 5000);
}
function gotouserpage() {
<%
if(Session["MicroLogin"]!=null)
{
%>
location = "../Microblog.aspx?id="+<%=GetUserID()%>;
<%
}
else
{
%>
location = document.getElementById("hfReturnUrl").value;
<%
}
%>  
}
var ms=5;
function setTimeShow(){
document.getElementById("spanTime").innerHTML="还剩"+ms+"秒跳转到登录";
ms--;
if(ms<=0){
window.location.href="login.aspx";
}
window.setTimeout("setTimeShow()", 5000);
}
</script>
<!-- 顶部代码布局 -->
<!-- 正文布局 -->
<div class="reg" >
<!-- 右边开始 -->
<asp:Literal ID="LitControlTreeInfo" runat="server"></asp:Literal>
<asp:Panel ID="PnlRegStep0" runat="server" Visible="false" Width="100%">
未开放注册，请和网站管理员联系！</asp:Panel>
<asp:Panel ID="PnlRegStep1" runat="server" Visible="false" Width="100%">
<h1>
第一步：服务条款和声明<img alt="" src="../App_Themes/UserThem/images/regl1.gif" /></h1>
<textarea name="textarea" cols="20" rows="2" readonly style="font-weight: normal;
font-size: 9pt; width: 99%; line-height: normal; font-style: normal; height: 372px;
font-variant: normal"><asp:Literal ID="LitProtocol" runat="server"></asp:Literal>
</textarea>
<div class="rsubmit">
<asp:Button ID="BtnRegStep1" CssClass="i_bottom" runat="server" Text="同意" OnClick="BtnRegStep1_Click" />
<asp:Button ID="BtnRegStep1NotApprove" runat="server" Text="不同意" OnClick="BtnRegStep1NotApprove_Click"
CssClass="i_bottom" />
</div>
<asp:HiddenField ID="hfUrl" runat="server" />
<!--第二轮开始 -->
<script type="text/javascript" language="javascript">	
<!--
var secs = 9;
var wait = secs * 1000;
var btnId = "<%= BtnRegStep1.ClientID %>";
document.getElementById(btnId).disabled = true;

function regload() {
document.getElementById(btnId).value = "我同意[" + secs + "]";
for (i = 1; i <= secs; i++) {
window.setTimeout("Update(" + i + ")", i * 1000);
}
window.setTimeout("Timer()", wait);
}

function Update(num) {
if (num != secs) {
printnr = (wait / 1000) - num;
document.getElementById(btnId).value = "我同意[" + printnr + "]";
}
}
function Timer() {
document.getElementById(btnId).disabled = false;
document.getElementById(btnId).value = "我同意";
}
function endbtn() {
document.getElementById(btnId).disabled = false;
}
//-->


</script>

</asp:Panel>
<asp:Panel ID="PnlMRegStep1" runat="server">
<div id="MobileRegis" runat="server">
<h1>
第一步：手机验证<img alt="" src="../App_Themes/UserThem/images/regl1.gif" /></h1><asp:Label ID="lbmob" runat="server"></asp:Label>
<table>
<tr><td>手机号：</td><td><asp:TextBox ID="TxtMobile1" runat="server" CssClass="input_out"></asp:TextBox> <asp:Literal ID="Literal4" runat="server"></asp:Literal>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="手机号码不能为空" SetFocusOnError="false"  ControlToValidate="TxtMobile1"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TxtMobile1" ErrorMessage="请输入正确的手机号码" ValidationExpression="^1(?:3|5|8)\d{9}$"></asp:RegularExpressionValidator></td></tr>
<tr><td>短信验证码：</td><td> <asp:TextBox ID="TextBox1" runat="server" CssClass="input_out"></asp:TextBox> <asp:Button ID="sendBtn" runat="server" Text="获取验证码" OnClick="SendMob_Click" Style=" border:none; border:1px solid #71b2ce;background:#d8f2ff;height:22px;" /></td></tr>
<tr><td colspan="2"><asp:Button ID="Button1" runat="server" Text="下一步" OnClick="BtnMRegStep1_Click"  CssClass="i_bottom" /></td></tr>
</table>    
</div>

</asp:Panel>
<asp:Panel ID="PnlRegStep2" runat="server" Visible="false" Width="100%">
<script type="text/javascript" language="javascript">

var btnId2 = "<%=BtnSubmit.ClientID %>";

function checkreg(obj) {

if (document.getElementById("CheckBox1").checked) {
document.getElementById(btnId2).disabled = false;
}
else {
document.getElementById(btnId2).disabled = true;
}
}
function dispbtn()
{
document.getElementById(btnId2).disabled = true;
}


function CheckUser()
{
var userName = document.getElementById("<%= TxtUserName.ClientID %>");
var checkUserNameMessage = document.getElementById("CheckUserNameMessage");       
if(userName.value=="" ||userName.value == null)
{
checkUserNameMessage.innerHTML = "用户名为空";       
checkUserNameMessage.className = "d_err";
}
else
{
CallTheServer(userName.value,"");

}
} 
function CallTheServer(arg,context)
{                    
var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
checkUserNameMessage.className = "";
checkUserNameMessage.innerHTML = "<img src=\"images/loading.gif\" align=\"absmiddle\" />";                        
<%= CallBackReference %>
}

function ReceiveServerData(result)
{ 
var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
if(result == "true")
{
checkUserNameMessage.innerHTML = "用户名已经被注册了！";
checkUserNameMessage.className = "d_err";
}

if(result == "error01"||result == "Nidtrue2"||result == "Nno"||result == "Nidtrue"||result=="Nyidtrue"||result=="Ncidtrue"||result=="Nxidtrue")
{
checkUserNameMessage.innerHTML = "用户名不允许纯数字！";//
checkUserNameMessage.className = "d_err";
}
if(result == "error02")
{
checkUserNameMessage.innerHTML = "用户名不允许纯英文！";//
checkUserNameMessage.className = "d_err";
}
if(result == "error03")
{
checkUserNameMessage.innerHTML = "用户名不允许带有中文！";//
checkUserNameMessage.className = "d_err";
}

if(result == "error04")
{
checkUserNameMessage.innerHTML = "用户名不允许带有特殊字符！";//
checkUserNameMessage.className = "d_err";
}
if(result == "error05")
{
checkUserNameMessage.innerHTML = "用户名不合法！";//
checkUserNameMessage.className = "d_err";
}

if(result == "error06")
{
checkUserNameMessage.innerHTML = "包含不允许注册的词语！";//
checkUserNameMessage.className = "d_err";
}
if(result == "error07")
{
checkUserNameMessage.innerHTML = "用户名已经存在！";//
checkUserNameMessage.className = "d_err";
}


if(result == "disabled")
{
checkUserNameMessage.innerHTML = "该用户名禁止注册！";
checkUserNameMessage.className = "d_err";
}

if(result == "false"||result == "Fidtrue2"||result == "Fno"||result == "Fidtrue"||result=="Fyidtrue"||result=="Fcidtrue"||result=="Fxidtrue")
{
checkUserNameMessage.innerHTML = "恭喜您，用户名可以使用！";
checkUserNameMessage.className = "d_ok";
}

if(result == "error")
{
checkUserNameMessage.innerHTML = "用户名必须大于<%=UserNameLimit() %>个字符并且不能超过<%=UserNameMax() %>！";//
checkUserNameMessage.className = "d_err";
}

}

function  Checkyes()
{
var idCard = document.getElementById("<%= TxtIDCard.ClientID %>");
var checkcardmsg=document.getElementById("checkcard");
if(idCard.value=="" ||idCard.value == null)
{
checkcardmsg.innerHTML = "身份证为空";       
checkcardmsg.className = "d_err";
}
else
{
CallTheServers(idCard.value,"");

}
}
function  CallTheServers(args,context)
{
var checkcardmsg=document.getElementById("checkcard");
checkcardmsg.className = "";
checkcardmsg.innerHTML = "<img src=\"images/loading.gif\" align=\"absmiddle\" />";                        
<%= CallBackcard %>

}
function ReceiveServerDataID(result)
{   
var checkcardmsg = document.getElementById("checkcard");
if(result=="idtrue2"||result=="Nidtrue2"||result=="Fidtrue2")
{
checkcardmsg.innerHTML = "请输入正确格式！";
checkcardmsg.className = "d_err";
}
else if(result == "idtrue"||result == "Nidtrue"||result == "Fidtrue")
{
checkcardmsg.innerHTML = "该身份证已被注册！";
checkcardmsg.className = "d_err";
} 
else if(result=="Fyidtrue"||result=="Nyidtrue"||result=="yidtrue")
{
checkcardmsg.innerHTML = "该身份证生日不正确！";
checkcardmsg.className = "d_err";
}
else if(result=="Fcidtrue"||result=="Ncidtrue"||result=="cidtrue")
{
checkcardmsg.innerHTML = "您超过了200岁？-吉尼斯世界纪录最长寿的人是132岁！";
checkcardmsg.className = "d_err";
}
else if(result=="Fxidtrue"||result=="Nxidtrue"||result=="xidtrue")
{
checkcardmsg.innerHTML = "您还没出生吧？";
checkcardmsg.className = "d_err";
}
else if(result=="Fno"){
//result=no02 ,result=no01;
checkcardmsg.innerHTML = "该身份证可用！";
checkcardmsg.className = "";
} 
}

function CheckParentUser()
{
var userName = document.getElementById("<%= TxtParentUserID.ClientID %>");
var checkUserNameMessage = document.getElementById("CheckParentUserMessage");       
if(userName.value=="" ||userName.value == null)
{
checkUserNameMessage.innerHTML = "推荐人为空";       
checkUserNameMessage.className = "d_err";
}
else
{
CallTheServerss("P|"+userName.value,"");
}
}
function  CallTheServerss(argss,context)
{
var checkcardmsg=document.getElementById("CheckParentUserMessage");
checkcardmsg.className = "";
checkcardmsg.innerHTML = "<img src=\"images/loading.gif\" align=\"absmiddle\" />";                        
<%= callBackParent %>

}
function ReceiveServerDataParent(result)
{    
var checkcardmsg = document.getElementById("CheckParentUserMessage"); 
if(result == "Ptrue")
{
checkcardmsg.innerHTML = "该用户存在！";
checkcardmsg.className = "d_err";
} 
else
{
//result=no02 ,result=no01;
checkcardmsg.innerHTML = "该用户不存在！";
checkcardmsg.className = "";
} 
}

function SwicthSelectFill()
{
var selectFill = document.getElementById("<%= TableRegisterSelect.ClientID %>");
var selectFill2 = document.getElementById("TableRegisterSelect2");
if(selectFill.style.display=="none")
{
selectFill.style.display="";
selectFill2.style.display="";
}
else
{
selectFill.style.display="none";
selectFill2.style.display="none";
}
}

function hidenbtn()
{
var selectFill = document.getElementById("<%= TableRegisterSelect.ClientID %>");
var selectFill2 = document.getElementById("TableRegisterSelect2");
selectFill.style.display="none";
selectFill2.style.display="none";
document.getElementById("checkSelectFill").checked=false;
}

function EndRequestHandler(sender, args)
{
if (args.get_error() != undefined){
alert("检测到表单中存在HTML代码！");
args.set_errorHandled(true);
}
}

</script>
<div class="reg">
<h1 style="display:none;"> <asp:Literal ID="Literal3" runat="server" Text="第二步："></asp:Literal>填写会员信息<img alt="" src="../App_Themes/UserThem/images/regl2.gif" /></h1> 
<div class="reg_sub">
<div class="reg_title">
创建您的帐号</div>
<ul style="padding-bottom:0;">
<li>
<div class="reg_put">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<asp:RadioButtonList ID="UserGroup" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="UserGroup_SelectedIndexChanged"
			RepeatColumns="4" AutoPostBack="True">
		</asp:RadioButtonList>
	</ContentTemplate>
</asp:UpdatePanel>
</div>
用户类型： </li>
<li>
<div class="reg_put">
	<asp:TextBox ID="TxtUserName" CssClass="form-control" runat="server" onblur="CheckUser();"></asp:TextBox>
			<span style="color: Red" id="CheckUserNameMessage"></span>
            <span style="color:#f00;">*</span>
			<asp:Literal ID="usertip" runat="server"></asp:Literal>
			&nbsp;用户名在<asp:Literal ID="Literal2" runat="server"></asp:Literal>～<asp:Literal ID="Literal1"
				runat="server"></asp:Literal>个字符之间
			<asp:RequiredFieldValidator ID="ReqTxtUserName" runat="server" ControlToValidate="TxtUserName"
				SetFocusOnError="false" ErrorMessage="用户名不能为空" Display="None"></asp:RequiredFieldValidator>
			<asp:RegularExpressionValidator ID="ValgTextMaxLength" ControlToValidate="TxtUserName"
				ValidationExpression="^[a-zA-Z0-9_\u4e00-\u9fa5\@\.]{4,40}$" SetFocusOnError="false"
				Display="None" runat="server"></asp:RegularExpressionValidator> 
</div>
用户名：</li>
<!--<li>
<div class="reg_put">
<input id="CheckUserName" type="button" value="检测" onclick="CheckUser()" class="g_bottom" />
</div>
</li>-->
<li>
<div class="reg_put"> 
	<asp:TextBox ID="TxtPassword" TextMode="Password" runat="server" CssClass="form-control" onfocus="focusinput();" onblur="document.getElementById('valPass').style.display='none';"></asp:TextBox>
    <span style="color:#f00;">*</span>
<div id="valPass" style="width: 100px; height: 30px; display: none; float: right; margin-left: 10px;">
	<span class="spantxt"><a id="idshow" class="atxt"></a></span><span class="spantxt"><a id="apass1" class="a_bor"></a><a id="apass2" class="a_bor"></a><a id="apass3" class="a_bor"> </a></span>
</div>
<asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server"
	ControlToValidate="TxtPassword" ValidationExpression="[\S]{6,}" ErrorMessage="密码至少6位"
	Display="Dynamic"></asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="ReqTxtPassword" runat="server" ControlToValidate="TxtPassword"
	SetFocusOnError="false" ErrorMessage="密码不能为空"></asp:RequiredFieldValidator>
</div>
密 码：</li>
<li>
<div class="reg_put">
<asp:TextBox ID="TxtPwdConfirm" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
<span style="color:#f00;">*</span>
<asp:RequiredFieldValidator ID="ReqTxtPwdConfirm" runat="server" ControlToValidate="TxtPwdConfirm"
	SetFocusOnError="false" Display="Dynamic" ErrorMessage="确认密码不能为空"></asp:RequiredFieldValidator><asp:CompareValidator
		ID="ValCompPassword" runat="server" ControlToValidate="TxtPwdConfirm" ControlToCompare="TxtPassword"
		Operator="Equal" SetFocusOnError="false" ErrorMessage="两次密码输入不一致" Display="Dynamic"></asp:CompareValidator>
</div>
确认密码： </li>
<li id="regVcodeRegister" runat="server" visible="false">
<div class="reg_put">
<asp:TextBox ID="SendVcode" MaxLength="6" runat="server" CssClass="form-control" autocomplete="off" onkeyup="checkCode(this);" ClientIDMode="Static"></asp:TextBox>
<asp:Image ID="Image1" runat="server" ImageUrl="~/Common/ValidateCode.aspx" Height="20px"
	ToolTip="点击刷新验证码" Style="cursor: pointer; border: 0; vertical-align: middle;"
	onclick="this.src='/Common/ValidateCode.aspx?t='+Math.random()" />
<span id="codeCheck"></span>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SendVcode"
	Display="Dynamic" ErrorMessage="验证码不能为空!"></asp:RequiredFieldValidator>
<asp:Label ID="Validateinfo" runat="server" Text=""></asp:Label>
</div>
验证码：<b>*</b> </li>
</ul>
<div class="reg_title">
帐户安全设置</div>
<ul>
<li>
<div class="reg_put">
<asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
	<asp:ListItem>最喜欢的运动是什么？</asp:ListItem>
	<asp:ListItem>最喜欢的运动员是谁？</asp:ListItem>
	<asp:ListItem>我最喜欢的物品的名称？</asp:ListItem>
	<asp:ListItem>我最喜欢的歌曲？</asp:ListItem>
	<asp:ListItem>我最喜欢的食物？</asp:ListItem>
	<asp:ListItem>我最爱的人的名字？</asp:ListItem>
	<asp:ListItem>我最爱的电影？</asp:ListItem>
	<asp:ListItem>我妈妈的生日？</asp:ListItem>
	<asp:ListItem>我的初恋日期？</asp:ListItem>
</asp:DropDownList>
<span style="color:#f00;">*</span>
</div>
密码问题：</li>
<li>
<div class="reg_put">
<asp:TextBox ID="TxtAnswer" runat="server" CssClass="form-control"></asp:TextBox>
<span style="color:#f00">*</span>
<asp:RequiredFieldValidator ID="ReqAnswer" runat="server" ControlToValidate="TxtAnswer" SetFocusOnError="false" Display="None" ErrorMessage="问题答案不能为空"></asp:RequiredFieldValidator>
</div>
问题答案：</li>
<li id="regEmail" runat="server">
<div class="reg_put">
<asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control"></asp:TextBox>
<span style="color:#f00">*</span>
<asp:RequiredFieldValidator ID="ReqTxtEmail" runat="server" ControlToValidate="TxtEmail" SetFocusOnError="false" Display="None" ErrorMessage="Email不能为空"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmail"
	ErrorMessage="邮件地址不规范" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
</div>
Email：<b>*</b> </li>
</ul>
<div class="reg_title">
补充丰富资料</div>
<ul style="display:none;">
<li>
<div class="reg_put" style="width:96%">
<asp:UpdatePanel ID="UpdatePanel3" runat="server">
	<ContentTemplate>
		<table id="Table1" style="border-collapse: collapse" cellspacing="1" cellpadding="2"
			width="100%" border="0">
			<asp:Literal ID="modelhtml" runat="server"></asp:Literal>
		</table>
	</ContentTemplate>
</asp:UpdatePanel>
</div>
</li>
</ul>
<ul  style="display:none">
<li>  
<span class="reg_put" style=" width:100%;" >
<table id="TableRegisterMust" runat="server" border="0" cellpadding="2" cellspacing="1"
style="border-collapse: collapse" width="100%">
<tr id="usergroupss" runat="server" style="display: none;">
	<td class="tdbgleft" style="width: 15%">
	</td>
</tr>
</table>
</span>
</li>
</ul>
<ul style=" display:none">
<li id="trSwicthSelectFill">
<div class="reg_put">
<input id="checkSelectFill" onclick="SwicthSelectFill()" type="checkbox" />
<label style="color: blue" for="checkSelectFill">
	显示用户设置选填信息</label>
</div>
选填信息： </li>
</ul>
<div class="reg_title" style="display:none;">
选填信息
</div>
<ul style="display:none;">
<li>
<div class="reg_put" style="width:96%">
<table style="border-collapse: collapse; display: none;" id="TableRegisterSelect"
	cellspacing="1" cellpadding="2" width="100%" border="0" runat="server">
	<thead>
	</thead>
	<tbody>
	</tbody>
	<tr id="trSwicthSelectFill" runat="server" onmouseover="this.className='tdbgmouseover'"
		onmouseout="this.className='tdbg'">
		<td style="width: 15%" class="tdbgleft" onclick="SwicthSelectFill()">
		</td>
		<td>
		</td>
	</tr>
</table>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
	<ContentTemplate>
		<table style="border-collapse: collapse; display: none" id="TableRegisterSelect2"
			name="TableRegisterSelect2" cellspacing="1" cellpadding="2" width="100%" border="0">
			<asp:Label ID="reghtml" runat="server"></asp:Label>
			<asp:Literal ID="lblHtml" runat="server"></asp:Literal>
		</table>
	</ContentTemplate>
</asp:UpdatePanel>
<table style="border-collapse: collapse; display: none" id="TableRegister" cellspacing="1"
	cellpadding="2" width="100%" border="0" runat="server" visible="false">
	<tbody>
		<tr id="trUserSex" runat="server" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td style="width: 15%" class="tdbgleft">
				<strong>性别：</strong>
			</td>
			<td>
				<asp:DropDownList ID="DropSex" runat="server">
					<asp:ListItem Text="男" Value="1" Selected="True"></asp:ListItem>
					<asp:ListItem Text="女" Value="0"></asp:ListItem>
				</asp:DropDownList>
				<asp:Literal ID="musttrUserSex" runat="server"></asp:Literal>
			</td>
		</tr>
		<tr id="trBirthday" runat="server" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td style="width: 15%" class="tdbgleft">
				<strong>出生日期：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtBirthday" runat="server" onclick="setday(this);" CssClass="input_out"
					onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};"
					onmousemove="this.className='input_move'" onmouseout="this.className='input_out'">1985-05-12 </asp:TextBox>
				<asp:Literal ID="musttrBirthday" runat="server"></asp:Literal>
				<asp:RequiredFieldValidator ID="ReqTxtBirthday" runat="server" Display="None" ErrorMessage="出生日期不能为空"
					SetFocusOnError="false" ControlToValidate="TxtBirthday"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trHomepage" runat="server" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td style="width: 15%" class="tdbgleft">
				<strong>主页：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtHomepage" runat="server" CssClass="input_out">http://</asp:TextBox>
				<asp:Literal ID="musttrHomepage" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtHomepage" runat="server" Display="None" ErrorMessage="主页地址不能为空" SetFocusOnError="false"
					ControlToValidate="TxtHomepage"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trQQ" runat="server" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td style="width: 15%" class="tdbgleft">
				<strong>QQ号码：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtQQ" runat="server" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrQQ" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtQQ" runat="server" Display="None" ErrorMessage="QQ号码不能为空" SetFocusOnError="false"
					ControlToValidate="TxtQQ"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trICQ" runat="server" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td style="width: 15%" class="tdbgleft">
				<strong>ICQ号码：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtICQ" runat="server" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrICQ" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtICQ" runat="server" Display="None" ErrorMessage="ICQ号码不能为空" SetFocusOnError="false"
					ControlToValidate="TxtICQ"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trMSN" runat="server" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td style="width: 15%" class="tdbgleft">
				<strong>MSN帐号：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtMSN" runat="server" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrMSN" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtMSN" runat="server" Display="None" ErrorMessage="MSN帐号不能为空" SetFocusOnError="false"
					ControlToValidate="TxtMSN"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trYahoo" runat="server" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td style="width: 15%" class="tdbgleft">
				<strong>雅虎通帐号：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtYahoo" runat="server" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrYahoo" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtYahoo" runat="server" Display="None" ErrorMessage="雅虎通帐号不能为空" SetFocusOnError="false"
					ControlToValidate="TxtYahoo"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trUC" runat="server" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
			<td style="width: 15%" class="tdbgleft">
				<strong>UC号码：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtUC" runat="server" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrUC" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtUC" runat="server" Display="None" ErrorMessage="UC号码不能为空" SetFocusOnError="false"
					ControlToValidate="TxtUC"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trOfficePhone" runat="server">
			<td style="width: 15%" class="tdbgleft">
				<strong>办公电话：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtOfficePhone" runat="server" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrOfficePhone" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtOfficePhone" runat="server" Display="None" ErrorMessage="办公电话不能为空"
					SetFocusOnError="false" ControlToValidate="TxtOfficePhone"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trHomePhone" runat="server">
			<td style="width: 15%" class="tdbgleft">
				<strong>家庭电话：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtHomePhone" runat="server" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrHomePhone" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtHomePhone" runat="server" Display="None" ErrorMessage="家庭电话不能为空" SetFocusOnError="false"
					ControlToValidate="TxtHomePhone"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trFax" runat="server">
			<td style="width: 15%" class="tdbgleft">
				<strong>传真号码：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtFax" runat="server" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrFax" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtFax" runat="server" Display="None" ErrorMessage="传真号码不能为空" SetFocusOnError="false"
					ControlToValidate="TxtFax"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trMobile" runat="server">
			<td style="width: 15%;" class="tdbgleft">
				<strong>手机号码：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtMobile" runat="server" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrMobile" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtMobile" runat="server" Display="None" ErrorMessage="手机号码不能为空" SetFocusOnError="false"
					ControlToValidate="TxtMobile"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
						ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtMobile"
						ErrorMessage="请输入正确的手机号码" ValidationExpression="^1(?:3|5|8)\d{9}$"></asp:RegularExpressionValidator>
			</td>
		</tr>
		<tr id="trPHS" runat="server">
			<td style="width: 15%" class="tdbgleft">
				<strong>小灵通号码：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtPHS" runat="server" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrPHS" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtPHS" runat="server" Display="None" ErrorMessage="小灵通号码不能为空" SetFocusOnError="false"
					ControlToValidate="TxtPHS"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trAddress" runat="server" style="padding-top:10px;">
			<td style="width: 15%" class="tdbgleft">
				<strong>联系地址：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtAddress" runat="server" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrAddress" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtAddress" runat="server" Display="None" ErrorMessage="联系地址不能为空" SetFocusOnError="false"
					ControlToValidate="TxtAddress"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trZipCode" runat="server">
			<td style="width: 15%" class="tdbgleft">
				<strong>邮政编码：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtZipCode" runat="server" MaxLength="6" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrZipCode" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtZipCode" runat="server" Display="None" ErrorMessage="邮政编码不能为空" SetFocusOnError="false"
					ControlToValidate="TxtZipCode"></asp:RequiredFieldValidator><asp:CompareValidator
						ID="CompareValidator1" runat="server" ErrorMessage="请输入正确的邮政编码" ControlToValidate="TxtZipCode"
						Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
			</td>
		</tr>
		<tr id="trTrueName" runat="server">
			<td style="width: 15%" class="tdbgleft">
				<strong>真实姓名：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtTrueName" runat="server" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrTrueName" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtTrueName" runat="server" Display="None" ErrorMessage="真实姓名不能为空" SetFocusOnError="false"
					ControlToValidate="TxtTrueName"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trIDCard" runat="server">
			<td style="width: 15%" class="tdbgleft">
				<strong>身份证号码：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtIDCard" runat="server" CssClass="input_out" onblur="Checkyes()" ></asp:TextBox>
				<asp:Literal ID="musttrIDCard" runat="server"></asp:Literal>
				<label runat="server" id="checkcard" style="color: red;"></label>
					必须18位且未在本系统注册过，不足18位请以X替代
				<asp:RequiredFieldValidator ID="ReqTxtIDCard" runat="server" Display="None" ErrorMessage="身份证号码不能为空" SetFocusOnError="false"   ControlToValidate="TxtIDCard"></asp:RequiredFieldValidator>
				<div style="display:none;"> <asp:RegularExpressionValidator  runat="server" ID="RegularExpressionValidator3" ValidationExpression="(^\d{15}$)|(^\d{17}([0-9]|X)$)"  ControlToValidate="TxtIDCard" ErrorMessage="请输入正确格式"></asp:RegularExpressionValidator> </div> 
						
			</td>
		</tr>
		<tr id="trUserFace" runat="server">
			<td style="width: 15%" class="tdbgleft">
				<strong>头像地址：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtUserFace" runat="server" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrUserFace" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtUserFace" runat="server" Display="None" ErrorMessage="头像地址不能为空" SetFocusOnError="false"
					ControlToValidate="TxtUserFace"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trProvince" runat="server">
			<td style="width: 15%" class="tdbgleft">
				<strong>省市县：</strong>
			</td>
			<td>
				<select runat="server" id="selprovince" onchange="javascript:area()">
				</select>
				<select runat="server" id="selcity" onchange="area2();">
				</select>
				<select runat="server" id="selcoutry">
				</select>
				<script type="text/javascript">
					function area() {
						$.ajax({
							type: "POST",
							url: "Register.aspx",
							data: "action=area&value=" + $("#selprovince option:selected").val(),
							success: function (msg) {
								var s = new Array();
								s = msg.split("|");
								var str = "";
								for (var i = 0; i < s.length; i++) {
									if (s[i] != null && s[i] != "")
										str += "<option>" + s[i] + "</option>"
								}
								$("#selcity").html(str);
								area2();
							},
							Error: function (msg) {
								alert("地址获取失败");
							}
						});
					}

					function area2() {
						$.ajax({
							type: "POST",
							url: "Register.aspx",
							data: "action=area2&pro=" + $("#selprovince option:selected").val() + "&city=" + $("#selcity option:selected").val(),
							success: function (msg) {
								var s = new Array();
								s = msg.split("|");
								var str = "";
								for (var i = 0; i < s.length; i++) {
									if (s[i] != null && s[i] != "")
										str += "<option>" + s[i] + "</option>";
								}
								$("#selcoutry").html(str);
							},
							Error: function (msg) {
								alert("地址获取失败");
							}
						});
					}
				</script>
			</td>
		</tr>
		<tr id="trFaceWidth" runat="server">
			<td style="width: 15%" class="tdbgleft">
				<strong>头像宽度：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtFaceWidth" runat="server" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrFaceWidth" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtFaceWidth" runat="server" Display="None" ErrorMessage="头像宽度不能为空" SetFocusOnError="false"
					ControlToValidate="TxtFaceWidth"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trFaceHeight" runat="server">
			<td style="width: 15%" class="tdbgleft">
				<strong>头像高度：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtFaceHeight" runat="server" CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrFaceHeight" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtFaceHeight" runat="server" Display="None" ErrorMessage="头像高度不能为空" SetFocusOnError="false"
					ControlToValidate="TxtFaceHeight"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trSign" runat="server">
			<td style="width: 15%" class="tdbgleft">
				<strong>签名档：</strong>
			</td>
			<td>
				<asp:TextBox ID="TxtSign" runat="server" TextMode="MultiLine" Width="300" Height="60"
					CssClass="input_out"></asp:TextBox>
				<asp:Literal ID="musttrSign" runat="server"></asp:Literal><asp:RequiredFieldValidator
					ID="ReqTxtSign" runat="server" Display="None" ErrorMessage="签名档不能为空" SetFocusOnError="false"
					ControlToValidate="TxtSign"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr id="trPrivacy" runat="server">
			<td style="width: 15%" class="tdbgleft">
				<strong>隐私设定：</strong>
			</td>
			<td>
				<asp:DropDownList ID="DropPrivacy" runat="server">
					<asp:ListItem Text="公开信息" Value="0"></asp:ListItem>
					<asp:ListItem Text="只对好友公开" Value="1"></asp:ListItem>
					<asp:ListItem Text="完全保密" Value="2"></asp:ListItem>
				</asp:DropDownList>
				<asp:Literal ID="musttrPrivacy" runat="server"></asp:Literal>
			</td>
		</tr>
			<tr id="trParentUserID" runat="server">
			<td style="width: 15%" class="tdbgleft">
				<strong> 推荐人：</strong>
						 
			</td>
			<td> <asp:TextBox ID="TxtParentUserID" runat="server" CssClass="input_out"  onblur="CheckParentUser()" ></asp:TextBox> 
				<%--<input id="checkuser" type="button" onclick="CheckName('TxtParentUserID')" />
				<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TxtParentUserID" ErrorMessage="用户ID只能为数字！" ValidationExpression="^\+?[1-9][0-9]*$"></asp:RegularExpressionValidator>
				<asp:TextBox ID="TxtParentUser" runat="server" CssClass="input_out"  OnTextChanged="PuserName_Changed" ></asp:TextBox>
				--%>  
				<asp:Literal ID="musttrParentUserID" runat="server"></asp:Literal>
					<label runat="server" id="CheckParentUserMessage" style="color: red;"></label>
				<asp:RequiredFieldValidator ID="ReqTxtParentUserID" runat="server" Display="None" ErrorMessage="推荐人不能为空" SetFocusOnError="false"   ControlToValidate="TxtParentUserID"></asp:RequiredFieldValidator> 
					
						
			</td>
		</tr>
	</tbody>
</table>
</div>
</li>
</ul>
<table style="border-collapse: collapse;margin-bottom:20px;" cellspacing="1" cellpadding="2" width="100%" border="0">
	<tr>
		<td style="height: 42px;" class="text-center">
			<span style="color: #ff0000; text-align:center;FONT-FAMILY:'Microsoft Yahei', SimSun, Tahoma, Helvetica, Arial, sans-serif;">以上所有信息除选填项都必须先正确填写后才能成功注册。</span>
		</td>
	</tr>
	<tr>
		<td style="height: 40px;FONT-FAMILY:'Microsoft Yahei', SimSun, Tahoma, Helvetica, Arial, sans-serif;" class="text-center">
            <asp:CheckBox ID="CheckBox1" runat="server" Text=" 同意并接受注册协议" Visible="false" onclick="checkreg()" />
		</td>
	</tr>
    <tr>
    	<td class="text-center">
        	<input type="button" value="注册" onclick="code();" class="btn btn-danger"/>
            <asp:Button ID="BtnSubmit" runat="server" Text="注册" CssClass="btn btn-danger" OnClick="BtnSubmit_Click" style="display:none;" ClientIDMode="Static"/>
            <input id="Reset" type="reset" value="重置" name="Reset" class="btn btn-danger" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="False" />
        </td>
    </tr>
</table>
</div>
</div>
</asp:Panel>
</div>
<asp:Panel ID="PnlStep3" runat="server" Visible="false" Width="100%">
<div id="main" class="reg">
<h2 style="display:none">第三步：注册结果<img src="../App_Themes/UserThem/images/regl3.gif" width="242" height="14"alt="" /></h2>
<asp:Literal ID="LitRegResult" runat="server"></asp:Literal>
<div class="reg_sub">
<div class="reg_title">会员帐号信息</div>
<ul id="userinfo">
<li>恭喜注册成功!</li>
<li>您的会员名：<span><%= Get(0) %></span></li>
<li>您的密码是：<span><%= Get(2) %></span></li>
<li>注册邮箱是：<span><%= Get(1) %></span></li>
<li>请您妥善保存您的信息，如忘记密码在<a href="/User/GetPassword.aspx" target="_blank">密码找回页</a>凭邮箱找回。
</li>
</ul>
</div>
</div>
</asp:Panel>
<asp:HiddenField ID="hfReturnUrl" runat="server" />

</form>
</div>
<div  class=" col-lg-3 col-md-3 col-sm-3 col-xs-12">
<div class="con_bor">
<div class="con_titss">
<strong>个人会员可以：</strong>
<p>
帮助创业者，实现财富梦想。
</p>
</div>
<div class="con_lis">
<ul><li>.助您找到适合自己的创业项目；</li>
<li>.可以查看自己的留言信息；</li>
<li>.免费在网站上发布信息；</li>
<li>.享受推广系统拿8%-20%佣金；</li>
<li>.享受专业的创业咨询和指导；</li>
<li>.可以享受精品项目定向推荐；</li>
<li>.可以享受正规企业创业扶持；</li>
</ul>
</div>
</div>

<div class="con_bor">
<div class="con_titss">
<strong>企业会员可以：</strong>
<p>
中小企业招商破局寻道的制高点
</p>
</div>
<div class="con_lis">
<ul><li>.完善公司信息，获得更多关注机会；</li>
<li>.免费发布项目资讯或宣传软文；</li>
<li>.获得参与发布网站优惠活动机会；</li>
<li>.享受专业的企业咨询和指导；</li>
<li>.享受成千上万会员推广，提升关注机会；</li>
</ul>
</div>
</div>

</div>


</div>
</div>
<%Call.Label("{ZL.Label id=\"全站底部\" /}"); %>
<script>
var uid='<%Call.Label("{ZL.Label id=\"根据用户ID得到用户名\"/}"); %>';
if(uid!='[err:无记录]')
{
document.getElementById("TxtParentUserID").value=uid;
}

</script>
</body>
</html>