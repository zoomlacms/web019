<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_OAConfig, App_Web_a3augfom" masterpagefile="~/Manage/I/Default.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <title>OA系统配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#Tabs0" data-toggle="tab">系统设置</a></li>
        <li><a href="#Tabs1" data-toggle="tab">OA节点设置</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="Tabs0">
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td><strong>绑定模型ID：</strong></td>
                    <td>
                        <div style="float: left">
                            <asp:TextBox runat="server" CssClass="form-control" ID="bindModel" MaxLength="8" Columns="3"></asp:TextBox>
                        </div>
                        <div class="must">
                            <asp:RequiredFieldValidator ID="p1" runat="server" ControlToValidate="bindModel" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"
                                ErrorMessage="绑定模型不能为空!" />
                            <asp:RegularExpressionValidator ID="p2" runat="server" ControlToValidate="bindModel" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="必须是数字!" ValidationExpression="^([0-9]+)" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><strong>用户名显示：</strong></td>
                    <td>
                        <div style="float: left">
                                <asp:RadioButtonList ID="UNameConfigR" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Selected="True">用户名</asp:ListItem>
                                <asp:ListItem Value="2">真名(呢称)</asp:ListItem>
                                <asp:ListItem Value="3">真名</asp:ListItem>
                                <asp:ListItem Value="4">真名(ID)</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div class="prompt">提示:设置经办人,抄送人等显示格式</div>
                    </td>
                </tr>
                <tr>
                    <td><strong>允许发送手机短信：</strong></td>
                    <td>
                        <div style="float: left">
                            <input runat="server" type="checkbox" id="allowMsgR" class="switchChk" checked="checked" />
                        </div>
                        <div class="prompt"></div>
                    </td>
                </tr>
                <tr>
                    <td><strong>允许自定义OA界面：</strong></td>
                    <td>
                        <div style="float: left">
                            <input runat="server" type="checkbox" id="allowUIR" class="switchChk" checked="checked" />
                        </div>
                        <div class="prompt"></div>
                    </td>
                </tr>
                <tr>
                    <td><strong>OA标题：</strong></td>
                    <td>
                        <asp:TextBox runat="server" CssClass="form-control" ID="oaTitleT" MaxLength="50" /></td>
                </tr>
                <tr>
                    <td><strong>Logo地址：</strong></td>
                    <td>
                        <asp:TextBox runat="server" CssClass="form-control" ID="logoT" MaxLength="100" />
                    </td>
                </tr>
                 <tr><td>主办人签名模板：</td><td><asp:TextBox runat="server" ID="Leader_T" TextMode="MultiLine" style="width:500px;height:100px;"></asp:TextBox></td></tr>
                 <tr><td>协办人签名模板：</td><td><asp:TextBox runat="server" ID="Parter_T" TextMode="MultiLine" style="width:500px;height:100px;"></asp:TextBox></td></tr>
                 <tr ><td ><strong>邮箱容量：</strong></td>
            <td>
                <asp:TextBox runat="server"  CssClass="form-control" ID="MailSize_T" MaxLength="50"/>(以M为单位，0则不限制)
            </td></tr>
                <tr>
                    <td><strong>操作：</strong></td>
                    <td>
                        <asp:Button runat="server" ID="saveBtn" Text="保存" OnClick="saveBtn_Click" OnClientClick="disBtn(this,1000);" CssClass="btn btn-primary" />
                        <input type="button" id="refBtn" value="重置" onclick="location = location;" class="btn btn-primary" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="tab-pane" id="Tabs1">
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <td><strong>党办：</strong></td>
                    <td>
                        <asp:TextBox ID="DangBangT" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><strong>院办：</strong></td>
                    <td>
                        <asp:TextBox ID="YuanBT" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><strong>纪检：</strong></td>
                    <td>
                        <asp:TextBox ID="JijianT" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><strong>人事：</strong></td>
                    <td>
                        <asp:TextBox ID="RenShiT" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><strong>财务：</strong></td>
                    <td>
                        <asp:TextBox ID="CaiWuT" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><strong>科教：</strong></td>
                    <td>
                        <asp:TextBox ID="KejiaoT" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><strong>医务：</strong></td>
                    <td>
                        <asp:TextBox ID="YiwuT" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><strong>护理：</strong></td>
                    <td>
                        <asp:TextBox ID="HuliT" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><strong>信息：</strong></td>
                    <td>
                        <asp:TextBox ID="InfoT" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><strong>医院最新通知：</strong></td>
                    <td>
                        <asp:TextBox ID="NewsT" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><strong>医院论坛交流：</strong></td>
                    <td>
                        <asp:TextBox ID="BBST" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><strong>医院论坛交流：</strong></td>
                    <td>
                        <asp:Button runat="server" ID="NodeSavBtn" Text="保存" OnClick="NodeSavBtn_Click" OnClientClick="return checkvalue()" CssClass="btn btn-primary" />
                    </td>
                </tr>
            </table>

        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function checkvalue() {
            flag = false;
            dang = $("#DangBangT").val();
            yuan = $("#YuanBT").val();
            jijian = $("#JijianT").val();
            ren = $("#RenShiT").val();
            caiwu = $("#CaiWuT").val();
            kejiao = $("#KejiaoT").val();
            yiwu = $("#YiwuT").val();
            huli = $("#HuliT").val();
            info = $("#InfoT").val();
            news = $("#NewsT").val();
            bbs = $("#BBST").val();
            if (isNaN(dang) || isNaN(yuan) || isNaN(jijian) || isNaN(ren) || isNaN(caiwu) || isNaN(kejiao) || isNaN(yiwu) || isNaN(huli) || isNaN(info) || isNaN(news) || isNaN(bbs))
                alert("节点必须为数字");
            else
                flag = true;
            return flag;
        }
    </script>
</asp:Content>
