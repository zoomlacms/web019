 <%@ page language="C#" autoeventwireup="true" inherits="User_Left, App_Web_pse5vbgc" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title><%=lang.Get("u_Left_funNav")%></title>
<link href="../../App_Themes/UserThem/user.css" rel="stylesheet" type="text/css" />
<script src="../../JS/jquery.js" type="text/javascript"></script>
<script src="../../js/UserDefault.js" type="text/javascript"></script>
</head>
<body class="user_left">  
<div class="left_font" onclick="usershow('#td1','#span1')" >
<span id="span1" class="imgbgover img_icon" onclick=" usershow('#td1','#span1')" ></span>
<%=lang.Get("u_ContentLeft_generalmanage")%></div>
<ul id="td1" class="tabtr">
<li><a href="../Content/Default.aspx?t=1"target="main_right"><%=lang.Get("u_ContentLeft_contribute")%></a></li>
<li> <a href="<%=CustomerPageAction.customPath.Replace("~","") %>AddOn/ProjectsList.aspx" target="main_right"><%=lang.Get("u_ContentLeft_item")%></a></li>
<li><a href="<%=CustomerPageAction.customPath.Replace("~","") %>AddOn/UserAddProjects.aspx"target="main_right"><%=lang.Get("u_ContentLeft_add")%></a></li>
<li><a href="../../user/iServer/FiServer.aspx"target="main_right" ><%=lang.Get("u_ContentLeft_insider")%></a></li>
</ul>

<div class="left_font"  onclick="usershow('#td2','#span2')" >
<span id="span2" class="imgbgout img_icon" onclick=" usershow('#td2','#span2')" ></span> 
<%=lang.Get("u_ContentLeft_recruit")%></div>
<ul id="td2" class="tabtr">
<li> <a href="../../Jobs/ExamineeList.aspx" target="main_right"><%=lang.Get("u_ContentLeft_interview")%></a></li>
<li><a href="../../CN/nite/Content/PositionManage.aspx"target="main_right"><%=lang.Get("u_ContentLeft_position")%></a></li>
<li><a href="../../CN/nite/Content/ResumeManage.aspx"target="main_right"><%=lang.Get("u_ContentLeft_resume")%></a></li>
<li><asp:Literal ID="lt_src" runat="server" Text="视频房间申请"></asp:Literal></li>
<li> <a href="../../CN/nite/Content/CompanyHouseManage.aspx" target="main_right" ><%=lang.Get("u_ContentLeft_manage")%></a></li>
<li><a href="../../CN/nite/Content/VideoManage.aspx"target="main_right" ><%=lang.Get("u_ContentLeft_video")%></a></li>
<li><a href="MyFavori.aspx"target="main_right" ><%=lang.Get("u_ContentLeft_favorite")%></a></li>
</ul>

<div class="left_font" onclick="usershow('#td3','#span3')" >
<span id="span3" class="imgbgout img_icon" onclick="usershow('#td3','#span3')" ></span>
<%=lang.Get("u_ContentLeft_interaction")%></div>
<ul id="td3" class="tabtr">
<li><a href="../Content/Default.aspx?t=1"target="main_right"><%=lang.Get("u_ContentLeft_publish")%></a></li>
<li><a href="../Content/CommentList.aspx" target="main_right"><%=lang.Get("u_ContentLeft_commentme")%></a></li>
<li><a href="../Message/Message.aspx" target="main_right"><%=lang.Get("u_ContentLeft_inbox")%></a></li>
</ul>

<div class="left_font" onclick="usershow('#td5','#span5')" >
<span id="span5" class="imgbgout img_icon" onclick="usershow('#td5','#span5')" ></span>
我的问答</div>
<ul id="td5" class="tabtr">
<li><a href="../Guest/MyAsk.aspx"target="main_right">我的提问</a></li>
<li><a href="../Guest/MyAnswer.aspx" target="main_right">我的回答</a></li>
<li><a href="../Guest/AskComment.aspx" target="main_right">我的评论</a></li>
<li><a href="../Guest/MyApproval.aspx" target="main_right">我的赞同</a></li>
</ul>
<div class="left_font" onclick="usershow('#td6','#span6')" >
<span id="span6" class="imgbgout img_icon" onclick="usershow('#td6','#span6')" ></span>
我的百科</div>
<ul id="td6" class="tabtr">
<li><a href="../Guest/BaikeContribution.aspx"target="main_right">词条贡献</a></li>
<li><a href="../Guest/BaikeDraft.aspx" target="main_right">草稿箱</a></li>
<li><a href="../Guest/BaikeFavorite.aspx" target="main_right">百科收藏</a></li>
</ul>
<div class="left_font" onclick="usershow('#td4','#span4')" >
<span id="span4" class="imgbgout img_icon" onclick="usershow('#td4','#span4')" ></span>
<%=lang.Get("u_ContentLeft_bid")%></div>
<ul id="td4" class="tabtr">
<li><a href="../Content/IRelease.aspx"target="main_right"><%=lang.Get("u_ContentLeft_bidmanage")%></a></li>
<li><a href="../Content/MyCommentList.aspx" target="main_right"><%=lang.Get("u_ContentLeft_participate")%></a></li>
</ul>
</body>
</html>