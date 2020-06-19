<%@ page language="C#" autoeventwireup="true" inherits="manage_Common_CutPic, App_Web_d5hpq5yu" enableviewstatemac="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<title> 图片截取</title>
<script type="text/javascript">
    var isIE = (document.all) ? true : false;
    var isIE6 = isIE && ([/MSIE (\d)\.0/i.exec(navigator.userAgent)][0]== 6);
    //var isIE6 = isIE && ([/MSIE (\d)\.0/i.exec(navigator.userAgent)][0][1] == 6);

    var $ = function (id) {
        return "string" == typeof id ? document.getElementById(id) : id;
    };

     
    var Class = {
        create: function () {
            return function () { this.initialize.apply(this, arguments); }
        }
    }

    var Extend = function (destination, source) {
        for (var property in source) {
            destination[property] = source[property];
        }
    }

    var Bind = function (object, fun) {
        return function () {
            return fun.apply(object, arguments);
        }
    }

    var BindAsEventListener = function (object, fun) {
        var args = Array.prototype.slice.call(arguments).slice(2);
        return function (event) {
            return fun.apply(object, [event || window.event].concat(args));
        }
    }

    var CurrentStyle = function (element) {
        return element.currentStyle || document.defaultView.getComputedStyle(element, null);
    }

    function addEventHandler(oTarget, sEventType, fnHandler) {
        if (oTarget.addEventListener) {
            oTarget.addEventListener(sEventType, fnHandler, false);
        } else if (oTarget.attachEvent) {
            oTarget.attachEvent("on" + sEventType, fnHandler);
        } else {
            oTarget["on" + sEventType] = fnHandler;
        }
    };

    function removeEventHandler(oTarget, sEventType, fnHandler) {
        if (oTarget.removeEventListener) {
            oTarget.removeEventListener(sEventType, fnHandler, false);
        } else if (oTarget.detachEvent) {
            oTarget.detachEvent("on" + sEventType, fnHandler);
        } else {
            oTarget["on" + sEventType] = null;
        }
    };
    function retn(url) {
        if (parent.window.frames['main_right'].document.getElementById('Img_pic')) {
            parent.window.frames['main_right'].document.getElementById('Img_pic').src = url + "?d=z";
            parent.closdlg();
        }
        else {
            parent.document.frames['main_right'].document.getElementById('Img_pic').src = url + "?d=z";
            parent.closdlg();
        }
    }
     </script>
      
</head>
<body style="background:#333333;">
<div class="cutbox">
<form id="form1" runat="server"> 
<div id="imgBox">
<div id="bgDiv">
<div id="dragDiv">
    <div id="rRightDown"> </div>
    <div id="rLeftDown"> </div>
    <div id="rRightUp"> </div>
    <div id="rLeftUp"> </div>
    <div id="rRight"> </div>
    <div id="rLeft"> </div>
    <div id="rUp"> </div>
    <div id="rDown"></div>
</div>
</div></div>
<div id="imgBox_pre">
<strong>预览</strong>
<div id="viewDiv" style="width:200px;height:150px; border:3px solid #ccc;"> </div>
<asp:Button ID="BtnCut" runat="server" Text="裁剪" OnClientClick="return Create();"  OnClick="Cut_Click" />  
<input id="BtnReCut" type="button"  value="使用原图" onclick="parent.closdlg();" /> 
</div>
<div style="clear:both;"></div> 
<div style="clear:both; margin-top:10px;">
<input id="iP" name="iP"  value='<%=Request.Form["iP"] %>' type="hidden"/>
左:<input id="ix"   name="ix"  value='<%=Request.Form["ix"] %>'  type="text" size="5" />
上:<input id="iy"  name="iy" value='<%=Request.Form["iy"] %>' type="text" size="5"  />
<input id="iw" name="iw" value='<%=Request.Form["iw"] %>' type="hidden" />
<input id="ih" name="ih"   value='<%=Request.Form["ih"] %>' type="hidden" />
 宽：<input id="ipw" name="ipw"  value='<%=Request.Form["ipw"] %>' type="text" size="5"  />
 高：<input id="iph" name="iph"  value='<%=Request.Form["iph"] %>' type="text" size="5"  />  
<%--<input id="idPic" type="button" value="换图" />--%>
   <div style="width:0; overflow:hidden;"> <img id="img1" runat="server" src=''/></div> </div>
</form>
 </div>
<script type="text/javascript" src="/JS/ImgCropper.js"></script>
<script type="text/javascript" src="/JS/picDrag.js"></script>
<script type="text/javascript" src="/JS/Resize.js"></script>
<script>  
var ic = new ImgCropper("bgDiv", "dragDiv", "<%=Request["p"]%>?<%=Request["d"]%>", {
Width: 400, Height: 300, Color: "#000",
    Resize: true,
    Right: "rRight", Left: "rLeft", Up: "rUp", Down: "rDown",
    RightDown: "rRightDown", LeftDown: "rLeftDown", RightUp: "rRightUp", LeftUp: "rLeftUp",
    Preview: "viewDiv", viewWidth: 200, viewHeight: 150
})

    document.getElementById("img1").src = '<%=Request["p"]%>?<%=Request["d"]%>';
function Create() {
    var p = ic.Url, o = ic.GetPos(); 
    x = o.Left,
    y = o.Top,
    w = o.Width,
    h = o.Height,
    pw = document.getElementById("img1").width;// ic._layBase.width,
    ph = document.getElementById("img1").height;//ic._layBase.height;
    var sca = 1;
    var sca1=pw/ic._layBase.width;
    var sca2=ph/ic._layBase.height;
    if (ic._layBase.width == 400) {
        sca = sca1;
    }
    else sca = sca2;
    document.getElementById("iP").value = ic.Url;
    document.getElementById("ix").value = x * sca;
    document.getElementById("iy").value = y * sca;
    document.getElementById("iw").value = pw; 
    document.getElementById("ih").value = ph;
    document.getElementById("ipw").value = w * sca;
    document.getElementById("iph").value = h * sca;
    return  true;
}
</script> 
</body>
</html>
