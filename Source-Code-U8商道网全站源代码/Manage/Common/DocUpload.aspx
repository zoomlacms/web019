﻿<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Common.DocUpload, App_Web_v0nor4nu" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>上传文件</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body class="tdbg">
    <form id="form1" runat="server" enctype="multipart/form-data">
    <table style="border:none; ">
        <tr class="tdbg">
            <td valign="top">
                完美Word转换:<asp:FileUpload ID="FupFile" runat="server" /><asp:Button ID="BtnUpload" runat="server" Text="上传" OnClick="BtnUpload_Click" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="ValFile" runat="server" ErrorMessage="上传" ControlToValidate="FupFile"></asp:RequiredFieldValidator><asp:Label ID="LblMessage" runat="server" ForeColor="red" Text=""></asp:Label>
            </td>
            <asp:HiddenField ID="HiddenField1" runat="server" />
        </tr>
    </table>
    </form>
</body>
</html>