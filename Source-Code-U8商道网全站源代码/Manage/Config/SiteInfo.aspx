<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="ZoomLa.WebSite.Manage.Config.SiteInfo, App_Web_swkw1mwp" enableviewstate="False" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>网站信息配置</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/Common.js"></script>
<script type="text/javascript">
    var tID = 0;
    var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3", "TabTitle4", "TabTitle5", "TabTitle6", "TabTitle7", "TabTitle8", "TabTitle9");
    var arrTabs = new Array("Div0", "Div1", "Div2", "Div3", "Div4", "Div5", "Div6", "Div7", "Div8", "Div9");
    window.onload = function() {
        pload();
    }
    function ShowTabs(ID) {            
        location.href = 'ContentManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&id=' + ID + '&type=' + ID;
    }
    function pload() {
        var ID = '<%=Request.QueryString["id"]%>';
        if (ID != tID) {
            document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
            document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
            tID = ID;
        }
     
    }
    function CheckInfo() {//更新配置前检测
        var a = document.getElementById("<%=CustomPath.ClientID%>").value;
         if (a.length < 3) {
             alert("个性化路径最少三位");
             document.getElementById("<%=CustomPath.ClientID%>").focus();
                return false;
         }
         else if (a.toLowerCase() == "user")
         {
             alert("不允许使用已有目录名user");
             document.getElementById("<%=CustomPath.ClientID%>").focus();
             return false;
         }
        setTimeout(function () { document.getElementById('Button1').disabled = true; }, 50)
            return true;
        }
</script>
</head>
<body>
<form id="form1" runat="server">
<div id="nav_box">
  <div class="r_navigation">
  <%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('2')" title="帮助"></a></div>
  <%} %>  后台管理&gt;&gt;系统配置 &gt;&gt;网站信息配置</div>
</div>
<div style="height:28px;"></div>
  <table width="100%" cellspacing="1" cellpadding="0" class="border">
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 200px"><strong>网站名称：</strong></td>
      <td><asp:TextBox ID="TextBox1" runat="server" Width="210px" class="l_input"></asp:TextBox></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 200px"><strong>网站标题：</strong></td>
      <td><asp:TextBox ID="TextBox2" runat="server" Width="210px" class="l_input"></asp:TextBox></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 200px"><strong>网站地址：</strong></td>
      <td><asp:TextBox ID="TextBox3" runat="server" Width="210px" class="l_input" Style="float:left;" ></asp:TextBox>
        <span  Style="float:left;color:#1e860b;" > &nbsp;当前网址：<asp:Literal ID="siteurl" runat="server"></asp:Literal></span>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="网址不能为空"  Style="float:left;" Display="Dynamic"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="^[a-zA-z]+://[^s]*[^d]*$" runat="server" ErrorMessage="网址格式错误，需加'http://'头" ControlToValidate="TextBox3"  Style="float:left;" Display="Dynamic"></asp:RegularExpressionValidator>
        </td>
    </tr>
       <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 200px"><strong>后台路径：</strong></td>
      <td><asp:TextBox ID="CustomPath" runat="server" Width="210px" MaxLength="10" class="l_input" onkeyup="value=value.replace(/[^\w\/]/ig,'')"  />
          <span style="color:#1e860b;"> 3-10英文数字组合</span>

      </td>
    </tr>
       <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 200px"><strong>安全目录：</strong></td>
      <td><asp:TextBox ID="NeedCheckRefer" runat="server" Width="210px" class="l_input" onkeyup="value=value.replace(/[^\w\/]/ig,'')"  />
          <span style="color:#1e860b;"> 例如:User/或User/info/指定目录下的页面将禁止直接访问</span>
      </td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 200px; "><strong>LOGO地址：</strong></td>
      <td><asp:TextBox ID="TextBox4" runat="server" Width="210px" class="l_input"></asp:TextBox></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 200px; "><strong>后台LOGO：</strong></td>
      <td><asp:TextBox ID="TextBox11" runat="server" Width="210px" class="l_input"></asp:TextBox></td>
    </tr>
    <tr class="tdbg">
      <td class="tdbgleft" style="width: 200px; height: 23px;"><strong>Banner地址：</strong></td>
      <td><asp:TextBox ID="TextBox5" runat="server" Width="210px" class="l_input"></asp:TextBox></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft"><strong>站长姓名：</strong></td>
      <td><asp:TextBox ID="TextBox6" runat="server" Width="210px" class="l_input"></asp:TextBox></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 200px"><strong>站长信箱：</strong></td>
      <td><asp:TextBox ID="TextBox7" runat="server" Width="210px" class="l_input"></asp:TextBox></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 200px"><strong>网站META关键词：</strong></td>
      <td><asp:TextBox ID="TextBox9" runat="server" TextMode="MultiLine" Rows="3" Columns="60" class="x_input"></asp:TextBox></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 200px"><strong>网站META网页描述：</strong></td>
      <td><asp:TextBox ID="TextBox10" runat="server" TextMode="MultiLine" Rows="3" Columns="60" class="x_input"></asp:TextBox></td>
    </tr>
    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 200px; height: 68px;"><strong>版权信息：</strong></td>
      <td><asp:TextBox ID="TextBox8" runat="server" TextMode="MultiLine" Rows="5" Columns="60" class="x_input"></asp:TextBox></td>
    </tr>
     <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
      <td class="tdbgleft" style="width: 200px"><strong>站长统计脚本：</strong></td>
      <td><asp:TextBox ID="allSiteJS" runat="server" TextMode="MultiLine" Rows="5" Columns="60" class="x_input" /></td>
    </tr>
  </table>
  <br />
  <asp:Button ID="Button1" runat="server" Text="保存设置" OnClick="Button1_Click" class="C_input" OnClientClick="return CheckInfo()"/>
  <br />
</form>
</body>
</html>