<%@ page language="C#" autoeventwireup="true" inherits="Guest_AddClassification, App_Web_ehi4oidk" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<meta charset="utf-8"/>
<title>问答中心-<%Call.Label("{$SiteName/}"); %></title>
<link href="../../App_Themes/UserThem/style.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/Guest/ask.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
window.onload = function () {
    //根据type 做滑动门效果
    var paras = location.href.split("type=");
    if (paras.length >= 2) {
        document.getElementById("type" + paras[1].substring(0, 1)).style.color = "Red";
    }
    else {
        document.getElementById("type1").style.color = "Red";
		 
    }
}
</script>
<style>
.ccontent .con_ul #type<%Call.Label("{$GetRequest(type)$}"); %>{ background:#fff; height:30px; line-height:30px;}
</style>
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
    </div>
    <div class="h_mid">
        <div class="h_mid_l"></div>
        <div id="tdh" class="h_mid_m">
            <span> <a href="MyAskList.aspx?QueType=">我的提问</a> <a href="MyAnswerlist.aspx">我的回答</a></span>
            <ul>
                <li><a title="问答首页" href="Default.aspx">问答首页</a> </li>
              <!-- <li><a title="知识专题" href="Topic.aspx">知识专题</a></li>--> 
                <li><a title="问答之星" href="Star.aspx">问答之星</a> </li>
                <li class="on"><a title="分类大全" href="Classification.aspx">分类大全</a></li>
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
<%--主内容开始--%>
<div id="main_ask">
<div id="mysite">
   您的位置：<a href="/">网站首页</a>>><a href="Default.aspx">问答中心</a>>><a href="Classification.aspx" >分类大全</a></div>
<div id="main_ask_l">
    <%--分类列表--%>
    <div class="classifynav" style="margin-top:0px;">
        <span class="cspan"><%=catename %></span>
        <ul class="cul">
            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                <ItemTemplate>
                    <li>
                        <%--<a href="Classification.aspx?ParentID=<%=cateid %>&GradeID=<%#Eval("GradeID") %>"><%#Eval("GradeName") %></a>--%>
                        <span runat="server" id="spGrade"></span>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <div class="clear"></div>
    </div>
    <%--问题列表--%><div class="clear"></div>
    <div class="ccontent" style="width:auto; float:none">
         <ul class="con_ul">
                <li class="ccontentli"><a href="Classification.aspx?type=1&ParentID=<%=cateid %>&GradeID=<%=gradeid %>" id="type1">待完善问题</a></li>
                <li class="ccontentli"><a href="Classification.aspx?type=2&ParentID=<%=cateid %>&GradeID=<%=gradeid %>" id="type2">已完善</a></li>
                <li class="ccontentli"><a href="Classification.aspx?type=3&ParentID=<%=cateid %>&GradeID=<%=gradeid %>" id="type3">高分</a></li>
                <li class="ccontentli"><a href="Classification.aspx?type=4&ParentID=<%=cateid %>&GradeID=<%=gradeid %>" id="type4">零回答</a></li>
                <li class="ccontentli"><a href="Classification.aspx?type=5&ParentID=<%=cateid %>&GradeID=<%=gradeid %>" id="type5">全部</a></li>
                <div class="clear"></div>
            </ul>
       
        <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
            <ItemTemplate>
                <ul>
                    <li style="width:30px;"><img src="../../App_Themes/Guest/images/TB2.gif" alt="" /><%#Eval("Score") %></li>
                    <li style="width:350px;"><a target="_self" href="SearchDetails.aspx?ID=<%#Eval("ID")%>"><%#GetLeftString(Eval("Qcontent").ToString(),20) %></a></li>
                    <li style="width:90px;"><label id="aCount" runat="server"></label></li>
                     <li style="width:90px;">
                       <a href="../../ShowList.aspx?id=<%#Eval("UserID")%>" target='_blank'>
                           <%#Eval("IsNi").ToString()=="1"?"匿名":Eval("UserName") %></a>
                    </li> 
                    <li style="width:90px;"><%#Eval("AddTime", "{0:yyyy-MM-dd}")%></li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
        <ul class="page">
			<li style="width: 98.5%; float: left; line-height: 28px; text-align: center;">
                共
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                条信息
                <asp:LinkButton runat="server" ID="First" onclick="First_Click">首页</asp:LinkButton>
                <asp:LinkButton runat="server" ID="Prev" onclick="Prev_Click">上一页</asp:LinkButton>
                <asp:LinkButton runat="server" ID="Next" onclick="Next_Click">下一页</asp:LinkButton>
                <asp:LinkButton runat="server" ID="Last" onclick="Last_Click">尾页</asp:LinkButton>
                页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                    Text="" />页
                <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" CssClass="l_input" OnTextChanged="txtPage_TextChanged"
                    Width="30px">10</asp:TextBox>
                条信息/页 转到第<asp:DropDownList ID="DropDownListPage" runat="server" 
                    AutoPostBack="True" onselectedindexchanged="DropDownListPage_SelectedIndexChanged">
                </asp:DropDownList>
                页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                    ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
            </li>
        </ul>
        <div class="clear"></div>
    </div>

</div>
<div id="main_ask_r">
 <div class="ask_border">
 <div class="ask_top"><strong>普通登录</strong></div>
<iframe src="/login.aspx?Style=1" frameborder="0" width="160" height="150"></iframe>
</div>
 </div>
 <div class="clear"></div>
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