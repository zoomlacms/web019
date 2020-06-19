<%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_AffairsList, App_Web_kty3igex" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>发文列表</title>
<script type="text/javascript" src="../../JS/jquery-1.9.1.min.js"></script>
<style>
tr th{ text-align:center;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div style="padding-left:10px; padding-right:10px;">
    <ul class="breadcrumb">
        <li><a href="#" onclick="javascript:parent.location.href = '/MIS/ZLOA/';">OA办公首页</a><span class="divider"></span></li>
        <li>发文列表</li>
    </ul>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" RowStyle-CssClass="tdbg" EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="100%" CssClass="table table-bordered" EmptyDataText="当前没有信息!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:TemplateField HeaderText="发文类型">
                <ItemTemplate>
                    <%#GetType(Eval("Type", "{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="拟稿部门" DataField="Branch" />
            <asp:BoundField HeaderText="标题" DataField="Title" />
            <asp:TemplateField HeaderText="密级">
                <ItemTemplate>
                    <%#GetSecret( Eval("Secret","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="紧急程度">
                <ItemTemplate>
                    <%# GetUrgency(Eval("Urgency","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="重要程度">
                <ItemTemplate>
                    <%# GetImport(Eval("Importance","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate>
                    <%# GetStatus(Eval("Status","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="创建时间" DataField="CreateTime" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="Office/ReadOffice.aspx?AppID=<%#Eval("ID") %>">详情</a>
<%--                    <asp:LinkButton ID="LinkButton1" CommandArgument='<%#Eval("ID") %>' CommandName="del1" runat="server" ToolTip="删除">删除</asp:LinkButton>--%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center"/>
        <RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>
</div>
</form>
</body>
</html>
