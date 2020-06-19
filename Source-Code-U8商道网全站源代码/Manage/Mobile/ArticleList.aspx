<%@ page language="C#" autoeventwireup="true" inherits="manage_Mobile_ContentList, App_Web_o5nokbfc" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="http://code.jquery.com/jquery-1.5.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.0a4.1/jquery.mobile-1.0a4.1.min.js"></script>
    <link rel="stylesheet" href="/App_Themes/AdminDefaultTheme/ikea.mobile.min.css?v=5.18"/> 
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0a4.1/jquery.mobile-1.0a4.1.min.css" />
      <style type="text/css">
        .liclass
        {
            
        }
    </style>
</head>

  
    <body>
<form id="form2" runat="server">
<div data-role="page" id="Div1">
<div data-role="header" data-position="fixed">
    <h1 id="topWord" runat="server"></h1>
</div>
<!--/header-->
<!--content-->
      
<div data-role="content" tabindex="-1" class="ikea-campaigns">
<ul id="campaign-list" data-role="listview" data-theme="d" data-inset="true">
 <li data-role="list-divider">浏览新闻</li>  
    <li>  
          <div style="background-color:#fff;">  
              
    <a href="javascript:location.href='AddContent.aspx?NodeID=<%=nodeID %>&modelid=2'" data-role='button' data-icon='plus' data-inline='true' >添加内容</a>
          </div> </li>
<asp:Literal runat="server" ID="lblHtml"></asp:Literal> 
</ul></div>
<!-- /page content-->
</div>

</form>
</body>

</html>
