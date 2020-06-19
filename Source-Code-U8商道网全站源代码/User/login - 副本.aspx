<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="User_login, App_Web_oitxanq2" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head runat="server">
<title>用户登录-<%Call.Label("{$SiteName/}"); %></title>
<%Call.Label("{ZL:Boot()/}"); %>
<link href="../App_Themes/UserThem/style.css"rel="stylesheet" type="text/css" />
<link href="<%Call.Label("{$CssDir/}"); %>global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../JS/ajaxrequest.js"></script>

 <%--   <!--新浪微博-->
    <script src=" http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=372074048" type="text/javascript" charset="utf-8"></script>--%>

    <!--腾迅QQ-->
<script type="text/javascript"
src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="<%=QQAPPID%>" data-redirecturi="<%=QQCALLBACKURL%>" charset="utf-8"></script>
   
     <!--百度---->
<%--<script type="text/javascript" src="http://openapi.baidu.com/connect/js/v2.0/featureloader"></script>--%>
<script src="../JS/jquery.js"></script>


<script src="../JS/jquery.js"></script>
<%--<script type="text/javascript">
    //第一个参数导入百度连接模块,第二个是:模块和其依赖模块全部加载完毕之后的回调函数回调函数的第一个参数将传入导入模块，我们可以通过这个参数调用导入模块的公开方法。 在connect里面，需要使用connect模块的init方法对页面进行初始化，如下：
    //另外其他的login等方法，必须放在回调函数中，否则无法生效。
        baidu.require('connect', function (connect) {
            //第一个参填入appid,第二个主动更新用户登录状态
            connect.init('GrtjhcBVCxPohioKW0SkHyPW', { statue: true }
               );   
        });

    </script>--%>
<script type="text/javascript">
if (self != top) { top.location = self.location; }
function onfocus() {
    try {
     document.getElementById('TxtUserName').focus();
    }catch(Error){}
}
var sts = 3;//登录后跳转等待时间;单位：秒
function sucse(s, url) {
    if (s == 1) {//成功
        document.getElementById("main_l").style.display = "none";
        document.getElementById("main_s").style.display = "";
        document.getElementById("sec").innerHTML = sts;
        setInterval(loacationgoto, 1000);
    }
    else {
        document.getElementById("main_l").style.display = "";
        document.getElementById("main_s").style.display = "none";
    }
}
function BtnTj() {
    var username = document.getElementById("TxtUserName");
    var userpass = document.getElementById("TxtPassword"); 
    var TxtValidateCode = document.getElementById("TxtValidateCode");

    if (username.value == "") {
        username.focus();
        return false;
    }
    if (userpass.value == "") {
        userpass.focus();
        return false;
    }
    if (TxtValidateCode&&TxtValidateCode.value == "") {
        TxtValidateCode.focus();
        return false;
    }
}


</script>
<style>
body{ background:none}
#main_l li{ margin-top:10px;}
</style>
</head>
<body onload="onfocus();" >
<%Call.Label("{ZL.Label id=\"全站头部\" /}"); %>
<div class="container">
<div class="row">
<div  class=" col-lg-4 col-md-4 col-sm-4 col-xs-12 padding5">
<div class="con_bor" style="height:295px;">
<div class="con_titss">
<strong>个人会员可以：</strong>
<p>
帮助创业者，实现财富梦想。
</p>
</div>
<div class="con_lis">
<ul><li>.助您找到适合自己的创业项目；</li>
<li>.可以查看自己的留言信息；</li>
<li>.免费在网站上发布信息；</li>
<li>.享受推广系统拿8%-20%佣金；</li>
<li>.享受专业的创业咨询和指导；</li>
<li>.可以享受精品项目定向推荐；</li>
<li>.可以享受正规企业创业扶持；</li>
<li><a href="/User/Register.aspx">我是创业者，我要注册>></a></li>
 </ul>
</div>
</div>
</div>

<div  class=" col-lg-4 col-md-4 col-sm-4 col-xs-12 padding5">
<div class="con_bor" style="height:295px;">
<div class="con_titss">
<strong>企业会员可以：</strong>
<p>
中小企业招商破局寻道的制高点
</p>
</div>
<div class="con_lis">
<ul><li>.完善公司信息，获得更多关注机会；</li>
<li>.免费发布项目资讯或宣传软文；</li>
<li>.获得参与发布网站优惠活动机会；</li>
<li>.享受专业的企业咨询和指导；</li>
<li>.享受成千上万会员推广，提升关注机会；</li>
<li><a href="/User/Register.aspx">我是企业，我要注册>></a></li>

  </ul>
