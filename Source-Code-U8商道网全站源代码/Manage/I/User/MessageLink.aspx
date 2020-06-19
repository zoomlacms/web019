<%@ page language="C#" autoeventwireup="true" inherits="manage_User_MessageLink, App_Web_cdtmwr4r" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=lang.Get("m_MessageLink_send")%></title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
      <div id="Div1">
    <ul>
      <li id="Guide_top">
        <div id="Guide_toptext"><%=lang.Get("m_MessageLink_send")%></div>
      </li>
      <li id="Guide_main">
        <div id="Guide_box">
          <div class="guideexpand" onclick="Switch(this)"><%=lang.Get("m_MessageLink_send")%></div>
          <div class="guide">
            <ul>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../User/MessageSend.aspx" target="main_right"><%=lang.Get("m_MessageLink_sendmessage")%></a></li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../User/Message.aspx" target="main_right"><%=lang.Get("m_MessageLink_list")%></a></li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../User/MobileMsg.aspx" target="main_right"><%=lang.Get("m_MessageLink_sms")%></a></li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../User/SendMailList.aspx" target="main_right"><%=lang.Get("m_MessageLink_sub")%></a></li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../User/AddMail.aspx" target="main_right"><%=lang.Get("m_MessageLink_mass") %></a></li>
              <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../User/MailIdiographList.aspx" target="main_right"><%=lang.Get("m_MessageLink_signature") %></a></li>
            </ul>
          </div>
           <div class="guideexpand" onclick="Switch(this)"><%= lang.Get("m_MessageLink_mail") %></div>
          <div class="guide">
            <ul>
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../User/MailList.aspx" target="main_right"><%=lang.Get("m_MessageLink_mail")%></a></li>
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../User/MailTemplist.aspx" target="main_right"><%= lang.Get("m_MessageLink_mailtemplate") %></a></li>
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Mail/Mail.aspx" target="main_right"><%= lang.Get("m_MessageLink_mailingList") %></a></li>
                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Mail/MailMorSend.aspx" target="main_right"><%= lang.Get("m_MessageLink_mailmorsend") %></a></li>
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
