<%@ page language="C#" autoeventwireup="true" inherits="manage_UserShopManage_StroeUpdate, App_Web_hyctq3jx" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <title>商家店铺修改</title>

    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
    <script src="../../Common/Common.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="r_navigation">
		<span>后台管理</span> &gt;&gt; <span>店铺管理</span> &gt;&gt;<a href="StoreManage.aspx">商家店铺管理</a>&gt;&gt;修改店铺信息
	</div>
    <div style="width:100%">
    <table style="width:100%;">
        <tr class="tdbg">
            <td colspan="2" style="text-align:center">
                <strong>修改店铺信息</strong>
            </td>
        </tr>
        <tr class="tdbg" style="height:24px;">
            <td class="tdbgleft" style="text-align:right; width:15%;">店铺名称</td>
            <td>
                <asp:TextBox ID="UserShopName_T" runat="server"></asp:TextBox>
            </td>
        </tr>
        <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
    </table>
    
    </div>
    <div style="margin-left:400px">
        <asp:Button ID="Esubmit" runat="server" Text="保存信息" onclick="Esubmit_Click" />
        <asp:HiddenField ID="HiddenField1" runat="server" />
    </div>
    </form>
</body>
</html>
