<%@ page language="C#" autoeventwireup="true" inherits="Guest_Baike_Class, App_Web_1rtysfbx" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>开放分类--<%Call.Label("{$SiteName/}"); %>百科</title>
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="../../App_Themes/Guest/baike.css" type="text/css" media="screen"/>
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

        <div id="s_page">
<!--head-->
	<div id="s_header"> 
	<div id="s_search" class="wa_mode"  > 
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

<div id="main" class="rg_inout" style="margin-top:20px; border:none;">  
<div id="divc" class="smartbox"  style="visibility: hidden;"></div>
</div>
</div>
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
 
<div id="mysite">您的位置：<a href="/">网站首页</a>>>&nbsp; <a href="Default.aspx" target="_self">百科中心</a> &gt;&gt; 按开放分类浏览</div> 
<div class="t1">按开放分类浏览</div>
<asp:Repeater ID="Repeater1" runat="server"  OnItemDataBound="Repeater1_ItemDataBound">
<ItemTemplate>
<dl class="categroy ft_l">
<dt><a name="renwu" href="Classification.aspx?ParentID=<%#Eval("ParentID") %>&GradeID=<%#Eval("GradeID") %>" title="<%#Eval("GradeName") %>"><%#Eval("GradeName") %></a></dt>
<dd>
<ul>
<asp:Repeater ID="Repeater2" runat="server">
<ItemTemplate>
<li class="listconList"><a href="Classification.aspx?ParentID=<%#Eval("ParentID") %>&GradeID=<%#Eval("GradeID") %>" title="<%#Eval("GradeName") %>"><%#Eval("GradeName") %></a></li> 
</ItemTemplate>
</asp:Repeater>
</ul>
<div class="k"></div>
</dd>
</dl>
</ItemTemplate>
</asp:Repeater>  
 
<div class="clear"></div> 
</div>
    </form>
</body>
</html>
