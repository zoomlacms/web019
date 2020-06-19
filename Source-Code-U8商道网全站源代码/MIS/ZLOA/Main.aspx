 <%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_Main, App_Web_kty3igex" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title></title>
<link href="CSS/ZLOA.css" rel="stylesheet" type="text/css" />
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../JS/jquery-ui.min.js"></script>
<style>
    .myTable {width:100%;text-align:center;}
    .myTable tr td {padding:5px;}
    .threeTr tr td {padding:12px;}
    .duty_tp a { float:right;color: black; position:relative; top:-13%;}
</style>
<script>
$(function () {
    $("#sortable").sortable();
    $("#sortable").disableSelection();
});
</script>
</head>
<body>
<form id="form1" runat="server">
<div style="height:1000px;">
    <ul id="sortable" style="width:100%;">
	    <li class="ui-state-default">
            <div class="OAborder">
                <div class="title">
                    <div class="duty_t" style="background:url('Images/document.png') no-repeat;">
                        <div class="duty_tp">
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align:left;">
                                        <strong>医院行政公文</strong> </td>
                                    <td style="text-align:right;">
                                        <a href="javascript:;" onclick="closeDiv(this);"><span class="fork"></span></a>
                                        <a href="javascript:;" onclick="coll(this);"><span class="oaarrow"></span></a>
                                        <a href="javascript:;" style="display: none;" onclick="coll2(this);"><span class="oaarrowDown"></span></a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="content templatelist">
                    <div class="inContent executive">
                          <table class="myTable threeTr">
                            <tr><td><a href="Drafting.aspx"><img src="Images/Main/official.png" /><div>公文拟稿</div></a></td>
                                <td><a href="AffairsList.aspx?view=1"><img src="Images/Main/wait.png" /><div>待办事务</div></a></td>
                                <td><a href="AffairsList.aspx?view=2"><img src="Images/Main/done.png" /><div>已办事务</div></a></td></tr>
                            <tr><td><a href="Office/Default.aspx"><img src="Images/Main/post.png" /><div>发文管理</div></a></td>
                                <td><a href="AffairsList.aspx?view=3"><img src="Images/Main/Receipt.png" /><div>收文管理</div></a></td>
                                <td><a href="AffairsList.aspx?view=4"><img src="Images/Main/Circulated.png" /><div>传阅管理</div></a></td></tr>
                            <tr><td colspan="3" style="text-align:right;"><a href="#">More...</a></td></tr>
                        </table>
                    </div>
                </div><div class="clearfix"></div>
            </div>
	    </li>
	    <li class="ui-state-default" >
            <div class="OAborder">
                <div class="title">
                    <div class="duty_t" style="background:url('Images/Branch.png') no-repeat;">
                        <div class="duty_tp">
                          <table style="width:100%;">
                                <tr>
                                    <td style="text-align:left;">
                                        <strong>部门行政办公</strong> </td>
                                    <td style="text-align:right;">
                                        <a href="javascript:;" onclick="closeDiv(this);"><span class="fork"></span></a>
                                        <a href="javascript:;" onclick="coll(this);"><span class="oaarrow"></span></a>
                                        <a href="javascript:;" style="display: none;" onclick="coll2(this);"><span class="oaarrowDown"></span></a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="content templatelist">
                    <div class="inContent office">
                            <table class="myTable threeTr">
                            <tr><td><a href="Drafting.aspx"><img src="Images/Main/draft.png" /></a></td>
                                <td><a href="AffairsList.aspx?view=1"><img src="Images/Main/Awaiting.png" /></a></td>
                                <td><a href="AffairsList.aspx?view=2"><img src="Images/Main/down.png" /></a></td></tr>
                            <tr><td><a href="Office/Default.aspx"><img src="Images/Main/ziyuan.png" /></a></td>
                                <td><a href="AffairsList.aspx?view=3"><img src="Images/Main/form.png" /></a></td>
                                <td><a href="AffairsList.aspx?view=4"><img src="Images/Main/schedule.png" /></a></td></tr>
                            <tr><td colspan="3" style="text-align:right;"><a href="#">More...</a></td></tr>
                        </table>
                    </div>
                </div>
            </div>      
	    </li>
	    <li class="ui-state-default">
            <div class="OAborder">
                <div class="title">
                    <div class="duty_t" style="background:url('Images/Notice.png') no-repeat;">
                        <div class="duty_tp">
                          <table style="width:100%;">
                                <tr>
                                    <td style="text-align:left;">
                                        <strong>医院部门公告</strong> </td>
                                    <td style="text-align:right;">
                                        <a href="javascript:;" onclick="closeDiv(this);"><span class="fork"></span></a>
                                        <a href="javascript:;" onclick="coll(this);"><span class="oaarrow"></span></a>
                                        <a href="javascript:;" style="display: none;" onclick="coll2(this);"><span class="oaarrowDown"></span></a></td></tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="content templatelist">
                    <div class="inContent notice">
                        <table class="myTable">
                            <tr><td><a href="#"><img src="Images/Main/Party.png" /></a></td>
                                <td><a href="#"><img src="Images/Main/hospital.png" /></a></td>
                                <td><a href="#"><img src="Images/Main/Discipline.png" /></a></td></tr>
                            <tr><td><a href="#"><img src="Images/Main/affairs.png" /></a></td>
                                <td><a href="#"><img src="Images/Main/Finance.png" /></a></td>
                                <td><a href="#"><img src="Images/Main/Medical.png" /></a></td></tr>
                            <tr><td><a href="#"><img src="Images/Main/Nurse.png" /></a></td>
                                <td><a href="#"><img src="Images/Main/Information.png" /></a></td>
                                <td><a href="#"><img src="Images/Main/Science.png" /></a></td></tr>
                            <tr><td colspan="3" style="text-align:right;"><a href="#">More...</a></td></tr>
                        </table>
                    </div>
                </div>
            </div>
        </li>
	    <li class="ui-state-default">
            <div class="OAborder">
                <div class="title">
                    <div class="duty_t" style="background:url('Images/Myemail.png') no-repeat;">
                        <div class="duty_tp">
                           <table style="width:100%;">
                                <tr>
                                    <td style="text-align:left;">
                                        <strong>我的邮箱管理</strong> </td>
                                    <td style="text-align:right;">
                                        <a href="javascript:;" onclick="closeDiv(this);"><span class="fork"></span></a>
                                        <a href="javascript:;" onclick="coll(this);"><span class="oaarrow"></span></a>
                                        <a href="javascript:;" style="display: none;" onclick="coll2(this);"><span class="oaarrowDown"></span></a></td></tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="content templatelist">
                    <div class="inContent email">
                        <table class="myTable threeTr">
                            <tr><td><a href="Mail/MessageSend.aspx"><img src="Images/Main/writemail.png" /><div>写邮件</div></a></td>
                                <td><a href="Mail/Message.aspx?view=1"><img src="Images/Main/recivemail.png" /><div>收邮件</div></a></td>
                                <td><a href="Mail/MessageOutbox.aspx?view=2"><img src="Images/Main/sendmail.png" /><div>发件箱</div></a></td></tr>
                            <tr><td><a href="Mail/MessageDraftbox.aspx"><img src="Images/Main/draftmail.png" /><div>草稿箱</div></a></td>
                                <td><a href="Mail/MessageGarbagebox.aspx?view=3"><img src="Images/Main/rubbishmali.png" /><div>垃圾箱</div></a></td>
                                <td><a href="javascript:;"><img src="Images/Main/contact.png" /><div>联系人</div></a></td></tr>
                            <tr><td colspan="3" style="text-align:right;"><a href="#">More...</a></td></tr>
                        </table>
                    </div>
                </div>
            </div>
	    </li>
	    <li class="ui-state-default">
            <div class="OAborder">
                <div class="title">
                    <div class="duty_t" style="background:url('Images/Newest.png') no-repeat;">
                        <div class="duty_tp">
                          <table style="width:100%;">
                                <tr>
                                    <td style="text-align:left;">
                                        <strong>医院最新通知</strong> </td>
                                    <td style="text-align:right;">
                                        <a href="javascript:;" onclick="closeDiv(this);"><span class="fork"></span></a>
                                        <a href="javascript:;" onclick="coll(this);"><span class="oaarrow"></span></a>
                                        <a href="javascript:;" style="display: none;" onclick="coll2(this);"><span class="oaarrowDown"></span></a></td></tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="content templatelist">
                    <div class="inContent">
                        <table class="table">
                          <asp:Repeater runat="server" ID="noticeR1">
                              <ItemTemplate>
                                  <tr><td><a href="ViewContent.aspx?gid=<%#Eval("GeneralID") %>"><%#Eval("Title") %></a> </td>
                                      <td><%#Eval("Inputer") %></td>
                                      <td style="text-align:right;"><%# DataBinder.Eval(Container.DataItem, "CreateTime", "{0:yyyy年M月d日 HH:mm}")%></td></tr>
                              </ItemTemplate>
                          </asp:Repeater>
                        </table>
                        <div class="more"><a href="#">More...</a></div>
                    </div>
                </div>
            </div>
	    </li>
	    <li class="ui-state-default">
            <div class="OAborder">
                <div class="title">
                    <div class="duty_t" style="background:url('Images/Bbs.png') no-repeat;">
                        <div class="duty_tp">
                           <table style="width:100%;">
                                <tr>
                                    <td style="text-align:left;">
                                        <strong>医院论坛交流</strong> </td>
                                    <td style="text-align:right;">
                                        <a href="javascript:;" onclick="closeDiv(this);"><span class="fork"></span></a>
                                        <a href="javascript:;" onclick="coll(this);"><span class="oaarrow"></span></a>
                                        <a href="javascript:;" style="display: none;" onclick="coll2(this);"><span class="oaarrowDown"></span></a></td></tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="content templatelist">
                    <div class="inContent">
                       <table class="table">
                          <asp:Repeater runat="server" ID="noticeR2">
                              <ItemTemplate>
                                  <tr><td><a href="ViewContent.aspx?gid=<%#Eval("GeneralID") %>"><%#Eval("Title") %></a> </td>
                                      <td><%#Eval("Inputer") %></td>
                                      <td style="text-align:right;"><%# DataBinder.Eval(Container.DataItem, "CreateTime", "{0:yyyy年M月d日 HH:mm}")%></td></tr>
                              </ItemTemplate>
                          </asp:Repeater>
                        </table>
                        <div class="more"><a href="#">More...</a></div>
                    </div>
                </div>
            </div>
	    </li>
    </ul>
</div>
<script type="text/javascript">
function coll(obj) {
    $p = $(obj).closest('li');
    $p.find(".content").hide("fast");
    $(obj).hide().siblings().show();
}
function coll2(obj) {
    $p = $(obj).closest('li');
    $p.find(".content").show("fast");
    $(obj).hide().siblings().show();
}
function closeDiv(obj) {
    $p = $(obj).closest('li');
    $p.hide("fast");
}
</script>
</form>
</body>
</html>
