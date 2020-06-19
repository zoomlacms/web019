<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" validaterequest="false" inherits="manage_Panoramic_AddPanoramic, App_Web_ryhfzik4" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加全景</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" align="center">
                <asp:Label ID="Title_L" runat="server" Text="添加全景"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 300px">全景名称: </td>
            <td>
                <asp:TextBox ID="PanoramicName" runat="server" CssClass="form-control" Width="254px"></asp:TextBox>
                <span style="color: red">(必填)</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PanoramicName" ErrorMessage="请输入全景名称"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">背景音乐: </td>
            <td>
                <asp:ListBox ID="PanoramicViewList_music" runat="server" CssClass="form-control" Height="172px" Width="256px" SelectionMode="Multiple"></asp:ListBox>
                <asp:Button ID="Button4" runat="server" Text="选择音乐" CssClass="btn btn-primary" CausesValidation="false" OnClientClick="Open_Select();return false;" />
                <asp:Button ID="Button9" runat="server" Text="删除" CssClass="btn btn-primary" OnClientClick="removeOne();return false;" /></td>
        </tr>
        <tr>
            <td align="right">场景列表: </td>
            <td>
                <asp:ListBox ID="PanoramicViewList_View" runat="server" CssClass="form-control" Height="172px" Width="256px" SelectionMode="Multiple"></asp:ListBox>
                <asp:Button ID="Button3" runat="server" Text="添加场景" CssClass="btn btn-primary" CausesValidation="false" OnClientClick="Create_View();return false;" />
                <asp:Button ID="Button10" runat="server" Text="删除" CssClass="btn btn-primary" OnClientClick="removepOne();return false;" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PanoramicViewList_View" ErrorMessage="场景不能为空！"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">是否自动播放音乐: </td>
            <td>
                <asp:CheckBox ID="AutoPlayMusic" runat="server" Text="自动播放" /></td>
        </tr>
        <tr id="showlable" name="showlable">
            <td align="right">调用标签: </td>
            <td>
                <asp:TextBox ID="calllabel" runat="server" CssClass="form-control" Width="251px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="Button1" runat="server" Text="添加" CssClass="btn btn-primary" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="取消" CssClass="btn btn-primary" CausesValidation="false" OnClientClick="location.href='PanoramicManage.aspx';return false" />
            </td>
        </tr>
    </table>
    <asp:HiddenField runat="server" ID="pid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Drag.js"></script>
    <script type="text/javascript" src="/js/Dialog.js"></script>
    <script type="text/javascript">
        function hiddenlabel() {
            window.onload = function () {
                document.getElementById("showlable").style.display = "none";
            }
        }
        function openurls(url) {
            Dialog.open({ URL: url });
        }
        function Open_Select() {
            if (document.getElementById("PanoramicName").value == "") {
                alert("请输入全景名称！");
            }
            else {
                var diag = new Dialog();
                diag.Width = 600;
                diag.Height = 400;
                diag.Title = "选择音乐<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
                diag.URL = "SelectMusic.aspx";
                diag.show();
            }
        }
        function Create_View() {
            if (document.getElementById("PanoramicName").value == "") {
                alert("请输入全景名称！");
            }
            else {
                var diag = new Dialog();
                diag.Width = 740;
                diag.Height = 540;
                diag.Title = "创建场景<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
                diag.URL = "CreateView.aspx";
                diag.show();
            }
        }
        function opentitle(url, title) {
            var diag = new Dialog();
            diag.Width = 800;
            diag.Height = 600;
            diag.Title = title;
            diag.URL = url;
            diag.show();
        }
        function closdlg() {
            Dialog.close();
        }
        function removeOne() {
            var obj = document.getElementById('PanoramicViewList_music');
            for (var i = obj.options.length - 1; i >= 0; i--) {
                if (obj.options[i].selected) {
                    var index = i;
                    obj.options.remove(i);
                }
            }
        }
        function removepOne() {
            var obj = document.getElementById('PanoramicViewList_View');
            for (var i = obj.options.length - 1; i >= 0; i--) {
                if (obj.options[i].selected) {
                    var index = i;
                    obj.options.remove(i);
                }
            }
        }
    </script>
</asp:Content>
