<%@ page language="C#" autoeventwireup="true" inherits="manage_Mobile_ContentList, App_Web_rgid0rzo" title="" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.0a4.1/jquery.mobile-1.0a4.1.min.css" />
    <script src="http://code.jquery.com/jquery-1.5.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.0a4.1/jquery.mobile-1.0a4.1.min.js"></script>
    <link rel="stylesheet" href="/App_Themes/AdminDefaultTheme/ikea.mobile.min.css?v=5.18"/>

<style type="text/css">
        body
        {
            font-family:'宋体';
            font-size:18px;       
        }
        #main
        {
        }

        #toolbar
        {
            text-shadow:none;
            background-color:#C8C8C8;
            width:100%;
            color:black;
            font-family:'楷体';
        }
            #toolbar a
            {
            font-family:'楷体';
            font-weight:normal;
            text-shadow:none;
            color:black;
            }
        #topTitle
        {
            font-family:'楷体';
            margin-top:10px;
            text-align:center;
            width:100%;
            font-size:25px;
            font-weight:bold;
            text-shadow:none;
        }

        #AuandDate
        {
           font-family:'楷体';
           text-align:center;
           position:relative;
           margin-top:5px;
           font-size:15px;
           color:grey;
           text-shadow:none;
        }

        #content
        {
            font-family:'宋体';
            font-size:12px;
            margin-top:10px;
            padding:10px;
            line-height:25px;
            text-shadow:none;   
        }

     

    </style>
</head>
    
<body>
    <form id="form1" runat="server" >
    <div data-role="page" id="list" style="width:100%;height:100%">
        <div  id="main" style="background-image:none;background:#fff;background-color:#fff;width:100%;height:100%">
        <div data-role="header" data-position="fixed">
            <h1 id="topWord" runat="server"></h1>
        </div>
            <div id="toolbar">
                <a href="javascript:location.href='/manage/Mobile/ContentList.aspx'">返回首页</a>&lt;&lt;
                <a href="javascript:window.history.go(-1);">返回上一页</a></div>
            <div id="topTitle" runat="server"><br/>
            </div>
            <div id="AuandDate" runat="server"></div>
        <!--/header-->

<!--Content Beg-->

<div id="content">
<asp:Literal runat="server" ID="lblHtml" ></asp:Literal> 
</div>    
    
            
<!--Content End -->
 <div data-role="content" tabindex="-1" class="ikea-campaigns" style="display:none">
 <ul id="campaign-list" data-role="listview" data-theme="d" data-inset="true" >
 <li data-role="list-divider" id="articleTitle" runat="server"></li>  
</ul></div>

        </div>
        </div>
     
    </form>
</body>
</html>
