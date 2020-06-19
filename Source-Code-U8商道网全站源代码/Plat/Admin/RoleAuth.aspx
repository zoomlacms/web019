<%@ page language="C#" autoeventwireup="true" inherits="Plat_Admin_RoleAuth, App_Web_n43wvi0k" masterpagefile="~/Plat/Empty.master" enableviewstate="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
    <title>角色权限</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered">
        <tr><td style="width:120px;">角 色 名：</td><td><asp:Label runat="server" ID="RoleName_L" /></td></tr>
        <tr><td>角色描述：</td><td><asp:Label runat="server" ID="RoleDesc_L" /></td></tr>
        <tr><td colspan="2" style="text-align:center;"><strong>权限配置</strong></td></tr>
        <tr>
            <td>用户管理：</td>
            <td>
                <input type="checkbox" name="UserAuth" value="AddUser" />添加用户
                <input type="checkbox" name="UserAuth" value="DelUser" />删除用户
                <input type="checkbox" name="UserAuth" value="ChangeUser" />更改用户信息
            </td>
        </tr>
        <tr><td>操作：</td><td>
                <asp:Button runat="server" ID="Save_Btn" Text="保存" CssClass="btn btn-primary" OnClick="Save_Btn_Click" />
            </td></tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function InitValue(v) {
            $("input[type='checkbox']").each(function () {
                var cv = $(this).val();
                this.checked = v.indexOf("," + cv + ",") >= 0;
            });
        }
    </script>
</asp:Content>