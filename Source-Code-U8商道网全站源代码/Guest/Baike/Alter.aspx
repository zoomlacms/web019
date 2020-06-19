<%@ page language="C#" autoeventwireup="true" inherits="manage_GuestBook_BkAlter, App_Web_1rtysfbx" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title> 修改-<%Call.Label("{$SiteName/}"); %>百科</title> 
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/Guest/editor.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../../App_Themes/Guest/baike.css" type="text/css" media="screen"/>
<script src="../../JS/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="../../js/base.js"></script>
 
</head>
<body>
<div id="Tab"><ul><li><a href="../Default.aspx">留言</a></li><li  class="hover"><a href="Baike/Default.aspx" >百科</a></li><li><a href="../Ask/Default.aspx">问答</a></li> </ul><div class="clear"></div></div>
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
<div id="s_header"> 
 <div id="s_search" class="wa_mode" wa_mode="top.search">
<h1 id="s_logo">
<a href="/Guest/Baike/Default.aspx" title="到<%Call.Label("{$SiteName/}"); %>百科首页"><img width="150" src="<%Call.Label("{$LogoUrl/}"); %>" alt="到<%Call.Label("{$SiteName/}"); %>百科首页" /> </a>
</h1> 
<div style="display:none;"><input type="hidden" name="formids" value="searchText,enterLemma,searchLemma"/>
<input type="hidden" name="submitmode" value=""/>
<input type="hidden" name="submitname" value=""/>
</div>
<div class="s_search_form">
<asp:TextBox ID="txtAsk" Height="25" Width="300" showHelp="true" maxlength="100" class="search_input" autocomplete="off" runat="server"></asp:TextBox>
<asp:Button runat="server" ID="btnEnter" Text="进入词条" onclick="btnEnter_Click"  class="search_bt" AccessKey=" " /> 
<asp:Button runat="server" ID="btnSearch" Text="搜索词条"   onclick="btnSearch_Click" class="ask_bt" /> 
</div> 
<div id="divc" class="smartbox"  style="visibility: hidden;"></div>
</div>
</div>
<div id="container">
<%-- <div id="Div1" style="position:absolute;top:35px">
<a href="/">
<img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>" /></a>
</div>--%>
<%--<div class="cart_lei" style="height: 70px">
<ul style="color: #FFF; font-size: 20px; line-height: 40px; padding: 10px 0 0 16px;">
<li style="float: left;"><b>逐浪百科</b></li>
<li style="float: left">
<asp:TextBox runat="server" ID="txtAsk" Height="25" Width="300"></asp:TextBox>
<asp:Button runat="server" ID="btnEnter" Text="进入词条" OnClick="btnEnter_Click" />&nbsp;
<asp:Button runat="server" ID="btnSearch" Text="搜索词条" OnClick="btnSearch_Click" />&nbsp;
</li>
</ul>
</div>--%>
<div id="nav"><ul class="tittleul"><li><a href="Default.aspx">百科首页</a></li>
<li><a href="Classification.aspx?ClassTitle=自然">自然</a></li>
<li><a href="Classification.aspx?ClassTitle=文化">文化</a></li>
<li><a href="Classification.aspx?ClassTitle=地理">地理</a></li>
<li><a href="Classification.aspx?ClassTitle=历史">历史</a></li>
<li><a href="Classification.aspx?ClassTitle=生活">生活</a></li>
<li><a href="Classification.aspx?ClassTitle=社会">社会</a></li>
<li><a href="Classification.aspx?ClassTitle=艺术">艺术</a></li>
<li><a href="Classification.aspx?ClassTitle=人物">人物</a></li>
<li><a href="Classification.aspx?ClassTitle=经济">经济</a></li>
<li><a href="Classification.aspx?ClassTitle=科技">科技</a></li>
<li><a href="Classification.aspx?ClassTitle=体育">体育</a></li>
</ul>
</div>
<div class="cleardiv" style="padding: 5px;">
            
