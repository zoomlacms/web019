<%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_Office_ReadOffice, App_Web_mwqc5r02" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../CSS/ZLOA.css" rel="stylesheet" type="text/css" />
<link href="/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script> 
    <title>公文处理</title>
     <style type="text/css">
        #EGV tr th {color:black;background:url(""); }
        #EGV tr th {text-align:center;}
        #EGV tr td input {line-height:normal;}
         .disupFile {margin-left:5px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="table border">
        <tr><td style="width:120px;">标题:</td><td><asp:Label runat="server" ID="titleL" /></td></tr>
        <tr><td>发起人:</td><td><asp:Label runat="server" ID="sendManL" /></td></tr>
        <tr><td>当前步骤:</td><td><asp:Label runat="server" ID="stepNameL" /></td></tr>
        <tr><td>发起时间:</td><td><asp:Label runat="server" ID="createTimeL" /></td></tr>
        <tr runat="server" visible="false" id="hqTr"><td>已会签人:</td><td><asp:Label runat="server" ID="hqL" /></td></tr>
        <tr><td>内容:</td><td>
            <asp:TextBox runat="server" Height="200px" Width="90%" TextMode="MultiLine" ID="txt_Content" ></asp:TextBox>
            </td></tr><!--内容-->
        <tr><td>附件:</td><td runat="server" id="publicAttachTD">
            <%--<asp:Button runat="server" ID="delAttachBtn" Text="删除附件" CssClass="btn btn-danger" Visible="false"/>--%>
                        </td></tr>
        <tr><td>审核意见:</td><td>
            <asp:TextBox runat="server" ID="remindT" TextMode="MultiLine" Width="500px" Height="100px"></asp:TextBox></td></tr>
        <tr runat="server" id="opBar"><td>操作</td>
            <td>
                <asp:Button runat="server" ID="agreeBtn" Visible="false" Text="同意" CssClass="btn btn-primary" OnClick="agreeBtn_Click" style="margin: 0 5px 0 5px;"/>
                <asp:Button runat="server" ID="rejectBtn" Visible="false" Text="拒绝" CssClass="btn btn-danger" OnClick="rejectBtn_Click" style="margin: 0 5px 0 5px;"/>
                <span runat="server" id="rollBackSpan" visible="false">
                当前步骤<asp:Label runat="server" ID="cStepL" />回退至:
                <asp:DropDownList runat="server" ID="rollBackDP"></asp:DropDownList>
                <asp:Button runat="server" ID="rollBackBtn" Visible="false" Text="回退" CssClass="btn btn-danger" OnClick="rollBackBtn_Click" style="margin: 0 5px 0 5px;"/>
                </span>
            </td>
        </tr>
    </table>
        <!--审核进度-->
        <div id="main" style="margin:5px 5px 0 0;">
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1"  Width="98%" CssClass="table border" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" >
                <Columns>
                    <asp:BoundField HeaderText="序号" DataField="ProLevel"/>
                    <asp:BoundField HeaderText="步骤名" DataField="ProLevelName" />
                    <asp:TemplateField HeaderText="处理结果">
                        <ItemTemplate>
                           <%#GetResult(Eval("Result")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="备注" DataField="Remind" />
                  </Columns>
                    <PagerStyle HorizontalAlign="Center"/>
                   <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
        </div>
    </div>
        <script type="text/javascript">
            $().ready(function () {
                UE.getEditor('txt_Content', { toolbars: [[]] });
                setTimeout(function () { UE.getEditor('txt_Content').setDisabled('fullscreen'); }, 500)
            });
        </script>
    </form>
</body>
</html>
