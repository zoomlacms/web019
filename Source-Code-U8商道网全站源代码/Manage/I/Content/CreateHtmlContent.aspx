<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="Manage_I_Content_CreateHtmlContent, App_Web_k4ea05fw" clientidmode="Static" validaterequest="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>发布管理</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <%-- <div class="divline">
        <ul style="cursor: hand;">
            <li class="spanfixdiv1" onclick="ShowCreate('crt1')">发布主页与内容</li>
            <li class="spanfixdiv1" onclick="ShowCreate('crt3')">发布单页</li>
            <li class="spanfixdiv1" onclick="ShowCreate('crt2')">发布栏目</li>
            <li class="spanfixdiv1" onclick="ShowCreate('crt4')">发布专题</li>
        </ul>
    </div>
    <div class="clearbox">
    </div>--%>
    <!--    <table class="border" align="center">
        <tr>
            <td colspan="3">
                <%=lang.Get("M_CreateHtmlContent_timedRelease")%>
            </td>
        </tr>
        <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td align="right" style="width:20%">
                <%=lang.Get("M_CreateHtmlContent_timedRelease")%>：
            </td>
            <td  style="width:8%">
            <asp:RadioButtonList ID="rblTime" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" onselectedindexchanged="rblTime_SelectedIndexChanged">
            <asp:ListItem Value="1">是</asp:ListItem>
            <asp:ListItem Value="2" Selected="True">否</asp:ListItem>
            </asp:RadioButtonList>
            </td>
            <td  ><asp:TextBox ID="txtDate" runat="server"  onclick="calendar()" class="l_input" ></asp:TextBox></td>
        </tr>
    </table>
