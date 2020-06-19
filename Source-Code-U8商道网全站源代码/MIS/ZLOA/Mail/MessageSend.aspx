<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.User.MessageSend, App_Web_m435ajnl" enableviewstatemac="false" validaterequest="false" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>发送短消息</title>
<link type="text/css" href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<link type="text/javascript" href="../CSS/ZLOA.css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="/JS/MisView.js"></script>
<script>
    var flag = "";
    var uid = "";
    var cuid = "";
    function showdiv(div_id,f)
    {
        $("#main_right").attr("src", "SelUser.aspx?SUID=" + uid);
        flag = f;
        var div_obj = $("#" + div_id);
        var h = (document.documentElement.offsetHeight - 800) / 2;
        var w = (document.documentElement.offsetWidth - 400) / 2;
        div_obj.animate({ opacity: "show", left: w, top: h, width: div_obj.width, height: div_obj.height }, 300);
        div_obj.focus();
    }
    function showdiv1(div_id)
    {
        $("#main_right").attr("src", "SelUser.aspx?Type=1&UID=" + uid + "&CUID=" + cuid);
        var div_obj = $("#" + div_id);
        var h = (document.documentElement.offsetHeight - 800) / 2;
        var w = (document.documentElement.offsetWidth - 400) / 2;
        div_obj.animate({ opacity: "show", left: w, top: h, width: div_obj.width, height: div_obj.height }, 300);
        div_obj.focus();
    }
    //组名外加[],用户名则不加，用,隔开
    function seluser(groupJson, userJson)
    {
        var n = "";
        uid = "";
        //for (var i = 0; i < groupJson.length; i++)
        //{
        //    n += "[" + groupJson[i].Gname + "],";
        //}
        for (var i = 0; i < userJson.length; i++) {
            n += userJson[i].Uname + ",";
            uid += userJson[i].Uid + ",";
        }
        n = n.substring(0, n.length - 1);
        uid = uid.substring(0, uid.length - 1);
        $("#TxtInceptUser").val(n);
        $("#HiddenUser").val(uid);
    }
    function seluser1(groupJson, userJson) {
        var n = "";
        cuid = "";
        //for (var i = 0; i < groupJson.length; i++)
        //{
        //    n += "[" + groupJson[i].Gname + "],";
        //}
        for (var i = 0; i < userJson.length; i++) {
            n += userJson[i].Uname + ",";
            cuid += userJson[i].Uid+",";
        }
        cuid = cuid.substring(0, cuid.length - 1);
        n = n.substring(0, n.length - 1);
        $("#TextBox1").val(n);
        $("#HiddenCCUser").val(cuid);
    }
    function hidediv()
    {
        $("#div_share").hide("fast");
    }
</script>
<style type="text/css">
    .tdLeft {text-align:right;width:120px;}
    .tdRight {text-align:left;}
    .selUserBtn{ margin-left:10px;}
    .table-border{ border:1px solid #ddd;}
    .mainDiv{ margin-left:10px;}
    .glyphicon-remove:hover{ cursor:pointer;}
    .nav li{float:left;width:80px;text-align:center;}
</style>
</head>
<body>
<form id="form1" runat="server">  
<div class="mainDiv">
    <div class="us_topinfo">
    <ul class="nav nav-pills">
    <li class="active"><a href="MessageSend.aspx">写邮件</a></li>
    <li><a href="Message.aspx">收件箱</a></li>
    <li><a href="MessageOutbox.aspx">发件箱</a></li>
    <li><a href="MessageDraftbox.aspx">草稿箱</a></li>
    <li><a href="MessageGarbagebox.aspx">垃圾箱</a></li>
    <li><a href="Mobile.aspx">手机短信</a></li>
    </ul>  
        <div style="clear:both;"></div>
    </div>
    <div style="margin-top:10px;">
	    <div class="us_seta" style="margin-top:5px;">
		    <table class="table table-border" style="line-height:25px;width:95%;">
		    <tr><td class="tdLeft">收件人：</td><td class="tdRight"><asp:TextBox CssClass="form-control pull-left" ID="TxtInceptUser" runat="server" Width="333px" />
                <asp:HiddenField ID="HiddenUser" runat="server"  />
                <button type="button" onclick="showdiv('div_share')" class="btn btn-info pull-left selUserBtn">选择</button></td></tr>
            <tr><td class="tdLeft">抄送人：</td><td class="tdRight"><asp:TextBox CssClass="form-control pull-left" ID="TextBox1" runat="server" Width="333px" />
                <asp:HiddenField ID="HiddenCCUser" runat="server" />
                <button type="button" onclick="showdiv1('div_share')" class="btn btn-info pull-left selUserBtn">选择</button></td></tr>
		    <tr><td class="tdLeft">邮件标题：</td><td class="tdRight">
                <asp:TextBox ID="TxtTitle" CssClass="form-control" runat="server" Width="333px"/>
                <asp:RequiredFieldValidator ID="ValrTitle" runat="server" ControlToValidate="TxtTitle" ErrorMessage="短消息主题不能为空" Display="Dynamic">*</asp:RequiredFieldValidator></td></tr>
		    <tr><td colspan="2">
                <asp:TextBox  ID="EditorContent" runat="server" Rows="10" TextMode="MultiLine"      Width="100%" class="l_input" Height="300px" ClientIDMode="Static">
                </asp:TextBox><asp:RequiredFieldValidator ID="ValrContent" runat="server" ControlToValidate="EditorContent"   ErrorMessage="短消息内容不能为空" Display="Dynamic">*</asp:RequiredFieldValidator></td></tr>
			    <tr><td colspan="2" align="center"><asp:HiddenField ID="HdnMessageID" runat="server" />&nbsp;
			    <asp:Button ID="BtnSend" runat="server" Text="发送" OnClick="BtnSend_Click"  class="btn btn-primary"/>&nbsp;
				    <asp:Button ID="Button1" runat="server" Text="存草稿" onclick="Button1_Click" class="btn btn-primary"/>&nbsp; 
			    <asp:Button ID="BtnReset" runat="server" Text="清除" OnClick="BtnReset_Click"  class="btn btn-primary"/></td></tr>
		    <tr><td colspan="2" align="center"> <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" /></td></tr></table>
	    <div align="center"></div>
	    </div>
        <div id="div_share" class="panel panel-primary" style="display:none; position:absolute;z-index:1000;">
            <div class="panel-heading"><span class="glyphicon glyphicon-remove pull-right" onclick="hidediv()" title="关闭"></span><h3 class="panel-title">选择会员</h3></div>
            <div class="panel-body">
                <iframe id="main_right" style="z-index: 1000; visibility: inherit; overflow: auto; overflow-x: hidden;width: 100%;height:auto;"  name="main_right" src="SelUser.aspx" frameborder="0"></iframe>
            </div>
        </div>
    </div>
</div>
    <script type="text/javascript">
        var ue = UE.getEditor('EditorContent');
    </script>
</form>
</body>
</html>