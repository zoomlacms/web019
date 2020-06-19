<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.login, App_Web_fx2smugy" enableviewstatemac="false" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Manage/I/ASCX/IE6.ascx" TagName="IE6" TagPrefix="IE6" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>管理登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link type="text/css" href="/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<form id="Login" runat="server">
<IE6:IE6 runat="server" />
<center style="background:url(<%=Call.GetRandomImg()%>);background-position: center;left:0;top:0;right:0;bottom:0; position: absolute; background-repeat:no-repeat;background-size:cover;">
<div style="margin-top:15em;">
    <ul class=" list-unstyled text-center center-block">
        <li><img src="<%:Call.LogoUrl%>" alt="<%:Call.SiteName%>_后台管理系统" /></li>
        <li style="margin-top:6em;">
            <asp:TextBox ID="TxtUserName" TabIndex="1" runat="server" size="20"  class="form-control input-control" autocomplete="off" 
            placeholder="帐户" onkeydown="return GetEnterCode('focus','TxtPassword');"/></li>
        <li>
            <asp:TextBox ID="TxtPassword" runat="server" TabIndex="2" TextMode="Password" MaxLength="18" 
                class="form-control input-control" autocomplete="off" placeholder="密码" onkeydown="return GetEnterCode('click','IbtnEnter');" /><br />
            <asp:RequiredFieldValidator ID="p1" runat="server" ControlToValidate="TxtPassword" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="密码不能为空!" />
        </li>
        <li id="safecode" runat="server"><asp:TextBox ID="TxtAdminValidateCode"  runat="server" MaxLength="6" class="form-control input-control " 
            size="20" /></li>
        <li id="CodeLi" runat="server" visible="false" style="margin-bottom:0;">
            <div class="form-group has-feedback" style="position:relative;display:inline-table">
              <asp:TextBox ID="TxtValidateCode"  runat="server" class="form-control input-control" Width="325" TabIndex="3" autocomplete="off" onkeyup="checkCode(this);" onkeydown="return GetEnterCode('click','IbtnEnter');"/>
                <span id="codeCheck" class="glyphicon glyphicon-remove form-control-feedback" title="验证码错误" ></span>
            </div>
            <asp:Image ID="VcodeLogin"  runat="server" ImageUrl="/Common/ValidateCode.aspx" ToolTip="点击刷新验证码" onclick="this.src='/Common/ValidateCode.aspx?t='+Math.random()" />
        </li>
        <li>
            <asp:Button runat="server" ID="IbtnEnter" CssClass="btn btn-info input-control" TabIndex="4" Text="立即登录" OnClick="IbtnEnter_Click"/>
        </li>
        <li> 
		<a href="/" target="_blank" title="首页"><span class="glyphicon glyphicon-home"></span></a>
        <a href="/Help.html" target="_blank" title="帮助"><span class="glyphicon glyphicon-globe"></span></a>
        <a href="http://help.zoomla.cn/data" target="_blank" title="数据字典"><span class="glyphicon glyphicon-book"></span></a> &copy Zoomla!CMS Software Co., LTD All Rights Reserved</li>
    </ul>
</div>
</center>
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/JS/FrontPage.js"></script>
<script>
if (self != top) { top.location = self.location; }
function code() {
	$("#TxtValidateCode").focus();
	return codeIsRight($("#TxtValidateCode").val());
}
var a = function (id, str) {
	var s = str;
	$("#" + id).val(s).css('color', '#666')
	.focus(function () { if (this.value == s) { this.value = ''; this.style.color = 'black'; } })
	.blur(function () { if (this.value == '') { this.value = s; this.style.color = '#666'; } });
}
function checkCode(obj) {
    if ($(obj).val().length < 6)
    {
        $("#codeCheck").removeClass("glyphicon-ok").addClass("glyphicon-remove");
        $("#codeCheck").attr("title", "验证码错误");
        return;
    }
	a = "checkcode";
	v = $(obj).val();
	$.ajax({
		type: "Post",
		url: "/Common/ValidateCode.aspx",
		data: { action: a, value: v },
		success: function (data) {
		    if (data == 0)
		    {
		        $("#codeCheck").removeClass("glyphicon-ok").addClass("glyphicon-remove");
		        $("#codeCheck").attr("title", "验证码错误");
		    }
				
		    else if (data == 1)
		    {
		        $("#codeCheck").removeClass("glyphicon-remove").addClass("glyphicon-ok");
		        $("#codeCheck").attr("title", "验证码通过");
		    }
		}
	});
}
$(function () {
	$("#TxtUserName").focus();
	//a('TxtUserName', '帐户');
	a('TxtAdminValidateCode', '安全码');
	a('TxtValidateCode', '验证码');
	if ($("#Apple_Hid").val() == "1") GetTo();
})
	function GetTo() {
		location.href = "default.aspx";
	}
</script>
</form>
<style>
ul li {list-style:none;margin-bottom:1em;}
#VcodeLogin {display:inline;width:70px;height:32px; margin-top:5px; cursor: pointer; border: 0; vertical-align: middle;margin-bottom:5px; margin-left:-35px;}
.input-control {display:inline;min-width:225px;max-width:400px; width:40%;}
.form-control-feedback{ right:45px;background:#fff; top:4px;padding:5px 15px;}
.glyphicon-remove { color:#a94442;}
.glyphicon-ok{ color:#3c763d;}
</style>
</body>
</html>