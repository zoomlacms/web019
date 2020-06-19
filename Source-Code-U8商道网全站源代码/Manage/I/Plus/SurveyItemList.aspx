<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Plus.SurveyItemList, App_Web_sjd2j2jy" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>问卷投票问题列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="r_navigation">
        <asp:HiddenField ID="HdnSID" runat="server" />
    </div>
    <div class="clear"></div>
    <ZL:ExGridView ID="EGV" RowStyle-HorizontalAlign="Center" DataKeyNames="QID" CellPadding="2" CellSpacing="1" BackColor="White" CssClass="table table-striped table-bordered table-hover" GridLines="None" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" Width="100%" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" OnRowDataBound="Gdv_RowDataBound">
        <EmptyDataTemplate>无相关数据</EmptyDataTemplate>
        <EmptyDataRowStyle BackColor="#e8f4ff" Height="45px" BorderColor="#4197e2" />
        <Columns>
            <asp:BoundField DataField="QID" HeaderText="序号">
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle Width="5%" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="问题标题" HeaderStyle-Width="40%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a href="SurveyItem.aspx?SID=<%=Request["SID"] %>&QID=<%# Eval("QID") %>"><%# Eval("QTitle") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="类别">
                <ItemTemplate>
                    <%# GetQType(Eval("TypeID","{0}"),Eval("QID", "{0}")) %>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <HeaderStyle Width="10%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("QID") %>'>修改</asp:LinkButton>
                    |                 
                <asp:LinkButton ID="lbtnDel" runat="server" CommandName="Del" CommandArgument='<%# Eval("QID") %>' OnClientClick="return confirm('确实要删除吗？');">删除</asp:LinkButton>
                    | 
                <asp:LinkButton ID="lbtnMoveUp" runat="server" CommandName="MovePre" CommandArgument='<%# Eval("QID") %>'>上移</asp:LinkButton>
                    |
                <asp:LinkButton ID="lbtnMoveDown" runat="server" CommandName="MoveNext" CommandArgument='<%# Eval("QID") %>'>下移</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <PagerTemplate>
            <%=lang.Get("m_ContentPager_total")%>
            <asp:Label ID="lblTotalCnt" runat="server" Text="Label"></asp:Label>
            <%=lang.Get("m_ContentPager_data")%>&nbsp;&nbsp;
                        <asp:LinkButton ID="lbtnFirstPage" CommandArgument="First" CommandName="Page" runat="server">首页</asp:LinkButton>&nbsp;
                       <asp:LinkButton ID="lbtnPrePage" CommandArgument="Prev" CommandName="Page" Enabled="<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>" runat="server">上一页</asp:LinkButton>&nbsp;
                        <asp:LinkButton ID="lbtnNextPage" CommandArgument="Next" CommandName="Page" Enabled="<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>" runat="server">下一页</asp:LinkButton>&nbsp;
                        <asp:LinkButton ID="lbtnLastPage" CommandArgument="Last" CommandName="Page" runat="server">尾页</asp:LinkButton>&nbsp; &nbsp;
                        <%=lang.Get("m_ContentPager_pages")%>：
                        <%# ((GridView)Container.NamingContainer).PageIndex + 1 %>/<%# ((GridView)Container.NamingContainer).PageCount %>
            <%=lang.Get("m_ContentPager_page")%>&nbsp; &nbsp;
                                <asp:Label ID="lblPages" runat="server" Text="" />
            <%=lang.Get("m_ContentPager_tip")%>
            <asp:TextBox ID="txtPageSize" runat="server" AutoPostBack="true" class="l_input" Width="30px" ToolTip="所输入的数据小于100" Text="<%# ((GridView)Container.NamingContainer).PageSize %>"></asp:TextBox>
            <%=lang.Get("m_ContentPager_data")%> &nbsp; &nbsp;
                                <%=lang.Get("m_ContentPager_turn")%>
            <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="True">
            </asp:DropDownList>
            <%=lang.Get("m_ContentPager_page")%> &nbsp; &nbsp;
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPageSize" ErrorMessage="数据不合法！" Type="Integer" MaximumValue="100" MinimumValue="1"></asp:RangeValidator>
        </PagerTemplate>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style>
        th {
            text-align: center;
        }
    </style>
</asp:Content>
