<%@ page language="C#" autoeventwireup="true" inherits="Guest_AskStar, App_Web_ehi4oidk" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>问答中心-问答之星</title>
<link href="../../App_Themes/UserThem/style.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/Guest/ask.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="Tab"><ul><li><a href="../Default.aspx">留言</a></li><li><a href="../Baike/Default.aspx" >百科</a></li><li  class="hover"><a href="/guest/Ask/Default.aspx">问答</a></li> </ul><div class="clear"></div></div>
<form id="form1" runat="server"> 
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
                <li><a title="问答首页" href="../Ask/Default.aspx">问答首页</a> </li>
               <!-- <li><a title="知识专题" href="Topic.aspx">知识专题</a></li>-->
                <li class="on"><a title="问答之星" href="../Ask/Star.aspx">问答之星</a></li>
                <li><a title="分类大全" href="../Ask/Classification.aspx">分类大全</a></li>
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
                <asp:Button runat="server" ID="btnSearch" AccessKey=" " class="sub" Text=" " OnClick="btnSearch_Click"
                />
                <asp:Button runat="server" ID="btnAsk" class="but" Text=" " OnClick="btnAsk_Click"
                />
                <asp:Button runat="server" ID="btnAnswer" class="answer" Text="" OnClick="btnAnswer_Click"
                />
            </div>
            <div class="sybz">
                <a href="http://help.Zoomla.cn/?index/help.html" title="帮助" target="_blank">使用<br />帮助</a>
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
</div>
<div id="main" class="rg_inout">
    <h1>
    <span style="float:left; width: 397px;" >您的位置：<a href="/">网站首页</a>>><a href="Default.aspx">问答中心</a>>><a href="Star.aspx" >问答之星</a></span>
    </h1>
    <div class="clear"></div>
    <asp:Repeater runat="server" ID="Repeater1" OnItemDataBound="Repeater1_ItemDataBound">
        <ItemTemplate> 
            <div class="starR">
                <div>
                    <div class="starRimg">
                        <img src="../../Images/InitHead.gif" width='100px' height='100px' />
                    </div>
                    <div class="starRC">
                        <ul>
                            <li style="line-height:40px; float:none;">用户ID:<a href="../../ShowList.aspx?id=<%#Eval("UserID")%>" target='_blank'><%#Eval("UserName")%></a></li>
                            <div class="clear"></div>
                            <li class="sli1">回答数:<%#getanswer(Eval("UserID","{0}"))%></li>
                            <li class="sli1">采纳率:<%#getRat(Eval("UserID","{0}"))%></li>
                            <li class="sli1">提问数:<%#getask(Eval("UserID","{0}"))%></li>
                            <li class="sli1">问答积分:<%#Eval("GuestScore","{0}")%></li>
                        </ul>
                    </div>
                    <div class="starRW">
                        精选解答:  <a href='Add.aspx?fix=<%#Eval("UserID") %>' class="button1">向TA提问</a>
                        <asp:Repeater runat="server" ID="Repeater2">
                            <ItemTemplate>
                                <br /><a href="SearchDetails.aspx?ID=<%#Eval("ID")%>" target='_blank' title=" "><%#Eval("Qcontent")%></a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="clr"></div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
<!-- 版权信息 -->
<div id="bottom">
<a href="/"><img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>" /></a>
<p>
<script language="javascript" type="text/javascript">
    var year = "";
    mydate = new Date();
    myyear = mydate.getYear();
    year = (myyear > 200) ? myyear : 1900 + myyear;
    document.write(year);
</script>&copy;&nbsp;Copyright&nbsp; <%Call.Label("{$SiteName/}"); %> All rights reserved.</p>
</div>
</form>
</body>
</html>