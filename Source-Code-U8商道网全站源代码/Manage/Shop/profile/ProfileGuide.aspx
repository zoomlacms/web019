<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_profile_ProfileGuide, App_Web_gee5ukta" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title><%= lang.Get("m_ProfileGuide_rebate") %></title>
<link type="text/css" rel="stylesheet" href="../../../App_Themes/AdminDefaultTheme/Guide.css" />
<link type="text/css" rel="stylesheet" href="../../../App_Themes/AdminDefaultTheme/index.css" />
<link type="text/css" rel="stylesheet" href="../../../App_Themes/AdminDefaultTheme/main.css" />
<script type="text/javascript">    
    function Switch(obj)
    {
        obj.className = (obj.className == "guideexpand") ? "guidecollapse" : "guideexpand";
        var nextDiv;
        if (obj.nextSibling)
        {
            if(obj.nextSibling.nodeName=="DIV")
            {
                nextDiv = obj.nextSibling;
            }
            else
            {
                if(obj.nextSibling.nextSibling)
                {
                    if(obj.nextSibling.nextSibling.nodeName=="DIV")
                    {
                        nextDiv = obj.nextSibling.nextSibling;
                    }
                }
            }
            if(nextDiv)
            {
                nextDiv.style.display = (nextDiv.style.display != "") ? "" : "none"; 
            }
        }
    }
    function OpenLink(lefturl,righturl)
    {
        if(lefturl!="")
        {
            parent.frames["left"].location =lefturl;
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
<body id="Guidebody" style="margin: 0px; margin-top:1px;">
<form id="formGuide" runat="server">
<div id="Div1">
    <ul>
        <li id="Guide_top">
            <div id="Guide_toptext"><%= lang.Get("m_Rebate") %></div>
        </li>
        <li id="Guide_main">
            <div id="Guide_box">
               <div class="guideexpand" onclick="Switch(this)"><%= lang.Get("m_ProfileGuide_reportstatis") %></div>                    
                <div class="guide">
                <ul>   
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="StatisticsBriefing.aspx" target="main_right"><%= lang.Get("m_ProfileGuide_formstatis") %></a></li>
                </ul>
                </div>
            </div>
        </li>
        <li id="Li1">
            <div id="Div2">
                <div class="guideexpand" onclick="Switch(this)">
                    <%= lang.Get("m_ProfileGuide_marketing") %>
                </div>                    
                <div class="guide">
                <ul>     
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="config.aspx" target="main_right"><%= lang.Get("m_ProfileGuide_baseset") %></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="LmUserManage.aspx" target="main_right"><%= lang.Get("m_ProfileGuide_members") %></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="LmUserListTree.aspx" target="main_right"><%= lang.Get("m_ProfileGuide_membertree") %></a></li>
                </ul>
                </div>
            </div>
        </li>
     </ul>
</div>
</form>
</body>
</html>