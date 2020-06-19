<%@ page language="C#" autoeventwireup="true" inherits="Guest_AskAdd, App_Web_ehi4oidk" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title> 提问-<%Call.Label("{$SiteName/}"); %>问答</title>
<link href="../../App_Themes/UserThem/style.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/Guest/ask.css" rel="stylesheet" type="text/css" />
<script type="text/ecmascript">
    function removeFix(){
        if(confirm("你确定要删除求助对象？")){
            document.getElementById("fix").style.display="none";
        }
    }
</script>
</head>
<body>
<div id="Tab"><ul><li><a href="../Default.aspx">留言</a></li><li><a href="../Baike/Default.aspx" >百科</a></li><li  class="hover"><a href="/guest/Ask/Default.aspx">问答</a></li> </ul><div class="clear"></div></div>
<form id="form1" runat="server">
<div class="topnav" id="toptab"> 
<div class="topright"> 
<a href="/">返回首页</a>
<a href="javascript:void(0)" onclick="SetHomepage()">设为首页</a>
<a href="javascript:void(0)" onclick="addfavorite()">收藏本站</a></div> 
<span  style="<%=getstyle()%>"> 您好！<a href="/user/" target="_blank"><asp:Label runat="server"  ID="user"></asp:Label></a> 欢迎来<%Call.Label("{$SiteName/}"); %>问答系统！ [<a href="<%=ResolveUrl("~/User/logout.aspx") %>?url=/Guest/Default.aspx">退出登录</a>]</span> 
<span  style="<%=getstyles()%>">[<a  href="/user/Login.aspx?ReturnUrl=/guest/">请登录</a>] [<a  href="/user/register.aspx?ReturnUrl=/guest/">免费注册</a>]</span>
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
                    <asp:Button runat="server" ID="btnSearch" class="sub" Text=" " OnClick="btnSearch_Click"
                    />
                    <asp:Button runat="server" ID="btnAsk" class="but" Text=" " OnClick="btnAsk_Click"
                    />
                    <asp:Button runat="server" ID="btnAnswer" class="answer" Text="" OnClick="btnAnswer_Click"
                    />
                </div>
                <div class="sybz">
                    <a href="http://help.Zoomla.cn/" title="帮助" target="_blank">使用<br />帮助</a>
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
            <span style="float:left; width: 397px;" >您的位置：<a href="/">网站首页</a>>><a href="Default.aspx">问答中心</a>>><a href="#GuestBorder">我要提问</a>&nbsp;&nbsp;</span>
        </h1>
        <div class="clear"></div>
        <div style="border-top: 2px solid #3171af; padding: 25px 0 10px 16px; height:auto;">
            <div class="aacengter">
            <div style="background: #8EC1EE; width:652px;">
                <span style="color: #fff; height: 30px; padding: 0 5px;">请将您的疑问告诉我们吧：</span></div>
            <div  style="width: 650px;">
                <asp:TextBox runat="server" ID="txtContent" CssClass="x_input" TextMode="MultiLine"
                    Width="650" Height="80"></asp:TextBox></div>
            <div style="width: 650px;">
                <input type="button" style="border-width: 0px; background: none; color: #3171af;"
                    value="补充问题(点此选填)" onclick="supplyment()" /></div>
            <div style="display: none;" id="divSupplyment">
                <asp:TextBox runat="server" ID="txtSupplyment" CssClass="x_input" TextMode="MultiLine"
                    Width="650" Height="120"></asp:TextBox></div>
            <div style="width: 650px;">
                <span style="color: #3171af; float: left;"><%--分类：<asp:DropDownList ID="ddlCate" runat="server"
                    Height="20px" Width="100px">
                </asp:DropDownList>--%>
                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
                        大类：<asp:DropDownList ID="ddlCate" runat="server" Height="20px" Width="100px" OnSelectedIndexChanged="ddlCate_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        小类：<asp:DropDownList ID="ddlGrade" runat="server" Height="20px" Width="100px"></asp:DropDownList>
                        <input type="text" style="height:30px; width:50px;"/>
                <%--    </ContentTemplate>
                </asp:UpdatePanel>--%>
                </span>
                <span style="float: right; color: #3171af;">
                    匿名<asp:CheckBox ID="isNi" runat="server" />
                    悬赏分：<asp:DropDownList ID="ddlScore"
                    runat="server" Height="20px" Width="100px">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>40</asp:ListItem>
                    <asp:ListItem>50</asp:ListItem>
                    <asp:ListItem>60</asp:ListItem>
                    <asp:ListItem>70</asp:ListItem>
                    <asp:ListItem>80</asp:ListItem>
                    <asp:ListItem>90</asp:ListItem>
                    <asp:ListItem>100</asp:ListItem>
                </asp:DropDownList>
                </span>
            </div>
            <div class="clear">
            </div>
            <div style="width: 650px;">
                <span id="fix" runat="server" visible="false">求助对象:<a href="/ShowList.aspx?id=<%=fixID %>" target="_blank"><%=fixName %></a><a href="javascript:void(0)" onclick="removeFix()"><%--<img src="../App_Themes/AdminDefaultTheme/images/error.gif" style="width:14px;height:13px;" alt=""/>--%><img src="../App_Themes/Guest/images/layer_close.png" style="width:14px;height:13px;" alt=""/></a></span>
                <span style="float: right; margin-top: 20px;">
                    <asp:Button runat="server" ID="btnSubmit" Text="提交问题" CssClass="C_input" OnClick="btnSubmit_Click" /></span></div>
       </div></div>
    </div>
    <!-- 版权信息 -->
    <div id="bottom">
        <a href="/">
            <img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>" /></a>
        <p>
          <script language="javascript" type="text/javascript"> 

    var year = "";
    mydate = new Date();
    myyear = mydate.getYear();
    year = (myyear > 200) ? myyear : 1900 + myyear;
    document.write(year); 
 
            </script> 
            &copy;&nbsp;Copyright&nbsp;
            <%Call.Label("{$SiteName/}"); %>
            All rights reserved.</p>
    </div>
    <asp:HiddenField runat="server" ID="hfid" />
    </form>
    <script type="text/javascript">
        function show() {
            var div = document.getElementById("show");
            if (div.style.display == "none") {
                div.style.display = "block";
            }
            // else {div.style.display = "none";}
        }
        function supplyment() {
            var div = document.getElementById("divSupplyment");
            //alert("aaa");
            if (div.style.display == "none") {
                div.style.display = "block";
            }
            else
                div.style.display = "none";

        }
</script>
</body>
</html>