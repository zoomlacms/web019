<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.CollectionStep1, App_Web_51yxiush" masterpagefile="~/Manage/I/Default.master" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>采集管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr class="text-center">
            <td colspan="2"><%=type%></td>
        </tr>
        <tr>
            <td style="width: 20%" class="text-right">
                <strong>项目名称：</strong>
            </td>
            <td>
                <asp:TextBox ID="txtItemName" runat="server" Width="200px" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtItemName" ErrorMessage="请输入项目名称"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 20%" class="text-right">
                <strong>网站名称： </strong>
            </td>
            <td>
                <asp:TextBox ID="txtSiteName" runat="server" Width="199px" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSiteName" ErrorMessage="请输入网站名称"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 20%" class="text-right">
                <strong>目标模型：</strong>
            </td>
            <td>
                <asp:DropDownList ID="ddlModel" runat="server" CssClass="form-control" DataTextField="ModelName" DataValueField="ModelID" AutoPostBack="True" OnSelectedIndexChanged="ddlModel_SelectedIndexChanged"></asp:DropDownList>
                <asp:Label ID="Lbl_checkNode" runat="server" Visible="false" Text="你选择的栏目没有绑定数据表单！" Style="font-size: 12px; color: Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 20%" class="text-right"><strong>入库节点：</strong></td>
            <td>
                <asp:TextBox ID="txtNode" runat="server" Width="250px" Enabled="false" CssClass="form-control"></asp:TextBox>
                <input id="Button2" class="btn btn-primary" type="button" value="更改节点" onclick="AddNode('link')" />
                <input id="Button4" class="btn btn-primary" type="button" value="添加到其他节点" onclick="AddNode('check')" />
                <table cellpadding="0" cellspacing="0" id="NondeTable" border="0"></table>
                <asp:HiddenField ID="hfNode" runat="server" Value="1|选择节点," />
            </td>
        </tr>
        <tr>
            <td style="width: 20%" class="text-right"><strong>入库专题：</strong></td>
            <td>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" id="SpecTable" border="0">
                            </table>
                        </td>
                        <td valign="top">
                            <input type="button" id="Button5" style="width: 110px;" value="添加到专题" onclick="AddToSpecial()" class="btn btn-primary" />
                            <asp:HiddenField ID="HdnSpec" runat="server" />
                        </td>
                    </tr>
                </table>
                <asp:DataList ID="dlSpec" runat="server" Width="100%">
                    <ItemTemplate>
                        <asp:TextBox ID="txtSpecial" class="form-control" runat="server" Width="250px" Text='<%#DataBinder.Eval(Container.DataItem, "Context")%>' Enabled="false"></asp:TextBox>
                        <asp:Button ID="Button6" class="btn btn-primary" runat="server" Text="从此专题中移除" OnClick="Button6_Click" OnClientClick="return confirm('你确定要从此专题中移除吗？')" />
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td style="width: 20%" class="text-right"><strong>采集URL：</strong></td>
            <td>
                <asp:TextBox ID="txtUrl" class="form-control" runat="server" Width="360px" Text="http://"></asp:TextBox>
                <span style="color: Green"> 注：以 http:// 开头</span>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUrl" ErrorMessage="请输入正确的采集URL" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]+[\u4e00-\u9fa5]*)?"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 20%" class="text-right"><strong>网站登录：</strong></td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem Value="1" Selected="True">不需要登录</asp:ListItem>
                    <asp:ListItem Value="2">设置参数</asp:ListItem>
                </asp:RadioButtonList>
                <span style="color: Green">只有在对方网站没有开启登录验证码功能时，才能进行登录采集</span>
            </td>
        </tr>
        <tr id="user1" runat="server" visible="false">
            <td style="width: 20%" class="text-right"><strong>用户参数：</strong></td>
            <td>
                <strong>用户文本框名称：</strong>
                <asp:TextBox ID="UTBName" runat="server" class="form-control"></asp:TextBox>
                <strong>用户名称：</strong>
                <asp:TextBox ID="username" runat="server" class="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr id="password1" runat="server">
            <td style="width: 20%" class="text-right"><strong>密码参数：</strong></td>
            <td>
                <strong>密码文本框名称：</strong>
                <asp:TextBox ID="PTBName" runat="server" class="form-control"></asp:TextBox>
                <strong>用户密码：</strong>
                <asp:TextBox ID="password" runat="server" class="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 20%" class="text-right"><strong><font color="red">编码选择：</font></strong></td>
            <td>
                <asp:RadioButtonList ID="rblCoding" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Selected="True">GB2312</asp:ListItem>
                    <asp:ListItem Value="2">UTF-8</asp:ListItem>
                    <asp:ListItem Value="3">Big5</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td style="width: 20%" class="text-right"><strong>采集数量：</strong></td>
            <td>
                <asp:TextBox ID="txtNum" class="form-control" runat="server" Width="67px"></asp:TextBox>
                <span style="color: Green"> 注：不指定为全部</span>
            </td>
        </tr>
        <tr>
            <td style="width: 20%" class="text-right"><strong>备 注：</strong></td>
            <td>
                <asp:TextBox ID="txtContext" runat="server" Rows="8" TextMode="MultiLine" Width="559px" class="form-control" Height="68px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="下一步" OnClick="Button1_Click" />
                <input id="Button3" class="btn btn-primary" type="button" value="返回" onclick="window.location.href = 'CollectionManage.aspx'" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        //添加专题
        function AddToSpecial() {
            var urlstr = "SpecialList.aspx";
            var isMSIE = (navigator.appName == "Microsoft Internet Explorer");
            var special = null;
            if (isMSIE) {
                special = window.open(urlstr, "self,width=200,height=150,resizable=yes,scrollbars=yes");
                if (special != "") {
                    var arr = special.split(',');
                    var odlsp = document.getElementById("HdnSpec").value;
                    var odlarr = odlsp.split(',');
                    var s = true;
                    for (var arri = 0; arri < odlarr.length; arri++) {
                        if (odlarr[arri] == arr[0]) {
                            s = false;
                        }
                    }
                    if (s) {
                        AddRow(arr[1], arr[0], document.all.SpecTable, "此专题", 2);
                        document.getElementById("HdnSpec").value = odlsp + arr[0] + ",";
                    }
                }
            }
            else {
                window.open(urlstr, 'newWin', 'modal=yes,width=200,height=150,resizable=yes,scrollbars=yes');
            }
        }

        //主节点
        function ShowNode(nodename) {
            document.getElementById("<%=txtNode.ClientID%>").value = nodename;
        }

        //添加节点
        function AddNode(type) {
            var nid = document.getElementById("<%=hfNode.ClientID%>").value;
            window.open('../Common/NodeList.aspx?nid=' + nid + '&type=' + type + '', 'newWin', 'modal=yes,width=400,height=300,resizable=yes,scrollbars=yes');
        }

        //添加条件行
        function AddNodeRow(nodename, nodeid) {
            AddRow(nodename, nodeid, document.all.NondeTable, "此节点", 1);
        }

        var i = 0, j = 0;     //行号与列号
        var oNewRow;    //定义插入行对象
        var oNewCell1, oNewCell2;     //定义插入列对象

        //添加条件行
        function AddRow(nodename, nodeid, tableid, text, index) {
            i = tableid.rows.length;
            oNewRow = tableid.insertRow(i);
            oNewRow.id = nodeid;

            //添加第一列
            oNewCell1 = tableid.rows[i].insertCell(0)
            oNewCell1.innerHTML = "<input type='text' id='Value" + nodeid + "'" + " style=\"width:250px;\" disabled=\"disabled\" value=\"" + nodename + "\">";

            //添加第二列
            oNewCell2 = tableid.rows[i].insertCell(1)
            oNewCell2.innerHTML = "<input type=button name=Del" + nodeid + " style=\"width:80px\" value='移除" + text + "'" + "onclick=\"if(confirm('你确定要从" + text + "中移除吗？'))DelCurrentRow(" + nodeid + "," + index + ");\">";
            j++;

        }
        //删除行
        function DelCurrentRow(nodeid, index) {
            var tableid;
            var hfClient;
            if (index == 1) {
                tableid = document.all.NondeTable;
                hfClient = document.getElementById("<%=hfNode.ClientID%>");
        }
        if (index == 2) {
            tableid = document.all.SpecTable;
            hfClient = document.getElementById("<%=HdnSpec.ClientID%>");
        }
        with (tableid) {
            for (var i = 0; i < rows.length; i++) {
                if (rows[i].id == nodeid) {
                    deleteRow(i);
                }
            }
        }
        var nid = hfClient.value;
        var arr = nid.split(",");
        var v = "";
        for (i = 0; i < arr.length; i++) {
            if (arr[i] != nodeid && arr[i] != "") {
                v += arr[i] + ",";
            }
        }
        hfClient.value = v;
        //document.write(document.getElementById("<%=hfNode.ClientID%>").value);
    }

    </script>
    <script type="text/ecmascript">
        window.onload = function () {
            var str = "";
            str = window.document.getElementById("<%=hfNode.ClientID%>").value;
            if (str != "") {
                var strarr = str.split(",");
                var s = "";
                if (strarr.length > 0) {
                    var sa = strarr[0].split("|");
                    s += sa[0] + ",";
                    window.document.getElementById("<%=txtNode.ClientID%>").value = sa[1].replace("&gt;&gt;", ">>");
                    for (var ii = 0; ii < strarr.length; ii++) {
                        if (ii > 0) {
                            if (strarr[ii] != "") {
                                var sarr = strarr[ii].split("|");
                                AddNodeRow(sarr[1], sarr[0]);
                                s += sarr[0] + ",";
                            }
                        }
                    }
                }
                window.document.getElementById("<%=hfNode.ClientID%>").value = s;
            }

            str = window.document.getElementById("<%=HdnSpec.ClientID%>").value;
            strarr = str.split(",");
            var s = ""; //alert(str);
            if (strarr.length > 0) {
                for (var ii = 0; ii < strarr.length; ii++) {
                    if (strarr[ii] != "") {
                        var sarr = strarr[ii].split("|");
                        AddRow(sarr[1], sarr[0], document.all.SpecTable, "此专题", 2);
                        s += sarr[0] + ",";
                    }
                }
            }
            window.document.getElementById("<%=HdnSpec.ClientID%>").value = s;
        }
    </script>
    <style type="text/css">
        .style1 {
            background: #e0f7e5;
            padding: 2px;
            width: 20%;
            height: 43px;
        }

        .style2 {
            height: 43px;
        }
    </style>
</asp:Content>
