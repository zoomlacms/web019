<%@ page language="C#" autoeventwireup="true" inherits="Guest_SearchDetails, App_Web_xwzmyvqh" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>已解决-<%Call.Label("{$SiteName/}"); %>问答</title>
<link href="../../App_Themes/UserThem/style.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/Guest/ask.css" rel="stylesheet" type="text/css" />
<script src="../../Plugins/Ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="../../JS/jquery.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8" src="../../Plugins/kindeditor/kindeditor.js"></script>
<script type="text/javascript">
	function supplyment() {

		var div = document.getElementById("divSupplyment");
		if (div.style.display == "none") {
			div.style.display = "block";
		}
		else {
			div.style.display = "none";
		}
	}
	function reply() {

		var div = document.getElementById("styreply");


		if (div.style.display == "none") {
			div.style.display = "block";
		}
		else {
			div.style.display = "none";
		}
		//alert(div.style.display);
	}
	function show() {
		var div = document.getElementById("show");
		if (div.style.display == "none") {
			div.style.display = "block";
		}
		// else {div.style.display = "none";}

	}
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
function showComment(id) {
document.getElementById("divComment"+id).style.display = "";
}
function hideComment(id) {
document.getElementById("divComment"+id).style.display = "none";
}
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
    <div class="h_mid_r"> </div>
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
<div id="main_ask">
<div id="mysite">
    您的位置：<a href="/">网站首页</a>>><a href="Default.aspx">问答中心</a>>><a href="List.aspx?strWhere=&QueType=">已解决</a> 
    <div class="clear"></div>
    </div>
    <div id="main_ask_l">
<div  class="myanswer">
           
    <div class="question">
        <span class="questions">问题：</span>
<strong><asp:Label ID="question" class="questions" runat="server"></asp:Label></strong><br />
                <span  class="questions">提问者： <asp:Label ID="username" runat="server"></asp:Label>|</span> 
            <span  class="questions">提问日期：<asp:Label
                    ID="addtime" runat="server"></asp:Label></span><br />
        <span class="questions" id="supdiv" runat="server">问题补充：</span><asp:Label ID="supment" runat="server"></asp:Label>
    </div>
    <div class="tuijian">
            <div class="tit"><div class="bg_tj"><span>推荐答案：</span></div>
            </div>
            <div class="tj_content">
                <div id="g_show">
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound1" >
<ItemTemplate>
    <div class="g_show_txt"><%# Eval("Content")%> <div style=" float:right;color:red" id="Div<%#Eval("ID") %>"><%#getstatus(Eval("Status","{0}"))%></div></div> 
    <div class="btm">
    <span class="btmlabe ad">回答者：<asp:Label id="Isname" runat="server"><a href="../../ShowList.aspx?id=<%#Eval("UserID")%>" target='_blank'><%#Eval("IsNi").ToString()=="1"?"匿名":Eval("UserName") %></a></asp:Label></span><span class="btmlabe date">回答日期：<%# Eval("AddTime")%></span><span  class="btmlabel"><a href="#" onClick="showComment(<%#Eval("ID") %>)">评论</a></span>
        <span class="btmlabel">
            <asp:LinkButton ID="lbtApproval" runat="server" CommandName="Approval" CommandArgument='<%#Eval("ID") %>' class="zandip" onMouseover="Changtxt(this)"  onMouseOut="rectxt(this)"></asp:LinkButton></span>
        <div id="divComment<%#Eval("ID") %>" style="display:none; width:75%">
            <div class="clear"></div>
            <ul>
                <asp:Repeater ID="RepeaterC" runat="server" OnItemDataBound="RepeaterC_ItemDataBound">
                    <ItemTemplate>
                        <li style="width:100%">
                            <span><label runat="server" id="lbUser"></label></span><span ><%#Eval("Content") %></span>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <asp:TextBox runat="server" ID="txtSupplyment" CssClass="x_input" TextMode="MultiLine"
            Width="500" Height="120">
            </asp:TextBox><br/>
            <div style="float:right;"><a href="#" onClick="hideComment(<%#Eval("ID") %>)">取消  </a><asp:LinkButton ID="lbtSub" runat="server" CommandName="subComment" CommandArgument='<%#Eval("ID") %>' >提交</asp:LinkButton></div>
        </div>
        
        <div class="clear"></div>
    </div> 
