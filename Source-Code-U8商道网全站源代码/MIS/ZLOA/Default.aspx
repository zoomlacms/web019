<%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_Default, App_Web_kty3igex" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="CSS/ZLOA.css" rel="stylesheet" type="text/css" />
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
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
    //window.onload = function () { document.getElementById("times").innerHTML = (new Date().getHours() < 10 ? "0" + new Date().getHours().toString() : new Date().getHours().toString()) + ":" + (new Date().getMinutes() < 10 ? "0" + new Date().getMinutes().toString() : new Date().getMinutes().toString()) + ":" + (new Date().getSeconds() < 10 ? "0" + new Date().getSeconds() : new Date().getSeconds().toString()); }
    //setInterval(function () { document.getElementById("times").innerHTML = (new Date().getHours() < 10 ? "0" + new Date().getHours().toString() : new Date().getHours().toString()) + ":" + (new Date().getMinutes() < 10 ? "0" + new Date().getMinutes().toString() : new Date().getMinutes().toString()) + ":" + (new Date().getSeconds() < 10 ? "0" + new Date().getSeconds() : new Date().getSeconds().toString()); }, 1000);
    function HideDiv(div_id) {
        $("#" + div_id).animate({ opacity: "hide" }, 300);
    }
    function ShowDiv(div_id) {
        var div_obj = $("#" + div_id);
        div_obj.animate({ opacity: "show", right: 0, bottom: 0, width: div_obj.width, height: div_obj.height }, 1000);
    }

    $().ready(function () {
        setTimeout("ShowDiv('TimeDiv')", 600);
    });
    function showMain(url)
    {
        $("#main_right").attr("src",url);
    }
