﻿<%@ page language="C#" autoeventwireup="true" inherits="User_Message_MessageOutbox, App_Web_m435ajnl" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>发件箱</title>
    <link type="text/css" href="/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link type="text/javascript" href="../CSS/ZLOA.css" rel="stylesheet" />
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
        <script type="text/javascript">
            $().ready(function () {
                $("#EGV tr:last >td>:text").css("line-height", "normal");
                $("#EGV tr:first >th").css("text-align", "center");
                $("#<%=EGV.ClientID%>  tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
                $("#chkAll").click(function () { selectAllByName(this, "idChk"); });
            });
    </script>
      <style type="text/css">
     .nav li{float:left;width:80px;text-align:center;}
    </style>
</head>
<body>
 <form id="form1" runat="server">
<div class="mainDiv">
<ul class="nav nav-pills">
<li><a href="MessageSend.aspx">写邮件</a></li>
<li><a href="Message.aspx">收件箱</a></li>
<li class="active"><a href="MessageOutbox.aspx">发件箱</a></li>
<li><a href="MessageDraftbox.aspx">草稿箱</a></li>
<li><a href="MessageGarbagebox.aspx">垃圾箱</a></li>
<li><a href="Mobile.aspx">手机短信</a></li>
</ul>  
<div style="clear:both;"></div>
<div class="us_seta" style="margin-top: 5px;">
    <div id="site_main" style="margin:5px 5px 0 0;">
                <table><tr style="height:30px;"><td><asp:TextBox runat="server" ID="searchText" placeholder="请输入需要查询的信息" CssClass="form-control" style="width:300px;height:25px;"/></td>
                <td><asp:Button runat="server" CssClass="btn btn-primary" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click"/></td></tr></table>
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" GridLines="None" CellPadding="2" CellSpacing="1" Width="98%" CssClass="table border" EmptyDataText="当前没有信息!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="选择" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="center">
                    <ItemTemplate>
                        <input type="checkbox" name="idChk" value='<%#Eval("MsgID") %>'/>
                    </ItemTemplate>
                    <HeaderStyle Width="5%"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="主题">
                    <HeaderStyle Width="40%" />
                    <ItemTemplate>
                        <%# Eval("Title", "{0}")%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="left" />
                </asp:TemplateField>
                <asp:BoundField DataField="Incept" HeaderText="收件人" HeaderStyle-Width="10%"
                    ItemStyle-HorizontalAlign="center">
                    <HeaderStyle Width="10%"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="PostDate" HeaderText="发送日期" HeaderStyle-Width="20%"
                    ItemStyle-HorizontalAlign="center">
                    <HeaderStyle Width="20%"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="操作" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="center">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDel" runat="server" CommandName="DeleteMsg" OnClientClick="if(!this.disabled) return confirm('确实要删除此信息到垃圾箱吗？');"
                            CommandArgument='<%# Eval("MsgID")%>' Text="删除"></asp:LinkButton>
                        <asp:LinkButton ID="lbRead" runat="server" CommandName="ReadMsg" CommandArgument='<%# Eval("MsgID")%>'>阅读信息</asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle Width="20%"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>
    </div>
<%--    <asp:Button ID="mobiletext" runat="server" Font-Size="9pt" Text="手机短信" OnClick="mobiletext_Click" class="btn btn-primary" />--%>
    <asp:Button ID="Button2" runat="server" Font-Size="9pt" Text="批量删除" OnClick="Button2_Click" class="btn btn-primary" />
    </div>
     </div>
</form>
</body>
</html>