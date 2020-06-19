<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserSign.aspx.cs" Inherits="User_UserSign" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Sign_Btn" runat="server" CssClass="btn btn-primary" Text="每日签到" OnClick="Sign_Btn_Click" />
    </div>
    </form>
</body>
</html>