<div id="mysite">
您的位置：<a href="/">网站首页</a>>>&nbsp;<a href="Default.aspx">百科中心</a>>><a href="#GuestBorder">修改词条</a></div>
</div>
<div><h1>
<asp:Label runat="server" ID="lblTittle" Font-Bold="True" Font-Size="XX-Large" ForeColor="#3171AF">百科</asp:Label></h1></div>
<script type="text/javascript">
var Fe = Fe || { version: "20080809", emptyFn: function () { } };
Fe.G = function () {
for (var A = [], B = arguments.length - 1; B > -1; B--) {
var C = arguments[B]; A[B] = null;
if (typeof C == "object" && C && C.dom) { A[B] = C.dom } else { if ((typeof C == "object" && C && C.tagName) || C == window || C == document) { A[B] = C } else { if (typeof C == "string" && (C = document.getElementById(C))) { A[B] = C } } }
} return A.length < 2 ? A[0] : A
}; Fe.on = function (C, B, A) {
if (!(C = Fe.G(C))) { return C } B = B.replace(/^on/, "").toLowerCase();
if (C.attachEvent) {
C[B + A] = function () { A.call(C, window.event) };
C.attachEvent("on" + B, C[B + A])
} else { C.addEventListener(B, A, false) } return C
};
Fe.un = function (C, B, A) { if (!(C = Fe.G(C))) { return C } B = B.replace(/^on/, "").toLowerCase(); if (C.attachEvent) { C.detachEvent("on" + B, C[B + A]); C[B + A] = null } else { C.removeEventListener(B, A, false) } return C };
var G_HIBAR = (function () {
var H = document, F, E, C, B = 3; function A(K, I, J) {
K.style.display = C ? "none" : "block";
K.style.left = I + "px"; K.style.top = J + "px"
}
function G(I) { C && G_HIBAR(I) }
function D() { F = null; E = null; Fe.un(window, "unload", D) } Fe.on(window, "resize", G);
Fe.on(document, "click", G); Fe.on(window, "unload", D);
return function (J) {
(J || window.event).cancelBubble = true; F = F || H.getElementById("usrbar");
E = E || H.getElementById("nav_extra");
var K = H.getElementById("my_home"), L = F.scrollHeight, I = 0;
do { I += K.offsetLeft } while (K = K.offsetParent);
I = I - 6;
A(E, I, B);
Fe.G("usrbar").scrollWidth; C = !C
}
})();
</script>
<style type="text/css">
.popb2{ padding: 10px;line-height: 22px;font-size: 14px;width: 280px;height: 230px;margin: 0 auto;}
#rempassItem{font-size: 12px;color: #F00;display: none;}
.regButton{padding: 2px;height: 25px;width: 140px;margin: 10px 60px;}
.f12{font-size: 12px;}
#rgHandle{text-align: center;font-weight: bold;}
.loginItem{width: 140px;}
</style>
<script src="../../JS/Bkpopup.js" type="text/javascript"></script>
<script type="text/javascript">            wikiConflict.isEdit = 1;</script>
<div id="inputShowSummaryDiv" style="padding: 0 0 10px; display: none;">
<div id="canEditSummary" style="display: none">
</div>
<div id="cardSummary">
</div>
</div>
<div id="inputShowMainInfoDiv" style="display: none;">
<div id="canEditMainInfo">
</div>
<div id="inputMainInfoDivContent">
</div>
</div>
<div style="position: relative">
<div id="loading">
</div>
<!-- 工具栏 --><div style=" position:absolute; top:6px; left:10px;z-index:99999; display:block; width:63px; height:23px; background:#EBEBEB;"><asp:LinkButton ID="lbt_Save" runat="server" OnClick="lbt_Save_Click" Style="display:block; width:65px; height:25px; text-align:center; line-height:25px;">存为草稿</asp:LinkButton></div>
<div id="toolsHolder">
<div id="tools">
<div id="toolbar">
</div>
<div class="bg">
</div>
</div>
</div>
<div id="EditorHolder" runat="server">
<div class="tangram_editor_container" style="height: 390px">
</div>
</div>
 <div class="tip">(不超过20000字，如有疑问请查看<a href="#">使用帮助</a>)</div>
<asp:TextBox runat="server" TextMode="MultiLine" ID="code" name="message" Style="display: none;"></asp:TextBox>
<span class="gray">
<input type="hidden" id="partContentNum" name="partContentNum" value="11092">
<input type="hidden" id="curPicNum" name="curPicNum" value="13">
<script type='text/javascript'>
var g_pcNum = G("partContentNum").value;
function setPicNum() {
if (editor) { editor.maxPicNum = G("curPicNum").value; }
}
Fe.on(window, "load", setPicNum);
</script>
</span>
</div>
<input id="lemmaclass" name="lemmaclass" value="法国,政坛,总统,法兰西第五共和国" type="hidden">
<script>            var templateGuide = templateGuide || {}; templateGuide.textEditType = 'part'</script>
<div class="btn">
<input type="hidden" value=" 提 交 " name="editlemma">
</div>
<div class="other_items">
<div style="width: 773px;">
<div class="tip">参考资料</div>
<div>
<asp:TextBox runat="server" ID="txtReference" CssClass="x_input" TextMode="MultiLine"
Width="773" Height="80"></asp:TextBox></div>
<div style="width: 773px;">
<div class="tip">开放分类</div></div>
<div>
<asp:TextBox runat="server" ID="txtBtype" CssClass="x_input" TextMode="MultiLine"
Width="773" Height="80"></asp:TextBox></div>
<div style="width: 773px;">
<div class="tip">扩展阅读</div></div>
<div>
<asp:TextBox runat="server" ID="txtExtend" CssClass="x_input" TextMode="MultiLine"
Width="773" Height="80"></asp:TextBox></div>
<div class="tip">修改原因</div>
                 
