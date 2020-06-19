<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="BBS_leaveword, App_Web_ipuhsxhf" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>留言中心首页</title>
<link href="../App_Themes/UserThem/style.css" rel="stylesheet" type="text/css" />
<link href="../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" /> 
<link href="../App_Themes/Guest/ask.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script> 
<script src="../JS/jquery.js" type="text/javascript"></script> 
<style>
#divshap{ position:absolute; width:100%; height:100%; background:#ccc;  filter:alpha(opacity=50); -moz-opacity:0.5; -khtml-opacity: 0.5; opacity:0.5;margin:0 auto;text-align:center; line-height:200px;z-index:999px;}
#divshap strong{ z-index:2; font-size:14px; color:#f00;}
.tdbg{ padding-left:5px;}
.border td{ padding:5px 0px;}
#lmenu<%= Server.HtmlEncode(Request["CateID"])%> {background: url(/App_Themes/Guest/images/nav_cur.gif) no-repeat scroll 0 0 transparent; text-align:center;}
#lmenu<%= Server.HtmlEncode(Request["CateID"])%> a {color: #303030;}
#lmenu<%= Server.HtmlEncode(Request["CateID"])%> a:hover {background: url(/App_Themes/Guest/images/nav_cur.gif) no-repeat scroll 0 0 transparent;}
</style>
<script type="text/javascript">
    function CheckDirty() {
	var value = Date.now;
	var TxtTTitle = document.getElementById("TxtTTitle").value;
	var TxtValidateCode = document.getElementById("TxtValidateCode").value;

if (value == "" || TxtTTitle == "" || TxtValidateCode=="") {
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
<div id="Tab"><ul><li><a href="Baike/Default.aspx" >百科</a></li><li  class="hover"><a href="Default.aspx">留言</a></li><li><a href="Ask/Default.aspx">问答</a></li> </ul><div class="clear"></div></div>

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
            <div class="logo" >
                <a href="/guest/" title="留言系统" target="_top"><img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>留言系统" /> </a>
            </div>
            <div class="userbar">
 <div class='hyn'> <p></p></div>
            </div>
            <div class="clr"></div>
        </div>
        <div class="h_mid">
            <div class="h_mid_l"> </div>
<div id="tdh" class="h_mid_m">
<ul> 
<li id="lmenu"><a href="Default.aspx" title="留言首页">留言首页</a></li>
<asp:Repeater ID="Repeater1" runat="server"><ItemTemplate> <%#GetDataItem()%> </ItemTemplate></asp:Repeater> 
</ul>
 
</div>
<div class="h_mid_r"></div>
</div>
<div class="clr"></div>
<div class="h_b">
<div class="h_b_l"></div>
<div class="h_b_m">
<div class="h_b_input" style=" width:560px;" >   
    <asp:DropDownList ID="Gtype" runat="server" CssClass="schDrp" >
    <asp:ListItem >留言ID</asp:ListItem>
    <asp:ListItem>留言标题</asp:ListItem>
    </asp:DropDownList> 
<asp:TextBox runat="server" ID="txtName" onmouseover="this.focus()" autocomplete="off" class="searchinput" style="vertical-align:middle;"  maxlength="100" tabindex="1"  value=""></asp:TextBox>
        <asp:Button ID="Button1" runat="server"  Text=" " CausesValidation="False" onclick="Button1_Click" class="schBtn" />           
</div>
<div class="sybz"><a href="http://help.Zoomla.cn/?index/help.html" title="帮助" target="_blank">使用<br/>帮助</a></div>             
<div class="clr"></div>
</div>
<div class="h_b_r"></div>
</div>
<div class="clr"></div>
</div>
<div class="content">
<div class="dh"> 您的位置：<a href="/">网站首页</a>>><a href="Default.aspx">留言中心</a>>><a href="#GuestBorder">留言板</a>&nbsp;&nbsp;
<asp:Literal ID="LitCate" runat="server"></asp:Literal>  
 </div>
 </div>
<div id="main" class="rg_inout">  
    <div class="cleardiv"></div>
    <asp:GridView ID="Gdv" DataKeyNames="GID"  
        runat="server" AutoGenerateColumns="False" PageSize="20"  Width="100%" EnableModelValidation="True" >
      <Columns>
      <asp:TemplateField HeaderText="标题">
        <ItemTemplate> <a href="GuestShow.aspx?GID=<%# Eval("GID")%>"><%# Eval("Title")%></a> </ItemTemplate>
        <ItemStyle  CssClass="tdbg" />
        <HeaderStyle Width="25%" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="类别">
        <ItemTemplate> <a href="Default.aspx?CateID=<%# Eval("CateID","{0}")%>"><%# GetCate(Eval("CateID","{0}")) %></a> </ItemTemplate>
        <ItemStyle  CssClass="tdbg" HorizontalAlign="Center"  />
        <HeaderStyle Width="10%" />
      </asp:TemplateField>      
      <asp:TemplateField HeaderText="时间">
        <ItemTemplate>  <%#Eval("GDate", "{0:yyyy-MM-dd hh:mm}")%>  </ItemTemplate>
        <ItemStyle  CssClass="tdbg" HorizontalAlign="Center"/>
        <HeaderStyle Width="10%" />
      </asp:TemplateField>
      </Columns>
      <RowStyle ForeColor="Black"  Height="25px" />
      <SelectedRowStyle   Font-Bold="True" ForeColor="White" />
      <PagerStyle CssClass="tdbg" ForeColor="Black"   />
      <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#000" BorderStyle="None" Height="30px" Font-Overline="False" BackColor="#C6E3F7" />
      <PagerSettings FirstPageText="第一页" LastPageText="最后页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
    </asp:GridView>
    <table Width="100%" style=" text-align:center">
      <tr class="tdbg">
        <td height="22" colspan="9"  class="tdbgleft"> 共
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

  <div class="rg_inout" style=" width:960px; margin:auto; margin-top:10px; padding:10px;">
                   <span id="banAnony" style="color:red;margin-left:10px;" runat="server" visible="false">你好请先登录，再发布留言!<a href="/user/Login.aspx?ReturnUrl=/guest/" style="color:#133db6;">[点击登录]</a></span>
      <div id="userDiv" runat="server">
  <table id="public"  style="position:relative;" class="border" width="100%" cellpadding="0" cellspacing="0" >
      <tr>
        <td class="spacingtitle" colspan="2" ><a name="GuestBorder">
          </a></td>
      <tbody id="UCate" runat="server" style="display:none">
        <tr class="tdbg">
          <td class="style1" align="right"><strong>选择分类：</strong><div id="divshap" style="display:none" runat="server"><strong>该留言需要先登录才能发表，您尚未登录，请先</strong><a  href="/User/Login.aspx?ReturnUrl=/Guest/" style="font-size:20px; color:blue;">登录</a></div></td>
          <td><asp:DropDownList ID="DDLCate" runat="server"  AutoPostBack="true" onselectedindexchanged="DDLCate_SelectedIndexChanged"  CssClass="schDrp"> </asp:DropDownList>
</td>
        </tr>
      </tbody>
      <tbody id="TCateName" runat="server" style="display:none">
        <tr class="tdbg">
          <td class="style1" align="right"><strong>分类：</strong></td>
          <td><asp:Label ID="LblCateName" runat="server" Text="Label"></asp:Label></td>
        </tr>
      </tbody>
      <tr class="tdbg">
        <td class="style1" align="right"><strong>标题：</strong> </td>
        <td style="width:85%">
        <asp:TextBox ID="TxtTTitle" runat="server" MaxLength="100"  class="searchinput"/>
             <asp:RequiredFieldValidator ID="TxtTTitleValidator" runat="server" ControlToValidate="TxtTTitle"
                ErrorMessage="标题不能为空!" SetFocusOnError="True" Display="Dynamic" />       
            <span id="RequiredFieldValidator2"></span>     
          </td>
      </tr>
      <tr class="tdbg">
        <td class="style1" align="right"><strong>内容：</strong></td>
        <td style="width:85%"><textarea runat="server" cols="80" id="TxtTContent" width="580px" height="200px" name="TxtTContent" rows="50" ></textarea>
             <asp:RequiredFieldValidator ID="TxtTContentValidator" runat="server" ControlToValidate="TxtTContent"
                ErrorMessage="内容不能为空!" SetFocusOnError="True" Display="Dynamic" /> 
            <%=Call.GetUEditor("TxtTContent") %>
          <span id="RequiredFieldValidator1"></span>
          <input type="hidden" id="txt_Config\" value="" />
          <asp:TextBox ID="FilePicPath" runat="server" Text="fbangd" Style="display: none;height:20px"></asp:TextBox></td>
      </tr>
      <tr  class="tdbg">
        <td  align="right"><strong>验证码：</strong></td>
        <td style="width:85%;margin-top:3px"><asp:Image ID="Image1" runat="server" ImageUrl="~/Common/ValidateCode.aspx" Height="20px" ToolTip="点击刷新验证码" Style="cursor: pointer; border: 0; vertical-align: middle;" onclick="this.src='../Common/ValidateCode.aspx?t='+Math.random()" />
          <asp:TextBox ID="TxtValidateCode" MaxLength="6" runat="server" style="width:70px;border:#CCC solid 1px;height:20px; line-height:23px;" autocomplete="off"></asp:TextBox>
          <span id="sp1"></span></td>
      </tr>
      <tr class="tdbgbottom" >
        <td colspan="2" align="center"><asp:HiddenField ID="HdnCateID" runat="server" />
          <asp:Button ID="EBtnSubmit2" Text="提交留言" OnClick="EBtnSubmit_Click" cssclass="i_bottom" runat="server" />

        </td>
      </tr>      
    </table>
      </div></div>
  <!-- 版权信息 -->
 <div id="bottom">
 
<p style="text-align:center">
<script language="javascript" type="text/javascript"> 
<!-- 
var year="";
mydate=new Date();
myyear=mydate.getYear();
year=(myyear > 200) ? myyear : 1900 + myyear;
document.write(year); 
--> 
</script>&copy;&nbsp;Copyright&nbsp; <%Call.Label("{$SiteName/}"); %> All rights reserved.</p>
</div>
</form>
</body>
</html>