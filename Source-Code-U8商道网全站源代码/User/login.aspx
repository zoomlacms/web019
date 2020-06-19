<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="User_login, App_Web_ap03glsj" enableviewstatemac="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>用户登录-<%Call.Label("{$SiteName/}"); %></title>
<link type="text/css" href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="/App_Themes/UserThem/Responsive.css"rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../JS/ajaxrequest.js"></script>
<%--   <!--新浪微博-->
<script src=" http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=372074048" type="text/javascript" charset="utf-8"></script>--%>
<!--腾迅QQ-->
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="<%=QQAPPID%>" data-redirecturi="<%=QQCALLBACKURL%>" charset="utf-8"></script>
<!--百度---->
<%--<script type="text/javascript" src="http://openapi.baidu.com/connect/js/v2.0/featureloader"></script>--%>
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
</head>
<body onload="onfocus();" class="backs" >
    <div class="navbar navbar-fixed-top" style="background-color:#004b9b;">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand hidden-sm" style="color:#fff;" href="/" title="首页"><%:Call.SiteName%></a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="http://www.zoomla.cn">官网首页</a></li>
            <li><a href="http://bbs.zoomla.cn/">技术社区</a></li>
            <li><a href="http://www.zoomla.cn/pub/">下载产品</a></li>
            <li><a href="http://help.zoomla.cn/">使用帮助</a></li>
          </ul>
        </div>
      </div>
    </div>

<form id="form" runat="server">
     <div id="main" class="container">
        <div id="main_l" class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="padding:0 5px;" >
            <div class="main_ldiv" style="margin:auto;">
                <h1 ><span class="glyphicon glyphicon-user pull-left"></span>登录会员中心</h1>
                <ul class="list-unstyled">
                    <li>
                        <asp:TextBox ID="TxtUserName" placeholder="用户名" runat="server" CssClass="form-control"></asp:TextBox><div class="clearfix"></div>
                    </li>
                    <li>
                        <asp:TextBox ID="TxtPassword" placeholder="密码" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox><div class="clearfix"></div>
                    </li>
                    <li>
					 <div class="form-group"  visible="false" id="trVcodeRegister" runat="server">
                     <div class="col-sm-8 col-lg-8 col-md-8 col-xs-12"  style="padding-left:0">
                      <asp:TextBox ID="TxtValidateCode" placeholder="验证码" MaxLength="6" runat="server" CssClass="form-control pull-left"></asp:TextBox>
                    </div>
                    <div class="col-sm-4 col-lg-4 col-md-4 col-xs-12 ">
                       <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/ValidateCode.aspx" Height="20px" ToolTip="点击刷新验证码" Style="cursor: pointer; vertical-align: middle;" onclick="this.src='../Common/ValidateCode.aspx?t='+Math.random()" />
                    </div>
                  </div>
                  <div class="clearfix"></div>
     </li>
                    <li>
                        <input type="checkbox" name="checkbox" checked="checked" id="checkbox" />记住登录<a href="/User/GetPassword.aspx" style="margin-left:5px;margin-right:5px;">忘记密码？</a>
                        <a href="Register.aspx">点此注册</a>
                        <a href="Register.aspx?Source=Plat">能力中心</a>
                        <asp:Button ID="btnLogin" CssClass="btn btn-info pull-left" OnClientClick="return BtnTj();" Width="100%" runat="server" Text="登录" onclick="btnLogin_Click" />
                        <div class="clearfix"></div>
                    </li>
                </ul>
                <div id="main_s" style="display:none">
                    <ul>
                        <li style="color:green; font-size:14px; font-weight:bold">欢迎您！登录成功</li>
                        <li style="margin-top:25px;">系统将在 <span id="sec">3</span> 秒后自动跳转到<a href="MemoView.aspx">会员首页</a></li>
                    </ul>
                </div>
                <div  id="alipayDIV">
                    <div style="border-bottom:solid #fff 1px;"><label id="AppTitle" runat="server">第三方登录平台</label></div>
                    <div  class="applgntype">
                        <%--<span style="float:left;margin-top:10px;" id="wb_connect_btn">微博</span>--%>
                        <asp:LinkButton ID="appSina" ToolTip="新浪" runat="server" Style="background-image: url('/images/sina.gif');background-repeat: no-repeat; " OnClick="appSina_Click"></asp:LinkButton>
                        <span id="qqLoginBtn" title="QQ" runat="server" style="padding:0;" ><img src="/images/sina.gif" /></span>
                        <asp:LinkButton ID="appBaidu" ToolTip="百度" runat="server" style="background-image:url('/images/bdidu.gif');background-repeat:no-repeat;"  OnClick="appBaidu_Click"></asp:LinkButton>
                        <asp:LinkButton ID="appKaiXin" ToolTip="开心网" runat="server"  style="background-image:url('/images/kaixin.gif');background-repeat:no-repeat;" onclick="appKaiXin_Click1" ></asp:LinkButton>
                        <asp:LinkButton ID="appRenRen" ToolTip="人人网" runat="server" style="background-image:url('/images/renren.gif');background-repeat:no-repeat;" onclick="appRenRen_Click1" ></asp:LinkButton>
                        <asp:LinkButton ID="appNetease" ToolTip="网易" runat="server" style="background-image:url('/images/wangyi.gif');background-repeat:no-repeat;" OnClick="appNetease_Click1" ></asp:LinkButton>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div style="display:none;"><asp:LinkButton ID="appQQ" runat="server" Style="background-image: url('/App_Themes/AdminDefaultTheme/images/QQ.png'); background-repeat: no-repeat;" OnClick="appQQ_Click"> QQ</asp:LinkButton></div>
                </div>
        </div>
        <div id="main_r"  class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <h2>登录会员中心您将获得：</h2>
            <ul class="list-unstyled">
                <li>自由发布信息</li>
                <li>查看积分与管理空间</li>
                <li>设定您的个性化空间</li>
                <li>提交您的需求为您服务</li>
                <li>购物支付多彩商务体验</li>
                <li>专业的用户中心引领E时代！</li>
                <li><asp:HyperLink ID="hlReg" runat="server"  NavigateUrl="~/User/I/login.aspx?RegID=1">Email登录</asp:HyperLink> &nbsp; <asp:HyperLink ID="uidReg" runat="server"  NavigateUrl="~/User/I/login.aspx?RegID=2">用户ID登录</asp:HyperLink> </li>
            </ul>
        </div><div class="clear"></div>
    </div><!--main end -->        
    
  
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

      
    <script>
        var a = function (id, str) {
            var s = str;
            $("#" + id).val(s).css('color', '#999')
            .focus(function () { if (this.value == s) { this.value = ''; this.style.color = 'black'; } })
            .blur(function () { if (this.value == '') { this.value = s; this.style.color = '#999'; } });
        }
        $().ready(function ()
        {
            a('TxtUserName', '用户名');
        })
    </script>
</form>
</body>
</html>