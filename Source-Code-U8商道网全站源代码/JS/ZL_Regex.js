/*
 *正则支持,Coffee
 */
function isEmpty(s) {
    s = $.trim(s);
    if (s.length > 0)
        return false;
    else
        return true;
}
//是否包含中文
function isContainChina(s) {
    var patrn = /[\u4E00-\u9FA5]|[\uFE30-\uFFA0]/gi;
    if (patrn.exec(s))
        return true;
    else
        return false;
}
//邮箱格式验证
function isEmail(s) {
    var patrn = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/gi;
    if (patrn.exec(s)) {
        return true;
    }
    else {
        return false;
    }
}
//是否手机号码
function isMobilePhone(s) {
    var patrn = /^1[(0-9)]{10}$/gi;
    if (patrn.exec(s)) {
        return true;
    }
    else {
        return false;
    }
}
//是否邮编
function isZipCode(s) {
    s = $.trim(s);
    if (isInt(s) && s.length == 6)
        return true;
    else
        return false;
}
//是否整数
function isInt(s) {
    var patrn = /^\d+(\d+)?$/gi;
    if (patrn.exec(s)) {
        return true;
    }
    else {
        return false;
    }
}
//是否正浮点数或正整数
function isNum(s)
{
    var patrn = /^\d+(\.\d+)?$/gi;
    if (patrn.exec(s)) {
        return true;
    }
    else {
        return false;
    }
}
//---域名注册使用
//---允许英文,数字,空格，不能有中文，英文中一定要带空格,注:传入的值用trim();,用于单位(英文名)等地方
function domIsEng(s)
{
    var patrn = /[^a-zA-Z0-9\s]+/gi;
    if (!patrn.exec(s)) {
        i = s.toString().indexOf(" ");
        return i > 0;
    }
    else {
        return false;
    }
}