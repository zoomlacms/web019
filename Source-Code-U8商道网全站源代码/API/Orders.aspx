<%@ page language="C#" autoeventwireup="true" inherits="API_Ucenter, App_Web_kt1scike" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%--<script type="text/javascript" src="http://code.zoomla.cn/jquery/jquery.min-1.9.0.js"></script>
<script type="text/javascript">
     $.ajax({
        url:"http://localhost:86/API/Orders.aspx?callback=?",   //"http://localhost:88/echo.ashx?callback=?",   
		type: "POST",
        dataType:"jsonp", 
        jsonpCallback:"person",
		 data: "uri=www.zoomla.cn&shopid=1&Price=12&tid=1&user=uuuuuuuuuuuuu",//uri:域名;uname:用户名;pwd:必须为MD5加密; tid: 1 添加,2 修改, 3 删除
        success:function(msg){   
		 switch (msg) {
                  case 0: alert("无相应权限，请检查是否通过统一认证中心授权"); break;
                  case 1: alert("认证成功"); break; 
				  case -1: alert("无添加权限"); break; 
				  case -2: alert("无修改权限"); break; 
				  case -3: alert("无删除权限"); break;  
				  case -4: alert("已存在此用户"); break; 
                  default: alert("认证失败" + msg); break;
             } 
        } 
   });
</script>--%>