<div> <asp:TextBox runat="server" ID="TextBox2" CssClass="x_input" TextMode="MultiLine"
Width="773" Height="80"></asp:TextBox></div>
<div style="display: none;" id="divSupplyment">
<asp:TextBox runat="server" ID="txtSupplyment" CssClass="x_input" TextMode="MultiLine"
Width="500" Height="120"></asp:TextBox></div> 
<div class="clear"> </div>
</div>
       
<div style="width: 500px;">
<span style="float: right; padding-top: 20px;">
<asp:Button runat="server" ID="btnSubmit" Text="提交" CssClass="C_input" OnClick="btnSubmit_Click"  OnClientClick="getCode()"/></span></div>
    <div class="clear"></div>
</div>

<!-- 版权信息 -->
<div id="bottom">  
<p style="text-align:center;margin-top:5px;margin-bottom:5px;">
 <!--<script  type="text/javascript"> 

var year = "";
mydate = new Date();
myyear = mydate.getYear();
year = (myyear > 200) ? myyear : 1900 + myyear;
document.write(year); 

</script>--> 
&copy;&nbsp;Copyright&nbsp;
<%Call.Label("{$SiteName/}"); %>
All rights reserved.</p>
</div>
</form>
<%--<script src="../JS/Bkcommon.js" type="text/javascript"></script>
<script src="../JS/Bkcore.js" type="text/javascript"></script>--%>
</body>
<div class="bd-menu-inserttable" id="bdMenuInsertTable" role="menu">
<div class="bd-dimension-picker" id="pickerHolder">
<div id="pickerArea">
<div class="bd-dimension-picker-unhighlighted" style="width: 10em; height: 10em;">
</div>
<div class="bd-dimension-picker-highlighted" style="width: 0em; height: 0em;" id="pickerHighlighted">
</div>
</div>
<div class="bd-dimension-picker-status">
<span style="float: left; font-size: 12px" id="pickerStatus"><span id="columnCount">
0</span>列 x <span id="rowCount">0</span>行</span> <span style="float: right;"><a href="#" onclick="setTablePanel.insertMoreTable();return false;" id="insertMoreTable"
style="text-decoration: none; font-size: 12px;">插入更多</a></span>
</div>
</div>
</div>
<br clear="all"/>
<script src="../../js/bkcommon.js" type="text/javascript"></script>
<script src="../../js/bkcore.js" type="text/javascript"></script>
<script type="text/javascript">
function getCode() {
//$(window.frames["tangram_editor_iframe_MZ__w"].document).find("#testId").html()
//var catalog = "";
var code = document.getElementById("code");
//            var arr = document.getElementById('tangram_editor_iframe_MZ__w').contentWindow.document.body.getElementsByTagName("h2");
//            //alert(arr);
//            var input_file = document.createElement("input")
//            input_file.setAttribute("type", "button");
//            input_file.setAttribute("size", "50");
//            input_file.setAttribute("name", "input1");

//            for (var i = 0; i < arr.length; i++) {
//                var aNew = document.createElement("a");
//                aNew.setAttribute("name", "a" + i);
//                aNew.setAttribute("id", "a" + i);
//                //                var alinks = arr[i].getElementsByTagName("a");
//                //                for (var j = 0; j < alinks.length; j++) {
//                //                    aNew.removeChild(alinks[0]);
//                //                }
//                arr[i].appendChild(aNew);
//                //catalog = catalog + "<li><a href=\"#a" + i + "\">" + arr[i].firstChild + "</a></li>";
//                catalog = catalog + "<a href=\"#a" + i + "\">" + arr[i].firstChild.data + "</a><br/>";
//            }
//            //alert(arr[0].getElementsByTagName("a"));
//            //alert(input_file);
//            //alert(arr[0].html());
//            //            for (var i = 0; i < arr.Length; i++) {
//            //                alert(arr[i].text());
//            //            }   
var content = $(document.getElementById('tangram_editor_iframe_MZ__w').contentWindow.document.body).html();
//            document.getElementById("code").value = "<div>目录<br/>" + catalog + "</div>" + content;
document.getElementById("code").value = content;
}
</script>
</html>