-->
    <div class="Creat_tips">
        <div class="alert alert-danger fade in" style="margin-bottom: 10px;">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <h4>提示!</h4>
            <p style="padding-left: 50px; line-height: 40px;">
                <strong>
                    <span class='glyphicon glyphicon-warning-sign' style='color: #f00; font-size: 18px;'></span>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    <asp:LinkButton ID="btnCreate" ForeColor="#428bca" OnClick="btnCreate_Click" runat="server">立即生成>></asp:LinkButton>
                </strong>
            </p>
            <p>
                发布栏目页，需在<a style="color: #428bca;" href="<%=CustomerPageAction.customPath2%>Config/SiteInfo.aspx">[系统设置]</a>-<a style="color: #428bca;" href="<%=CustomerPageAction.customPath2%>Content/NodeManage.aspx">[节点管理]</a>对相应节点生成选项进行设置，.aspx为不生成静态页<br />
                发布内容页，需对内容所在节点的生成选项的中，对内容页扩展名进行设置，.aspx为不生成静态页。
            </p>
        </div>
    </div>
    <!--top生成内容页-->
    <div>
        <ul class="nav nav-tabs">
            <li class="active"><a href="#Tab1" data-toggle="tab">快速发布</a></li>
            <li><a href="#Tab6" data-toggle="tab">定时发布</a></li>
            <li><a href="#Tab2" data-toggle="tab">发布栏目</a></li>
            <li><a href="#Tab3" data-toggle="tab">发布内容</a></li>
            <li><a href="#Tab4" data-toggle="tab">发布单页</a></li>
            <li><a href="#Tab5" data-toggle="tab">发布专题</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="Tab1">
                <table class="table table-bordered table-hover" align="center" id="crt1" name="crt1">
                    <tr>
                        <td colspan="2" align="center">快速发布
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td align="right" class="bqleft"><%=lang.Get("M_CreateHtmlContent_inIDRelease")%>：
                        </td>
                        <td>
                            <span class="pull-left spanH30"><%=lang.Get("M_CreateHtmlContent_from")%></span><asp:TextBox ID="txtIdStart" CssClass="pull-left form-control" Width="150" runat="server"></asp:TextBox><span class="pull-left spanH30" style="margin-left: 5px;"><%=lang.Get("M_CreateHtmlContent_to")%></span>
                            <asp:TextBox ID="txtIdEnd" CssClass="form-control pull-left" Width="150" runat="server"></asp:TextBox>
                            <asp:Button ID="btnCreateId" runat="server" Text="开始发布" Style="margin-left: 10px;" CssClass="btn btn-primary" OnClick="btnCreateId_Click" />
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td align="right">
                            <%=lang.Get("M_CreateHtmlContent_releasedTheLatest")%>：
                        </td>
                        <td>
                            <asp:TextBox ID="txtNewsCount" Style="margin-left: 18px;" CssClass="form-control pull-left" Width="150" runat="server"></asp:TextBox>
                            <span style="margin-left: 5px; margin-right: 5px;"><%=lang.Get("M_CreateHtmlContent_piece")%></span>
                            <asp:Button ID="btnNewsCount" runat="server" Text="开始发布" CssClass="btn btn-primary" OnClick="btnNewsCount_Click" />
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td align="right">
                            <%=lang.Get("M_CreateHtmlContent_releasedByDate")%>：
                        </td>
                        <td>
                            <span class="pull-left spanH30"><%=lang.Get("M_CreateHtmlContent_from")%></span><asp:TextBox ID="txtStartDate" CssClass="form-control pull-left" Width="150" runat="server" onclick="WdatePicker();" /><span class="pull-left spanH30" style="margin-left: 5px;"><%=lang.Get("M_CreateHtmlContent_to")%></span>
                            <asp:TextBox ID="txtEndDate" CssClass="form-control pull-left" Width="150" runat="server" onclick="WdatePicker();" />
                            <asp:Button ID="Button2" Style="margin-left: 10px;" runat="server" Text="开始发布" CssClass="btn btn-primary" OnClick="Button2_Click" />
                        </td>
                    </tr>
                    <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td align="right"><%=lang.Get("M_CreateHtmlContent_personnelSystem") %>：
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" CssClass="form-control pull-left" Width="150" runat="server">
                                <asp:ListItem Value="zhaopin">招聘企业</asp:ListItem>
                                <asp:ListItem Value="zhiwei">职位信息</asp:ListItem>
                                <asp:ListItem Value="jianli">用户简历</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="Button4" runat="server" Style="margin-left: 10px;" Text="开始发布" CssClass="btn btn-primary" OnClick="Button4_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right"><%=lang.Get("M_CreateHtmlContent_publishAll")%>：
                        </td>
                        <td>
                            <asp:Button ID="btnNewsContent" runat="server" Text="开始发布" CssClass="btn btn-primary" OnClick="btnNewsContent_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" valign="middle">
                            <span style="color: Blue"><strong><%=lang.Get("M_CreateHtmlContent_note")%>：</strong></span><%=lang.Get("M_CreateHtmlContent_ifYouDo")%>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="tab-pane" id="Tab2">
                <!--start发布栏目-->
                <table class="table table-bordered table-hover" align="center" id="crt2" name="crt2">
                    <tr>
                        <td colspan="2" align="center" style="height: 23px">
                            <%=lang.Get("M_CreateHtmlContent_releasePart")%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle">
                            <%=lang.Get("M_CreateHtmlContent_selectPart")%>：
                        </td>
                        <td valign="middle" style="padding: 0px;">
                            <div style="float: left;">
                                <asp:ListBox ID="lbColumn" runat="server" CssClass="form-control" Width="200" Height="220" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                            <div style="margin-top: 100px; float: left;">
                                <asp:Button ID="btnCreateColumn" Style="margin-left: 10px;" runat="server" Text="开始发布" CssClass="btn btn-primary" OnClientClick="return lbColumnCheck()" OnClick="btnCreateColumn_Click" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%=lang.Get("M_CreateHtmlContent_selectPart")%>：
                        </td>
                        <td>
                            <asp:Button ID="btnCreateColumnAll" runat="server" Text="发布所有栏目" CssClass="btn btn-primary" OnClick="btnCreateColumnAll_Click" />
                        </td>
                    </tr>
                </table>
                <!--end发布栏目-->
            </div>
            <div class="tab-pane" id="Tab3">
                <!--begin发布内容-->
                <table class="table table-bordered table-hover" align="center" id="crt5" name="crt5">
                    <tr>
                        <td colspan="2" align="center">
                            <%=lang.Get("M_CreateHtmlContent_publishContent")%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle"><%=lang.Get("M_CreateHtmlContent_contentWithSection")%>：</td>
                        <td valign="middle" style="padding: 0px;">
                            <div style="float: left;">
                                <asp:ListBox ID="ColumnList" runat="server" CssClass="form-control" Width="200" Height="220" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                            <div style="margin-top: 100px; float: left;">
                                <asp:Button ID="Button6" Style="margin-left: 10px;" runat="server" Text="开始发布" CssClass="btn btn-primary" OnClientClick="return myfun()" OnClick="btnColumnCreate_Click" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right"><%=lang.Get("M_CreateHtmlContent_selectPart")%>：</td>
                        <td>
                            <asp:Button ID="Button5" runat="server" Text="发布所有栏目" CssClass="btn btn-primary" OnClick="btnCreateColumnAll_Click" />
                        </td>
                    </tr>
                </table>
                <!--end发布内容-->

            </div>
            <div class="tab-pane" id="Tab4">
                <!--start发布单页-->
                <table class="table table-bordered table-hover" align="center" id="crt3" name="crt3">
                    <tr>
                        <td colspan="2" align="center"><%=lang.Get("M_CreateHtmlContent_publishPage")%></td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle"><%=lang.Get("M_CreateHtmlContent_selectASinglePage")%>： </td>
                        <td valign="middle" style="padding: 0px;">
                            <div style="float: left;">
                                <asp:ListBox ID="lbSingle" CssClass="form-control" runat="server" Width="200" Height="220" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                            <div style="margin-top: 100px; float: left;">
                                <asp:Button ID="Button3" Style="margin-left: 10px;" runat="server" Text="开始发布" CssClass="btn btn-primary" OnClientClick="return lbSingleCheck()" OnClick="btnCreateSingle_Click" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right"><%=lang.Get("M_CreateHtmlContent_releaseAllSinglePage")%>：</td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="发布所有单页" CssClass="btn btn-primary" OnClick="btnCreateSingleAll_Click" />
                        </td>
                    </tr>

                </table>
                <!--end发布单页-->
            </div>
            <div class="tab-pane" id="Tab5">
                <!--start发布主题-->
                <table class="table table-bordered table-hover" align="center" id="crt4" name="crt4">
                    <tr>
                        <td colspan="2" align="center"><%=lang.Get("M_CreateHtmlContent_publishThematic")%> </td>
                    </tr>
                    <tr>
                        <td align="right" valign="middle"><%=lang.Get("M_CreateHtmlContent_selectionOfTopics")%>：</td>
                        <td valign="middle" style="padding: 0px;">
                            <div style="float: left;">
                                <asp:ListBox ID="lbSpeacil" CssClass="form-control" runat="server" Width="200" Height="220" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                            <div style="margin-top: 100px; float: left;">
                                <asp:Button ID="btnCreateSpeacil" runat="server" Text="开始发布" CssClass="btn btn-primary" OnClientClick="return lbSpeacilCheck()" OnClick="btnCreateSpeacil_Click" />
                            </div>
                        </td>
                    </tr>
                </table>
                <!--end发布主题-->
            </div>
            <div class="tab-pane" id="Tab6"><!--定时发布-->
                <table class="table table-bordered table-hover" id="crt4" name="crt4">
                    <tr>
                        <td colspan="2" style="text-align:center;">定时发布<a href="SchedTask.aspx">[查看所有任务]</a></td>
                    </tr>
                    <tbody runat="server" id="addBody">
                    <tr>
                        <td colspan="2" style="line-height:34px;">
                            定时发布首页：
                            <select id="scheTime_Sel" name="scheTime_Sel" onchange="switchFunc();">
                                <option value="0">每天</option>
                                <option value="1">每隔</option>
                            </select>
                            <asp:TextBox runat="server" ID="scheTime_T" Width="80" CssClass="form-control"  onfocus="WdatePicker({dateFmt: 'HH:mm', minDate: '0:00:00', maxDate: '25:00:00' })"/>
                            <span id="scheSpan_2" style="display:none;">
                            <asp:TextBox runat="server" ID="scheTime_T2" Width="80" CssClass="form-control"/>分钟(最低可填5分钟)
                            </span>
                        <script type="text/javascript">
                            function switchFunc()
                            {
                                flag = $("#scheTime_Sel").val();
                                switch (flag)
                                {
                                    case "0":
                                        $("#scheTime_T").show();
                                        $("#scheSpan_2").hide();
                                        break;
                                    case "1":
                                        $("#scheTime_T").hide();
                                        $("#scheSpan_2").show();
                                        break;
                                }
                            }
                            function ValidData()
                            {
                                var result = false;
                                var val = "";
                                flag = $("#scheTime_Sel").val();
                                switch (flag) {
                                    case "0":
                                        val = $("#scheTime_T").val().trim();
                                        break;
                                    case "1":
                                        val = $("#scheTime_T2").val().trim();
                                        break;
                                }
                                if (val && val != "") result = true;
                                else
                                    alert("时间不能为空");
                                return result;
                            }
                        </script>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        <asp:Button runat="server" ID="scheSure_Btn" Text="保存" OnClick="scheSure_Btn_Click" OnClientClick="return ValidData();" CssClass="btn btn-primary" ValidationGroup="sch"/></td>
                    </tr>
                    </tbody>
                    <tbody runat="server" id="viewBody" visible="false">
                        <tr>
                            <td colspan="2"><asp:Label runat="server" ID="scheView_L" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!--end生成内容页-->
    <style>
        .spanH30 {
            line-height: 30px;
            margin-right: 5px;
        }
    </style>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle1", "TabTitle2", "TabTitle3", "TabTitle4", "TabTitle5");
        function pload() {
            var ID = '<%=Request.QueryString["id"]%>';
            if (ID != tID) {
                if (document.getElementById(arrTabTitle[ID].toString()) != null) {
                    document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
                }
                if (document.getElementById(arrTabTitle[tID].toString()) != null) {
                    document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                }
            } else {
                if (document.getElementById("TabTitle") != null) {
                    document.getElementById("TabTitle").style.display = "";
                    document.getElementById("TabTitle").className = "titlemouseover";
                }
                tID = ID;
            }
        }
    </script>
    <script type="text/javascript">
        function myfun() {
            if ($("#ColumnList").val() == null || $("#ColumnList").val() == "") {
                alert("请选择栏目");
                return false;
            }
        }

        function lbColumnCheck() {
            if ($("#lbColumn").val() == null || $("#lbColumn").val() == "") {
                alert("请选择栏目");
                return false;
            }
        }

        function lbSingleCheck() {
            if ($("#lbSingle").val() == null || $("#lbSingle").val() == "") {
                alert("请选择单页");
                return false;
            }
        }
        function lbSpeacilCheck() {
            if ($("#lbSpeacil").val() == null || $("#lbSpeacil").val() == "") {
                alert("请选择专题");
                return false;
            }
        }
        function ShowCreate(result, id) {
            HideCreate();
            document.getElementById(result).style.display = "";

            for (var i = 0; i < arrTabTitle.length; i++) {
                if (arrTabTitle[i] == id) {
                    document.getElementById(arrTabTitle[i]).style.display = "";
                    document.getElementById(arrTabTitle[i]).className = "titlemouseover";
                } else {
                    document.getElementById(arrTabTitle[i]).className = "tabtitle";
                }
            }
        }

        function HideCreate() {
            for (i = 1; i < 6; i++) {
                document.getElementById("crt" + i).style.display = "none";
            }
        }
        function ShowMainsgourl(lurl, rurl) {
            parent.parent.frames["left"].location = lurl;
            parent.parent.frames["main_right"].location = rurl; void (0);
        }
    </script>
</asp:Content>
