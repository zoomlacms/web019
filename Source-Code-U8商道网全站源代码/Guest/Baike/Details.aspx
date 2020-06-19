<%@ page language="C#" autoeventwireup="true" inherits="Guestbook_BkDetails, App_Web_1rtysfbx" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>逐浪百科</title> 
<link href="../../App_Themes/UserThem/user_user.css"  type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/Guest/baike.css"  type="text/css" rel="stylesheet"  media="screen"/>
<script src="../../JS/jquery.js" type="text/javascript"></script>
 
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
<script>    wikiConflict.isEdit = 1;</script>
<script>    var templateGuide = templateGuide || {}; templateGuide.textEditType = 'part'</script>       
<script>    wikiConflict.isEdit = 1;</script>
<script type="text/javascript">
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
    <div class="clear"></div>
</div>
	<div id="mysite"> 您的位置：<a href="/">网站首页</a>>>&nbsp;<a href="Default.aspx">百科中心</a>&gt;&gt; 词条详情 </div> 
	<div class="cleardiv"> 
	<div class="yulian">
        <div class="yl_items it">
      <h1><span class="right_b"><asp:LinkButton runat="server" ID="Edit" 
		  Text="编辑本词条" onclick="Edit_Click" Font-Size="Medium"></asp:LinkButton></span>
		   <asp:Label runat="server" ID="lblTittle" Font-Bold="True" Font-Size="XX-Large" ForeColor="#3171AF"></asp:Label>
		   </h1></div>

    <div id="inputShowSummaryDiv" style="padding:0 0 10px;display:none;">
		<div id="canEditSummary" style="display:none"></div>
		<div id="cardSummary"></div>
	</div>
	<div id="inputShowMainInfoDiv" style="display:none;">
		<div id="canEditMainInfo"></div>
		<div id="inputMainInfoDivContent"></div>
	</div>    
	<div style="position:relative; ">
		<div id="loading"></div>
		<div runat="server" id="code" class="x_input"  >
			</div>
		<%--<asp:TextBox runat="server" TextMode="MultiLine" id="code" name="message" style="display:none;"></asp:TextBox>
		--%>
	</div> 
        <div class="clear"></div>

	<div class="yl_items its">
		<div class="item first">
			<div class="itme_tit"><strong>参考资料</strong></div>
		<div runat="server" id="txtReference" class="x_input" ></div>
			</div>
				<div class="item">
			<div class="itme_tit"><strong>开放分类</strong></div>
		<div runat="server" id="txtBtype" class="x_input"></div>
		  </div>
				<div class="item">
			<div class="itme_tit"><strong>扩展阅读</strong></div>
		<div runat="server" id="txtExtend" class="x_input"></div>
		   </div>
		<div id="editSpan" class="item" runat="server">  <div class="itme_tit"><strong>合作编辑</strong></div>
		<div runat="server" id="editman" class="x_input">
		   </div></div>
        <span style="float:right; padding-right:50px"><asp:LinkButton ID="lbtFavorite" runat="server" OnClick="lbtFavorite_Click">收藏</asp:LinkButton></span>
		<div style="display: none;" id="divSupplyment">
			<asp:TextBox runat="server" ID="txtSupplyment" CssClass="x_input" TextMode="MultiLine"
				Width="500" Height="120"></asp:TextBox></div>            
		<div class="clear">
		</div>
	  </div> 
	
    </div>
<div class="right baike_border">
<div id="userinfo" runat="server" style="display:none">
<asp:Label runat="server" ID="username"></asp:Label>----实习小编
</div>
<div class="aa">
<div class="right-t"><span style="color:Black;font-size:medium">词条统计</span></div>
<ul><li>浏览次数：</li>
<li>编辑次数：<asp:Label runat="server" ID="edittime"></asp:Label></li>
<li>最近更新：<asp:Label runat="server" ID="updatetimes"></asp:Label></li>
<li>创建者：<asp:Label runat="server" ID="creatbaike"></asp:Label></li>
    <div class="claer"></div>
	</ul>
</div>


<div class="aa">
<div class="right-t">
<span style="color:Black;font-size:medium">贡献光荣榜</span></div>
<ul><asp:Repeater runat="server" ID="Contribution">
<ItemTemplate>
 <li><span style="float:right"><a href="Details.aspx?tittle=<%#Eval("Tittle")%>&username=<%#Eval("UserName")%>&soure=baikeedit">版本</a></span><%#Eval("UserName")%></li>
</ItemTemplate>
</asp:Repeater>
</ul>
        <div class="claer"></div>
</div>
<div class="aa">
  <div class="right-t"> <span style="color:Black;font-size:medium">最新动态</span></div>
  <asp:Repeater runat="server" ID="Latestnews">
  <ItemTemplate>
  </ItemTemplate>
  </asp:Repeater>
</div>
</div> 
<div class="clear"></div>
</div>  
<!-- 版权信息 -->
<%-- <div id="bottom">
	<a href="/">
		<img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>" /></a>--%>
<div id="baike_bottom">	<p style="text-align:center;clear:both">
		<script language="javascript" type="text/javascript"> 
<!--
			var year = "";
			mydate = new Date();
			myyear = mydate.getYear();
			year = (myyear > 200) ? myyear : 1900 + myyear;
			document.write(year); 
--> 
		</script>
		&copy;&nbsp;Copyright&nbsp;
		<%Call.Label("{$SiteName/}"); %>
		All rights reserved.</p> 
		</div>
</form>
<script type="text/javascript">
	$(function () {
		getCode();
	});
	function getCode() {
		//$(window.frames["tangram_editor_iframe_MZ__w"].document).find("#testId").html()
		var catalog = "";
		var code = document.getElementById("code");
		//var content = $(document.getElementById('tangram_editor_iframe_MZ__w').contentWindow.document.body).html();
		//            var content = document.getElementById('code').html();
		//alert(content);
		var arr = document.getElementById('code').getElementsByTagName("h2");
		for (var i = 0; i < arr.length; i++) {
			var aNew = document.createElement("a");
			aNew.setAttribute("name", "a" + i);
			aNew.setAttribute("id", "a" + i);
			arr[i].appendChild(aNew);
			catalog = catalog + "<a href=\"#a" + i + "\">" + arr[i].firstChild.data + "</a><br/>";
		}
		var content = document.getElementById('code').innerHTML;
		document.getElementById("code").innerHTML = "<div class='itme_tit'><strong>目录</strong><br/>" + catalog + "</div>" + content;
	}
</script>
</body>
</html>