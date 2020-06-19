<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Guest_GuestCateMana, App_Web_5qamorfk" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>留言分类管理</title>
</asp:Content>
<asp:Content  ContentPlaceHolderID="Content" Runat="Server">
<div style="margin-bottom:10px;">
    <div>
		<span class="pull-left" style="line-height:34px"><%=lang.Get("M_GuestCateMana_categoryName")%>：</span><asp:TextBox ID="txtCateName" class="form-control pull-left" value="必填项" runat="server"  Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="必填项" ControlToValidate="txtCateName"></asp:RequiredFieldValidator>
		<span class="pull-left" style="line-height:34px;margin-left:5px;"><%=lang.Get("M_GuestCateMana_openAnonyGuest")%>：</span>
        <asp:DropDownList ID="NeedLog" CssClass="form-control pull-left" Width="100" runat="server">
			<asp:ListItem Value="0">是</asp:ListItem>
			<asp:ListItem Value="1">否</asp:ListItem>
		</asp:DropDownList>
        <asp:Button ID="addCate" CssClass="btn btn-primary" runat="server" Text="添加分类" OnClick="addCate_Click" />
	 </div><div class="clearfix"></div>
</div>
<ZL:ExGridView ID="EGV" CssClass="table table-bordered table-hover table-striped" RowStyle-HorizontalAlign="Center" DataKeyNames="CateID" runat="server"
	AutoGenerateColumns="False" AllowPaging="True" Width="100%" OnPageIndexChanging="Egv_PageIndexChanging"
	EmptyDataText="无相关数据" OnRowDataBound="Gdv_RowDataBound"  GridLines="None" CellPadding="4" CellSpacing="1" ForeColor="Black">
	<Columns>
		<asp:TemplateField HeaderText="序号" HeaderStyle-Width="10%" >
			<ItemTemplate >
				<%#Eval("CateID")%>
			</ItemTemplate>
			<HeaderStyle Width="10%"></HeaderStyle>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="分类名称" HeaderStyle-Width="40%">
			<ItemTemplate>
				<%#Eval("CateName")%>
			</ItemTemplate>
			<EditItemTemplate>
				<asp:TextBox ID="txtName" CssClass="form-control" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CateName")%>'>'></asp:TextBox>
			</EditItemTemplate>
			<HeaderStyle Width="40%"></HeaderStyle>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="允许匿名留言">
			<ItemTemplate>
				<%#(Eval("NeedLog").ToString()=="0")?"是":"否"%>
			</ItemTemplate>
			<EditItemTemplate>
				<asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control pull-left" Width="100">
					<asp:ListItem Value="0">是</asp:ListItem>
					<asp:ListItem Value="1">否</asp:ListItem>
				</asp:DropDownList>
				<asp:Button ID="Button1" CssClass="btn btn-primary pull-left" runat="server" Text="确定" OnClick="Button1_Click" CausesValidation="false" />
			</EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
		</asp:TemplateField>
		<asp:TemplateField HeaderText="操作">
			<ItemTemplate>
				<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CausesValidation="false">修改</asp:LinkButton>
				|
				<asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('确实要删除吗？当系统无分类数据时，则不能发表留言!');"
					OnClick="LinkButton2_Click" CausesValidation="false">删除</asp:LinkButton>
				| <a href='Default.aspx?CateID=<%# Eval("CateID") %>'>留言列表</a>
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
	<RowStyle ForeColor="Black" Height="25px" />
	<PagerStyle ForeColor="Black" HorizontalAlign="Center" />
	<HeaderStyle  Font-Bold="True"  />
</ZL:ExGridView>
<asp:HiddenField ID="HdnCateID" Value="0" runat="server" />
<style>
    th{ text-align:center;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
</asp:Content>
