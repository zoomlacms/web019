<%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_Mail_SelUser, App_Web_f5u0rubg" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>选择会员</title>
<link type="text/css" href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
</head>
<body style="background:none;">
<form id="form1" runat="server">
<div id="seluser">
    <div>
    <ul class="list-unstyled" id="Group">
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
        <ItemTemplate>
            <li><input type="checkbox" onclick="chkAll(this);"  name="ck1" value="<%#Eval("GroupID") %>" myName="<%#Eval("GroupName")%>" />
                <a href="javascript:;" ><%# Eval("GroupName") %></a>
                <ul class="list-unstyled userul" style="padding-left:20px;display:none;">
                    <asp:Repeater ID="Repeater2" runat="server" >
                        <ItemTemplate>
                            <li>
                                <input type="checkbox"  name="ck2" value="<%#Eval("UserID") %>" myName="<%#Eval("UserName")%>" />
                                <a href="javascritp:;"><%#Eval("UserName") %></a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </li>
        </ItemTemplate>
    </asp:Repeater>
    </ul>
    <div ><button type="button" onclick="sureuser()" class="btn btn-info">确认</button></div>
    </div>
</div>
</form>
<script>
    var IDS = '<% =Request.QueryString["SUID"]%>';
    var CID = '<% =Request.QueryString["CUID"]%>';
    var IDArr = IDS.split(',');
    var CIDArr = CID.split(',');
    selectID(IDArr);
    selectID(CIDArr);
    function selectID(Arr)
    {
        for (var j = 0; j < Arr.length; j++) {
            chkArr1 = $("#Group").find(":checkbox[name=ck2][value=" + Arr[j] + "]");
            for (var i = 0; i < chkArr1.length; i++) {
                chkArr1[i].checked = true;
            }
        }
    }
    function chkAll(obj)
    {
        chkArr = $(obj).parent().find(":checkbox[name=ck2]");
        for (var i = 0; i < chkArr.length; i++) {
            chkArr[i].checked = obj.checked;
        }
    }
    function valueChk()//有参则选中默认值
    {
        if (getParam("Gid")) {
        }
        if (getParam("Uid")) {
           
        }
    }
    $().ready(function () {
        valueChk();
        $("#Group").children('li').children('a').click(function () {
            $(this).parent().children('ul').toggle("fast");
        });
    });
    function sureuser()
    {
        //[{ "userName": "wtwt", "userID": 1}];
        var groupJson="";//需要赋值，否则下面会为undefined{}
        var userJson = "";
        $("input[type=checkbox][name=ck1]:checked").each(function ()
        {
            groupJson += '{ "Gname": "'+$(this).attr("myName")+'", "Gid":"'+$(this).val()+'"},';
        })
        $("input[type=checkbox][name=ck2]:checked").each(function ()
        {
            userJson += '{ "Uname": "' + $(this).attr("myName") + '", "Uid": "' + $(this).val() + '"} ,';
        })
        if (groupJson)
        {
            groupJson = groupJson.substring(0, groupJson.length - 1);
            groupJson = eval("["+groupJson+"]");
        }
        if (userJson) {
            userJson = userJson.substring(0, userJson.length - 1);
            userJson = eval("[" + userJson + "]");
        }
        if ('<%= Request.QueryString["Type"]%>' == "1") {
            parent.seluser1(groupJson, userJson);
        }
        else
        {
            parent.seluser(groupJson, userJson);
        }
        $(":checkbox").each(function () { this.checked = ''; });
        parent.hidediv();
    }
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
</script>
</body>
</html>