</div>
</div>
</div>
    
<div  class=" col-lg-4 col-md-4 col-sm-4 col-xs-12">

 <div  style="position:relative;">
 <div class="con_bor" style="margin-top:15px; height:295px;">
 <div class="con_login_tit"><strong>会员登录</strong></div>
 <div class="con_login_f">
    <form id="form" runat="server">
<div id="main_l" style="width:auto; padding:0; background:none; margin:0;">

<ul style="padding:0;">
 <li><asp:Label ID="lblUser" runat="server" Text="用户名："></asp:Label>
<asp:TextBox ID="TxtUserName" runat="server" style="width:140px; margin-left:20px ;border:#CCC solid 1px;"  CssClass="input_out"  onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'"></asp:TextBox>

    
</li>
      
<li>密　码： <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" style="width:140px; margin-left:20px; border:#CCC solid 1px;"  CssClass="input_out"  onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'"></asp:TextBox></li>
<li><div class="reg_put" id="trVcodeRegister" visible="false" runat="server" >
    验证码：<asp:TextBox ID="TxtValidateCode" MaxLength="6" runat="server" style="width:140px; margin-left:20px ;border:#CCC solid 1px;" CssClass="input_out"  onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'"></asp:TextBox>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/ValidateCode.aspx" Height="20px" ToolTip="点击刷新验证码" Style="cursor: pointer; border: 0; vertical-align: middle;" onclick="this.src='../Common/ValidateCode.aspx?t='+Math.random()" />        </div>
</li>
<li><asp:Button ID="btnLogin" CssClass="i_bottom" OnClientClick="return BtnTj();" runat="server" Text="登　录" onclick="btnLogin_Click" />　

<input type="checkbox" name="checkbox" checked="checked" id="checkbox" style="margin-left:18px" />记住登录&nbsp;
  &nbsp;  <a href="/User/GetPassword.aspx">忘记密码了？ </a></li>
<li style="margin-top:10px;  ">如果您尚未在本站注册为用户，请先点击<a href="Register.aspx">点此注册</a>。</li>
</ul>
</div>

<div id="main_s" style="display:none">
<ul>
<li style="color:green; font-size:14px; font-weight:bold">欢迎您！登录成功</li>
<li style="margin-top:25px;">系统将在 <span id="sec">3</span> 秒后自动跳转到<a href="MemoView.aspx">会员首页</a></li>
</ul>
</div>

  <div  id="alipayDIV">
      <br />    
<div style="border-bottom:solid #fff 1px; width:270px;"><label id="AppTitle" runat="server">第三方登录平台</label>

</div>
    <div  class="applgntype">
        <span style="margin-left:10px;"></span>
<%--        <span style="float:left;margin-top:10px;" id="wb_connect_btn">微博</span>--%>
                <asp:LinkButton ID="appSina" runat="server" Style="background-image: url('../App_Themes/AdminDefaultTheme/images/Sina.png');background-repeat: no-repeat; " OnClick="appSina_Click">　 新浪</asp:LinkButton>

        <span  id="qqLoginBtn" runat="server" >QQ</span>
                <asp:LinkButton ID="appBaidu" runat="server" style="background-image:url('../App_Themes/AdminDefaultTheme/images/Baidu.png');background-repeat:no-repeat;"  OnClick="appBaidu_Click">　 百度</asp:LinkButton>
      
                 
                 <asp:LinkButton ID="appKaiXin" runat="server"  style="background-image:url('../App_Themes/AdminDefaultTheme/images/Kaixin.png');background-repeat:no-repeat;"
          onclick="appKaiXin_Click1" >　 开心</asp:LinkButton>
                 <asp:LinkButton ID="appRenRen" runat="server" style="background-image:url('../App_Themes/AdminDefaultTheme/images/Renren.png');background-repeat:no-repeat;"
          onclick="appRenRen_Click1" >　 人人</asp:LinkButton>
                <asp:LinkButton ID="appNetease" runat="server" style="background-image:url('../App_Themes/AdminDefaultTheme/images/Netease.png');background-repeat:no-repeat;"
          onclick="appNetease_Click1" >　 网易</asp:LinkButton>
    </div></div>
 <div style="display:none;"> <asp:LinkButton ID="appQQ" runat="server" Style="background-image: url('../App_Themes/AdminDefaultTheme/images/QQ.png');
                background-repeat: no-repeat;" OnClick="appQQ_Click"> QQ</asp:LinkButton>
                   </div>
