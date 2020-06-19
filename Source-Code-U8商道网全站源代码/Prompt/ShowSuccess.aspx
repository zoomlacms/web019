<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Admin.Prompt.ShowSuccess, App_Web_5i4b30sh" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>成功提示信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--[if lt IE 9]>
	    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <%=link %>
    <style type="text/css">
        * {
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="panel panel-primary" style="width: 400px; margin: auto; margin-top: 40px;">
            <!-- Default panel contents -->
            <div class="panel-heading">
                <h3 class="panel-title"><span class="glyphicon glyphicon-ok pull-left"></span>成功信息</h3>
            </div>
            <div class="panel-body text-center">
                <p class="text-center">
                    <asp:Literal ID="LtrSuccessMessage" runat="server"></asp:Literal>
                    <br />
                    <asp:HyperLink ID="LnkReturnUrl" runat="server"><< 返回上一页</asp:HyperLink>
                </p>
            </div>
        </div>
        <style>
            li {
                list-style: none;
            }
        </style>
    </form>
</body>
</html>
