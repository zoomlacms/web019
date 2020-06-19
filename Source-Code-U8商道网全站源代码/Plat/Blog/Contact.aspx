<%@ page language="C#" autoeventwireup="true" inherits="Plat_Blog_Contact, App_Web_o3cst4gs" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:content runat="server" contentplaceholderid="head">
    <title>通讯录</title>
</asp:content>

<asp:content runat="server" contentplaceholderid="Content">
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li><a href="/Plat/Blog/">首页</a></li>
            <li><a href="/Plat/Task/">任务中心</a></li>
            <li>通讯录</li>
        </ol>
    </div>
    <br />
    <div class="input-group" style="width:200px;">
        <input class="form-control" placeholder="请输入搜索内容" type="text" /><span class="input-group-btn"><input type="submit" style=" width:4em;" class="btn btn-default" value="搜索" /></span>
    </div>
    <div style="width:100%">
        <br />
        <Zl:ExGridview ID="EGV" AutoGenerateColumns="false" AllowPaging="true" EnableTheming="false" GridLines="None" CellPadding="2" CellSpacing="1" Width="98%" CssClass="table table-bordered table-hover" EmptyDataText="当前没有信息！" OnPageIndexChanging="EGV_PageIndexChanging"  OnRowCommand="EGV_RowCommand" PageSize="10" runat="server">
            <columns>
                <asp:templatefield HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="center">
                    <itemtemplate>
                        <input type="checkbox" name="idChk" value="<%#Eval("UserID") %>" />
                    </itemtemplate>
                </asp:templatefield>
                <asp:BoundField HeaderText="用户名" DataField="UserName" />
                <asp:templatefield headertext="真实名称">
                    <itemtemplate>
                         <%# GetGN(Eval("TrueName")) %>
                    </itemtemplate>
                </asp:templatefield>
                 <asp:BoundField HeaderText="手机号码" DataField="Mobile" />
                 <asp:BoundField HeaderText="所属部门" DataField="GroupName" />
                <asp:templatefield Headertext="操作">
                    <itemtemplate>
                        <a href="#" title="发送邮件">邮件</a>
                        <a href="#" title="发送短信">短信</a>
                    </itemtemplate>
                </asp:templatefield>
            </columns>
        </Zl:ExGridview>
    </div>
</asp:content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script>
        $().ready(function () {
            $("#EGV tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");
            $("#chkAll").click(function () {
                selectAllByName(this, "idChk");
                selectAllByName();
            });
        });


    </script>

</asp:Content>
