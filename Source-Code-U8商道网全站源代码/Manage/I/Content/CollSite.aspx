<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_CollSite, App_Web_51yxiush" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>子站采集</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" IsHoldState="false"
        class="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!"
        OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
        <Columns>
            <asp:TemplateField>                            
                <ItemTemplate>
                    <input type="checkbox" name="chkSel" title="" value='<%#Eval("ID") %>' />
                </ItemTemplate>
                <ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="ID">
                <ItemTemplate>
                    <a href="AddSites.aspx?ID=<%#Eval("ID")%>&guang=all"><%#Eval("ID") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="站点名">
                <ItemTemplate>
                    <a href="AddSites.aspx?ID=<%#Eval("ID")%>&guang=all"><%#Eval("SiteName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Http地址">
                <ItemTemplate>
                    <a href="AddSites.aspx?ID=<%#Eval("ID")%>&guang=all"><%#Eval("SiteUrl") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="密钥">
                <ItemTemplate>
                    <a href="AddSites.aspx?ID=<%#Eval("ID")%>&guang=all"><%#Eval("SiteKey") %></a>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField  HeaderText="更新时间">
                <ItemTemplate>
                    <a href="AddSites.aspx?ID=<%#Eval("ID")%>&guang=all"><%#Eval("LastTime") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除"><img src="/App_Themes/AdminDefaultTheme/images/del.png" /></asp:LinkButton>
                    <a href="AddSites.aspx?ID=<%#Eval("ID") %>"><span class="glyphicon glyphicon-pencil"  style="color:#7D98A1;"></span></a>

                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle Height="24px" HorizontalAlign="Center" />
    </ZL:ExGridView>
    <asp:Button runat="server" Text="批量删除" OnClientClick="return confirm('你确定要删除选中项吗!');" ToolTip="批量删除" CssClass="btn btn-primary" OnClick="Unnamed_Click"/>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            $("#EGV tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "chkSel");
            });
        });
    </script>
</asp:Content>
