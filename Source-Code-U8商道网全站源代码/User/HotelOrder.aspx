<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_PrintServer_HotelOrder, App_Web_xkfb25nr" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>酒店订单管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">酒店订单管理</li>
    </ol>
    <div class="us_topinfo">
        您现在的位置：<a title="网站首页" href="/" target="_blank"><asp:Label ID="LblSiteName" runat="server" Text="Label"></asp:Label></a>&gt;&gt;
        <a title="会员中心" href="/User/Default.aspx" target="_parent">会员中心</a> &gt;&gt; 酒店订单管理
    </div>
    <div class="us_seta">
        <asp:Panel ID="Panel1" runat="server" Width="100%" Visible="false">
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td colspan="5" class="text-center">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">订单编号</td>
                    <td class="text-center">客户名称</td>
                    <td class="text-center">入住时间</td>
                    <td class="text-center">订单金额</td>
                    <td class="text-center">实际金额</td>
                </tr>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td style="text-align: center; text-overflow: ellipsis; white-space: nowrap; overflow: hidden">
                                <a href="?menu=ViewOrderlist&id=<%#Eval("id") %>"><%#Eval("OrderNo")%></a>
                            </td>
                            <td style="text-align: center;">
                                <%#Eval("Rename") %>
                            </td>
                            <td style="text-align: center; text-overflow: ellipsis; white-space: nowrap; overflow: hidden">
                                <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy-MM-dd}")%>
                            </td>
                            <td style="text-align: center;">
                                <%#formatcc(DataBinder.Eval(Container, "DataItem.Ordersamount", "{0:N2}"))%>
                            </td>
                            <td style="text-align: center;">
                                <%#formatcc(DataBinder.Eval(Container, "DataItem.Ordersamount", "{0:N2}"))%>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="5" class="text-center">共
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                        条记录
                    <asp:Label ID="Label3" runat="server" Text="" />
                        <asp:Label ID="Label4" runat="server" Text="" />
                        <asp:Label ID="Label5" runat="server" Text="" />
                        <asp:Label ID="Label6" runat="server" Text="" />
                        页次：
                    <asp:Label ID="Label7" runat="server" Text="" />/<asp:Label ID="Label8" runat="server" Text="" />
                        页
                    <asp:TextBox ID="txtPage" runat="server" Width="30px" AutoPostBack="True" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
                        条记录/页 转到第<asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"></asp:DropDownList>
                        页 
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Width="100%" Visible="false">
            <ul>
                <li style="width: 16%; float: left; line-height: 30px; text-align: center; background-color: #FFF5EC">酒店名称 </li>
                <li style="width: 16%; float: left; line-height: 30px; text-align: center; background-color: #FFF5EC">价格 </li>
                <li style="width: 16%; float: left; line-height: 30px; text-align: center; background-color: #FFF5EC">入住人 </li>
                <li style="width: 16%; float: left; line-height: 30px; text-align: center; background-color: #FFF5EC">入住时间 </li>
                <li style="width: 16%; float: left; line-height: 30px; text-align: center; background-color: #FFF5EC">到店时间 </li>
                <li style="width: 16%; float: left; line-height: 30px; text-align: center; background-color: #FFF5EC">城市 </li>
            </ul>
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <ul>
                        <li style="width: 16%; float: left; line-height: 30px; text-align: center; text-overflow: ellipsis; white-space: nowrap; overflow: hidden">
                            <%#DataBinder.Eval(Container, "DataItem.proname", "{0}")%></li>
                        <li style="width: 16%; float: left; line-height: 30px; text-align: center">
                            <%# DataBinder.Eval(Container, "DataItem.Shijia", "{0:N2}")%></li>
                        <li style="width: 16%; float: left; line-height: 30px; text-align: center">
                            <%# Eval("Proinfo")%></li>
                        <li style="width: 16%; float: left; line-height: 30px; text-align: center">
                            <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy-MM-dd}")%></li>
                        <li style="width: 16%; float: left; line-height: 30px; text-align: center">
                            <%#Eval("PerID")%></li>
                        <li style="width: 16%; float: left; line-height: 30px; text-align: center">
                            <%# Eval("city")%></li>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
            <br />
            <ul>
                <li style="width: 100%; float: none; line-height: 24px; text-align: left; background-color: #F7F7F7">合计：<asp:Label ID="preojiage" runat="server" Text=""></asp:Label>元 </li>
            </ul>
        </asp:Panel>
    </div>
</asp:Content>
