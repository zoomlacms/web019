<%@ page language="C#" autoeventwireup="true" inherits="User_Shopfee_Moneytop, App_Web_3mkh55sp" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>支付跳转页</title>
 <link type="text/css" href="../../App_Themes/UserThem/style.css" rel="Stylesheet" />
 <link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function sterline(s) {
    if (s == 1) {
        document.getElementById("sterline").style.display = 'block';
        document.getElementById("other").style.display = 'none';
    } else {
        document.getElementById("other").style.display = 'block';
        document.getElementById("sterline").style.display = 'none';
    }
}
</script>
<style>
#main h1{ font-size:16px; color:#F00; }
.toptitle { display:block; border-bottom:2px solid #c6e3f7;height:32px; line-height:30px;}
.toptitle a{ display:block; float:left; margin-left:20px; background:#C6E3F7; border:1px solid #fff; width:100px; height:30px; font-size:14px;}
.toptitle a:hover{background:#FFF; border:1px solid #C6E3F7;}
.p_center { margin-top:10px;}.p_center td{ border:1px solid #c6e3f7; line-height:25px; padding:0px 5px;}
.p_center table{ border-collapse:collapse;}
</style> 
</head>
<body>
<form id="form1" runat="server">
<div id="main" class="rg_inout">
<h1><strong>支付跳转</strong> <img alt="" src="/user/images/regl3.gif" width="242" height="14" /></h1>
<table cellspacing="0" cellpadding="0" width="100%" border="0"  align="center">
    <tbody>
        <tr>
            <td align="center">
                <div class="toptitle">
                <asp:LinkButton ID="Button1" runat="server" Text="人民币支付"  PostBackUrl="UserOrderinfo.aspx" ></asp:LinkButton>
                 <a href="javascript:sterline(1)">英镑支付</a>
                 <a href="javascript:sterline(2)">美元货币</a>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="topline"></td>
        </tr>
        <tr><td style=" border:1px solid #c6e3f7; padding-left:10px;"> 
<div id="sterline" style="display: none">
    <asp:LinkButton ID="LinkButton1" runat="server" Text="线下汇款"  PostBackUrl="UserOrderinfo.aspx?page=1" /><br />
    <asp:LinkButton ID="LinkButton2" runat="server" Text="Paypal支付"  PostBackUrl="PaypalDefray.aspx?page=1" />
</div>
<div id="other" style="display: none">
    <asp:LinkButton ID="LinkButton3" runat="server" Text="Paypal支付"  PostBackUrl="PaypalDefray.aspx?page=2" />
</div>
        </td></tr>
    </tbody>
</table>
</div>
<div id="bottom"> <a href="/"><img src="/images/logo.gif" alt="逐浪CMS" /></a>
<p> 
  <script language="javascript" type="text/javascript"> 
<!--
      var year = "";
      mydate = new Date();
      myyear = mydate.getYear();
      year = (myyear > 200) ? myyear : 1900 + myyear;
      document.write(year); 
--> 
</script>&copy;&nbsp;Copyright&nbsp;
  逐浪CMS
  All rights reserved.</p>
</div>
 
</form>
</body>
</html>