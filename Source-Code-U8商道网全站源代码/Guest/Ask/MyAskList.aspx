<%@ page language="C#" autoeventwireup="true" inherits="Guest_MyAskList, App_Web_xwzmyvqh" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>问题列表-<%Call.Label("{$SiteName/}"); %>问答</title>
<link href="../../App_Themes/UserThem/style.css"rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/Guest/ask.css" rel="stylesheet" type="text/css" />
<script src="../../Plugins/Ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="../../JS/jquery.js" type="text/javascript"></script>
<script charset="utf-8" src="../../Plugins/kindeditor/kindeditor.js"></script>
<style  type="">
#divshap{ position:absolute; width:100%; height:100%; background:#ccc;  filter:alpha(opacity=50); -moz-opacity:0.5; -khtml-opacity: 0.5; opacity:0.5;margin:0 auto;text-align:center; line-height:200px;z-index:999px;}
#divshap strong{ z-index:2; font-size:14px; color:#f00;}
</style>
<script type="text/javascript">
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
             <span style="<%=getstyle()%>"><a href="MyAskList.aspx?QueType=">我的提问</a> <a href="MyAnswerlist.aspx">我的回答</a> </span>
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
                <asp:Button runat="server" ID="btnSearch" class="sub" Text=" " OnClick="btnSearch_Click"  />
                <asp:Button runat="server" ID="btnAsk" class="but" Text=" " OnClick="btnAsk_Click"  />
                <asp:Button runat="server" ID="btnAnswer" class="answer" Text="" OnClick="btnAnswer_Click" />
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
<div id="mysite">
<p>您的位置：<a href="/">网站首页</a>>><a href="Default.aspx">问答中心</a>>><a href="MyAskList.aspx?QueType=">我的问题列表</a>&nbsp;&nbsp;</p>
 </div>
<div id="main" class="rg_inout">
      <div class="cleardiv"></div>
    <div class="aacengter">
    <asp:GridView ID="Gdv" DataKeyNames="ID"  
        runat="server" AutoGenerateColumns="False" PageSize="20"  ShowHeader="false">
      <Columns>
      <asp:TemplateField >
        <ItemTemplate> 
             <div class="qst">
                   <asp:Label ID="labState" runat="server" Text='<%# GetStatus(Convert.ToInt32( Eval("Status"))) %>'></asp:Label>
               <h3>
                    <a target="_self" href="Interactive.aspx?ID=<%#Eval("ID")%>"><%#GetLeftString(Eval("Qcontent").ToString(),30) %></a>
               </h3>                 
              <div class="type">
                  <%# Getname(Eval("isNi", "{0}"),Eval("UserName", "{0}"),Eval("UserID", "{0}"))%>  - <%#Eval("AddTime", "{0:yyyy-MM-dd}")%> - <a href="Classification.aspx?GradeID=<%# Eval("QueType")%>"><%#gettype(Eval("QueType","{0}"))%></a>
               </div>
             </div>
        </ItemTemplate>
        <ItemStyle />
      </asp:TemplateField>
      </Columns>
      <PagerStyle   />

      <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
    </asp:GridView>
    <table>
      <tr >
        <td height="22" colspan="9"  > 共
          <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
          条记录
          <asp:Label ID="Toppage" runat="server" Text="" />
          <asp:Label ID="Nextpage" runat="server" Text="" />
          <asp:Label ID="Downpage" runat="server" Text="" />
          <asp:Label ID="Endpage" runat="server" Text="" />
          页次：
          <asp:Label ID="Nowpage" runat="server" Text="" />
          /
          <asp:Label ID="PageSize" runat="server"
                        Text="" />
          页
          <asp:Label ID="pagess" runat="server" Text="" />
          条记录/页 转到第
          <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged"> </asp:DropDownList>
          页 </td>
      </tr>
    </table>
    </div>
  </div>
  <!-- 版权信息 -->

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
    <script  type="text/javascript">
        function show() {
            var div = document.getElementById("show");
            if (div.style.display == "none") {
                div.style.display = "block";
            }
        }

</script>
</body>
</html>
<script  type="text/javascript">
    function show() {
        var div = document.getElementById("show");
        if (div.style.display == "none") {
            div.style.display = "block";
        }
    }

</script>