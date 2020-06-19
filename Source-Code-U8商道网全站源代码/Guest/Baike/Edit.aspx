<%@ page language="C#" autoeventwireup="true" inherits="Guestbook_BaikeEdit, App_Web_1rtysfbx" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>编辑词条-<%Call.Label("{$SiteName/}"); %>百科</title>
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/Guest/editor.css" rel="stylesheet" type="text/css" />
<link  href="../../App_Themes/Guest/baike.css" rel="stylesheet" type="text/css" media="screen"/>
<script src="../../JS/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="../../JS/jquery.js" type="text/javascript"></script>
<script src="../../js/base.js"  type="text/javascript"></script>
<script src="../../JS/Bkpopup.js" type="text/javascript"></script>
   
<script type="text/javascript">
function getImg() {          
} 
</script>
</head>
<body>
<div id="Tab"><ul><li><a href="../Default.aspx">留言</a></li><li  class="hover"><a href="Baike/Default.aspx" >百科</a></li><li><a href="../Ask/Default.aspx">问答</a></li> </ul><div class="clear"></div></div>
<form id="form1" runat="server">
<div class="top">
<div class="topnav" id="toptab">
	<div class="topleft" >
		<span  style="<%=getstyle()%>"> 您好！<a href="../../user/" target="_blank"><asp:Label runat="server"  ID="user"></asp:Label></a> 欢迎来<%Call.Label("{$SiteName/}"); %>问答系统！ [<a href="<%=ResolveUrl("~/User/logout.aspx") %>?url=/Guest/Ask/Default.aspx">退出登录</a>]</span>
		<span  style="<%=getstyles()%>">[<a  href="../../user/Login.aspx?ReturnUrl=/guest/">请登录</a>] [<a  href="../../user/register.aspx?ReturnUrl=/guest/">免费注册</a>]</span>
	</div>
	<div class="topright">
		<a href="/">返回首页</a>
		<a href="#" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage(location.href);">设为首页</a>
		<a href="#" onclick="window.external.AddFavorite(location.href,document.title)" style="cursor:pointer;color:blue">收藏本站</a>
	</div>
</div>
</div>
<div id="s_page">
<!--head-->
	<div id="s_header"> 
	<div id="s_search" class="wa_mode"  >
<div id="s_logo">
	<a href="/Guest/Baike/Default.aspx" title="到<%Call.Label("{$SiteName/}"); %>百科首页"><img width="150" src="<%Call.Label("{$LogoUrl/}"); %>" alt="到<%Call.Label("{$SiteName/}"); %>百科首页" /> </a>
</div> 
<div style="display:none;"><input type="hidden" name="formids" value="searchText,enterLemma,searchLemma"/>
<input type="hidden" name="submitmode" value=""/>
<input type="hidden" name="submitname" value=""/>
</div>
<div class="s_search_form">
<asp:TextBox ID="txtAsk" Height="25" Width="300" showHelp="true" maxlength="100" class="search_input" autocomplete="off" runat="server"></asp:TextBox>
<asp:Button runat="server" ID="btnEnter" Text="进入词条" onclick="btnEnter_Click"  class="search_bt" AccessKey=" " /> 
<asp:Button runat="server" ID="btnSearch" Text="搜索词条"   onclick="btnSearch_Click" class="ask_bt" /> 

</div> 
<div id="divc" class="smartbox"  style="visibility: hidden;"></div>
</div>
</div>
<div id="main" class="rg_inout" style="margin-top:20px; border:none;">  
   <div id="nav"><ul class="tittleul"><li><a href="Default.aspx">百科首页</a></li>
    <li><a href="Classification.aspx?ClassTitle=自然">自然</a></li>
    <li><a href="Classification.aspx?ClassTitle=文化">文化</a></li>
    <li><a href="Classification.aspx?ClassTitle=地理">地理</a></li>
    <li><a href="Classification.aspx?ClassTitle=历史">历史</a></li>
    <li><a href="Classification.aspx?ClassTitle=生活">生活</a></li>
    <li><a href="Classification.aspx?ClassTitle=社会">社会</a></li>
    <li><a href="Classification.aspx?ClassTitle=艺术">艺术</a></li>
    <li><a href="Classification.aspx?ClassTitle=人物">人物</a></li>
    <li><a href="Classification.aspx?ClassTitle=经济">经济</a></li>
    <li><a href="Classification.aspx?ClassTitle=科技">科技</a></li>
    <li><a href="Classification.aspx?ClassTitle=体育">体育</a></li>
    </ul>
    </div>
        <div class="cleardiv" style="padding: 5px;">           
            <div id="mysite">您的位置：<a href="/">网站首页</a>>>&nbsp;<a href="Default.aspx">百科中心</a>>><a href="#GuestBorder">创建词条</a></div>  
        </div>
        <div class="baike_tips">欢迎您进入词条创建页！开始创建前，建议您参考<a href="#">编辑指南</a>，学习如何创建一个高质量的词条。 
