<%@ page language="C#" autoeventwireup="true" inherits="Plat_Admin_Default, App_Web_ogdx1eks" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
     #emails_ul li{margin-bottom:5px;list-style-type:none;}
    </style>
    <title>用户管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb">
        <li><a href="/Plat/Blog/">能力中心</a></li>
        <li><a href="/Plat/Admin/">管理平台</a></li>
        <li><a href="/Plat/Admin/UserManage.aspx">用户管理</a></li>
    </ol>
      <div class="child_head">
            <span class="child_head_span1"></span>
            <span class="child_head_span2">邀请注册</span>
        </div>
    <div style="padding-top:10px;">
        <div class="col-lg-5">
            <span>使用邮箱地址邀请：</span>
            <ul id="emails_ul" style="border-right: 1px dashed #ddd;">
                <li>Email：<input type="text" name="emails" class="form-control" placeholder="请输入Email地址" /></li>
                <li>Email：<input type="text" name="emails" class="form-control" placeholder="请输入Email地址" /></li>
                <li>
                    <asp:Button runat="server" ID="BatEmail_Btn" Text="邀请注册" OnClick="BatEmail_Btn_Click" CssClass="btn btn-primary" /></li>
            </ul>
        </div>
        <div class="col-lg-7">
            <style type="text/css">
               .right_regdiv{border:1px solid #0088cc;width:200px;height:120px;cursor:pointer;float:left;text-align:center;padding:10px 10px 0 10px; margin-right:20px;}
            </style>
            <div>
                更多注册方式：
            </div>
            <div class="right_regdiv" title="文本导入">
                <div style="color:#0088cc;padding-bottom:5px;">文本导入</div>
                <div style="color:#ddd;">支持TXT,CSV,Excel</div>
            </div>
             <div class="right_regdiv" title="邀请链接" data-toggle="modal" data-target="#ulink_div">
                <div style="color:#0088cc;padding-bottom:5px;">获取邀请链接</div>
                <div style="color:#ddd;">您可以直接复制到公司全员邮件或QQ群等，实现快速邀请</div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div style="clear: both;"></div>
    </div>
    <div>
        <div class="child_head">
            <span class="child_head_span1"></span>
            <span class="child_head_span2">用户列表</span>
        </div>
        <div class="input-group nav_searchDiv" style="margin:5px 0 5px 0;">
                <asp:DropDownList runat="server" ID="Status_DP" style="float:left;width:80px;border-right:none;" CssClass="form-control">
                    <asp:ListItem Value="100" Selected="True" >全部</asp:ListItem>
                    <asp:ListItem Value="1" >正常</asp:ListItem>
                    <asp:ListItem Value="0" >未审核</asp:ListItem>
                    <asp:ListItem Value="-1" >离职</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox runat="server" ID="Search_T" class="form-control" placeholder="请输入需要搜索的内容" />
                <span class="input-group-btn" style="float:left;">
                    <asp:LinkButton runat="server" CssClass="btn btn-default" ID="Search_Btn"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                </span>
            </div>
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" IsHoldState="false"
            class="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!"
            OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <input type="checkbox" name="idChk" value='<%# Eval("UserID") %>' />
                    </ItemTemplate>
                    <HeaderStyle Width="50px" />
                </asp:TemplateField>
                <asp:BoundField DataField="UserID" HeaderText="ID" SortExpression="UserID">
                    <HeaderStyle Width="50px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="会员名">
                    <ItemTemplate>
                        <%#Eval("UserName","{0}") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="姓名" DataField="TrueName" />
                <asp:BoundField HeaderText="职务" DataField="Post" />
                <asp:BoundField HeaderText="手机" DataField="Mobile"/>
                <asp:TemplateField HeaderText="状态">
                    <ItemTemplate>
                        <%#GetStatus() %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="加入时间">
                    <ItemTemplate>
                        <%#Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy年MM月dd日") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <a href="/Plat/UPCenter.aspx?uid=<%#Eval("UserID") %>" title="修改"><span class="glyphicon glyphicon-pencil"></span></a>
                        <asp:LinkButton runat="server" CommandName="Del2" CommandArgument='<%#Eval("UserID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除" style="margin-left:5px;">
                            <span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>
        <asp:Button runat="server" ID="Audit_Btn" Text="批量审核" CssClass="btn btn-primary" OnClick="Audit_Btn_Click" />
        <asp:Button runat="server" ID="UnAudit_Btn" Text="批量禁止" CssClass="btn btn-primary" OnClick="UnAudit_Btn_Click" />
        <asp:Button runat="server" ID="BatDel_Btn" Text="批量移除" CssClass="btn btn-primary" OnClick="BatDel_Btn_Click" />
    </div>
        <div class="modal fade" id="ulink_div" style="margin-top:20%;width:1000px;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <span class="modal-title">邀请链接</span>
                </div>
                <div class="modal-body">
                    <asp:Label runat="server" ID="ULink_L" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>