﻿<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Project_ProjectList, App_Web_0aid0tpp" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>


<asp:Content ContentPlaceHolderID="Head" runat="Server">
    <title>用户项目列表</title>
</asp:Content>


<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <div class="s_bright">

    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">用户项目列表</li>
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 

        <li style="width:100%; margin-left:1300px;:30px; margin-top:50px;">
	  <div align="left" >
    <asp:DropDownList ID="DLType"  CssClass="form-control pull-left" Width="120" style=""  runat="server">
    <asp:ListItem Value="0" Text="按名称" Selected="True"></asp:ListItem>
    <asp:ListItem Value="1" Text="按时间"></asp:ListItem>
    <asp:ListItem Value="2" Text="按ID"></asp:ListItem>        
    <asp:ListItem Value="3" Text="按描述"></asp:ListItem> 
    </asp:DropDownList>  
         <asp:TextBox runat="server" ID="SearchValue" class="form-control" Text="关键字"></asp:TextBox><asp:Button  ID="Search" runat="server" CssClass="btn btn-primary" Text="搜索" OnClick="Search_Click"/>
	  </div>
	</li>
        <div class="us_topinfo" style="width:97%; ">
       <ul class="nav nav-tabs">
           <li><a href="ProjectList.aspx"  > 我的项目</a></li>
        <li class="active"><a href="ProjectRequire.aspx">提交需求</a></li>
       
    </ul>
  </div>
<div style="margin-top:10px;">
  <div >
	  <li style="width:100%;line-height:25px">
<ZL:ExGridView ID="Egv" runat="server" AllowPaging="True" AutoGenerateColumns="False"
   DataKeyNames="RequireID" PageSize="10"  class="table table-bordered table-hover table-striped" OnPageIndexChanging="Egv_PageIndexChanging"  Width="100%" OnRowCommand="GridView1_RowCommand" EmptyDataText="无任何相关数据">
	<Columns>                         
		<asp:TemplateField HeaderText="项目ID" ItemStyle-HorizontalAlign="Center">
			<ItemTemplate>
				<%# DataBinder.Eval(Container.DataItem, "ProjectID").ToString()%>       
			</ItemTemplate>
			<HeaderStyle Width="10%" />
		</asp:TemplateField>
		<asp:BoundField DataField="ProjectName" HeaderText="项目名称" ItemStyle-HorizontalAlign="Center">
			<HeaderStyle Width="20%" />
			
		</asp:BoundField>
		<asp:BoundField DataField="StartDate" HeaderText="开始时间" ItemStyle-HorizontalAlign="Center" >
			<HeaderStyle Width="16%" />
			
		</asp:BoundField>
		  <asp:TemplateField HeaderText="进度" ItemStyle-HorizontalAlign="Center">
			<HeaderStyle Width="5%" />
			<ItemTemplate>
					<%# CountRate(Convert.ToInt32(Eval("ProjectID"))) %>
			</ItemTemplate>
			
	   </asp:TemplateField>
		<asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
			<ItemTemplate>                        
				<asp:LinkButton ID="LnkDelete"  runat="server" CommandName="DeleteUser" OnClientClick="if(!this.disabled) return confirm('确实要删除此会员吗？');"
					CommandArgument='<%# Eval("ProjectID")%>' OnClick="delete_Click" Visible="false">删除</asp:LinkButton>
				<asp:LinkButton ID="Lnk"  runat="server" CommandName="ShowDetail"
					CommandArgument='<%# Eval("ProjectID")%>'>详细内容</asp:LinkButton>
				
			  </ItemTemplate>
			 
		</asp:TemplateField>
	　</Columns>
	
    <PagerStyle HorizontalAlign="Center" />
      
</ZL:ExGridView>  
	</li>
  </div>
</div>
</asp:Content>

