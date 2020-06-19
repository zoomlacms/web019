<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="User_Default, App_Web_oitxanq2" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!doctype html>
<html lang="zh">
<head id="Head1" runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title><%=lang.Get("u_center")%></title>
 <script src="../js/ajaxrequest.js" type="text/javascript"></script>
<script src="../JS/main.js" type="text/javascript"></script>
<script src="../JS/UserDefault.js" type="text/javascript"></script>
<script src="../../js/Dialog/Drag.js" type="text/javascript"></script>
<script src="../JS/Dialog.js"  type="text/javascript"></script>
<script src="/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
window.onload = function ()
 {
	 if(isIE = navigator.userAgent.indexOf("MSIE")!=-1)
	 {
	     document.getElementById("MENU").height = document.documentElement.clientHeight -192;
	     document.getElementById("RightHeight").height = document.documentElement.clientHeight;
     }
}
var returnvalue;
var ajax = new AJAXRequest;
// 请求提示
function doPrompt(step) {
}
function GetMess_show() {
    ajax.get("/User/mess.aspx?c=mess",
function (obj) {
    returnvalue = obj.responseText;
    if (returnvalue.indexOf("$$$") > -1) {
        if (returnvalue != "0") {
            var returnarr = returnvalue.split("$$$");
            if (returnarr[0] != "0") {
                showmsg("系统提示:", "<a href=\"javascript:void(0)\" hidefocus=\"true\" onclick=\"top.document.getElementById('main_right').src='/user/iServer/FiServer.aspx'\">您有" + returnarr[0] + "条回复问题</a>", returnarr[1]);
            }
        }
    }
}
);
}

if (<%=IsSMSTipsShow %>) {
    window.setInterval("GetMess_show()", 60000);
    window.setInterval("GetOrderMess_show()", 60000);
}

function showmsg(title, mess, tip) {
var MSG = new CLASS_MSN_MESSAGE("aa", 200, 120, title, mess, tip);
MSG.speed = 10;
MSG.step = 2;
MSG.show();
}

function GetOrderMess_show() {
ajax.get("/User/mess.aspx?c=order",
function(obj) {
returnvalue = obj.responseText;
if (returnvalue != "0") {
	showmsg("系统提示:", "<a href=\"javascript:void(0)\" hidefocus=\"true\" onclick=\"top.document.getElementById('main_right').src='/User/PreViewOrder.aspx?menu=Orderinfo'\">您今天有" + returnvalue + "个订单</a>", "请查收");
}
}
);
}
function Load(r1, r2) {
document.getElementById("left").src = r1;
document.getElementById("main_right").src = r2;
}

function SelChange(obj) {
var leftUrl = "";
var rightUrl = "";
if (obj == "1") {
	leftUrl = "Left.aspx";
	rightUrl = "Info/UserInfo.aspx";
	Load(leftUrl, rightUrl);
}
if (obj == "2") {
	leftUrl = "Content/ContentLeft.aspx";
	rightUrl = "Content/Default.aspx?t=1";
	Load(leftUrl, rightUrl);
}
if (obj == "3") {
	leftUrl = "Sera_shopLeft.aspx";
	rightUrl = "Info/DredgeVip.aspx";
	Load(leftUrl, rightUrl);
}
if (obj == "4") {
	leftUrl = "CommunityLeft.aspx";
	rightUrl = "UserZone/Default.aspx";
	Load(leftUrl, rightUrl);
}
if (obj == "5") {
	leftUrl = "UserShop/ShopLeft.aspx";
	rightUrl = "../../Space/SpaceManage.aspx";
	  Load(leftUrl, rightUrl);
}
if (obj == "6") {
	leftUrl = "StationGuid.aspx";
	rightUrl = "Pages/Default.aspx";
	Load(leftUrl, rightUrl);
}
if (obj == "7") {
	leftUrl = "Questions/ExamGuide.aspx";
	rightUrl = "Questions/Default.aspx";
	Load(leftUrl, rightUrl);
}
var url = document.getElementById("siulr").value;
if (obj == "8") {   //网站首页
	window.location.replace(url);
}
if (obj == "9") {   //会员中心
	window.location.replace(url + "/User");
}
}

var frameObj = document.getElementById("MENU2");
setInterval("loadaction();", 500);
function loadaction() {
document.getElementById("main_right").width = parseFloat(document.body.offsetWidth) - parseFloat(document.getElementById("left").width) - 81;
}
</script>
<%Call.Label("{ZL:Boot()/}"); %>
<link href="<%Call.Label("{$CssDir/}"); %>global.css" rel="stylesheet" type="text/css" />
 </head>
<body class="user_body">
<div class="usermain_top">
 <div class="container">
 <div class="row">
 <div class="col-md-2 col-lg-2 col-sm-2 col-xs-12">
