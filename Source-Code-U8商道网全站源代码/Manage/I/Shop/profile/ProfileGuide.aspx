<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_profile_ProfileGuide, App_Web_s44xkhuk" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%= lang.Get("m_ProfileGuide_rebate") %></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="Div1">
    <ul>
        <li id="Guide_top">
            <div id="Guide_toptext"><%= lang.Get("m_Rebate") %></div>
        </li>
        <li id="Guide_main">
            <div id="Guide_box">
               <div class="guideexpand" style="max-width:100px;cursor:pointer;padding:5px;" onclick="Switch(this)">
                   <%= lang.Get("m_ProfileGuide_reportstatis") %><span class="glyphicon glyphicon-circle-arrow-down" style="margin-left:5px;"></span></div>                    
                <div class="guide">
                <ul style="padding-left:15px;">   
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="StatisticsBriefing.aspx" target="main_right"><%= lang.Get("m_ProfileGuide_formstatis") %></a></li>
                </ul>
                </div>
            </div>
        </li>
        <li id="Li1">
            <div id="Div2">
                <div class="guideexpand" style="max-width:100px;cursor:pointer;padding:5px;" onclick="Switch(this)">
                    <%= lang.Get("m_ProfileGuide_marketing") %><span class="glyphicon glyphicon-circle-arrow-down" style="margin-left:5px;"></span>
                </div>                    
                <div class="guide">
                <ul style="padding-left:15px;">     
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="config.aspx" target="main_right"><%= lang.Get("m_ProfileGuide_baseset") %></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="LmUserManage.aspx" target="main_right"><%= lang.Get("m_ProfileGuide_members") %></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="LmUserListTree.aspx" target="main_right"><%= lang.Get("m_ProfileGuide_membertree") %></a></li>
                </ul>
                </div>
            </div>
        </li>
     </ul>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
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
</asp:Content>

