 <%@ page language="C#" autoeventwireup="true" inherits="manage_Plus_BbsGuide, App_Web_4yy5j0bb" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title><%=lang.Get("m_BbsGuide_forum")%></title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />    
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
function search() {
    var LabelCate = "";
    var LabelName = document.getElementById("Lname").value;
    window.open('../Guest/WdCheck.aspx?Cate=' + LabelCate + '&lblkey=' + LabelName, "main_right");
}
</script>
</head>
<body id="Guidebody" style="margin: 0px; margin-top:1px;">
<form id="formGuide" runat="server">
<div id="Div1">
    <ul>
        <li id="Guide_top">
            <div id="Guide_toptext"><%=lang.Get("m_BbsGuide_message")%></div>
        </li>
        <li id="Guide_main">
            <div id="Guide_box">
                <div class="guideexpand" onclick="Switch(this)"><%=lang.Get("m_BbsGuide_message")%></div>                    
                <div class="guide">
                <ul>                        
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="GuestCateMana.aspx" target="main_right"><%=lang.Get("m_BbsGuide_manage")%></a></li>
                </ul>
                </div>
                <div class="guideexpand" onclick="Switch(this)"><%=lang.Get("M_Guest_BaikeMana")%></div>
                <div class="guide">
                <ul>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="BkCheck.aspx" target="main_right"><%=lang.Get("M_Guest_BaikeClass")%></a></li>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../AddOn/GradeOption.aspx?CateID=3" target="main_right"><%=lang.Get("M_Guest_BaikeType")%></a></li>
                </ul>
                </div>
                <div class="guideexpand" onclick="Switch(this)"><%=lang.Get("M_Guest_WenDaMana")%></div>
                <div class="guide">
                <ul>
                    <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="WdCheck.aspx" target="main_right"><%=lang.Get("M_Guest_WenDaClass")%></a></li>
                 <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../AddOn/GradeOption.aspx?CateID=2" target="main_right"><%=lang.Get("M_Guest_WenDaType")%></a></li>
                </ul>
                </div>
            </div>
        </li>
     </ul>
</div>
    <div style="margin-top:20px; padding-left:5px;">
<%=lang.Get("按内容搜索问题")%>：<br />
<table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;" class="l_input"><tr ><td> 

<input id="Lname"  style="border-color:#fff" class="l_inpnon" runat="server" onkeypress="CheckInfo(this)"/>
<script type="text/javascript">
    function CheckInfo(obj) {
        if (event.keyCode == 13) {
            //alert(obj.value);
            search();
        }
    }
        </script>
<input type="button" onclick="search()"  class="C_sch"/>
</td></tr></table>
</div>
</form>
</body>
</html>