<a href="/"><img src="<%Call.Label("{$CssDir/}"); %>images/logo.gif" alt="" class="img-responsive" /></a>
</div>
 <div class="col-md-3 col-lg-3 col-sm-3- col-xs-12 paddingtop20">
 <a  href="/user" class="btn btn-info pull-right">会员中心</a>
<a  href="/class_1/default.aspx" class="btn btn-info  pull-right" style=" margin-right:10px;" >创业项目</a>
  </div>
   <div class="col-md-3 col-lg-3 col-sm-3 col-xs-12 paddingtop20">
   <form class="form-inline" role="form">
    <div class="form-group">
    <input type="text"  class="form-control"   placeholder="请输入您要查询的内容">
    </div>
        <div class="form-group">
 <button type="submit" class="btn btn-default">搜索</button>
 </div>
</form>
  </div>
     <div class="col-md-3 col-lg-3 col-sm-3 col-xs-12 pull-right paddingtop20">
      <a href="Message/Message.aspx" target="main_right">
	  <%=lang.Get("u_info")%>(<asp:Label ID="LblUnreadMsg" runat="server" />)</a>
  <a href="<%=ResolveUrl("~/User/logout.aspx") %>" class="marginleft10" onclick="javascript:QC.Login.signOut();"><%=lang.Get("u_exit")%></a>  
</div>
  </div>
 </div>
</div>
 <div class="container fff">
 <div class="row">
 <div class="col-md-2 col-lg-2 col-sm-2 col-xs-12">
 <div style=" margin-top:10px;border:1px solid #ccc;"> 
 <div class="u_tit"><strong>项目管理</strong></div>
 <div class="us_li">
<ul>
<li><a href="/Class_32/NodePage.aspx"  target="main_right">留言的项目</a></li>
 <li><a href="/User/Content/MyFavori.aspx?type=1"  target="main_right">关注的项目</a></li>
 <li><a href="/Class_32/NodeNews.aspx"  target="main_right">项目足迹</a></li>

</ul>
</div>
<div class="u_t"><strong>我的U8商道</strong></div>
<div class="u_tit"><strong>公司信息管理</strong></div>
<div class="us_li">
<ul>
<li><a href="/user/Pages/default.aspx"target="main_right">广告投放</a></li>
</ul>
</div>

<div class="u_tit"><strong>推广赚钱</strong></div>
<div class="us_li">
<ul>
<li><a href="/class_52/default.aspx" target="main_right">推广商家入驻</a></li>
<li><a href="/Class_52/NodeElite.aspx" target="main_right">邀请好友</a></li>
</ul>
</div>
<div class="u_tit"><strong>财务管理</strong></div>

<div class="us_li">
<ul>
<li><a href="/class_52/NodePage.aspx" target="main_right">账户余额</a></li>
<li><a href="/class_52/NodeNews.aspx" target="main_right">提现申请</a></li>
 <li><a href="/class_52/Nodehot.aspx" target="main_right">提现记录</a></li>
 
 </ul>
</div>
<div class="u_tit"><strong><a href="/user/content/default.aspx" target="main_right">资讯免费发布</a></strong></div>
  </div></div>
  <div class="col-md-10 col-lg-10 col-sm-10 col-xs-12">
  <iframe src="/class_32/default.aspx" scrolling="no" frameborder="0" height="800px;" width="100%" name="main_right"></iframe>
 </div>
 </div>
 </div>
  </div>
 <div  class="fff">
  <%Call.Label("{ZL.Label id=\"全站底部\"/}"); %>
  <div class="clearfix"></div>


<div class="usermain" style="display:none">
<input id="siulr" type="hidden" value=" <%=siteUrl %>" />
<asp:Image ID="imgUserPic" runat="server" Width="55" Height="55" /> 
<asp:Label ID="lblUserName" runat="server" Text="" />
<asp:Image ID="Grouppicture" runat="server" Width="20" Height="20" /> 
<span id="selectsite" style="display: inline">
          <div id='_SiteSelector' name='_SiteSelector' selectedindex='0' ztype='Select' class='zSelect'
        style="display: inline-block; zoom: 1; display: inline; vertical-align: middle;
        position: relative; height: 20px; white-space: nowrap; width: 130px;" styleoriginal="width:130px;"
        onchange="Application.onParentSiteChange();" listwidth="250" defaultblank="false">
             
            <img class='arrowimg' alt="" src='../App_Themes/UserThem/images/blank.gif' width='18' height='20' id='_SiteSelector_arrow' style='position: relative; left: -17px; cursor: pointer; width: 18px; height: 20px; vertical-align: top;' />
            <div id='_SiteSelector_list' class='optgroup' style='text-align: left; display: none;'>
              <div id='_SiteSelector_ul' style='left: -1px; width: -1px;'> <a href="javascript:void(0);" onclick="Selector.onItemClick(this);" onmouseover='Selector.onItemMouseOver(this)'
                    selected='true' hidefocus value="206"><%=lang.Get("u_compre")%></a><a href="javascript:void(0);" onclick="Selector.onItemClick(this);"
                        onmouseover='Selector.onItemMouseOver(this)' hidefocus value="211"><%=lang.Get("u_gov")%></a><a href="javascript:void(0);"
                            onclick="Selector.onItemClick(this);" onmouseover='Selector.onItemMouseOver(this)' hidefocus value="213"><%=lang.Get("u_company")%></a> </div>
            </div>
          </div>
          </span>
