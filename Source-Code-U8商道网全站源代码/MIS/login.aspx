<%@ page language="C#" autoeventwireup="true" inherits="MIS_Default, App_Web_4bzezlil" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html> 
<html>
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>MIS</title>
<link href="../App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script src="/js/jquery.js" type="text/javascript"></script>
<script src="<%Call.Label("{$CssDir/}"); %>js/slid.js"></script>
<script>function doname() {
if (document.getElementById("txtLoginId").value == "请输入帐号") {
    document.getElementById("txtLoginId").value = "";
    document.getElementById("txtLoginId").className = "cLoginIdH";
}
else {
    if (document.getElementById("txtLoginId").value == "") {
        document.getElementById("txtLoginId").value = "请输入帐号";
        document.getElementById("txtLoginId").className = "cLoginId";
    }
}
}
function dopassword() {
        if (typeof (HTMLElement) != "undefined" && !window.opera) {
            HTMLElement.prototype.__defineGetter__("outerHTML", function () {
                var a = this.attributes, str = "<" + this.tagName, i = 0; for (; i < a.length; i++)
                    if (a[i].specified)
                        str += " " + a[i].name + '="' + a[i].value + '"';
                if (!this.canHaveChildren)
                    return str + " />";
                return str + ">" + this.innerHTML + "</" + this.tagName + ">";
            });
            HTMLElement.prototype.__defineSetter__("outerHTML", function (s) {
                var r = this.ownerDocument.createRange();
                r.setStartBefore(this);
                var df = r.createContextualFragment(s);
                this.parentNode.replaceChild(df, this);
                return s;
            });
            HTMLElement.prototype.__defineGetter__("canHaveChildren", function () {
                return !/^(area|base|basefont|col|frame|hr|img|br|input|isindex|link|meta|param)$/.test(this.tagName.toLowerCase());
            });
        }
        var input = document.getElementById("txtPwd");
        if (input.value == "请输入密码") {
            input.value = "";
            input.outerHTML = "<input onblur=dopassword() id=txtPwd onselect=dopassword() onclick=dopassword() type=password name=txtPwd>";
            document.getElementById("txtPwd").focus();
            document.getElementById("txtPwd").focus();
        }
        else {
            if (document.getElementById("txtPwd").value == "") {
                input.outerHTML = "<input onblur=dopassword() id=txtPwd onselect=dopassword() onclick=dopassword() type=text name=txtPwd>";
                document.getElementById("txtPwd").value = "请输入密码";
            }
        }
}
</script>
</head>
<body id="body_bg">
<form id="form1" runat="server">
<div id="logo_m"><a href="/mis"><img src="../App_Themes/UserThem/images/Mis/logo.png" /></a></div>
<div id="Ihead">
<div id="login">
<asp:TextBox ID="txtLoginId" runat="server" onblur="doname()" onselect="doname()" onclick="doname()" Text="请输入帐号" CssClass="cLoginId">
</asp:TextBox>
<asp:TextBox TextMode="Password" ID="txtPwd" runat="server" onblur="dopassword()" onselect="dopassword()" onclick="dopassword()" Text="请输入密码">
</asp:TextBox>
<asp:Button ID="ibLogin" runat="server" OnClick="ibLogin_Click" Text="登录" />
<div class="login_ls">
<a href="#">忘记密码</a>
<asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>	
<asp:CheckBox ID="remusrname" runat="server" CssClass="labelbox" /> 
<label for="remusrname"> 下次自动登录</label> 
</div> 
</div>  
</div>
<div id="I_main">
<div id="I_main_l">
<div class="Index_tit"><strong>梦想图</strong></div>
<div class="Index_pic">
<slid imgUrl="/App_Themes/UserThem/images/Mis/01.jpg,/App_Themes/UserThem/images/Mis/02.jpg" 
type="slidB" 
title="01,02" 
linkUrl="#,#" width="260" height="280"/>
</div>
<div class="Index_con">
    <p>用图片传递梦想，用光影镌刻年华</p>
    <p>微言细语 独唱合唱</p>
    <p>让时光停在芳华流转的刹那…</p></div>
</div>
<div id="I_main_c">
<div class="Index_tit"><strong>目标精选</strong></div>
<div class="Tar_li">
<ul>
    <li>
        <a href="#"><img src="../App_Themes/UserThem/images/Mis/wlbg.jpg" /></a>
        <p>娱乐大本营【赵本山被曝开内部表彰会  包】据资深爆料人长春国贸在网易博客爆料，本山传媒2月14日召开内部总结表彰会。赵</p>
    </li>
    <li>
        <a href="#"><img src="../App_Themes/UserThem/images/Mis/wlbg.jpg" /></a>
        <p>娱乐大本营【赵本山被曝开内部表彰会 深爆料人长春国贸在网易博客爆料，本山传媒2月14日召开内部总结表彰会。赵</p>
    </li>
    <li>
        <a href="#"><img src="../App_Themes/UserThem/images/Mis/wlbg.jpg" /></a>
        <p>娱乐大本营【赵本山被曝开内部表彰会 亲自为 长春国贸在网易博客爆料，本山传媒2月14日召开内部总结表彰会。赵</p>
    </li>
    <li>
        <a href="#"><img src="../App_Themes/UserThem/images/Mis/wlbg.jpg" /></a>
        <p>娱乐大本营【赵本山被曝开内部表彰会 亲自为弟子 贸在网易博客爆料，本山传媒2月14日召开内部总结表彰会。赵</p>
    </li>
    <li>
        <a href="#"><img src="../App_Themes/UserThem/images/Mis/wlbg.jpg" /></a>
        <p>娱乐大本营【赵本山被曝开内部表彰会 亲自为弟子发红包】 本山传媒2月14日召开内部总结表彰会。赵</p>
    </li>
</ul>
</div>
</div>
<div id="I_main_r">
<div class="Index_tit"><strong>人气推荐</strong></div>
<div class="person_li">
<ul><li><span>90922</span><a href="#"><img src="#" />sdsd</a></li></ul>
</div>
</div>
<div class="clear"></div>
</div> 
</form>
</body>
</html>
