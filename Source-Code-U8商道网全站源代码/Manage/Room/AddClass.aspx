﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Room_AddClass, App_Web_esu4yw2q" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>添加分类</title>

    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .style1
        {
            background: #e0f7e5; /*line-height: 120%;*/
            padding: 2px;
            width: 27%;
        }
        .style2
        {
            height: 39px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="r_navigation">
        
        <span>后台管理</span> &gt;&gt; <span>OIEM管理</span> &gt;&gt; <span>小屋管理</span> &gt;&gt; <span>分类管理</span> &gt;&gt; <span>添加分类</span>
    </div>
    <div class="clearbox">
    </div>
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border">
        <tr align="center">
            <td colspan="2" class="spacingtitle">
                <strong>
                    <asp:Label ID="LblTitle" runat="server" Text="添加物品分类" Font-Bold="True"></asp:Label>
                </strong>
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="style1" align="left">
                分类名称：
            </td>
            <td style="text-align: left; width: 60%;">
                <asp:TextBox ID="classname" class="l_input" runat="server" Width="280px"></asp:TextBox>
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="style1" align="left">
                分类排序：(数字越大排列越前)
            </td>
            <td  style="text-align: left; width: 60%;">
                <asp:TextBox ID="classnum" class="l_input" runat="server" Width="91px">0</asp:TextBox>
            </td>
        </tr>
        <tr class="tdbg">
            <td style="text-align: center" colspan="2" class="style2">
                <asp:Button ID="EBtnSubmit" class="C_input" Text="保存" runat="server" 
                    onclick="EBtnSubmit_Click" />&nbsp;&nbsp;
                <input name="BtnCancel" class="C_input" type="button" onclick="javascript:window.location.href='ClassManage.aspx'"
                    value=" 取消 " />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