</div>
        <div class="baike_tit"><h1><asp:Label runat="server" ID="lblTittle" Font-Bold="True" Font-Size="XX-Large" ForeColor="#3171AF">百科</asp:Label><span>
        <a href="#">&nbsp;&nbsp;如何为感兴趣的词条贡献有意义的内容？</a> </span></h1>
        <div class="clear"></div>
        </div>
        <script type="text/javascript">
            var Fe = Fe || { version: "20080809", emptyFn: function () { } };
            Fe.G = function () {
                for (var A = [], B = arguments.length - 1; B > -1; B--) {
                    var C = arguments[B]; A[B] = null;
                    if (typeof C == "object" && C && C.dom) { A[B] = C.dom } else { if ((typeof C == "object" && C && C.tagName) || C == window || C == document) { A[B] = C } else { if (typeof C == "string" && (C = document.getElementById(C))) { A[B] = C } } }
                } return A.length < 2 ? A[0] : A
            }; Fe.on = function (C, B, A) {
                if (!(C = Fe.G(C))) { return C } B = B.replace(/^on/, "").toLowerCase();
                if (C.attachEvent) {
                    C[B + A] = function () { A.call(C, window.event) };
                    C.attachEvent("on" + B, C[B + A])
                } else { C.addEventListener(B, A, false) } return C
            };
            Fe.un = function (C, B, A) { if (!(C = Fe.G(C))) { return C } B = B.replace(/^on/, "").toLowerCase(); if (C.attachEvent) { C.detachEvent("on" + B, C[B + A]); C[B + A] = null } else { C.removeEventListener(B, A, false) } return C };
            var G_HIBAR = (function () {
                var H = document, F, E, C, B = 3; function A(K, I, J) {
                    K.style.display = C ? "none" : "block";
                    K.style.left = I + "px"; K.style.top = J + "px"
                }
                function G(I) { C && G_HIBAR(I) }
                function D() { F = null; E = null; Fe.un(window, "unload", D) } Fe.on(window, "resize", G);
                Fe.on(document, "click", G); Fe.on(window, "unload", D);
                return function (J) {
                    (J || window.event).cancelBubble = true; F = F || H.getElementById("usrbar");
                    E = E || H.getElementById("nav_extra");
                    var K = H.getElementById("my_home"), L = F.scrollHeight, I = 0;
                    do { I += K.offsetLeft } while (K = K.offsetParent);
                    I = I - 6;
                    A(E, I, B);
                    Fe.G("usrbar").scrollWidth; C = !C
                                    }
            })();
         
		  wikiConflict.isEdit = 1;</script>

     
        <div id="inputShowSummaryDiv" style="padding: 0 0 10px; display: none;">
            <div id="canEditSummary" style="display: none">
            </div>
            <div id="cardSummary">
            </div>
        </div>
        <div id="inputShowMainInfoDiv" style="display: none;">
            <div id="canEditMainInfo">
            </div>
            <div id="inputMainInfoDivContent">
            </div>
        </div>
        <div style="position: relative">
            <div id="loading">
            </div>
            <!-- 工具栏 --> <div style=" position:absolute; top:6px; left:10px;z-index:99999; display:block; width:63px; height:23px; background:#EBEBEB;"><asp:LinkButton ID="lbt_Save" runat="server" OnClick="lbt_Save_Click" Style="display:block; width:65px; height:25px; text-align:center; line-height:25px;">存为草稿</asp:LinkButton></div>
            <div id="toolsHolder">
               
                <div id="tools">
                    <div id="toolbar">
                    </div>
                    <div class="bg">
                    </div>
                </div>
            </div>
            <div id="EditorHolder">
                <div class="tangram_editor_container" style="height: 390px">
                </div>
            </div>
          <div class="tip">(不超过20000字，如有疑问请查看<a href="#">使用帮助</a>)</div>
            <asp:TextBox runat="server" TextMode="MultiLine" ID="code" name="message" Style="display: none;"></asp:TextBox>
            <span class="gray">
                <input type="hidden" id="partContentNum" name="partContentNum" value="11092">
                <input type="hidden" id="curPicNum" name="curPicNum" value="13">
                <script type='text/javascript'>
                    var g_pcNum = G("partContentNum").value;
                    function setPicNum() {
                        if (editor) { editor.maxPicNum = G("curPicNum").value; }
                    }
                    Fe.on(window, "load", setPicNum);
                </script>
            </span>
        </div>
        <input id="lemmaclass" name="lemmaclass" value="法国,政坛,总统,法兰西第五共和国" type="hidden">
        <script>            var templateGuide = templateGuide || {}; templateGuide.textEditType = 'part'</script>
        <div class="btn">
            <input type="hidden" value=" 提 交 " name="editlemma">
        </div>
        <div class="other_items">
         <div class="tip">
            <span style="color: #3171af;">参考资料</span><a href="#">如何使用参考资料 </a></div>
        <div>
            <asp:TextBox runat="server" ID="txtReference" CssClass="x_input" TextMode="MultiLine"
                Width="773" Height="80"></asp:TextBox></div>
        <div class="tip">
            <span style="color: #3171af; ">开放分类</span>
            <span>(多个分类请以，隔开，开放分类最多不超过5个)</span> </div>
        <div >
            <asp:TextBox runat="server" ID="txtBtype" CssClass="x_input" TextMode="MultiLine"
                Width="773" Height="80"></asp:TextBox><a href="#">什么是开放分类?</a></div>
        <div style="width: 773px;">
            <span style="color: #3171af;">扩展阅读</span><span>(不超过1000字)</span></div>
        <div>
            <asp:TextBox runat="server" ID="txtExtend" CssClass="x_input" TextMode="MultiLine"
                Width="773" Height="80"></asp:TextBox></div>
        <div>
            <p>请在提交编辑前确认以下事项:</p>
            <span>