</form>
<div class="clearfix"></div>
</div>
</div>
<div id="main_r" style="display:none">
 
    <li><asp:HyperLink ID="hlReg" runat="server"  NavigateUrl="~/User/login.aspx?RegID=1">Email登录</asp:HyperLink> &nbsp; <asp:HyperLink ID="uidReg" runat="server"  NavigateUrl="~/User/login.aspx?RegID=2">用户ID登录</asp:HyperLink> </li>
 </div><div class="clear"></div>
</div><!--main end -->
</div> 
             
 
  
<%--<script type="text/javascript">
    //新浪微博,需部署，本地无效
    WB2.anyWhere(function (W) {
        W.widget.connectButton({
            id: "wb_connect_btn",
            type: '6,4',//登录前样式，登录后样式
            callback: {
                login: function (o) {	//登录后的回调函数
                    //O.id,o.screen_name
                    $.post("/user/AppBack.aspx", { nickName: o.screen_name, openId: o.id, Type: "Sina" }, function (data) {
                        if (data.result == 1) {
                            location.href = "/user/default.aspx";
                        }
                        else {
                            //alert(data.result);
                            location.href = "/user/AppBack.aspx?Type=Sina&openId=" + o.Id + "&nickname=" + o.screen_name;
                        }
                    }, "json");

                },
                logout: function () {	//退出后的回调函数
                }
            }
        });
    });
</script>--%>
<script type="text/javascript">

   // document.getElementById("qqLoginBtn").innerHTML="已登录";
    //该段代码为QQ登录处自定义显示脚本
    //调用QC.Login方法，指定btnId参数将按钮绑定在容器节点中;
    QC.Login({
        //btnId：插入按钮的节点id，必选
        btnId: "qqLoginBtn",
        //用户需要确认的scope授权项，可选，默认all
        scope: "all",
        //按钮尺寸，可用值[A_XL| A_L| A_M| A_S|  B_M| B_S| C_S]，可选，默认B_S
        size: "C_S"
    }, function (reqData, opts) {//登录成功
        //根据返回数据，更换按钮显示状态方法
        QC.Login.getMe(function (openId, accessToken) {
            $.post("/user/AppBack.aspx", { nickName: reqData.nickname, openId: openId,Type:""}, function (data) {
                if (data.result == 1)
                {
                   location.href = "/user/default.aspx";   
                }
                else
                {
                   // alert(data.result);
                    location.href = "/user/AppBack.aspx?type=QQ&openId=" + openId + "&nickname=" + reqData.nickname;
                }
            }, "json");

           // location.href = "AppBack.aspx?type=QQ&openId=" + openId + "&nickname=" + reqData.nickname + "&gender=" + reqData.gender;

        });//获取在线用户的信息
              
       // var dom = document.getElementById(opts['btnId']),
       //_logoutTemplate = [
       // //头像
       //     '<span><img src="{figureurl}" width="80" height="60" /></span><br/>', //class="{size_key}"
       // //昵称
       //     '<span style="color:#690;">{nickname}，您好，欢迎到逐浪CMS！</span><br/>',
       // //退出
       //     '<span><a href="javascript:QC.Login.signOut();" style="color:#f60;">==点此登出==</a></span>'
       //].join("");
       // dom && (dom.innerHTML = QC.String.format(_logoutTemplate, {
       //     nickname: QC.String.escHTML(reqData.nickname),
       //     figureurl: reqData.figureurl
       // }));

    }, function (opts) {//注销成功
        alert('QQ登录 注销成功');
    }
);
    if (QC.Login.check()) {//如果已登录
        //这里可以调用自己的保存接口

        //用JS SDK调用OpenAPI获取用户信息
        var paras = {};
        QC.api("get_user_info", paras)
        //指定接口访问成功的接收函数，s为成功返回Response对象
	    .success(function (s) {
	        //成功回调，通过s.data获取OpenAPI的返回数据
	        //alert("获取用户信息成功！当前用户昵称为：" + s.data.nickname);
            
	    })
        //指定接口访问失败的接收函数，f为失败返回Response对象
	    .error(function (f) {
	        //失败回调
	      
	    })
        //指定接口完成请求后的接收函数，c为完成请求返回Response对象
	    .complete(function (c) {
	        //完成请求回调
	    
	    });

        //调用自己的接口，保存信息
        //......
    }

    
</script>
 
</div>
</div>
<%Call.Label("{ZL.Label id=\"全站底部\" /}"); %>

</body>
</html>