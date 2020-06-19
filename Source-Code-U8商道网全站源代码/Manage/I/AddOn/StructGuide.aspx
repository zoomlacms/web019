<%@ page language="C#" autoeventwireup="true" inherits="manage_AddOn_StructGuide, App_Web_ddl2proh" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><%=lang.Get("m_StructureGuide_Structure")%></title> 
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
                    if (nextDiv.style.display != "") {
                        parent.document.getElementById("left").height = document.body.scrollHeight;
                    }
                    else {
                        parent.document.getElementById("left").height = document.body.scrollHeight + 20;
                    }
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
 <li id="Guide_top"><div id="Guide_toptext"><%=lang.Get("m_StructureGuide_Structure")%>  </div></li>
    <li id="Guide_main1">
        <div id="Guide_box1">
            <div class="guideexpand" onclick="Switch(this)"><%=lang.Get("m_StructureGuide_Structure")%>   </div>
            <div class="guide" id="a1">
            <ul>
            <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../AddOn/StructManage.aspx?type=0" target="main_right"><%=lang.Get("m_StructureGuide_Structure")%>   </a></li>
            <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../AddOn/StructList.aspx?type=0" target="main_right"><%=lang.Get("m_StructureGuide_Set")%></a></li>  
        </ul>
            </div>
        </div>
    </li>
    <li id="Li2">
        <div id="Div3">
            <div class="guideexpand" onclick="Switch(this)">
              <%=lang.Get("m_StructureGuide_UserStruct")%>  
            </div>
            <div class="guide" id="a2">
            <ul> 
            <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../AddOn/StructList.aspx?type=1" target="main_right"><%=lang.Get("m_StructureGuide_ManageStruct")%> </a> </li>
            <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../AddOn/StructAnalysis.aspx" target="main_right"><%=lang.Get("m_StructureGuide_Analysis")%>  </a> </li>
        </ul>
        </div>
      </div>
   </li>
</ul>
</div>  
    </form>
</body>
</html>
