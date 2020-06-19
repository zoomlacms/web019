<%@ page language="C#" autoeventwireup="true" inherits="Guest_Entry, App_Web_1rtysfbx" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<title>词条分类-<%Call.Label("{$SiteName/}"); %>百科</title>
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
<asp:Button runat="server" ID="btnEnter" Text="进入词条" class="search_bt" OnClick="btnEnter_Click" AccessKey=" " /> 
<asp:Button runat="server" ID="btnSearch" Text="搜索词条" class="ask_bt" OnClick="btnSearch_Click" /> 
</div> 
<div id="divc" class="smartbox"  style="visibility: hidden;"></div>
</div>
</div>
<!--main--> 
<div id="container"> 
<div id="nav"><ul class="tittleul"><li><a href="Default.aspx">百科首页</a></li>
    <li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("自然") %>">自然</a></li>
    <li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("物理") %>">地理</a></li>
    <li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("历史") %>">历史</a></li>
    <li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("生活") %>">生活</a></li>
    <li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("社会") %>">社会</a></li>
    <li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("艺术") %>">艺术</a></li>
    <li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("人物") %>">人物</a></li>
    <li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("经济") %>">经济</a></li>
    <li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("科技") %>">科技</a></li>
    <li><a href="Classification.aspx?ClassTitle=<%=Server.UrlEncode("体育") %>">体育</a></li>
    </ul>
    </div><br /> 
            <div id="mysite">您的位置：<a href="/">网站首页</a>>>&nbsp;<a href="Default.aspx">百科中心</a>>><a href="#GuestBorder">词条列表</a></div>  
   <div><asp:Repeater runat="server" ID="Classification">
   <ItemTemplate> 
  <table cellspacing="0" cellpadding="0" border="0">
    <tbody>
    <tr ><td><h2><a href="Details.aspx?soure=manager&tittle=<%#Server.UrlEncode(Eval("Tittle").ToString()) %>" target="_blank"><%#Eval("Tittle")%></a> <%#Eval("AddTime","{0:yyyy-MM-dd}") %></h2>
    <%--<div><%#NoHTML(Eval("Contents").ToString()) %>...</div>--%>
    <%--<div><%#Eval("AddTime","{0:yyyy-MM-dd}") %> <%#Eval("UserName") %></div>--%>
    </td>
    </tr>
    </tbody>
  </table><br />
   </ItemTemplate>
   </asp:Repeater></div>
   <asp:Literal runat="server" ID="createbaike" Visible="false"></asp:Literal>
  </div>  
   <div style="text-align:center;">共有词条<asp:Label ID="AllNum" runat="server" Text=""></asp:Label>个
            <asp:Label runat="server" ID="Toppage"></asp:Label>
            <asp:Label runat="server" ID="Nextpage"></asp:Label>
            <asp:Label runat="server" ID="Downpage"></asp:Label>
            <asp:Label runat="server" ID="Endpage"></asp:Label>
            页次：<asp:Label ID="Nowpage" runat="server"></asp:Label>/<asp:Label ID="PageSize" runat="server" ></asp:Label>页<asp:Label ID="Lable1" runat="server"></asp:Label>个记录/页 转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true"></asp:DropDownList>页
           </div>
           <div id="main" class="rg_inout"> 
            <p style="text-align:center">
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
</body>
</html>
