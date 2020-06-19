<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.ModelManage, App_Web_bq0ou31b" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>开发中心</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
 <%--<asp:HiddenField ID="type" runat="server" />
  <table width="100%" border="0" cellpadding="1" cellspacing="2" class="border" style="text-align: center;">
    <tbody>
      <tr class="gridtitle" align="center" style="height: 30px;">
        <td style="text-align: center;" class="auto-style1"><strong>ID</strong></td>
        <td style="text-align: center;" class="auto-style3"><strong>项目图标</strong></td>
        <td style="text-align: center;" class="auto-style5"><strong>插件名称</strong></td>
        <td style="text-align: center;" class="auto-style5"><strong>数据表名</strong></td>
        <td style="text-align: center;" class="auto-style4"><strong>项目单位</strong></td>
        <td style="text-align: center;" class="auto-style5"><strong>项目描述</strong></td>
        <td style="text-align: center;" class="auto-style4"><strong>可执行次数</strong></td>
        <td style="text-align: center;" class="auto-style4"><strong>关联负责人</strong></td>
        <td style="text-align: center;" class="auto-style4"><strong>按钮名称</strong></td>
        <td style="text-align: center;" class="auto-style3"><strong>添加文件</strong></td>
        <td style="text-align: center;" class="auto-style10"><strong>自动计划</strong></td>
        <td style="width: 20%; text-align: center;"><strong>操作</strong></td>
      </tr>
      <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
        <ItemTemplate>
          <tr class="tdbg" style="line-height: 30px;" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'" id="<%# Eval("ID") %>" >
            <td><strong><%# Eval("ID") %></strong></td>
            <td><strong><%# Eval("Icon")%></strong></td>
            <td><strong><%# Eval("TagName")%></strong></td>
            <td><strong><%# Eval("TableName")%></strong></td>
            <td><strong><%# Eval("Unit")%></strong></td>
            <td><strong><%# Eval("Explain") %></strong></td>
            <td><strong><%# Eval("RunNum") %></strong></td>
            <td><strong><%# Eval("UserID")%></strong></td>
            <td><strong><%# Eval("BtnName")%></strong></td>
            <td><strong><%# Eval("SqlUrl")%></strong></td>
            <td><strong><%# Eval("RunTime")%></strong></td> 
            <td class="margin_l">
              <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ID") %>'>修改</asp:LinkButton>
              |
              <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('确实要删除此模型吗？');">删除</asp:LinkButton>
              |
              <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Field" CommandArgument='<%# Eval("ID") %>'>字段列表</asp:LinkButton></td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
      <tr class="tdbg">
        <td style="height: 22px; text-align: center;" colspan="12" class="tdbgleft">
          <span style="text-align: center">共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
            条数据
            <asp:Label ID="Toppage" runat="server" Text="" />
            <asp:Label ID="Nextpage" runat="server" Text="" />
            <asp:Label ID="Downpage" runat="server" Text="" />
            <asp:Label ID="Endpage" runat="server" Text="" />
            页次：
            <asp:Label ID="Nowpage" runat="server" Text="" />/
            <asp:Label ID="PageSize" runat="server" Text="" />页
            <asp:Label ID="pagess" runat="server" Text="" />
            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="16px"
                Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
            条数据/页 转到第
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
        </span>
        </td>
      </tr>
    </tbody>
  </table>--%>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript">
        function getinfo(id) {
            location.href = "AddEditModel.aspx?ModelID=" + id + '&ModelType=<%=Request["ModelType"] %>';
    }
    </script>
</asp:Content>