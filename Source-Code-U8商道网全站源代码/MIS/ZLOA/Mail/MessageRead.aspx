<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.User.MessageRead, App_Web_m435ajnl" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>阅读短消息</title>
<link type="text/css" href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<link type="text/javascript" href="../CSS/ZLOA.css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<style>
.tdLeft {text-align:right;width:120px; border-right:1px solid #ddd;}
.tdRight {text-align:left;}
.selUserBtn{ margin-left:10px;}
.table-border{ border:1px solid #ddd;}
.nav li{float:left;width:80px;text-align:center;}
</style>
</head>
<body>
<form runat="server">
<div class="us_topinfo">
<ul class="nav nav-pills">
<li><a href="MessageSend.aspx">写邮件</a></li>
<li class="active"><a href="Message.aspx">收件箱</a></li>
<li><a href="MessageOutbox.aspx">发件箱</a></li>
<li><a href="MessageDraftbox.aspx">草稿箱</a></li>
<li><a href="MessageGarbagebox.aspx">垃圾箱</a></li>
<li><a href="mobile.aspx">手机短信</a></li>
</ul>          <div style="clear:both;"></div>
</div>
<div style="margin-top:10px;">
	<div class="us_seta" style="margin-top:5px;">
        <table class="table table-border" style="width: 95%; line-height: 25px;">
            <tr>
                <td class="tdLeft">发件人：</td>
                <td class="tdRight"><asp:Label ID="LblSender" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td class="tdLeft">收件人：</td>
                <td class="tdRight"><asp:Label ID="LblIncept" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td class="tdLeft">短消息主题：</td>
                <td class="tdRight"><asp:Label ID="LblTitle" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td class="tdLeft">发送时间：</td>
                <td class="tdRight"><asp:Label ID="LblSendTime" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td class="tdLeft">短消息内容：</td>
                <td class="tdRight">
                    <asp:TextBox runat="server" Height="300px" Width="100%" TextMode="MultiLine" ID="txt_Content" ReadOnly="true"></asp:TextBox>
                    <script type="text/javascript">
                        var ue = UE.getEditor('txt_Content');
                    </script>
                </td>
            </tr>
            <tr>
                <td class="tdLeft">操作：</td>
                <td class="tdRight">
        <asp:Button ID="BtnReply" runat="server" Text="回复" CssClass="btn btn-primary" OnClick="BtnReply_Click" Visible="false" />
                    <asp:Label ID="LBCopy" runat="server" Text="抄送文件无法操作" Visible="false"></asp:Label>
                </td>
            </tr>
        </table> 
    </div>
</div>
</form>
</body>
</html>