<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_BackupRestore, App_Web_1yaxcbik" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html >
<html>
<head id="Head1" runat="server">
    <title>备份与还原数据</title>
    <link type="text/css" href="/App_Themes/AdminDefaultTheme/Guide.css" rel="stylesheet" />
    <link type="text/css" href="/App_Themes/AdminDefaultTheme/index.css" rel="stylesheet" />
    <link type="text/css" href="/App_Themes/AdminDefaultTheme/main.css" rel="stylesheet" />
    <link type="text/css" href="/Plugins/JqueryUI/ProgressBar/css/demos.css" rel="stylesheet" />
    <link type="text/css" href="/Plugins/JqueryUI/ProgressBar/css/jquery.ui.theme.css" rel="stylesheet" />
    <link type="text/css" href="/Plugins/JqueryUI/ProgressBar/css/jquery.ui.progressbar.css" rel="stylesheet" />
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/Plugins/JqueryUI/ProgressBar/js/jquery-ui.custom.js"></script>
    <style type="text/css">
        .ui-progressbar {
            position: relative;
            top:50%;
        }
        .progress-label {
            position: absolute;
            left: 50%;
            top: 4px;
            font-weight: bold;
            text-shadow: 1px 1px 0 #fff;
        }
    </style>
            <script>
                $(function () {
                    var progressbar = $("#progressbar"),
                        progressLabel = $(".progress-label");

                    progressbar.progressbar({//绑定进度条事件
                        value: false,
                        change: function () {
                            progressLabel.text(progressbar.progressbar("value") + "%");
                        },
                        complete: function () {
                            progressLabel.text("Complete!");
                        }
                    });

                    function progress() {
                        var val = progressbar.progressbar("value") || 0;
                        progressbar.progressbar("value", val + 1);
                    }
                });
                function increase(value) {//后台算出百分比，然后传值前台
                    var progressbar = $("#progressbar")
                    var val = progressbar.progressbar("value") || 0;
                    progressbar.progressbar("value", value);
                    //progressbar.progressbar("value", val + 1);//加1位
                }
                //实时获取进度,后台用异步或线程池
                function ajaxPost(obj, a, val) {//this,actionName,要上传的值,回调方法,是否弹出回复窗(true显示,false不显示)
                    $.ajax({
                        type: "Post",
                        url: "BackupRestore.aspx",
                        data: { action: a, value: val },
                        success: function (data) {
                            if (a == "getProgress" && data == "100") {
                                increase(parseInt(data));
                                clearInterval(interval);
                                alert("压缩完成");
                                location = location;
                            }
                            else {
                                increase(parseInt(data));//必须要转换次，否则返回的字符串变量无用为0%
                            }
                        },
                        error: function (data) {
                        }
                    });
                }
                var interval;
                function beginCheck(request)
                {
                    setTimeout(function () { document.getElementById('SiteBackup').disabled = true; }, 50);
                    $("#progressbar").show();
                    interval = setInterval(function () { ajaxPost(this, request, '') }, 1000);
                }//实时获取后台进度
</script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="HdnPath" runat="server" />
        <div class="r_navigation">
            <%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
            <div id="help"><a onclick="help_show('69')" title="帮助"></a></div>
            <%} %>
            <a href="/manage/">后台管理</a> &gt;&gt;扩展功能&gt;&gt;<a href="RunSql.aspx">开发中心</a>&gt;&gt;<a href="DatalistProfile.aspx"> 系统概况</a>&gt;&gt; <a href="BackupRestore.aspx">备份与还原数据</a>
        </div>
        <%--    <div class="spacingtitle">
        备份与还原数据库</div>--%>
        <table width="100%" cellpadding="0" cellspacing="1" border="0" class="border"
            align="center">
            <tr class="gridtitle" align="center" style="height: 24px">
                <td>文件名
                </td>
                <td style="width: 15%">大小
                </td>
                <td style="width: 20%">创建时间
                </td>
                <td style="width: 25%">操作
                </td>
            </tr>
            <asp:Repeater ID="RptFiles" runat="server" OnItemCommand="RptFiles_ItemCommand">
                <ItemTemplate>
                    <tr style="height: 24px" class="tdbg"
                        onmouseover="this.className='tdbgmouseover';"
                        onmouseout="this.className='tdbg';">
                        <td align="left">
                            <%# System.Convert.ToInt32(Eval("type")) == 1 ? "<img src='/App_Themes/AdminDefaultTheme/Images/Folder/mfolderclosed.gif'>" : GetShowExtension(Eval("content_type").ToString())%>
                            <% if ((Request.QueryString["Type"] == "video") || (Request.QueryString["Type"] == "music"))
                               { %>
                            <%# System.Convert.ToInt32(Eval("type")) == 1 ? "<a href='CloudManage.aspx?Type="+Request["Type"]+"&Dir=" + Server.UrlEncode(GetPath()) + "'>" + 
Eval("Name").ToString() + "</a>" : "<a href='javascript:open(\""+GetPath()+"\");'>" + Eval("Name").ToString() + "</a>"%>
                            <%}
                               else
                               { %>
                            <%# (Eval("content_type").ToString() == "jpg" || Eval

("content_type").ToString() == "png" || Eval("content_type").ToString() == "gif" || Eval

("content_type").ToString() == "bmp") ? "<a href='javascript:open(\"" + GetPath() + "\");'>" + 

