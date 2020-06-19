<%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_ViewContent, App_Web_kty3igex" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>查看文章</title>
<link type="text/css" href="CSS/ZLOA.css" rel="stylesheet" />
<script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<%--<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script> --%>
<style>
#popImg{ display:none;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div id="site_main" style="margin:5px;">
    <table class="table" cellspacing="0" cellpadding="0">
                <tr><td colspan="8" class="trhead">公文起草</td></tr>
                <tr>
                    <td >密级</td><td>机密级</td>
                    <td>紧急程度</td><td>较紧急</td>
                    <td>重要程度</td><td>重要</td>
                    <td>引入数据</td><td>无引入数据</td>
                </tr>
                <tr>
                    <td>标题:</td><td colspan="3"><asp:Label ID="LBTitle" runat="server" /></td>
                    <td>流程:</td><td>暂未获取</td>
                    <td>模板</td><td>暂未获取</td>
                </tr>
                <tr><td>主题词:</td><td colspan="5">无</td>
                    <td>起草日期</td><td><asp:Label ID="LbCreatTime" runat="server" Text=""></asp:Label></td></tr>
                <tr><td>起草人</td><td colspan="3"><asp:Label ID="LbAuthor" runat="server" Text="Label"></asp:Label></td>
                    <td>起草部门</td><td colspan="3"><asp:Label ID="LbBranch" runat="server" Text="Label"></asp:Label></td></tr>
                <tr><td colspan="8" style="text-align:center;font-size:20px;font-family:'Microsoft YaHei';">文本内容</td></tr>
                <tr><td colspan="8" style="min-height:400px;"><asp:Literal ID="ContentHtml" runat="server"></asp:Literal></td></tr>
            </table>
</div>
</form>
</body>
</html>
