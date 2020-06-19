<%@ page language="C#" autoeventwireup="true" inherits="User_UserShop_CommentsManage, App_Web_aoc1neuf" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<%@ Register Src="WebUserControlTop2.ascx" TagName="WebUserControlTop2" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>店铺评论管理</title>
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div style="width:100%">
    <uc1:WebUserControlTop2 ID="WebUserControlTop2_1" runat="server" />
    <uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" />
    <div class="us_topinfo" style="margin-top:10px; width:98%">
        <a href="OrderList.aspx">店铺评论管理</a>
        <span style="padding-left:20px; padding-right:10px;">按互动表名管理评论</span>
        <asp:DropDownList ID="CommentTP" runat="server"  OnSelectedIndexChanged="CommentTP_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
    </div>
    <div id="ShowDiv1" runat="server" style="margin-top:10px; width:100%">
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" RowStyle-CssClass="tdbg" EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="100%" CssClass="border" EmptyDataText="当前没有评论信息!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ID" />
                <asp:BoundField HeaderText="标题" DataField="PubTitle" />
                <asp:BoundField HeaderText="IP地址" DataField="PubIP" />
                <asp:BoundField HeaderText="发表日期" DataField="PubAddTime" />
                <asp:TemplateField HeaderText="状态">
                    <ItemTemplate>
                        <%# GetStatus(Eval("Pubstart","{0}")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton4" CommandName="view" CommandArgument='<%#Eval("ID") %>' runat="server" >查看详情</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" CommandName="pass" CommandArgument='<%#Eval("ID") %>' runat="server" >通过审核</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" CommandName="Npass" CommandArgument='<%#Eval("ID") %>' runat="server" >取消审核</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton3" CommandName="del2" CommandArgument='<%#Eval("ID") %>' runat="server" >删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center"/>
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>
    </div>
    <div id="ShowDiv" runat="server" visible="false" style="margin-top:10px;" >
        <table class="border" GridLines="None" CellPadding="2" CellSpacing="1"  Width="100%" style="margin-bottom:10px;">
            <tr class="tdbg">
                <td style="width:20%; text-align:right; padding-right:10px;">ID</td>
                <td style="padding-left:10px;">
                    <asp:Label ID="CID" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr class="tdbg">
                <td style="width:20%; text-align:right;padding-right:10px;">用户名</td>
                <td style="padding-left:10px;">
                    <asp:Label ID="UserName" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr class="tdbg">
                <td style="width:20%; text-align:right;padding-right:10px;">标题</td>
                <td style="padding-left:10px;">
                    <asp:Label ID="Ctitle" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr class="tdbg">
                <td style="width:20%; text-align:right;padding-right:10px;">内容</td>
                <td style="padding-left:10px;">
                    <asp:Label ID="Content" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr class="tdbg">
                <td style="width:20%; text-align:right;padding-right:10px;">IP地址</td>
                <td style="padding-left:10px;">
                    <asp:Label ID="CIP" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr class="tdbg">
                <td style="width:20%; text-align:right;padding-right:10px;">添加时间</td>
                <td style="padding-left:10px;">
                    <asp:Label ID="AddTime" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
        <asp:Button ID="BackTo" CssClass="C_input" OnClick="BackTo_Click" runat="server" Text="返回" />
    </div>
</div>
</form>
</body>
</html>
