﻿<%@ page language="C#" autoeventwireup="true" inherits="User_Usertalk_MyFriends, App_Web_ec14xm3a" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>我的好友</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div>
    <input id="Hidden1" type="hidden" value="" runat="server" />
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
		<asp:TreeView ID="TreeView1" style="font-size:15px;color:#FFF"  runat="server" 
		ShowExpandCollapse="False" >
		 <NodeStyle BorderColor="#CCCCCC" Font-Size="12pt" ForeColor="Black" />
	</asp:TreeView>
	</ContentTemplate>
	</asp:UpdatePanel>
</div>
</form>
</body>
</html>