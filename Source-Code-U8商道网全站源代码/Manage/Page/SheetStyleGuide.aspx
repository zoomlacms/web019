﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Page_SheetStyleGuide, App_Web_nhfzwvrc" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title><%= lang.Get("m_YellowPage_tagmgmt") %></title>
    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
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
                    <div id="Guide_toptext"><%= lang.Get("m_YellowPage_enterprise") %></div>
                </li>
                <li id="Guide_main">
                    <div id="Guide_box">
                        <div class="guideexpand" onclick="Switch(this)"><%= lang.Get("m_YellowPage_taglib") %></div>
                        <div class="guide">
                            <ul>
                                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Page/SheetStyleManage.aspx" target="main_right"><%= lang.Get("m_YellowPage_tagmgmt") %></a></li>
                                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Page/AddSheetStyle.aspx" target="main_right"><%= lang.Get("m_YellowPage_addtag") %></a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </form>
</body>
</html>
