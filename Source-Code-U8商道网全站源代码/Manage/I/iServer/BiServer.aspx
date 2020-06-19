<%@ page language="C#" autoeventwireup="true" inherits="manage_iServer_BiServer, App_Web_44lcr1l0" masterpagefile="~/Manage/I/Default.master" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=lang.Get("m_BiServer_qa")%></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="input-group" style="width: 200px; position:absolute; top:0px; left:300px;">
        <asp:TextBox ID="TextBox1" runat="server" Text="" class="form-control input-control" placeholder="请输入标题"></asp:TextBox>
        <span class="input-group-btn">
            <button class="btn btn-default" type="submit" onserverclick="Button1_Click" runat="server"><span class="glyphicon glyphicon-search"></span></button>
        </span>
    </div>            
    <div>
        <!-- v3.0.2 -->
        <table class="table">
            <tr>
                <td colspan="2" style="text-align: center">
                    <table class="table table-striped table-bordered table-hover">
                        <tr>
                            <td colspan="2" class="title" align="center"><%=lang.Get("m_BiServer_qa")%></td>
                        </tr>
                        <tr align="left" ondblclick="javascript:window.location.href='BselectiServer.aspx'">
                            <td width="100" align="right"><a href="BselectiServer.aspx"><%=lang.Get("m_BiServer_total")%></a>：</td>
                            <td>
                                <asp:Label ID="lblAllNum" runat="server" Text="0" onmouseover="onUP(this)" onmouseout="onDown(this)"  onclick="jump(this,-1)"></asp:Label>
                                <div id="typeList" class="btn-group" style="margin-left:100px;">
                                    <asp:Repeater ID="repSeachBtn" runat="server">
                                        <ItemTemplate>
                                            <a name="type" href='BselectiServer.aspx?type=<%# returnType(Eval("type")) %>&num=1' target="_self"><%# Eval("type") %></a>&nbsp;&nbsp;
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <a href="BselectiServer.aspx" target="_self">All&gt;&gt;</a>&nbsp;&nbsp;
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                            </td>
                        </tr>
                        <asp:Panel ID="panel_w" runat="server" Visible="false">
                            <tr align="left" ondblclick="javascript:window.location.href='BselectiServer.aspx?num=1'">
                                <td class="TitleTD" align="right">
                                    <a href="BselectiServer.aspx?num=1"><font color="red"><%=lang.Get("m_BiServer_unsolve")%></font></a>：
                                </td>
                                <td>
                                    <asp:Label ID="lblnum_w" runat="server" Text="" onmouseover="onUP(this)" onmouseout="onDown(this)"  onclick="jump(this,1)"></asp:Label>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="panel_ch" runat="server" Visible="false">
                            <tr align="left" ondblclick="javascript:window.location.href='BselectiServer.aspx?num=2'">
                                <td class="TitleTD" align="right">
                                    <a href="BselectiServer.aspx?num=2"><font color="brown"><%=lang.Get("m_BiServer_solve")%></font></a>：
                                </td>
                                <td>
                                    <asp:Label ID="lblNum_ch" runat="server" Text="" onmouseover="onUP(this)" onmouseout="onDown(this)"  onclick="jump(this,2)"></asp:Label>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="panel_y" runat="server" Visible="false">
                            <tr align="left" ondblclick="javascript:window.location.href='BselectiServer.aspx?num=3'">
                                <td class="TitleTD" align="right">
                                    <a href="BselectiServer.aspx?num=3"><font color="green"><%=lang.Get("m_BiServer_solved")%></font></a>：
                                </td>
                                <td>
                                    <asp:Label ID="lblnum_y" runat="server" Text="" onmouseover="onUP(this)" onmouseout="onDown(this)"  onclick="jump(this,3)"></asp:Label>
                                </td>
                            </tr>
                        </asp:Panel>
                    </table>
                    <table class="table table-striped table-bordered">
                        <tr>
                            <td>
                                <ul class="nav nav-tabs" role="tablist" id="myTab">
                                    <li class="active"><a href="#tab1" id="d" onclick="javascript:location.href='BiServer.aspx?num=1'" role="tab" data-toggle="tab">待解决问题</a></li>
                                    <li><a href="#tab2" onclick="javascript:location.href='BiServer.aspx?num=2'" role="tab" data-toggle="tab">处理中问题</a></li>
                                    <li><a href="#tab3" onclick="javascript:location.href='BiServer.aspx?num=3'" role="tab" data-toggle="tab">已经解决问题</a></li>
                                </ul>
                                <br />
                                <asp:Repeater ID="resultsRepeater_w" runat="server">
                                    <HeaderTemplate>
                                        <table class="table table-striped table-bordered table-hover">
                                            <tr align="center">
                                                <th class="title"><%=lang.Get("m_BiServer_num")%></th>
                                                <th class="title"><%=lang.Get("m_BiServer_title")%></th>
                                                <th class="title">提交者</th>
                                                <th class="title"><%=lang.Get("m_BiServer_priority")%></th>
                                                <th class="title"><%=lang.Get("m_BiServer_type")%></th>
                                                <th class="title"><%=lang.Get("m_BiServer_read")%></th>
                                                <th class="title"><%=lang.Get("m_BiServer_submit")%></th>
                                                <th class="title"><%=lang.Get("m_BiServer_status")%></th>
                                                <th class="title"><%=lang.Get("m_BiServer_operate")%></th>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr align="center" ondblclick="javascript:window.location.href='BiServerInfo.aspx?QuestionId=<%#Eval("QuestionId")%>'">
                                            <td>
                                                <%# Eval("QuestionId")%>
                                            </td>
                                            <td>
                                                <a href="BiServerInfo.aspx?QuestionId=<%#Eval("QuestionId")%>">
                                                    <%# ZoomLa.Common.BaseClass.CheckInjection(Eval("Title", "{0}"))%></a>
                                            </td>
                                            <td>
                                                <a onclick="opentitle('/manage/User/Userinfo.aspx?id=<%#Eval("UserId") %>','查看会员')" href="###" title="查看会员"><%#GetUserName(Eval("UserId","{0}"))%></a>
                                            </td>
                                            <td><%# Eval("Priority")%></td>
                                            <td><a href='BselectiServer.aspx?type=<%# returnType(Eval("type")) %>' target="_self"><%# Eval("type") %></a></td>
                                            <td><%# Eval("ReadCount")%></td>
                                            <td><%# Eval("SubTime")%></td>
                                            <td>
                                                <asp:Label ID="lblState" runat="server" ForeColor="Red" Text='<%# Eval("State")%>'></asp:Label>
                                            </td>
                                            <td>
                                                <a href="BiServerInfo.aspx?QuestionId=<%#Eval("QuestionId")%>"><%=lang.Get("m_BiServer_edit")%></a> &nbsp;&nbsp;
                                                    <a href="BIServerDel.aspx?QuestionId=<%#Eval("QuestionId")%>" onclick="return confirm('确认要删除此项?')">
                                                        <%=lang.Get("m_BiServer_del")%></a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript" src="/JS/Dialog.js"></script>
    <script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
    <script  type="text/javascript">
        if (getParam("num")) {
            $("li a[href='#tab" + getParam("num") + "']").parent().addClass("active").siblings("li").removeClass("active");;
        };
        $(function () {
            var num = $("#typeList").find("a[name='type']").length;
            if (parseInt(num) == 0)
                $("#typeList").hide();
        });
        function opentitle(url, title) {
            var diag = new Dialog();
            diag.Width = 600;
            diag.Height = 400;
            diag.Title = title;
            diag.URL = url;
            diag.show();
        };
        function checkAll() {
            xstatus = document.getElementById("cbAll").checked;
            var checkBoxs = document.getElementsByName("Btchk");
            for (i = 0; i < checkBoxs.length; i++) {
                checkBoxs[i].checked = xstatus;
            }

        };
        function isAnyOneChecked() {
            var checkBoxs = document.getElementsByName("Btchk");
            for (i = 0; i < checkBoxs.length; i++) {
                if (checkBoxs[i].checked) return true;
            }
        };
        function jump(obj, num) {
            var name = $(obj).text();
            if (parseInt(name) > 0) {
                if (num > 0)
                    window.location.href = "BselectiServer.aspx?num=" + num;
                else
                    window.location.href = "BselectiServer.aspx";
            }
        };
        function onUP(obj) {
            var name = $(obj).text();
            if (parseInt(name) > 0)
                $(obj).css({ "color": "#428bca", "cursor": "pointer", "text-decoration": "underline" });
            else
                $(obj).css({ "cursor": "default" });
        }
        function onDown(obj) {
            $(obj).css({ "color": "#000", "cursor": "default", "text-decoration": "none" });
        }
    </script>
    <style type="text/css">
        th { text-align: center;}
    </style>
</asp:Content>
