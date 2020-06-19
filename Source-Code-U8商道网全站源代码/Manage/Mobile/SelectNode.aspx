<%@ page language="C#" autoeventwireup="true" inherits="manage_Mobile_SelectNode, App_Web_o5nokbfc" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0a4.1/jquery.mobile-1.0a4.1.min.css" />
    <script src="http://code.jquery.com/jquery-1.5.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.0a4.1/jquery.mobile-1.0a4.1.min.js"></script>
</head>

<body>
    <form id="form1" runat="server">
    <div data-role="page" id="list">
        <div data-role="header" data-position="fixed">
            <h1>资讯中心</h1>
        </div>
        <!--/header-->
        <!--content-->
        <div data-role="content">
            
            <ul data-role="listview" data-inset="true">
                <li data-role="list-divider">请选择你要添加新闻的栏目</li>  
                 <asp:Literal runat="server" ID="lblHtml"></asp:Literal>    
            </ul>
            
        </div>
    </div>
        
    </form>
</body>
</html>

