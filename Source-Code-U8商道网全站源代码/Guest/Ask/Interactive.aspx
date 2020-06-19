<%@ page language="C#" autoeventwireup="true" inherits="Guest_Interactive, App_Web_ehi4oidk" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的提问-<%Call.Label("{$SiteName/}"); %>问答</title>
<link href="../../App_Themes/UserThem/style.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" /> 
<link href="../../App_Themes/Guest/ask.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script src="../../Plugins/Ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="../../JS/jquery.js" type="text/javascript"></script>
<script type="text/javascript"  charset="utf-8" src="../../Plugins/kindeditor/kindeditor.js"></script>
<script type="text/javascript">
	function supplyment(id) {
		document.getElementById("Rid").value = id; 
		var div = document.getElementById("divSupplyment");
		if (div.style.display == "none") {
			div.style.display = "block";
		}
		else {
			div.style.display = "none";
		}
	}
	function Recommend_click(id) {
		document.getElementById("hfstatus").value = id;
	
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
            <div class="userbar">
                <div class='hyn'  style="<%=getstyle()%>"> 
                    <a href="MyAskList.aspx?QueType=">我的提问</a> <a href="MyAnswerlist.aspx">我的回答</a>
                </div>
                <hr />
            </div>
            <div class="clr"></div>
        </div>
        <div class="h_mid">
            <div class="h_mid_l"></div>
            <div id="tdh" class="h_mid_m"> 
                <ul>
                    <li class="on"><a title="问答首页" href="Default.aspx">问答首页</a> </li>
                     <!-- <li><a title="知识专题" href="Topic.aspx">知识专题</a></li>-->
                    <li><a title="问答之星" href="Star.aspx">问答之星</a></li>
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
           <span style="float:left; width: 397px;"> 您的位置：<a href="/">网站首页</a>>> <a href="Default.aspx">问答中心</a>>><a href="MyAskList.aspx?QueType=">我的提问</a>>><a href="Interactive.aspx?ID=<%=Request["ID"]%>">我的提问互动详情</a>&nbsp;&nbsp;</span>
           <%--><span  style="float:right; font-size:20px">
<a href="Baike.aspx" >百科</a> 
<a href="Default.aspx">留言</a>
<a href="Ask.aspx">问答</a></span>--%>
        </h1>
      <%--   <div class="cart_lei" style="height: 70px">
            <ul style="color: #FFF; font-size: 20px; line-height: 40px; padding: 10px 0 0 16px;">
                <li style="float: left;"><b>逐浪问答</b></li>
                <li style="float: left">
                    <asp:TextBox runat="server" ID="txtAsk" Height="25" Width="300"></asp:TextBox>
                    <br />
                    <asp:Button runat="server" ID="btnSearch" Text="搜索答案" 
                        onclick="btnSearch_Click" />&nbsp;
                    <asp:Button runat="server" ID="btnAsk" Text="我要提问" onclick="btnAsk_Click" />&nbsp;
                    <asp:Button  runat="server" ID="btnMyAsk" Text="我的提问" OnClick="btnMyAsk_Click"/>&nbsp
                    <asp:Button runat="server" ID="btnAnswer" Text="我要回答" onclick="btnAnswer_Click" />
                </li>
            </ul>
        </div>
      --%>       
        <div style="border-top: 2px solid #3171af; padding: 25px 0 10px 16px;">
       <div  class="show_">
          
      <span class="questions">问题：</span><span style=" font-weight:bold;"><asp:Label ID="question" runat="server"></asp:Label></span><br />
   <span  class="questions">提问者： <asp:Label  ID="username" runat="server"></asp:Label> </span>
                 <span  class="questions">提问日期：<asp:Label  ID="addtime" runat="server"></asp:Label></span><br />
                <span class="questions" id="supdiv" runat="server">问题补充：</span><asp:Label ID="supment" runat="server"></asp:Label><br />
           <span><input type="button" id="btn1" value="补充问题" onclick="ViewQes()" class="btns" /></span>
          <div id="viewQ" style="display:none;"> 
              <asp:TextBox ID="Txtsupment" runat="server" TextMode="MultiLine" Columns="60" Rows="6" CssClass="txtinput" ></asp:TextBox><br />
           <asp:Button ID="Button2" OnClick="Button2_Click" Text="提交" runat="server" CssClass="btns" /> <input type="button" id="Button1" value="取消" onclick="ViewQes()" class="btns"  />
              </div>
                </div>
       <div id="g_show"  class="show_" >
          <div class="tit"><div class="bg_hd"><span>回答:</span></div></div>
           <div style="padding-left:10px;">
      <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
        <ItemTemplate>
          <div><%# Eval("Content")%> </div>
          <span>回答者：<asp:Label id="Isname" runat="server">  <a href="../../ShowList.aspx?id=<%#Eval("UserID")%>" target='_blank'><%#Eval("UserName") %></a></asp:Label>|<span>回答日期：<%# Eval("AddTime")%></span>
          <div class="g_show_txt">
            
              <div style=" float:right;color:red" id="recomand"><%#getstatus(Eval("Status","{0}"))%></div>
            <asp:Repeater runat="server" ID="Repeater2"  OnItemDataBound="Repeater2_ItemDataBound">
                            <ItemTemplate>
                                <%--  <h1>
                                   <span style="float: right">追问时间:<%#Eval("Submitdate")%></span></h1>--%>
                                <div class="g_show_txt" id="content">
                                <div> &nbsp;&nbsp;&nbsp;追问：<%#Eval("Content")%></div>
                                <asp:Repeater runat="server" ID="Repeater3">
                                        <ItemTemplate> 
                                            <%--  <h1>
                                               <span style="float: right">追问时间:<%#Eval("Submitdate")%></span></h1>--%>
                                            <div class="g_show_txt" id="content">
                                              &nbsp;&nbsp;  回答：<%# Eval("Content")%></div>
                                           <%--  <h1>
                                                <span style="float: right">回答日期:<%#Eval("Answerdate")%></span></h1>--%> 
                      </ItemTemplate>
                                    </asp:Repeater>  
                                 </div>
                               <%--  <h1>
                                    <span style="float: right">回答日期:<%#Eval("Answerdate")%></span></h1>--%>
                                    <%--  <asp:Panel  ID="ReplyBtn"  runat="server" >  <input type="button" style="border-width: 0px; background: none; color: #3171af;" value="继续追问" onclick="supplyment(<%# Eval("ID")%>)" /></asp:Panel> --%> 
                            </ItemTemplate>
                        </asp:Repeater>
<div style=" float:left"><asp:Panel  ID="ReplyBtn1"  runat="server" >  <input type="button" style="border-width: 0px; background: none; color: #3171af;" value="继续追问" onclick="supplyment(<%# Eval("ID")%>)" /></asp:Panel></div>
<div style=" float:right"><asp:LinkButton ID="recommand" runat="server" CommandName="recomand"  CommandArgument='<%#Eval("ID")%>'  OnClientClick="javascript:return confirm('你确认推荐吗?')"><p style="border-width: 0px; background: none; color: #3171af;">推荐为满意答案</p></asp:LinkButton></div>
 <br />
      </div> 
        </ItemTemplate>
      </asp:Repeater>

           </div>
         <div style="display: none;" id="divSupplyment">         
                                <asp:HiddenField ID="Rid" runat="server" Value="" />
                <asp:TextBox runat="server" ID="txtSupplyment" CssClass="x_input" TextMode="MultiLine"
                    Width="500" Height="120">
                    </asp:TextBox><br/>
                    <asp:Button runat="server" ID="btnSubmit" Text="提交追问" CssClass="C_input" OnClick="btnSubmit_Click" /></div>
    </div>          
           <%-- <div style="width: 500px;">
                <span style="float: right; padding-top: 20px;">
                    <asp:Button runat="server" ID="btnSubmit" Text="提交" CssClass="C_input" OnClick="btnSubmit_Click" /></span></div>
        </div>--%>  
    <!-- 版权信息 -->
    <div id="bottom">
        <a href="/">
            <img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>" /></a>
        <p>
       <script  type="text/javascript"> 

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
    </div>
    </div>
    <asp:HiddenField  runat="server" ID="hfsid"/>
    <asp:HiddenField  runat="server" ID="hfstatus"/>
    </form>
    
    <script type="text/javascript">
    function show() {
        var div = document.getElementById("show");
        if (div.style.display == "none") {
            div.style.display = "block";
        }
        // else {div.style.display = "none";} 
    }
    function ViewQes()
    {
        if($("#viewQ").css("display")=="none")
            $("#viewQ").css("display","");
        else
            $("#viewQ").css("display","none");
    }

</script>
</body>
</html>