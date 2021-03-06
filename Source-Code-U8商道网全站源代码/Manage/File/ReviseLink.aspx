﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_File_ReviseLink, App_Web_s5dc2ech" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>添加站内链接</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">后台管理&gt;&gt;扩展功能 &gt;&gt;站内链接 &gt;&gt;修改链接   <a href="tjlink.aspx"><font color="red">[添加文字链接]</font></a>
	</div>
<table style="width: 100%; margin: 0 auto;" cellpadding="2" cellspacing="1" class="border">
    <tr align="center">
        <td colspan="2" class="spacingtitle">
            <asp:Label ID="LblTitle" runat="server" Text="修改站内链接" Font-Bold="True"></asp:Label></td>
    </tr>
   
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" align="right" style="width: 105px">
            <strong>关键字：&nbsp;</strong></td>
        <td class="style4" align="left">
            <asp:TextBox ID="Txtlinkname" class="l_input" runat="server" Width="175px" 
               ></asp:TextBox>
        </td>
    </tr>
    
     <tr class="tdbg">
            <td class="tdbgleft" align="right" style="width: 105px" >
                <strong>目标框架：&nbsp;</strong>
            </td>
            <td width="66%" align="left" >
                <asp:DropDownList ID="quicksouch" runat="server" AutoPostBack="True"  >
                   
                <asp:ListItem Value="_blank">_blank</asp:ListItem>
                <asp:ListItem Value="_top">_top</asp:ListItem>
                <asp:ListItem Value="_self">_self</asp:ListItem>
                <asp:ListItem Value="_parent">_parent</asp:ListItem>
                </asp:DropDownList>                
            </td>
        </tr>
       <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td class="tdbgleft" align="right" style="width: 105px">
            <strong>链接网址：&nbsp;</strong></td>
        <td class="style1" align="left">
            <asp:TextBox ID="TxtKeyword" class="l_input" runat="server" Width="175px" >http://www.</asp:TextBox>
        </td>
    </tr>
   <tr class="tdbg">
            <td class="tdbgleft" align="right" style="width: 105px">
                <strong> 链接状态：&nbsp;</strong></td>
            <td>
                <asp:RadioButtonList ID="Txtstate"  runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="0" Selected="True">开启</asp:ListItem>
                 <asp:ListItem Value="1">关闭</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr> 
    <tr class="tdbgbottom">
        <td colspan="2">
            &nbsp;&nbsp;
          <asp:Button ID="EBtnModify" class="C_input"  Text="修改" runat="server"  onclick="EBtnModify_Click"/>
            <input name="Cancel" type="button" class="C_input"  id="Cancel" value="取消" onclick="javascript:window.location.href='Addlinkhttp.aspx'"/>
            <asp:HiddenField ID="a" runat="server"/>
            <asp:HiddenField ID="b" runat="server"/>
        </td>
       </tr>
  </table>
</div>
</form>
</body>
</html>