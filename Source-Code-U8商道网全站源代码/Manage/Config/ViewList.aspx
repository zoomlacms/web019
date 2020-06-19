<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_ViewList, App_Web_1yaxcbik" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %> 
<!DOCTYPE html> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>视图列表</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<style>    .tdbg td { padding-left:5px;}
</style>
<script type="text/javascript">
    function CheckAll(spanChk) {
        var oItem = spanChk.children;
        var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
        xState = theBox.checked;
        elm = theBox.form.elements;
        for (i = 0; i < elm.length; i++) if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
            if (elm[i].checked != xState)
                elm[i].click();
        }
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="r_navigation"><%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('71')" title="帮助"></a></div>
  <%} %>后台管理&gt;&gt;扩展功能&gt;&gt;<a href="DatalistProfile.aspx">开发中心</a>&gt;&gt;视图列表

            

            <a href="CreateView.aspx" target="_self" style="color:red;">[创建视图]</a></div>
    
        <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
         
       <tr class="tdbg" align="center" colspan="2" > 
        <td width="5%" class="title">
			全选
	    </td>
      <td width="73%" align="left" valign="middle" class="spacingtitle"  >视图名称</td> 
      <td width="20%" align="center" valign="middle" class="spacingtitle"  >操作</td>
      </tr>
        <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound" OnItemCommand="Repeater2_ItemCommand">
            <ItemTemplate>
               <tr class="tdbg" style="height: 25px; color: black;" onmouseover="this.style.backgroundColor='#C4E4FF'" onmouseout="this.style.backgroundColor='#E8F5FF'">
                   <td height="22" align="center">
					<input name="Item" type="checkbox" value='<%# Eval("ViewName")%>' />
				</td>
                    <td align="left">
                    <%#Eval("ViewName") %> <input type="hidden" runat="server" id="tN" value='<%#Eval("ViewName") %>'  />
                    </td>
                    <td align="center">
                         <a href="ViewInfo.aspx?ViewName=<%#Eval("ViewName") %>">查看</a>
                         <a href="CreateView.aspx?ViewName=<%#Eval("ViewName") %>">编辑</a>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" OnClientClick="return confirm('你确认要删除该视图吗？')">删除</asp:LinkButton>
                    </td>

                </tr>
            </ItemTemplate>
        </asp:Repeater> 
        </table>
        <table style="width: 100%;" cellpadding="2" cellspacing="1" 
              <tr class="tdbg">
                <td class="tdbg" align="center" colspan="3">
                    <ul>
			            <li style="width: 98.5%; float: left; line-height: 28px; text-align: center;">

                            共
                                <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                            条信息
                            <asp:LinkButton runat="server" ID="First" onclick="First_Click">首页</asp:LinkButton>
                            <asp:LinkButton runat="server" ID="Prev" onclick="Prev_Click">上一页</asp:LinkButton>
                            <asp:LinkButton runat="server" ID="Next" onclick="Next_Click">下一页</asp:LinkButton>
                            <asp:LinkButton runat="server" ID="Last" onclick="Last_Click">尾页</asp:LinkButton>
                            页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
                                Text="" />页
                            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" CssClass="l_input" OnTextChanged="txtPage_TextChanged"
                                Width="30px">10</asp:TextBox>
                            条信息/页 转到第<asp:DropDownList ID="DropDownListPage" runat="server" 
                                AutoPostBack="True" onselectedindexchanged="DropDownListPage_SelectedIndexChanged">
                            </asp:DropDownList>
                            页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage"
                                ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
                        </li>
                    </ul>
                </td>
            </tr>
        </table>
        <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" />全选
        <asp:Button ID="Button3" class="C_input"  runat="server" OnClientClick="return confirm('此操作将删除现有站点数据，确认？');" Text="批量删除" OnClick="Button3_Click" />
        <%--<table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td align="center" class="title" style="width:25%">
                    <span class="tdbgleft">序号</span>
                </td>
                <td align="center" class="title" style="width:45%">
                    <span class="tdbgleft">视图名</span>
                </td>
                <td align="center" class="title" style="width:30%">
                    <span class="tdbgleft">操作</span>
                </td>
            </tr>
        </table>--%>

    </form>
</body>
</html>
