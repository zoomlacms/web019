<%@ page language="C#" autoeventwireup="true" validaterequest="false" enableeventvalidation="false" inherits="manage_Page_AuditUser, App_Web_xlbt2aeo" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" viewStateEncryptionMode="Never" %>


<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>查看企业黄页</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tbody id="Tbody1">
            <tr class="tdbg">
                <td align="center" colspan="2" class="title" style="width:10%">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr class="tdbg">
                        <td align="right" class="tdbgleft" style="height: 24px; width: 30%">
                            用 户 名
                        </td>
                        <td align="left" class="tdbgright" style="height: 24px; width: 70%">
                            <%#Eval("Username") %>
                            <input type="hidden" name="hdusername" value="<%#Eval("Username") %>" />
                        </td>
                    </tr>
                    <tr id="Tr2" class="tdbg" runat="server">
                        <td align="right" class="tdbgleft" style="height: 24px; width: 30%">
                            企业名称：
                        </td>
                        <td align="left" class="tdbgright" style="height: 24px; width: 70%">
                            <input name="CompanyName" id="CompanyName" type="text" value="<%#Eval("CompanyName") %>"  class="form-control"/>
                        </td>
                    </tr>
                    <tr id="Tr4" class="tdbg" runat="server">
                        <td align="right" class="tdbgleft" style="height: 24px; width: 30%">
                            企业LOGO：
                        </td>
                        <td align="left" class="tdbgright" style="height: 24px; width: 70%">
                            <input name="logo" id="logo" type="text" value="<%#Eval("logo") %>" class="form-control" />
                        </td>
                    </tr>
                    <tr id="Tr5" class="tdbg" runat="server">
                        <td align="right" class="tdbgleft" style="height: 24px; width: 30%">
                            企业说明：
                        </td>
                        <td align="left" class="tdbgright" style="height: 24px; width: 70%">
                            <textarea id="pageinfo" name="pageinfo" cols="80" rows="8" class="form-control"><%#Eval("pageinfo") %></textarea>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr><td colspan="2"><asp:Literal ID="ModelHtml" runat="server"></asp:Literal></td></tr>
            <asp:Label ID="RegFileds" runat="server" Text=""></asp:Label><tr class="tdbg">
                <td align="center" colspan="2" class="tdbgright" style="height: 24px; width: 100%">
                    <asp:HiddenField ID="HdnID" runat="server" />
                    <asp:HiddenField ID="HdnModel" runat="server" />
                    <asp:Button ID="Button5" CssClass="btn btn-primary" runat="server" Text="修改" OnClick="Button5_Click" />
                    <asp:Button ID="Button4" CssClass="btn btn-primary" runat="server" OnClick="Button4_Click" Text="返回" />
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>