</ItemTemplate>
</asp:Repeater>
        </div>
            </div>
    </div>
    <div class="tuijian">
            <div class="tit"><div class="bg_hd"><span>其他回答:</span></div>
            </div>
            <div class="tj_content">
        <div id="bDiv2">
        <asp:Repeater ID="Repeater2" runat="server"  OnItemCommand="Repeater2_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound1">
<ItemTemplate>
<div class="g_show_txt" style="border:none"><%# Eval("Content")%> <div style=" float:right;color:red" id="Div<%#Eval("ID") %>"><%#getstatus(Eval("Status","{0}"))%></div></div> 
    <div class="btm">
    <span class="btmlabe ad">回答者：<asp:Label id="Isname" runat="server"><a href="../../ShowList.aspx?id=<%#Eval("UserID")%>" target='_blank'><%#Eval("IsNi").ToString()=="1"?"匿名":Eval("UserName") %></a></asp:Label></span><span class="btmlabe date">回答日期：<%# Eval("AddTime")%></span><span  class="btmlabel"><a href="#" onClick="showComment(<%#Eval("ID") %>)">评论</a></span>
        <span class="btmlabel zan">
            <asp:LinkButton ID="lbtApproval" runat="server" CommandName="Approval" CommandArgument='<%#Eval("ID") %>' class="zandip"  onMouseover="Changtxt(this)"  onMouseOut="rectxt(this)"></asp:LinkButton></span>
        <div id='divComment<%#Eval("ID") %>' style="display:none; width:75%">
            <div class="clear"></div>
            <ul>
                <asp:Repeater ID="RepeaterC" runat="server" OnItemDataBound="RepeaterC_ItemDataBound">
                    <ItemTemplate>
                        <li style="width:100%">
                            <span><label runat="server" id="lbUser"></label></span><span ><%#Eval("Content") %></span>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <asp:TextBox runat="server" ID="txtSupplyment" CssClass="x_input" TextMode="MultiLine"
            Width="500" Height="120">
            </asp:TextBox><br/>
            <div style="float:right;"><a href="#" onClick="hideComment(<%#Eval("ID") %>)">取消  </a><asp:LinkButton ID="lbtSub" runat="server" CommandName="subComment" CommandArgument='<%#Eval("ID") %>' >提交</asp:LinkButton></div>
        </div>
        <div class="clear"></div>
    </div> 
</ItemTemplate>
</asp:Repeater>
        </div>
            </div>
    </div>
    <div class="tuijian">
            <div class="tit"><div class="bg_dd"><span>等待您来回答：</span></div>
            </div>
            <div class="tj_content">
        <div id="witDiv3">
            <ul>
        <asp:Repeater ID="Repeater3" runat="server" >
<ItemTemplate>
    <li>
        <span><%#getanswer(Eval("ID").ToString()) %>回答</span>  <a href="MyAnswer.aspx?ID=<%#Eval("ID") %>" >
             <%#GetLeftString(Eval("Qcontent").ToString(),45) %></a>
    </li>
                    </ItemTemplate>
                </asp:Repeater>         
    </ul></div> 

        </div>
            </div>
    </div>
 

</div>
<div id="main_ask_r">
 <div class="ask_border">
 <div class="ask_top"><strong>普通登录</strong></div>
<iframe src="/login.aspx?Style=1" frameborder="0" width="160" height="150"></iframe>
</div>
 </div>          </div>
        </div>
    <!-- 版权信息 -->
    <div id="bottom">
        <p>  &copy;&nbsp;Copyright&nbsp;
            <%Call.Label("{$SiteName/}"); %>
            All rights reserved.
            </p>
    </div>
    <asp:HiddenField runat="server" ID="hfsid" />
    <asp:HiddenField runat="server" ID="zanval" /> 
    </form>
    <script>
        function Changtxt(obj) {
            $("#zanval").val(obj.innerHTML);
            obj.innerHTML = "赞同";
        }
        function rectxt(obj)
        {
            obj.innerHTML = $("#zanval").val();
        }
    </script>
</body>
</html>