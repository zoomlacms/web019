<%@ page language="C#" autoeventwireup="true" inherits="manage_Mobile_Default, App_Web_rgid0rzo" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html> 
<html lang="zh-cn">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>后台管理</title>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.0a4.1/jquery.mobile-1.0a4.1.min.css" />
<script src="http://code.jquery.com/jquery-1.5.min.js"></script>
<script src="http://code.jquery.com/mobile/1.0a4.1/jquery.mobile-1.0a4.1.min.js"></script>
<style type="text/css">
td { width:150px;}
li{ display:block; float:left; margin:5px;width:80px; line-height:80px; background:#09C; color:#FFF; text-align:center;}
.green { background:#ad9999;}
.Purple {background: #90C;}
li:hover{display:block; background:#ccc; cursor:pointer;}
a:link{text-decoration:none ; color:white ;}
a:visited {text-decoration:none ; color:white;}
a:hover {text-decoration:none ; color:white;}
a:active {text-decoration:none ; color:white;} 
</style>
    <script type="text/javascript">
        function Signout()
        {
            window.location = '../SignOut.aspx';
        }
        function JumpToOrder() {
            window.location = '../Shop/OrderList.aspx'
        }
        function JumpToUser() {
            window.location = '../User/UserManage.aspx'
        }
        function JumpToCRM() {
            window.location = '../AddCRM/CustomerList.aspx?usertype=0'
        }
        function JumpToAnswer() {
            window.location = '../iServer/BiServer.aspx'
        }
    </script>
</head>
<body>
<form id="form1" runat="server">
    <!-- page -->
<div data-role="page" id="menu">
<!-- header -->
<div data-role="header"  data-position="fixed">
    <h1>后台主页</h1>
</div>
<!--Begin-->
     <div data-role="content" style="margin-right:40px;">
        <ul>
          <li class="green"  onclick="location.href='ContentList.aspx?nodeId=1'">内容管理</li>
          <li class="Purple" onclick="location.href='ContentList.aspx?nodeId=85'">图库管理</li>
          <li onclick="JumpToOrder()">订单管理</li><!--/manage/Shop/OrderList.aspx-->
          <li onclick="JumpToUser()">用户管理</li>
          <li onclick="JumpToCRM()">CRM管理</li>
          <li onclick="JumpToAnswer()">有问必答</li>
        </ul>
    </div>
<!--End-->
<div data-role="footer" data-position="fixed" style="text-align:center;">
    <a data-role="button" style="width:160px;margin-top:10px;" onclick="Signout()">安全退出</a>
    <h6>&copy Shanghai Zoomla!CMS Software technology Co., LTD all rights reserved</h6>
</div>
    <!-- /footer -->
</div>
<!--/page -->
</form>
</body>
</html>
