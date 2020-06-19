<%@ page language="C#" autoeventwireup="true" inherits="Guestbook_MyAnswer, App_Web_xwzmyvqh" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的问答中心-<%Call.Label("{$SiteName/}"); %>问答</title>
<link href="../../App_Themes/UserThem/style.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/Guest/ask.css" rel="stylesheet" type="text/css" />
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
                <a href="Default.aspx" title="问答系统" target="_top">
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
                    <li class="on"><a title="问答首页" href="../Ask/Default.aspx">问答首页</a> </li>
                    <!-- <li><a title="知识专题" href="Topic.aspx">知识专题</a></li>-->
                    <li><a title="问答之星" href="../Ask/Star.aspx">问答之星</a></li>
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
                    <asp:Button runat="server" AccessKey=" " ID="btnSearch" class="sub" Text=" " OnClick="btnSearch_Click"
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
            <span style="float: left; width: 397px;">您的位置：<a href="/">网站首页</a>>>&nbsp;<a href="Default.aspx">问答中心</a>>><a href="List.aspx?strWhere=&QueType=">问题列表</a>>>&nbsp;<a href="MyAnswer.aspx?ID=<%=Request["ID"]%>">问题详情</a>&nbsp;</span>
        </h1>
        <div class="cleardiv" style="height: 40px">
        </div>
        <div class="myanswer">
            <div class="aacengter">
               <div style="width: 650px;">
                <span class="questions">问题：</span><span style="font-weight:bold;"><asp:Label ID="question" runat="server"></asp:Label></span><br />
                    <span class="questions">提问者：<a href="#"><asp:Label ID="username" runat="server"></asp:Label></a></span>
                     <span class="questions">提问日期：<asp:Label ID="addtime" runat="server"></asp:Label></span><br />
                <span class="questions" id="supdiv" runat="server">问题补充：</span><asp:Label ID="supment" runat="server"></asp:Label>
            </div>
         <div class="tj_content"> 
       <div class="tit"><span>您的回答:</span></div>  
      <asp:TextBox runat="server" ID="txtContent" CssClass="x_input" TextMode="MultiLine" Width="647px" Height="100px"></asp:TextBox> 
   <span style="float:right;"><asp:CheckBox ID="CkIsNi" runat="server" />匿名<asp:Button runat="server" ID="btnSubmit" Text="提交回答" CssClass="C_input" OnClick="btnSubmit_Click" /></span>
  <div class="clr"></div></div>             
       <div class="show_an">
             <div class="tit"><div class="bg_hd"><span>其他回答:</span></div></div>
           <div class="pad10"> 
              <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                    <ItemTemplate>
                 <div class="g_show_txt">
                     <%# Eval("Content")%> <div><%#getstatus(Eval("Status","{0}"))%></div></div> 
                   <div class="btm">
                    <span class="btmlabe ad">回答者：<asp:Label id="Isname" runat="server"><a href="../../ShowList.aspx?id=<%#Eval("UserID")%>" target='_blank'><%#Eval("IsNi").ToString()=="1"?"匿名":Eval("UserName") %></a></asp:Label></span><span class="btmlabe date">回答日期：<%# Eval("AddTime")%></span></div>
                   <asp:Repeater runat="server" ID="Repeater2"  OnItemDataBound="Repeater2_ItemDataBound">
                     <ItemTemplate>  
                                <div class="g_show_txt" id="content">
                                <div> &nbsp;&nbsp;&nbsp;追问：<%#Eval("Content")%></div>
                                <asp:Repeater runat="server" ID="Repeater3">
                                        <ItemTemplate>  
                                            <div class="g_show_txt" id="content">
                                              &nbsp;&nbsp;  回答：<%# Eval("Content")%></div> 
                                        </ItemTemplate>
                                    </asp:Repeater>  
                                 </div>  
                            <asp:Panel  ID="ReplyBtn"  runat="server" > 
                         <input type="button" style="border-width: 0px; background: none; color: #3171af;" value="回复追问" onclick="reply(<%#Eval("ID")%>)" />
                         </asp:Panel>  
                         </ItemTemplate>
                        </asp:Repeater> 
                    </ItemTemplate>
                </asp:Repeater>
               </div> 
                </div>
        </div>
 </div>
 </div>


    <!-- 版权信息 -->
    <div id="bottom">
         
        <p>
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
    <asp:HiddenField runat="server" ID="hfsid" />
    </form>
</body>
</html>
<script type="text/javascript">
    function show() {
        var div = document.getElementById("show");
        if (div.style.display == "none") {
            div.style.display = "block";
        }
        // else {div.style.display = "none";}

    }
</script>