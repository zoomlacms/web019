<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_DataGuide, App_Web_bf2dohqv" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title><%= lang.Get("m_DepCenter") %></title>
<link type="text/css" rel="stylesheet" href="/App_Themes/AdminDefaultTheme/Guide.css" />
<link type="text/css" rel="stylesheet" href="/App_Themes/AdminDefaultTheme/index.css" />
<link type="text/css" rel="stylesheet" href="/App_Themes/AdminDefaultTheme/main.css" />
<script type="text/javascript">
        function Switch(obj) {
            obj.className = (obj.className == "guideexpand") ? "guidecollapse" : "guideexpand";
            var nextDiv;
            if (obj.nextSibling) {
                if (obj.nextSibling.nodeName == "DIV") {
                    nextDiv = obj.nextSibling;
                }
                else {
                    if (obj.nextSibling.nextSibling) {
                        if (obj.nextSibling.nextSibling.nodeName == "DIV") {
                            nextDiv = obj.nextSibling.nextSibling;
                        }
                    }
                }
                if (nextDiv) {
                    nextDiv.style.display = (nextDiv.style.display != "") ? "" : "none";
                }
            }
        }
        function OpenLink(lefturl, righturl) {
            if (lefturl != "") {
                parent.frames["left"].location = lefturl;
            }
            try {
                parent.MDIOpen(righturl); return false;
            } catch (Error) {
                parent.frames["main_right"].location = righturl;
            }
        }
        function gotourl(url) {
            try {
                parent.MDILoadurl(url); void (0);
            } catch (Error) {
                parent.frames["main_right"].location = "../" + url; void (0);
            }
        }
</script>

       
</head>
<body id="Guidebody" style="margin: 0px; margin-top: 1px;">
<form id="formGuide" runat="server">
<div id="Div1">
<ul>
    <li id="Guide_top">
        <div id="Guide_toptext"><%= lang.Get("m_DepCenter") %></div>
    </li>
    <li id="Guide_main">
        <div id="Guide_box">
            <div class="guideexpand" onclick="Switch(this)"><%= lang.Get("m_DepCenter_sysinfos") %></div>
            <div class="guide">
                <ul>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'">
                        <a href="../Config/DatalistProfile.aspx" target="main_right"><%= lang.Get("m_DepCenter_dbinfo") %></a>              
                    </li>                                  
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Config/BackupRestore.aspx" target="main_right"><%= lang.Get("m_DepCenter_backuprestore") %></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Config/Optimization.aspx" target="main_right"><%= lang.Get("m_DepCenter_indexoptimize") %></a></li>                     
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Common/SystemFinger.aspx" target="main_right"><%= lang.Get("m_DepCenter_serverinfos") %></a></li>
                </ul>
            </div>
            <div class="guideexpand" onclick="Switch(this)"><%=lang.Get("m_DataGuide_maintain")%></div>
            <div class="guide">
                <ul>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Config/DataSearch.aspx" target="main_right"><%= lang.Get("m_DepCenter_dataretrieval") %></a></li> 
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Config/SQLManage.aspx" target="main_right"><%= lang.Get("m_DepCenter_task") %></a></li>
                     <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Config/CreateTable.aspx" target="main_right"><%= lang.Get("m_DepCenter_maketable") %></a></li>    
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Config/RunSql.aspx" target="main_right"><%=lang.Get("m_DepCenter_execsqls")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Config/DataAssert.aspx" target="main_right"><%=lang.Get("m_DepCenter_batchcope")%></a></li>
                   <%-- <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Config/DevelopmentCenter.aspx" target="main_right"><%=lang.Get("m_DataGuide_devCenter")%></a></li>--%>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Config/EmptyData.aspx" target="main_right"><%= lang.Get("m_DepCenter_cleartests") %></a></li>
                     <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Config/ViewList.aspx" target="main_right"><%= lang.Get("m_DepCenter_viewmgmt") %></a></li>                
                </ul>
            </div>
        </div>
    </li>
</ul>
</div>
</form>
</body>
</html>