</script>
<style>
.Calendar { font-family: verdana; text-decoration: none; width: 100%; background-color: #C0D0E8; font-size: 9pt; border: 0px dotted #1C6FA5; }
.CalendarTD { font-family: verdana; font-size: 7pt; color: #000000; background-color: #f6f6f6; height: 20px; width: 11%; text-align: center; }
.Title { font-family: verdana; font-size: 11pt; font-weight: normal; height: 24px; text-align: center; color: #333333; text-decoration: none; background-color: #A4B9D7; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-bottom-style: 1px; border-top-color: #999999; border-right-color: #999999; border-bottom-color: #999999; border-left-color: #999999; }
.Day { font-family: verdana; font-size: 8pt; color: #243F65; background-color: #E5E9F2; height: 20px; width: 11%; text-align: center; }
.DaySat { font-family: verdana; font-size: 8pt; color: #FF0000; text-decoration: none; background-color: #E5E9F2; text-align: center; height: 18px; width: 12%; }
.DaySun { font-family: verdana; font-size: 8pt; color: #FF0000; text-decoration: none; background-color: #E5E9F2; text-align: center; height: 18px; width: 12%; }
.DayNow { font-family: verdana; font-size: 8pt; font-weight: bold; color: #000000; background-color: #FFFFFF; height: 20px; text-align: center; }
.DayTitle { font-family: verdana; font-size: 9pt; color: #000000; background-color: #C0D0E8; height: 20px; width: 11%; text-align: center; }
.DaySatTitle { font-family: verdana; font-size: 9pt; color: #FF0000; text-decoration: none; background-color: #C0D0E8; text-align: center; height: 20px; width: 12%; }
.DaySunTitle { font-family: verdana; font-size: 9pt; color: #FF0000; text-decoration: none; background-color: #C0D0E8; text-align: center; height: 20px; width: 12%; }
.DayButton { font-size: 9pt; font-weight: bold; color: #243F65; cursor: hand; text-decoration: none; }
.r_navigation{ margin-bottom:3px;line-height: 24px;border: 1px solid #4197E2;background: url(../../App_Themes/AdminDefaultTheme/images/localGIF.gif) 10px center #C7E0F6 no-repeat; padding-left:25px;clear: both; }
.r_navdv{ width:100%; font-size:12px;}
.select{ border-top-left-radius:0;border-bottom-left-radius:0;}
</style>
<title>OA办公首页</title>
</head>
<body>
<form id="form1" runat="server">
<div class="oatop">
    <div id="logo" class="pull-left"><a href="/MIS/ZLOA/"><img src="images/logo.png" alt="南昌大学第二附属医院"/></a></div>
    <div class="system pull-left"><span>OA办事系统</span></div>
    <div class="informtion pull-left"><p>耳鼻咽喉-头颈外科|李小明
        <script type="text/javascript">
            writeDate();
            function writeDate() {
                var week;
                if (new Date().getDay() == 0) week = "星期日"
                if (new Date().getDay() == 1) week = "星期一"
                if (new Date().getDay() == 2) week = "星期二"
                if (new Date().getDay() == 3) week = "星期三"
                if (new Date().getDay() == 4) week = "星期四"
                if (new Date().getDay() == 5) week = "星期五"
                if (new Date().getDay() == 6) week = "星期六"
                document.write(new Date().getFullYear() + "年" + (new Date().getMonth() + 1) + "月" + new Date().getDate() + "日 " + week);
            }
        </script><br />今日值班：胡大宝</p></div>
    <div class="set pull-right" style="width:400px;">
        <ul>
            <li class="setli"><a href="javascript:;" onclick="showMain('/User/Info/UserBase.aspx');">个人设置</a></li>
            <li class="useli"><a href="javascript:;">使用反馈</a></li>
            <li class="helpli"><a href="javascript:;">使用帮助</a></li>
            <li class="logout"><a href="javascript:;">退出系统</a></li>
        </ul>
        <%--<div class="input-group pull-right" style="width:300px;margin-top:24px;">
            <asp:TextBox ID="TextBox1" CssClass="form-control pull-left" runat="server" Width="150"></asp:TextBox>
            <span class="input-group-btn" style="width:150px;">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control pull-left select" data-container="body" Width="100">
                    <asp:ListItem Value="1">员工姓名</asp:ListItem>
                    <asp:ListItem Value="2">员工ID</asp:ListItem>
                </asp:DropDownList>
                <button class="btn btn-primary pull-left" type="button"><span class="glyphicon glyphicon-search"></span></button>
            </span>
        </div>--%>
    </div>
    <!-- /input-group -->
    <div class="clearfix"></div>
</div>
<div class="oanav">
    <div>
        <ul>
            <li class="navhome"><a href="Default.aspx">首页</a></li>
            <li class="navtong"><a href="javascript:;" onclick="showMain('Mail/Message.aspx?view=1');">沟通</a></li>
            <li class="navhui"> <a href="javascript:;" onclick="showMain('Mail/Message.aspx?view=1');">会议</a></li>
            <li class="navgong"><a href="javascript:;" onclick="showMain('Default');">工作台</a></li>
            <li class="navuser"><a href="javascript:;" onclick="showMain('/User/Default.aspx');">会员</a></li>
            <li class="navnus"> <a href="javascript:;" onclick="showMain('ContentManage.aspx?NodeID=100');">护理</a></li>
            <li class="navtask"><a href="javascript:;" onclick="showMain('/Mis/Task/');">任务管理器</a></li>
            <li class="navsign"><a href="javascript:;" onclick="showMain('/Mis/MisAttendance.aspx');">签到管理</a></li>
        </ul>
    </div>
</div>
<div class="oamain">
    <table style="width:100%;" cellPadding="0" cellSpacing="0">
        <tr>
            <td style="width: 195px; background-image: none; background-attachment: scroll; background-repeat: repeat; background-position-x: 0%; background-position-y: 0%; background-size: auto; background-origin: padding-box; background-clip: border-box; background-color: rgb(207, 232, 254);" valign="top"><div class="oamain_left pull-left">
        <div class="left_user">
            <div class="userimg pull-left"><img src="images/userimg.jpg" alt="" runat="server" id="faceImg" /></div>
            <div class="userinfo pull-right" style="margin-right:15px;">
                <span><strong>用户名称：<asp:Label runat="server" ID="userNameL" /></strong></span><br />
                <span>所属部门：<asp:Label runat="server" ID="userGNL" /></span><br />
                <span>会员编号：<asp:Label runat="server" ID="userIDL" /></span>
            </div>
            <table style="width:100%;" class="border">
                <tr align="left">
                    <td colspan="2" class="spacingtitle"><asp:Label ID="LblTitle" runat="server" Text="日历" Font-Bold="True"></asp:Label><a href="../../Common/SelectChinaDay.html">[<%=lang.Get("m_Worktables_calendar")%>]</a></td>
                </tr>
                <tr class="tdbg">
                    <td class="tdbgleft" colspan="2" align="left">
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
                                //obj.runtimeStyle.cssText = "background-color:#FFFFFF";
                            }

                            function buttonOut() {
                                var obj = window.event.srcElement;
                                //window.setTimeout(function() { obj.runtimeStyle.cssText = ""; }, 300);
                            }
                        </script>
                        <table border="0" cellpadding="0" cellspacing="1" class="Calendar" id="caltable" name="caltable">
                            <tr align="center" valign="middle">
                            <td colspan="7" class="title"><a href="javaScript:subMonth();" title="上一月" class="DayButton"><%=lang.Get("m_Worktables_last")%></a>
                                <input name="year" id="year" type="text" size="4" maxlength="4" onkeydown="if (event.keyCode==13){setDate()}"  onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onpaste="this.value=this.value.replace(/[^0-9]/g,'')" style="height:25px;line-height:25px;text-align:center;" />
                                <%=lang.Get("m_Worktables_year")%>
                                <input name="month" id="month" type="text" size="1" maxlength="2" onkeydown="if (event.keyCode==13){setDate()}"  onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onpaste="this.value=this.value.replace(/[^0-9]/g,'')" style="height:25px;line-height:25px;text-align:center;" />
                                <%=lang.Get("m_Worktables_month")%> <a href="JavaScript:addMonth();" title="下一月" class="DayButton"><%=lang.Get("m_Worktables_next")%></a></td>
                        </tr>
                            <tr align="center" valign="middle"> 
            <script language="JavaScript">
                document.write("<TD class=\"DaySunTitle\" id=\"diary\" name=\"diary\" >" + days[0] + "</TD>");
                for (var intLoop = 1; intLoop < days.length - 1; intLoop++) {
                    document.write("<TD class=\"DayTitle\" id=\"diary\" name=\"diary\">" + days[intLoop] + "</TD>");
                }
                document.write("<TD class=\"DaySatTitle\" id=\"diary\" name=\"diary\" >" + days[intLoop] + "</TD>");
            </script> 
                        </tr>
                        <tbody style="border: 1;" id="calendar" name="calendar" align="CENTER" onclick="showMain('/Mis/Daily/Default.aspx');">
            <script language="JavaScript">
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
                    </td>
                </tr>
            </table>
            <script type="text/javascript">
                function hideC(obj) {
                    $(obj).hide().siblings().show();
                    $p = $(obj).parent().parent().parent();
                    $p.find("div.content").hide("fast");
                }
                function showC(obj)
                {
                    $(obj).hide().siblings().show();
                    $p = $(obj).parent().parent().parent();
                    $p.find("div.content").show("fast");
                }
                function closeDiv(obj) {
                    $p = $(obj).parent().parent().parent();
                    $p.hide("fast");
                }
            </script>
            <div class="clearfix"></div>
            <div class="duty">
                <div class="duty_t">
                    <div class="duty_tp">
                        <span class="fork pull-right" onclick="closeDiv(this);"></span>
                        <span class="oaarrow pull-right" onclick="hideC(this);"></span>
                        <span class="oaarrowDown pull-right" style="display:none;" onclick="showC(this);"></span>
                        <strong>医院值班</strong></div>
                </div>
                <div class="content duty_c">
                    <p>今日：<script type="text/javascript">writeDate();</script></p>
                    <span>院领导：[领导名字]</span><br />
                    <span>总值班：张锦鹏</span><br />
                    <span>夜查房：胡小明  李小风 张小宇</span>
                </div><div class="clearfix"></div>
            </div>
        </div>
        <div class="commonuser">
            <div class="common_t">
                <div class="duty_tp"><span class="fork pull-right" onclick="closeDiv(this);"></span>
                    <span class="oaarrow pull-right" onclick="hideC(this);"></span>
                    <span class="oaarrowDown pull-right" style="display:none;" onclick="showC(this);"></span><strong>常用联系人</strong></div>
            </div>
            <div class="content common_c">
                <ul style="margin-bottom:0;">
                    <li><img src="images/cuser.jpg" alt="" /><a href="#">暴风杨立东</a></li>
                    <li><img src="images/cuser.jpg" alt="" /><a href="#">暴风杨立东</a></li>
                    <li><img src="images/cuser.jpg" alt="" /><a href="#">暴风杨立东</a></li>
                    <li><img src="images/cuser.jpg" alt="" /><a href="#">暴风杨立东</a></li>
                </ul>
            </div>
        </div>
        <div class="ask">
            <ul style="margin-bottom:0;">
                <li style="border-bottom:1px solid #35358A;"><a href="#" >职工问卷</a></li>
                <li><a href="#" >医院网站</a></li>
            </ul>
        </div>
        <div class="commonuser">
            <div class="history_t">
                <div class="duty_tp"><span class="fork pull-right"  onclick="closeDiv(this);"></span>
                    <span class="oaarrow pull-right" onclick="hideC(this);"></span>
                    <span class="oaarrowDown pull-right" style="display:none;" onclick="showC(this);"></span><strong>最近访问记录</strong></div>
            </div>
            <div class="content history_c">
                <ul style="margin-bottom:0;">
                    <li><a href="#">合同</a></li>
                    <li><a href="#">申请</a></li>
                    <li><a href="#">日程安排</a></li>
                    <li><a href="#">报告管理</a></li>
                    <li><a href="#">客户信息</a></li>
                </ul>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div></td>
            <td>
      <iframe id="main_right" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden;width: 100%;height:1000px;"  name="main_right" src="Main.aspx" frameborder="0"></iframe>
            </td>
        </tr>
    </table>
<div id="TimeDiv" class="pop_box panel panel-primary pull-right" style="display:none;height:200px;width: 300px; margin-top:-30px; margin-bottom:0; position:absolute; right:0px; bottom:-200px;">
    <div class="panel-heading">
        <span class="pull-right m_close" onclick="HideDiv('TimeDiv')">关闭</span>
            打卡提示
    </div>
    <div class="panel-body">
        <div id="TimeInfo">
            <div id="DateDiv" style="font-size:20px; color:#278139;font-weight:bold;text-align:left;"></div>
            <div><a href="MisAttendance.aspx">进入考勤页面</a></div>
            <div id="warnContent" style="height:90px; margin-top:30px; padding-left:20px;">
                <div style="float:left; margin-right:20px; height:40px;">上班：<asp:Label ID="lblBegin" runat="server"></asp:Label>
                    <asp:Button ID="BtnBegin" Text="签到" CssClass="btn btn-primary" Width="50" runat="server" /></div>
                <div style="height:40px;">下班：<asp:Label ID="lblEnd" runat="server"></asp:Label> <asp:Button ID="BtnEnd" Text="签退" CssClass="btn btn-primary" Width="50" runat="server" /></div>
            </div>
        </div>
    </div>
</div>  
</div>
</form>
</body>
</html>
