<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa_WebSite_Manages_Worktable, App_Web_avkgoiyo" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%--<%@ OutputCache Duration="6000" VaryByParam="*" %>--%>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title><%=lang.Get("m_Worktables_mytable")%></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--[if lt IE 9]>
	    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <link type="text/css" href="/App_Themes/ICMS/V3.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
    <style type="text/css">
        Input { font-family: verdana; font-size: 9pt; text-decoration: none; background-color: #FFFFFF; height: 20px; border: 1px solid #666666; color: #000000; }
        .Title { font-family: verdana; font-size: 11pt; font-weight: normal; height: 24px; text-align: center; color: #333333; text-decoration: none; background-color: #A4B9D7; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: 1px; border-top-color: #999999; border-right-color: #999999; border-bottom-color: #999999; border-left-color: #999999; }
    </style>
    <script type="text/javascript">
        var months = new Array("一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二");
        var daysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
        var days = new Array("日", "一", "二", "三", "四", "五", "六");
        var classTemp;
        var today = new getToday();
        var year = today.year;
        var month = today.month;
        var newCal;
        function getDays(month, year) {
            if (1 == month) return ((0 == year % 4) && (0 != (year % 100))) || (0 == year % 400) ? 29 : 28;
            else return daysInMonth[month];
        }
        function getToday() {
            this.now = new Date();
            this.year = this.now.getFullYear();
            this.month = this.now.getMonth();
            this.day = this.now.getDate();
        }
        function Calendar() {
            newCal = new Date(year, month, 1);
            today = new getToday();
            var day = -1;
            var startDay = newCal.getDay();
            var endDay = getDays(newCal.getMonth(), newCal.getFullYear());

            var daily = 0;
            if ((today.year == newCal.getFullYear()) && (today.month == newCal.getMonth())) {
                day = today.day;
            }
            var caltable = window.document.getElementById("calendar");

            var intDaysInMonth = getDays(newCal.getMonth(), newCal.getFullYear());

            for (var intWeek = 0; intWeek < caltable.rows.length; intWeek++)

                for (var intDay = 0; intDay < caltable.rows[intWeek].cells.length; intDay++) {
                    var cell = caltable.rows[intWeek].cells[intDay];
                    var montemp = (newCal.getMonth() + 1) < 10 ? ("0" + (newCal.getMonth() + 1)) : (newCal.getMonth() + 1);
                    if ((intDay == startDay) && (0 == daily)) { daily = 1; }
                    var daytemp = daily < 10 ? ("0" + daily) : (daily);
                    var d = "<" + newCal.getFullYear() + "-" + montemp + "-" + daytemp + ">";
                    if (day == daily) cell.className = "DayNow";
                    else if (intDay == 6) cell.className = "DaySat";
                    else if (intDay == 0) cell.className = "DaySun";
                    else cell.className = "Day";
                    if ((daily > 0) && (daily <= intDaysInMonth)) {
                        cell.innerHTML = daily;
                        daily++;
                    } else {
                        cell.className = "CalendarTD";
                        cell.innerHTML = "";
                    }
                }
            document.getElementById("year").value = year;
            document.getElementById("month").value = month + 1;
        }
        function subMonth() {
            if ((month - 1) < 0) {
                month = 11;
                year = year - 1;
            } else {
                month = month - 1;
            }
            Calendar();
        }
        function addMonth() {
            if ((month + 1) > 11) {
                month = 0;
                year = year + 1;
            } else {
                month = month + 1;
            }
            Calendar();
        }
        function setDate() {
            if (document.getElementById("month").value < 1 || document.getElementById("month").value > 12) {
                alert("月的有效范围在1-12之间!");
                return;
            }
            year = Math.ceil(document.getElementById("year").value);
            month = Math.ceil(document.getElementById("month").value - 1);
            Calendar();
        }
        window.onload = function () { document.getElementById("times").innerHTML = (new Date().getHours() < 10 ? "0" + new Date().getHours().toString() : new Date().getHours().toString()) + ":" + (new Date().getMinutes() < 10 ? "0" + new Date().getMinutes().toString() : new Date().getMinutes().toString()) + ":" + (new Date().getSeconds() < 10 ? "0" + new Date().getSeconds() : new Date().getSeconds().toString()); }
        setInterval(function () { document.getElementById("times").innerHTML = (new Date().getHours() < 10 ? "0" + new Date().getHours().toString() : new Date().getHours().toString()) + ":" + (new Date().getMinutes() < 10 ? "0" + new Date().getMinutes().toString() : new Date().getMinutes().toString()) + ":" + (new Date().getSeconds() < 10 ? "0" + new Date().getSeconds() : new Date().getSeconds().toString()); }, 1000);
        function getinfo(id) {
            location.href = "../AddOn/ProjectsDetail.aspx?ProjectID=" + id + "";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <ol class="breadcrumb navbar-fixed-top" runat="server" id="BreadNav" style="margin-bottom:10px;">
            <li><a href="../I/Main.aspx" style="color:#428bca;">工作台</a></li>
            <li class="active">版本信息&nbsp;&nbsp;
                <%=lang.Get("m_Worktables_welcome")%><strong><asp:Literal runat="server" ID="litUserName"></asp:Literal></strong>&nbsp;<%=lang.Get("m_Worktables_today")%>:
                <asp:Literal runat="server" ID="litDate"></asp:Literal><span id="times" name="times"></span>
            </li>
            <%= Call.GetHelp(1) %>
        </ol>
        <div class="panel panel-primary" style="margin-bottom:10px;margin-top:50px;">
            <div class="panel-heading"><%=lang.Get("m_Worktables_welcometo")%><%:Call.SiteName %><%=lang.Get("m_Worktables_system")%>，<asp:Label ID="Version" runat="server"></asp:Label>。</div>
            <div class="panel-body">
                <table id="ShortCutTable" style="width:550px;" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="text-center"><a href="../I/Config/SiteInfo.aspx"><img src="../../App_Themes/AdminDefaultTheme/Images/System1.png" alt="网站配置" /></a></td>
                        <td class="text-center"><a href="../I/Content/ModelManage.aspx"><img src="../../App_Themes/AdminDefaultTheme/images/System2.png" alt="内容模型管理" /></a></td>
                        <td class="text-center"><a href="../I/Content/NodeManage.aspx"><img src="../../App_Themes/AdminDefaultTheme/Images/System3.png" alt="节点设置" /></a></td>
                        <td class="text-center"><a href="../I/Template/LabelManage.aspx"><img src="../../App_Themes/AdminDefaultTheme/Images/System4.png" alt="标签设置" /></a></td>
                        <td class="text-center"><a href="../I/Template/TemplateSet.aspx"><img src="../../App_Themes/AdminDefaultTheme/Images/System5.png" alt="模板设置" /></a></td>
                        <td class="text-center"><a href="../I/User/AdminManage.aspx"><img src="../../App_Themes/AdminDefaultTheme/Images/System8.png" alt="安全设定" /></a></td>
                        <td class="text-center"><a href="../I/Content/ContentManage.aspx"><img src="../../App_Themes/AdminDefaultTheme/Images/system13.png" alt="内容管理" /></a></td>
                    </tr>
                    <tr>
                        <td class="text-center"><a href="../I/Config/SiteInfo.aspx" target="_self"><%=lang.LF("网站配置")%></a></td>
                        <td class="text-center"><a href="../I/Content/ModelManage.aspx" target="_self"><%=lang.LF("内容模型管理")%></a></td>
                        <td class="text-center"><a href="../I/Content/NodeManage.aspx" target="_self"><%=lang.LF("节点设置")%></a></td>
                        <td class="text-center"><a href="../I/Template/LabelManage.aspx" target="_self"><%=lang.LF("标签设置")%></a></td>
                        <td class="text-center"><a href="../I/Template/TemplateSet.aspx" target="_self"><%=lang.LF("模板设置")%></a></td>
                        <td class="text-center"><a href="../I/User/AdminManage.aspx" target="_self"><%=lang.LF("安全设定")%></a></td>
                        <td class="text-center"><a href="../I/Content/ContentManage.aspx" target="_self"><%=lang.LF("内容管理")%></a></td>
                    </tr>
                </table>
            </div>
        </div>
        <table style="width:100%;">
            <tr>
                <td style="width:322px; text-align:left;">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <asp:Label ID="LblTitle" runat="server" Text="日历" Font-Bold="True"></asp:Label><a href="../../Common/SelectChinaDay.html">[<%=lang.LF("万年历")%>]</a>
                        </div>
                        <div class="panel-body" style="height:310px;">
                            <script type="text/javascript">
                                function getEvent() {
                                    if (document.all) {
                                        return window.event; //如果是ie
                                    }
                                    func = getEvent.caller;
                                    while (func != null) {
                                        var arg0 = func.arguments[0];
                                        if (arg0) {
                                            if ((arg0.constructor == Event || arg0.constructor == MouseEvent) || (typeof (arg0) == "object" && arg0.preventDefault && arg0.stopPropagation)) {
                                                return arg0;
                                            }
                                        }
                                        func = func.caller;
                                    }
                                    return null;
                                }
                                function buttonOver() {
                                    var evt = getEvent();
                                    var obj = evt.srcElement || evt.target;
                                    obj.style.cssText = " background-color:#FFFFFF;";
                                }

                                function buttonOut() {
                                    var obj = window.event.srcElement;
                                    obj.style.cssText = "";
                                }
                            </script>
                            <table class="table table-striped table-bordered" id="caltable" name="caltable" style="margin-bottom:0px;">
                                <thead>
                                    <tr style="vertical-align: middle; text-align: center;">
                                        <td colspan="7" style="line-height:34px;">
                                            <a href="javaScript:subMonth();" title="上一月" class="DayButton"><%=lang.Get("m_Worktables_last")%></a>
                                            <input name="year" id="year" class="form-control" type="text" style="text-align:center;width: 65px; display: inline;" size="4" maxlength="4" onkeydown="if (event.keyCode==13){setDate()}" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onpaste="this.value=this.value.replace(/[^0-9]/g,'')" />
                                            <%=lang.Get("m_Worktables_year")%>
                                            <input name="month" id="month" type="text" class="form-control" style="text-align:center;width: 45px; display: inline;" size="1" maxlength="2" onkeydown="if (event.keyCode==13){setDate()}" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onpaste="this.value=this.value.replace(/[^0-9]/g,'')" />
                                            <%=lang.Get("m_Worktables_month")%> <a href="JavaScript:addMonth();" title="下一月" class="DayButton"><%=lang.Get("m_Worktables_next")%></a></td>
                                    </tr>
                                    <tr style="vertical-align: middle; text-align: center;">
                                        <script>
                                            document.write("<td class=\"DaySunTitle\" id=\"diary\" name=\"diary\" >" + days[0] + "</td>");
                                            for (var intLoop = 1; intLoop < days.length - 1; intLoop++) {
                                                document.write("<td class=\"DayTitle\" id=\"diary\" name=\"diary\">" + days[intLoop] + "</td>");
                                            }
                                            document.write("<td class=\"DaySatTitle\" id=\"diary\" name=\"diary\" >" + days[intLoop] + "</td>");
                                        </script>
                                    </tr>
                                </thead>
                                <tbody style="border: 1;" id="calendar" name="calendar" class="text-center">
                                    <script type="text/javascript">
                                        for (var intWeeks = 0; intWeeks < 6; intWeeks++) {
                                            document.write("<TR style=\"cursor: hand\">");
                                            for (var intDays = 0; intDays < days.length; intDays++) document.write("<TD class=\"CalendarTD\" onMouseover=\"buttonOver();\" onMouseOut=\"buttonOut();\"></TD>");
                                            document.write("</TR>");
                                        }
                                    </script>
                                </tbody>
                            </table>
                            <script type="text/javascript">
                                Calendar();
                            </script>
                        </div>
                    </div>
                </td>
                <td style="padding-left:1px;vertical-align:top;">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center"><asp:Label ID="Label1" runat="server" Font-Bold="True"><%=lang.Get("m_Worktables_memorandum")%></asp:Label></div>
                        <div class="panel-body" style="height:310px;">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="TbRemmber" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="11" Style="height: 243px;max-width:100%;" Columns="50" AutoPostBack="true" OnTextChanged="AutoSave"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />
                            <font color="red">*<%=lang.Get("m_Worktables_prompt")%>:<%=lang.Get("m_Worktables_enter")%><a href="../AddOn/ProjectAffairsCenter.aspx">[<%=lang.Get("m_Worktables_center")%>]</a><%=lang.Get("m_Worktables_exchage")%></font>
                            <br />
                        </div>
                    </div>
                 </td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td style="width: 320px">
                    <table class="table table-striped table-bordered">
                        <tr class="title">
                            <td class="text-left" colspan="2">&nbsp;<b><%=lang.LF("浏览信息")%></b>
                               <a href="../I/Common/SystemFinger.aspx" title="服务器信息总览" style="float:right;">信息总览</a>
                            </td>
                        </tr>
                        <tr class="sysinfo">
                            <td>
                                <iframe id="showiframe" src="../BrowserCheck.aspx" marginwidth="1" marginheight="1" scrolling="no" frameborder="0" style="width:100%;border:none;"></iframe>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="padding-left:1px;vertical-align:top;"></td>
            </tr>
        </table>
        <script>
            $('#element').popover('hide');
        </script>
    </form>
</body>
</html>
