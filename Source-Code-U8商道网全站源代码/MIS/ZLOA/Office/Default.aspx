<%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_Office_Default, App_Web_mwqc5r02" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="../../../JS/jquery-1.9.1.min.js"></script>
        <script type="text/javascript">
            $().ready(function () {
                $("#EGV tr:last >td>:text").css("line-height", "normal");
                $("#EGV tr:first >th").css("text-align", "center");
            });
    </script>
    <style type="text/css">
        #EGV tr th {color:black;background:url(""); }
        #EGV tr th {text-align:center;}
        #EGV tr td input {line-height:normal;}
    </style>
    <title>公文处理</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="site_main" style="margin:5px 5px 0 0;">
        <div class="input-group" style=" width:400px;float:left;margin-bottom:10px;">
            <asp:TextBox runat="server" ID="searchText" placeholder="请输入需要查询的信息" CssClass="form-control"/>
            <span class="input-group-btn">
                <asp:Button runat="server" CssClass="btn btn-primary" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click"/>
            </span>
        </div>
        <div class="tab3">
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="98%" CssClass="table border" EmptyDataText="你当前尚未发出任何公文!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
                <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:TemplateField HeaderText="发文类型">
                <ItemTemplate>
                    <%#GetType(Eval("Type", "{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="拟稿部门" DataField="Branch" />
            <asp:BoundField HeaderText="标题" DataField="Title" />
            <asp:TemplateField HeaderText="密级">
                <ItemTemplate>
                    <%#GetSecret( Eval("Secret","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="紧急程度">
                <ItemTemplate>
                    <%# GetUrgency(Eval("Urgency","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="重要程度">
                <ItemTemplate>
                    <%# GetImport(Eval("Importance","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate>
                    <%# GetStatus(Eval("Status","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="创建时间" DataField="CreateTime" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="../Drafting.aspx?Edit=1&AppID=<%#Eval("ID") %>" title="如果已经开始,则禁止修改">修改</a>|
                    <a href="ReadOffice.aspx?AppID=<%#Eval("ID") %>">查看审批详情</a>|
                    <asp:LinkButton ID="LinkButton1" CommandArgument='<%#Eval("ID") %>' CommandName="del1" runat="server" ToolTip="删除"><img src="/App_Themes/AdminDefaultTheme/images/del.png" /></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
                    <PagerStyle HorizontalAlign="Center"/>
                   <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
        </div>
    </div>
    </form>
</body>
</html>
