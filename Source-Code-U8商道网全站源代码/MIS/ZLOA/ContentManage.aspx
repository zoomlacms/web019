<%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_ContentManage, App_Web_kty3igex" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>内容管理</title>
<script src="../../JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<style>
#EGV tr th {text-align:center;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div id="site_main" style="margin:5px;">
    <div class="input-group" style=" width:400px;float:left;margin-bottom:10px;">
        <asp:TextBox runat="server" ID="searchText" placeholder="请输入需要查询的信息" CssClass="form-control"/>
        <span class="input-group-btn">
            <asp:Button runat="server" CssClass="btn btn-primary" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click"/>
        </span>
    </div>
    <div class="tab3">
        <ZL:ExGridView runat="server" ID="EGV" DataKeyNames="GeneralID" AutoGenerateColumns="false" AllowPaging="true" PageSize="20"  EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="100%" CssClass="table table-bordered" EmptyDataText="没有任何数据!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound" >
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="GeneralID" />
                <asp:TemplateField HeaderText="标题">
                    <ItemTemplate>
                        <a href="ViewContent.aspx?ID=<%#Eval("GeneralID") %>" title="<%#Eval("Title") %>"><%#Eval("Title") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="录入者" DataField="Inputer" />
                <asp:TemplateField HeaderText="状态" >
                    <ItemTemplate>
                        <%# GetStatus( Eval("Status","{0}")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="创建时间" DataField="CreateTime" />
                <asp:BoundField HeaderText="更新时间" DataField="UpDateTime" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" CommandName="read" CommandArgument='<%#Eval("GeneralID") %>' runat="server">阅读</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center"/>
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>
    </div>
</div>
</form>
</body>
</html>
