<%@ page language="C#" autoeventwireup="true" inherits="PubAction, App_Web_5kosraee" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<title>投票</title>
<script src="/JS/ajaxrequest.js"></script>
    <link href="../App_Themes/Microblog/global.css" rel="stylesheet" type="text/css" />
<script>
    function ActionSec(obj,tit, url) {
        //obj -1未登录,1为成功  url :要跳转的路径
        if (obj == -1) {
            alert("提交失败!");
        }
        if (obj == 1) {
            parent.getvoteTit(tit, url);
            window.closed();
  }
//        //alert(obj);
//        window.location.href = url;
    }

</script>
</head>
<body>
<form id="form1" runat="server">
<div class="main">
          
            <ul style="text-align: center; text-align: center">
             <table width="100%"><tr><td width="15%" align="right"> 标题：</td><td align="left"><asp:TextBox ID="TxtQTitle" runat="server" Width="200px"></asp:TextBox></td></tr>
             <tr><td align="right">类型：</td><td align="left"><asp:RadioButtonList ID="RblTypeID" runat="server" RepeatDirection="Horizontal">
          <asp:ListItem Value="1" Selected="True">单选项</asp:ListItem>
          <asp:ListItem Value="2">复选项</asp:ListItem>
        </asp:RadioButtonList></td></tr>
             <tr><td align="right"> 选项：</td><td align="left"><asp:TextBox ID="RadioType_Content" class="l_input" runat="server" 
					TextMode="MultiLine" Columns="25" Rows="6" Height="68px"></asp:TextBox> <span style="color: red"> *</span>分行键入每个选项
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="RadioType_Content">选项不能为空</asp:RequiredFieldValidator></td></tr>
             <tr><td align="center" colspan="2">  <asp:Button ID="Button6" runat="server" Width="80px" OnClick="EBtnSubmit_Click" Text="确定" /></td></tr>
             </table>    
            </ul>
            <ul style="text-align: center; text-align: center">
                <br />
            </ul>
        </div>
</form>
</body>
</html>