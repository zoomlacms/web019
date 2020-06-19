 /*
  *该页面用于存放通用性最强的方法,必须严格控制体积与兼容性
  */
function getParam(paramName) {
    paramValue = "";
    isFound = false;
    if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
        arrSource = decodeURI(this.location.search).substring(1, this.location.search.length).split("&");
        i = 0;
        while (i < arrSource.length && !isFound) {
            if (arrSource[i].indexOf("=") > 0) {
                if (arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase()) {
                    paramValue = arrSource[i].split("=")[1];
                    isFound = true;
                }
            }
            i++;
        }
    }
    return paramValue;
}
//注:不同浏览器Cookie不通用
function setCookie(name, value) {
    var today = new Date()
    var expires = new Date()
    expires.setTime(today.getTime() + 1000 * 60 * 60 * 24 * 365)
    document.cookie = name + "=" + escape(value) + "; expires=" + expires.toGMTString()
}
function getCookie(cookie_name) {
    var allcookies = document.cookie;
    var cookie_pos = allcookies.indexOf(cookie_name);
    // 如果找到了索引，就代表cookie存在，
    // 反之，就说明不存在。  
    if (cookie_pos != -1) {
        // 把cookie_pos放在值的开始，只要给值加1即可。   
        cookie_pos += cookie_name.length + 1;
        var cookie_end = allcookies.indexOf(";", cookie_pos);
        if (cookie_end == -1) {
            cookie_end = allcookies.length;
        }
        var value = unescape(allcookies.substring(cookie_pos, cookie_end));
    }
    return value;
}

//页面使用:见/Site/Default.aspx,建议不要submit或return GetEnterCode阻止默认触发(推荐)
//--onkeydown="GetEnterCode('focus','TxtPassword');"
function GetEnterCode(a, id) {
    if (event.keyCode == 13) {
        switch (a) {
            case "click"://解发指定控件单击事件
                $("#" + id).trigger("click");
                break;
            case "focus"://焦点移到指定控件
                $("#" + id).focus();
                break;
        }
        return false;
    }//回车判断结束
    else { return true; }
}
//------------Button
//--disBtn(this); disBtn(this,2000);
function disBtn(o, t) {
    if (arguments.length == 1) {
        setTimeout(function () { o.disabled = true; }, 50);
    }
    else if (arguments.length == 2) {
        setTimeout(function () { o.disabled = true; }, 50);
        setTimeout(function () { o.disabled = false; }, t);
    }
}
//产生随机密码,可指定位数与是否使用特殊符号
//(6, true)||(6)  位数,是否启用特殊字符,不启用则为数字加字母
function GetRanPass(length, special) {
    var iteration = 0;
    var password = "";
    var randomNumber;
    if (special == undefined) {
        var special = false;
    }
    while (iteration < length) {
        randomNumber = (Math.floor((Math.random() * 100)) % 94) + 33;
        if (!special) {
            if ((randomNumber >= 33) && (randomNumber <= 47)) { continue; }
            if ((randomNumber >= 58) && (randomNumber <= 64)) { continue; }
            if ((randomNumber >= 91) && (randomNumber <= 96)) { continue; }
            if ((randomNumber >= 123) && (randomNumber <= 126)) { continue; }
        }
        iteration++;
        password += String.fromCharCode(randomNumber);
    }
    return password;
}
//-----------公用
function GetRandomNum(Min, Max) {//返回随机值,包含最小与最大数
    var Range = Max - Min;
    var Rand = Math.random();
    return (Min + Math.round(Rand * Range));
}
//----------用于响应式,移动设备优先
//第一列为0
function HideColumn(value,cls,id) {
    if (!cls) cls = "hidden-xs hidden-sm";
    if (!id) id = "EGV";
    var arr = value.split(',');
    for (var i = 0; i < arr.length; i++) {
        $("#" + id + " tr").each(function ()
        {
            $(this).find("td:eq(" + arr[i] + ")").addClass(cls);
            $(this).find("th:eq("+arr[i]+")").addClass(cls);
        });
    }
}

//使用:$(window).resize(function () {SetEditor("txt_content");});
//让百度编辑器可响应,编辑器ID，百分比(默认1,可输0.8,0.76等),最小宽度(默认400)
function SetEditor(id, wp, mw) {
    if (!wp) wp = 1;
    if (!mw) mw = 400;
    var width = (document.body.clientWidth||document.documentElement.clientWidth) * wp;
    if (width < mw) width = mw;
    var uu = UE.getEditor(id);
    uu.destroy();
    var editor = new UE.ui.Editor({ initialFrameWidth: width });
    editor.render(id);
}

//使用:$(window).resize(function () {SetEditorByClass();});
//百分比,最小宽度,class筛选
function SetEditorByClass(wp, mw,cs)
{
    if (!wp) wp = 0.65;
    if (!mw) mw = 400;
    if (!cs) cs = ".ueditor";
    var width = (document.body.clientWidth || document.documentElement.clientWidth) * wp;
    if (width < mw) width = mw;

    ueArr = $(cs);
    for (var i = 0; i < ueArr.length; i++) {
        if (ueArr[i].id == "" || ueArr[i].id == undefined) { continue; }
        $(ueArr[i]).removeClass("form-control");//移除BootStrap风格
        var uu = UE.getEditor(ueArr[i].id);
        uu.destroy();
        var editor = new UE.ui.Editor({ initialFrameWidth: width });
        editor.render(ueArr[i].id);
    }
   
}
var Num = 0;
var nn = 0;
function help_show(helpid) {
    Num++;
    var newDiv = document.createElement('div');
    var str = "<div id='help_content'  style='z-index:999;'></div><div id='help_hide'  style='z-index:999;'><a onclick='help_hide(Num)' style='width:20px;color:#666' title='关闭'><span class='glyphicon glyphicon-remove'></span></a></div> ";
    newDiv.innerHTML = str;
    newDiv.setAttribute("Id", "help_div" + Num);
    nn = Num - 1
    jQuery("#help").append(newDiv);
    help_hide(nn);
    jQuery("#help_content").load("/manage/help/" + helpid + ".html", function () { jQuery("#help").show(); });
}
function help_hide(Num) {
    jQuery("#help_div" + Num).remove();
}