Eval("Name").ToString() + "</a>" : System.Convert.ToInt32(Eval("type")) == 1 ? "<a href='CloudManage.aspx?Type=" + Request["Type"] + "&Dir=" + Server.UrlEncode(GetPath()) + "'>" + 
Eval("Name").ToString() + "</a>" :  Eval("Name").ToString() %>
                            <%} %>
                        </td>
                        <td align="center">
                            <%# GetSize(Eval("size").ToString())%>
                        </td>
                        <td align="center">
                            <%# Eval("createTime")%>
                        </td>
                        <td align="center"> 
                            <asp:LinkButton ID="LinkButton1" CommandName='Down'
                                CommandArgument='<%# Eval("Name")%>' OnClientClick="if(!this.disabled) return confirm('是否继续下载？');" runat="server">[下载]</asp:LinkButton>

                            [<asp:LinkButton ID="LbtnDelList" CommandName='<%# 
System.Convert.ToInt32(Eval("type")) == 1 ? "DelDir":"DelFiles" %>'
                                CommandArgument='<%# Eval("Name")%>' OnClientClick="if(!this.disabled) return confirm('确定要删除吗？');" runat="server">删除</asp:LinkButton>]
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
          <div class="spacingtitle">数据库备份</div>
        <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" align="center">
            <tr class="tdbg">
                <td class="tdbgleft" style="width: 350px; text-align: left;">数据库的保存名字：
                </td>
                <td>
                    <asp:TextBox ID="DatabasePath" class="l_input" Width="200" Height="20" Font-Size="11" runat="server"></asp:TextBox>&nbsp;* 默认为网站根目录下的temp目录
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft" style="width: 350px; text-align: left;">数据库操作：
                </td>
                <td><asp:Button ID="Backup" runat="server" Text="备份数据库" class="C_input" OnClick="Backup_Click" />
                <asp:Button ID="Restore" runat="server" Text="还原数据库" class="C_input" OnClick="Restore_Click" />
                    </td>
            </tr>
        </table>
                  <div class="spacingtitle">全站备份</div>
        <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" align="center">
            <tr class="tdbg">
                <td class="tdbgleft" style="width: 350px; text-align: left;">备份名：
                </td>
                <td>
                    <asp:TextBox ID="SiteText" class="l_input" Width="200" Height="20" Font-Size="11" runat="server" />&nbsp;* 默认为网站根目录下的temp目录
                </td>
            </tr>
            <tr class="tdbg">
                <td class="tdbgleft" style="width: 350px; text-align: left;">操作：
                </td>
                <td><asp:Button ID="SiteBackup" runat="server" Text="开始备份" class="C_input" OnClick="SiteBackup_Click" 
                     OnClientClick="if(confirm('要备份全站文件吗?')){setTimeout(function () { document.getElementById('SiteBackup').disabled = true;},50)}else{return false;}" />
                </td>
            </tr>
        </table>
        <div id="progressbar" style="width:50%;display:none;"><div class="progress-label" >压缩进度</div></div>
        <div style="color:#f00; line-height:25px; padding-left:20px;"><asp:Label ID="runResult" runat="server" Visible="false" Text="还原数据库需如下操作：<br />1.断开数据库连接，因数据库有可能正在运行；<br />2.选择还原数据源；<br />3.删除数据库绑定的专属用户；<br />4.重新绑定用户。<br />* *如有问题可联系管理员进行还原。**" ></asp:Label></div>
    </form>
</body>
</html>
