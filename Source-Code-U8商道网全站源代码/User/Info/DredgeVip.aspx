<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_DredgeVip, App_Web_fdza5mo4" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>VIP信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>	
    	<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="UserInfo.aspx">账户管理</a></li><li class="active">VIP信息</li>
    </ol>
    <div class="us_seta" id="manageinfos" runat="server">
        <uc1:WebUserControlTop ID="WebUserControlTop1" runat="server" />
    </div>
    <div class="us_seta" style="margin-top: 10px;" id="manageinfo" runat="server">
        <h1 style="text-align: center">VIP信息</h1>
        <div style="text-align: center; vertical-align: middle;">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <div style="width: 300px; margin: auto;">
                        <span class="pull-left tips text-left" style="width: 60px;">VIP号：</span>
                        <asp:TextBox ID="txtVIP" runat="server" Width="200px" Style="margin-bottom: 10px;" CssClass="form-control pull-left"></asp:TextBox><div class="clearfix"></div>
                        <span class="pull-left tips text-left" style="width: 60px;">密码：</span>
                        <asp:TextBox ID="txtPas" runat="server" Width="200px" TextMode="Password" CssClass="form-control pull-left"></asp:TextBox><div class="clearfix"></div>
                        <asp:Button ID="Button1" Style="margin-top: 10px;" runat="server" OnClick="Button1_Click" Text="开通VIP" CssClass=" btn btn-primary" />
                    </div>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    你的VIP卡以开通号：&nbsp;
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <table class="table table-striped table-bordered table-hover">
                        <tr align="center">
                            <td width="10%" class="title">
                                <asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
                            <td width="15%" class="title">卡号 </td>
                            <td width="20%" class="title">发放用户 </td>
                            <td width="10%" class="title">使用用户 </td>
                            <td width="20%" class="title">卡片状态 </td>
                            <td width="10%" class="title">操作 </td>
                        </tr>
                        <asp:Repeater ID="gvCard" runat="server">
                            <ItemTemplate>
                                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                                    <td align="center">
                                        <input name="Item" type="checkbox" value='<%# Eval("Card_ID")%>' /></td>
                                    <td align="center"><%# Eval("CardNum")%></td>
                                    <td align="center"><%#GetUserName(DataBinder.Eval(Container.DataItem ,"PutUserID").ToString()) %></td>
                                    <td align="center"><%#GetUserName(DataBinder.Eval(Container.DataItem ,"AssociateUserID").ToString()) %></td>
                                    <td align="center"><%#GetState(DataBinder.Eval(Container.DataItem, "CardState").ToString())%>
                                    <td align="center"><a href="CardView.aspx?id=<%#Eval("Card_ID") %>">查看</a></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <tr class="tdbg">
                            <td colspan="7" align="center" class="tdbgleft">共
                                <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                                个商品
                                <asp:Label ID="Toppage" runat="server" Text="" />
                                <asp:Label ID="Nextpage" runat="server" Text="" />
                                <asp:Label ID="Downpage" runat="server" Text="" />
                                <asp:Label ID="Endpage" runat="server" Text="" />
                                页次：
                                <asp:Label ID="Nowpage" runat="server" Text="" />
                                /
                                <asp:Label ID="PageSize" runat="server" Text="" />
                                页
                                <asp:Label ID="pagess" runat="server" Text="" />
                                个商品/页 转到第
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>
                                页 
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