<div id="e_post_p"></div>
</div>

</body>
</html> 
<script src="/js/jquery.js" type="text/javascript"></script>

<script type="text/javascript">
    (function () {
        var _skin, _jQuery;
        var _search = window.location.search;
        if (_search) {
            _skin = _search.split('demoSkin=')[1];
            _jQuery = _search.indexOf('jQuery=true') !== -1;
            if (_jQuery) document.write('<scr' + 'ipt src="jquery-1.6.2.min.js"></sc' + 'ript>');
        };
        document.write('<scr' + 'ipt src="artDialog.source.js?&skin=' + (_skin || 'aero') + '"></sc' + 'ript>');
    })();
</script>
<script src="artDialog.iframeTools.source.js" type="text/javascript"></script>
<script src="_doc/demo.js" type="text/javascript"></script>

<script type="text/javascript">

    function popAlert(str) {
        //width="' + $(window).width() + '"
        $('<div id="popalert">' + '<iframe id="picture" name="picture" marginwidth="0" marginheight="0" frameborder="0" scrolling="no"  src="../user/Cloud/ShowPhoto.aspx?Dir=' + str + '\" width="100%" height="100%"></iframe>' + '</div>').appendTo('body');
        var _popalert = $('#popalert');
        _popalert.css({
            position: 'absolute',
            height: ($(window).height() + $('body').scrollTop()) + 'px',
            width: ($(window).width()) + 'px',
            left: '0px',
            top: '0px'
        });
    }
    //窗口自适应
    window.onresize = function () {
        $('#popalert').css({
            position: 'absolute',
            height: ($(window).height()) + 'px',
            width: ($(window).width()) + 'px',
            left: '0px',
            top: '0px'
        });
    }
    //关闭浏览图片
    function close() {
        $('#popalert').remove();
    }
    //关闭弹出层
    function closeNewFile() {
        //alert(8);
        $('.aui_focus').remove();
        $('#back').remove();

    }
    //弹出层
    function NewFormd(title, content) {
        //alert(title);
        if ($("iframe").eq(2).html() == null) {
            $(".aui_title").html(title);
            art.dialog.data('homeDemoPath', './_doc/');
            if (title == "新建文件夹") {
                art.dialog.open(content, { title: title, width: "360" }, true);
                $("iframe").eq(2).css({ "width": "360px", "height": "200px" });
            } else if (title == "文件上传") {
                art.dialog.open(content, { title: title, width: "360" }, true);
                $("iframe").eq(2).css({ "height": "180px", "width": "360px" });
            } else if (title == "音乐播放") {
                art.dialog.open(content, { title: title, width: "300" }, true);
                $("iframe").eq(2).css({ "width": "300px", "height": "405px" });
                $('#back').remove();
            } else {
                art.dialog.open(content, { title: title, width: "400" }, true);
                $("iframe").eq(2).css({ "width": "400px", "height": "300px" });
            }
        } else {
            $("iframe").eq(2).attr("src", $("iframe").eq(2).attr("src"));
        }
    }
	
	
		var t='<%Call.Label("{$GetRequest(t)$}"); %>';
	if(t==''){
		 document.getElementById("law_nav").style.display="none";
		 
		}
	else if(t=='1'){
		document.getElementById("left").src="/user/Cloud/CloudGuide.aspx";
 		document.getElementById("main_right").src="/user/FileFactory/ContentManage.aspx";
 		}
		else if(t=='2'){
			document.getElementById("left").src="/user/Cloud/CloudGuide.aspx";
document.getElementById("main_right").src="/user/FileFactory/Doc.aspx?parentID=9&status=1&dirName=律师管理";
  			}
	else if(t=='3'||t=='4'||t=='5'){
		document.getElementById("left").src="/user/Cloud/CloudGuide.aspx";
document.getElementById("main_right").src="/user/FileFactory/Doc.aspx";	
 
 		}
</script>

