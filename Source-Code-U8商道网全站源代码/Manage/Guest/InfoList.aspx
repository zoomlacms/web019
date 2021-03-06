﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Guest_InfoList, App_Web_4yy5j0bb" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<title>词条列表</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
 <style>
 .rap { word-wrap: break-word; word-break: break-all;}
#Egv  td{  width:auto; text-align:center}
.user_t{border:1px solid #9bbde6; border-top:none}
 .borders{ border-bottom:1px solid #40a2fd}</style>
 <script src="/JS/Common.js" type="text/javascript"></script>
<script type="text/javascript">
    var tID = 0;
    var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3");
    window.onload = function () {
        pload();
    }
    function ShowTabss(ID) {
        location.href = 'InfoList.aspx?tittle=<%=Request.QueryString["tittle"] %>&id=' + ID + '&type=' + ID;
    }
    function pload() {
        var ID = '<%=Request.QueryString["id"]%>';
        if (ID != tID) {
            document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
            document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
            tID = ID;
        }
    }
 </script>
 <script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/Common.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation"><%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('97')" title="帮助"></a></div>
  <%} %>
<%=lang.Get("M_SpecContent_manage")%> &gt;&gt;<%=lang.Get("M_Guest_BaikeMana")%> &gt;&gt;<%=lang.Get("M_Guest_BaikeClass")%>
</div>
<div class="clearbox">
</div>
   <div class="borders">
  <table border="0" cellpadding="0" cellspacing="0">
            <tr align="center">
                <td id="TabTitle0" class="titlemouseover" onclick="ShowTabss(0)"><a href="?tittle=<%=Request.QueryString["tittle"] %>&type=0&id=0">所有词条</a>

                  </td>
                <td id="TabTitle1" class="tabtitle" onclick="ShowTabss(1)"><a href="?tittle=<%=Request.QueryString["tittle"] %>&type=1&id=1"><%=lang.Get("m_ContentManage_wait")%></a></td>
                
                <td id="TabTitle2" class="tabtitle" onclick="ShowTabss(2)"><a href="?tittle=<%=Request.QueryString["tittle"] %>&type=2&id=2"><%=lang.Get("m_ContentManage_complete")%></a></td>
                <td id="TabTitle3" class="tabtitle" onclick="ShowTabss(3)"><a href="?tittle=<%=Request.QueryString["tittle"] %>&type=3&id=3">新版待审</td>
	</tr>
</table>
</div>
<div class="clearbox">
</div>
<div class="user_t">
<asp:GridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="20" OnRowDataBound="Egv_RowDataBound"   OnRowCommand="Lnk_Click" Width="100%" Height="20px" AllowPaging="True"
 CellPadding="1"  RowStyle-CssClass="tdbg"  CellSpacing="1" BackColor="White" ForeColor="Black" CssClass="border" GridLines="None">
	<Columns>
		<asp:TemplateField HeaderText="选择">
			<HeaderStyle Width="5%" />
			<ItemTemplate>
				<asp:CheckBox ID="chkSel" runat="server" />
			</ItemTemplate>
			<ItemStyle CssClass="tdbg" />
		</asp:TemplateField>
        <asp:TemplateField HeaderText="" HeaderStyle-Width="0%" Visible="false">
                <ItemTemplate>
                </ItemTemplate>
                <HeaderStyle Width="0%"></HeaderStyle>
                <ItemStyle  CssClass="tdbg"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID" HeaderStyle-Width="5%" >
                <ItemTemplate>
                    <%#Eval("ID")%>
                </ItemTemplate>
                <HeaderStyle Width="5%"></HeaderStyle>
                <ItemStyle  CssClass="tdbg"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="词条" HeaderStyle-Width="12%" >
                <ItemTemplate>
                    <%#Eval("Tittle")%>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" class="l_input" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Tittle")%>'>'></asp:TextBox>
                </EditItemTemplate>
                <HeaderStyle Width="12%"></HeaderStyle>
                <ItemStyle CssClass="tdbg"></ItemStyle> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="修改人" HeaderStyle-Width="12%" >
                <ItemTemplate>
                    <%#Eval("UserName")%>
                </ItemTemplate>
                <HeaderStyle Width="12%"></HeaderStyle>
                <ItemStyle CssClass="tdbg"></ItemStyle> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="修改时间" HeaderStyle-Width="10%" >
                <ItemTemplate>
                    <%#Eval("EditTime")%>
                </ItemTemplate>
                <HeaderStyle Width="10%"></HeaderStyle>
                <ItemStyle CssClass="tdbg"></ItemStyle> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="修改原因" >
            <ItemTemplate>
                <%#Eval("Why") %>
            </ItemTemplate>
            <ItemStyle CssClass="tdbg"></ItemStyle> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="审核">
                <ItemTemplate>
                    <%#getcommend(Eval("status"))%>
                </ItemTemplate>
                <ItemStyle CssClass="tdbg"></ItemStyle> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                  <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Audit" CausesValidation="false">审核</asp:LinkButton>
                    |
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('确实要删除吗？');" CommandArgument='<%#Eval("ID") %>' CommandName="Del" CausesValidation="false">删除</asp:LinkButton>|
                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="show" CausesValidation="false">设为显示</asp:LinkButton>
                    
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
	</Columns>
	<RowStyle ForeColor="Black" BackColor="#DEDFDE" Height="25px" />
	<SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
	<PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
	<HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
</asp:GridView>
<table width="100%">
        <tr>
            <td class="tdbg">
                <div style="text-align: center">
                    <span style="text-align: center">
                        <%=lang.Get("m_ContentManage_total")%>
                        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                        <%=lang.Get("m_ContentManage_data")%>
                        <asp:Label ID="Toppage" runat="server" Text="" />
                        <asp:Label ID="Nextpage" runat="server" Text="" />
                        <asp:Label ID="Downpage" runat="server" Text="" />
                        <asp:Label ID="Endpage" runat="server" Text="" />
                        <%=lang.Get("m_ContentManage_pages")%>：
                        <asp:Label ID="Nowpage" runat="server" Text="1" />/
                        <asp:Label ID="PageSize" runat="server" Text="" /><%=lang.Get("m_ContentManage_page")%>
                        <asp:Label ID="pagess" runat="server" Text="" />
                        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" OnTextChanged="txtPage_TextChanged"
                            Width="30px"></asp:TextBox>
                        <%=lang.Get("m_ContentManage_turn")%>
                        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                        </asp:DropDownList>
                        <%=lang.Get("m_ContentManage_page")%><asp:RangeValidator ID="RangeValidator1" runat="server"
                            ControlToValidate="txtPage" ErrorMessage="仅支持数字" Type="Integer" MaximumValue="100000"
                            MinimumValue="0"></asp:RangeValidator></span></div>
            </td>
        </tr>
    </table>
</div>
<asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Font-Size="9pt" OnCheckedChanged="CheckBox2_CheckedChanged" Text="全选" />
<asp:Button ID="Button1"   runat="server" Text="删除选定的词条"  
    UseSubmitBehavior="False" 
    OnClientClick="if(!confirm('确定要批量删除词条吗？')){return false;}" class="C_input" 
    onclick="Button1_Click"/>
<asp:Button ID="Button2"   runat="server" Text="审核通过选定的词条"  
    UseSubmitBehavior="False" class="C_input" onclick="Button2_Click" />
<asp:Button ID="Button3"  runat="server" Text="取消审核选定的词条"  
    UseSubmitBehavior="False" class="C_input" onclick="Button3_Click" />

</form>
</body>
</html>
