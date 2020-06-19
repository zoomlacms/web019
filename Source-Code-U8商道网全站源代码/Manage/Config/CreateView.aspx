<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_CreateView, App_Web_swkw1mwp" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>创建视图</title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="r_navigation"><%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('71')" title="帮助"></a></div>
  <%} %>后台管理&gt;&gt;扩展功能&gt;&gt;开发者中心&gt;&gt;<label id="lbBan" runat="server">创建视图</label></div>

        <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
            <tr class="tdbg"> 
                <td class="spacingtitle" colspan="2" align="center">
                <table  width="100%">
                    <tr>
                        <td  align="center"><label id="lbTag" runat="server">创建视图</label></td>
                        <td width="40"></td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 80px"><strong>视图名：</strong></td>
                <td>
                    ZL_V_<input type="text" id="txtVName" runat="server" />
                    <asp:Button ID="CheckName" runat="server" Text="检测视图名" CssClass="C_input" OnClick="CheckName_Click"/>
                    <label id="lbCheck" runat="server" visible="false"></label>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 80px"><strong>选择数据表：</strong></td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:ListBox ID="ListBox1" runat="server" Height="100px" Width="200px" SelectionMode="Multiple"></asp:ListBox>
                                <asp:Button ID="BtnAdd" runat="server" Text="确认 > >" CssClass="C_input" OnClick="BtnAdd_Click" />
                            </td>
                            <td>
                                
                            </td>
                            <%--<td>
                                <asp:ListBox ID="ListBox2" runat="server" Height="220px" Width="200px" SelectionMode="Multiple"></asp:ListBox>
                                
                            </td>--%>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 80px">选择数据：</td>
                <td>
                    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                            <div style=" float:left;width:220px; margin-top:10px;">
                                <ul>
                                    <li style=" background-color:#9AC7F0;"><strong style="width:165px;overflow:hidden;"><%#Eval("tableName") %></strong><input type="hidden" runat="server" id="tN" value='<%#Eval("tableName") %>'  />
                                        <div style="float:right;"><asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" OnClientClick="return confirm('你确认要移除该表吗？')">移除</asp:LinkButton></div>
                                    </li>
                                    <li>
                                        <asp:ListBox ID="ListBox3" runat="server" Height="100px" Width="100%" SelectionMode="Multiple"></asp:ListBox>
                                    </li>
                                    <%--<li style=" background-color:#9AC7F0;">
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del" CommandArgument='<%#Eval("tableName") %>' OnClientClick="return confirm('你确认要移除该表吗？')">移除</asp:LinkButton>
                                    </li>--%>
                                </ul>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <%--<tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 80px">选择数据：</td>
                <td>
                    <table width="520px" border="0" cellpadding="0" cellspacing="1" class="border" align="left">
                        <tr class="gridtitle" align="center" style="height: 25px;">
                            <td class="auto-style2">
                                表名
                            </td>
                            <td width="35%">
                                显示字段
                            </td>
                            <td width="10%">
                                操作
                            </td>
                        </tr>
                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
                            <ItemTemplate>
                                <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                                    <td align="center"><%#Eval("tableName") %><input type="hidden" runat="server" id="tN" value='<%#Eval("tableName") %>'  /></td>
                                    <td align="center">
                                        <asp:ListBox ID="ListBox3" runat="server" Height="100px" Width="100%" SelectionMode="Multiple"></asp:ListBox>
                                    </td>
                                    <td align="center">
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del" CommandArgument='<%#Eval("tableName") %>' OnClientClick="return confirm('你确认要移除该表吗？')">移除</asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>    
                </td>
            </tr>--%>
            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 120px">
                    <strong>连接条件(可为空)：</strong>
                    <p></p>
                </td>
                <td>
                    <textarea runat="server" id="taWhere" style="width: 800px;height:50px"></textarea>
                    <p>连接条件格式为： 表1.字段名=表2.字段名 and 表3.字段=表4.字段名，依次类推</p>
                </td>
            </tr>
            
            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 80px"><strong>SQL语句：</strong></td>
                <td>
                    <textarea runat="server" id="taSQL" readonly="readonly" style="width: 800px;height:100px"></textarea>
                    <asp:Button ID="BtnSQL" runat="server" Text="预览SQL" CssClass="C_input" OnClick="BtnSQL_Click" />
                </td>
            </tr>

            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 80px"><strong>视图说明(选填)：</strong></td>
                <td>
                    功能：<input type="text" runat="server" id="explain" />
                   <%-- 二字查询关键字：<input type="text" runat="server" id="secshort" />三字查询关键字：<input type="text" runat="server" id="thrshort" />--%>
                </td>
            </tr>

            <tr class="tdbg">
                <td class="tdbgleft" align="right" style="width: 80px"></td>
                <td><asp:Button ID="BtnSub" runat="server" Text="生成视图" CssClass="C_input" OnClick="BtnSub_Click" />
                    <%--window.history.go(-1);window.location.reload()“>
                    <a href="ViewList.aspx" target="_self">取消</a>--%>
                    <input type="button" class="C_input" onclick="window.location.href('ViewList.aspx');" value="取消" />
                    <%--<input type="button" class="C_input" onclick="window.history.go(-1); window.location.reload();" value="取消" />--%>
                </td>
            </tr>
        </table>

        <%--<table style="width: 100%;margin-top:20px;" cellpadding="2" cellspacing="1" class="border">
            <tr class="tdbg"> 
                <td class="spacingtitle" colspan="2" align="center">
                <table  width="100%">
                    <tr>
                        <td  align="center">视图列表</td>
                        <td width="40"></td>
                    </tr>
                </table>
                </td>
            </tr>

            <tr class="tdbg">
                <td class="tdbg" align="left" colspan="2">
                    <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound" OnItemCommand="Repeater2_ItemCommand">
                        <ItemTemplate>
                            <div style=" float:left;width:220px; margin-top:10px;">
                                <ul>
                                    <li align="center" style=" background-color:#9AC7F0;">
                                        <strong style="width:165px;overflow:hidden;"><%#Eval("ViewName") %></strong><input type="hidden" runat="server" id="tN" value='<%#Eval("ViewName") %>'  />
                                        <div style="float:right;"><asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" OnClientClick="return confirm('你确认要删除该视图吗？')">删除</asp:LinkButton></div>
                                    </li>
                                    <li align="center">
                                        <asp:ListBox ID="ListBox3" runat="server" Height="100px" Width="100%" SelectionMode="Multiple"></asp:ListBox>
                                    </li>
                                </ul>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
        </table>--%>
        <%--<br /><br /><br />--%>
    </form>
</body>
</html>