逐浪百科所有内容均需具有可靠来源能供读者查证。缺乏来源依据的内容会对读者造成误导。为保证这一原则，请您为编辑的内容提供参考资料以供查证。 
逐浪百科不欢迎任何形式的广告宣传。有关个人、公司或产品的宣传稿件，或者内容中含有推销或宣传的内容，都将被删除。 
感谢您在逐浪百科参与分享知识，亿万网友将因您的贡献而获益。
</span>
        </div>
        <div style="width: 500px;">
            <span style="float: right; padding-top: 20px;">
                <asp:Button runat="server" ID="btnSubmit" Text="提交" CssClass="C_input" OnClick="btnSubmit_Click"  OnClientClick="getCode()"/>&nbsp;&nbsp;&nbsp;<input type="button" id="btnshow" value="预览"  class="C_input"  onclick="show()" /></span></div>
        <div style="display: none;" id="divSupplyment">
            <asp:TextBox runat="server" ID="txtSupplyment" CssClass="x_input" TextMode="MultiLine"
                Width="500" Height="120"></asp:TextBox></div>
        <div class="clear">
        </div>        
    </div>
    </div>
    <div class="clear"></div>
    </div>
    <script type="text/javascript">
        function show() {
            getCode();
            var s = document.getElementById("code").value;
            var tittle = document.getElementById("lblTittle").innerHTML;
            var d = document.getElementById("txtReference").value;
            var f = document.getElementById("txtBtype").value;
            var g = document.getElementById("txtExtend").value;
            //alert(g);
            window.open("Details.aspx?soure=show&tittle=" + tittle + "&codes=" + s + "&btype=" + f + "&extend=" + g + "&refer=" + d, 'newwindow', "");
        }
    </script>
    <!-- 版权信息 -->
              <div id="baike_bottom"> <p style="text-align:center">
            <script language="javascript" type="text/javascript"> 
                 var year = "";
                mydate = new Date();
                myyear = mydate.getYear();
                year = (myyear > 200) ? myyear : 1900 + myyear;
                document.write(year); 
             </script>
            &copy;&nbsp;Copyright&nbsp;
            <%Call.Label("{$SiteName/}"); %>
            All rights reserved.</p></div>
    </form>
 <div class="bd-menu-inserttable" id="bdMenuInsertTable" role="menu">
    <div class="bd-dimension-picker" id="pickerHolder">
        <div id="pickerArea">
            <div class="bd-dimension-picker-unhighlighted" style="width: 10em; height: 10em;">
            </div>
            <div class="bd-dimension-picker-highlighted" style="width: 0em; height: 0em;" id="pickerHighlighted">
            </div>
        </div>
        <div class="bd-dimension-picker-status">
            <span style="float: left; font-size: 12px" id="pickerStatus"><span id="columnCount">
                0</span>列 x <span id="rowCount">0</span>行</span> <span style="float: right;"><a href="#"
                    onclick="setTablePanel.insertMoreTable();return false;" id="insertMoreTable"
                    style="text-decoration: none; font-size: 12px;">插入更多</a></span>
        </div>
    </div>
</div>
<form name="pre" method="post" action=" /preview/" target="_blank">
<input type="hidden" name="pretitle" value="" />
<input type="hidden" name="prelemma" value="" />
<input type="hidden" name="pretag" value="" />
<input type="hidden" name="prepic" value="" />
<input type="hidden" name="preref" value="" />
<input type="hidden" name="preview" value="preview">
<input type="hidden" name="preBeforeLemma" id="preBeforeLemma" value="">
<input type="hidden" name="preEndLemma" id="preEndLemma" value="">
<input type="hidden" name="preFlag" id="preFlag" value="">
<input type="hidden" value="" name="preExtData" />
<input type="hidden" value="" name="preSummaryImgId" />
<input type="hidden" value="" name="preSummaryImgInfo" />
<input type="hidden" name="preSummarySummary" value="" />
<input type="hidden" name="preExtDataType" value="" />
<div id="refData4Preview" style="display: none">
</div>
</form>
<br clear="all">
<script src="../../JS/Bkcommon.js" type="text/javascript"></script>
    <script src="../../JS/Bkcore.js" type="text/javascript"></script>
    <script type="text/javascript">
        function getCode() {
           
            var code = document.getElementById("code");
 
            var content = $(document.getElementById('tangram_editor_iframe_MZ__w').contentWindow.document.body).html();
            document.getElementById("code").value = content;

        }
    </script>
 </body>
</html>