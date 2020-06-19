<%@ page language="C#" autoeventwireup="true" inherits="MIS_SelUser, App_Web_4bzezlil" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title> 会员列表</title>
<link href="../App_Themes/UserThem/Mis.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../JS/jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server">
   <div>
    <table width="100%" border="0" cellpadding="2" cellspacing="0" class="border">
      <tr class="tdbg">
        <td align="left"><input type="text" class="l_input" id="UserNameList" size="20" maxlength="100" readonly="readonly"  />
          <input type="hidden" name="HdnUserName" id="HdnUserName"/>  <input type="button" class="i_bottom" name="del2" onclick="del(0)" value="清除" /></td>
        <td align="center"> <asp:TextBox ID="TxtKeyWord" class="l_input" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:Button class="i_bottom" ID="BtnSearch" runat="server" Text="查找" /></td>
      </tr>
    </table>
    <br />
    <table width="100%" border="0" cellpadding="2" cellspacing="0" class="border">
    <tr class="title" style=" background:#e7f3ff" height="25">
      <td align="left"><b>会员列表：</b></td> 
    </tr>
    <tr>
    <td valign="top" ><div id="DivUserName" runat="server" visible="false"> 未找到任何用户！</div>
    <asp:Repeater ID="RepUser" runat="server" OnItemDataBound="RepUser_ItemDataBound">
      <HeaderTemplate>
        <table width="100%" border="0" cellspacing="1" cellpadding="1" class="border" style="line-height:25px; text-align:left;">
        <tr>
      </HeaderTemplate>
      <ItemTemplate>
        <td align="left" style="padding-left:5px;">
            <input type="checkbox"  name="ck1"  onclick="<%# "add(this,'" + Eval("UserName") + "')"%>" userName="<%#Eval("UserName") %>" value="<%#Eval("UserID") %>"/><%# Eval("UserName") %> </td>
        <%   i++; %>
        <% if (i % 5 == 0 && i > 1)
          {%>
        </tr>
        <tr>
        <%} %>
      </ItemTemplate>
      <FooterTemplate>
        </tr>
        </table>
      </FooterTemplate>
    </asp:Repeater>
    </td>
    </tr> 
    </table>
    <table border="0" align="center" cellpadding="2" cellspacing="0">
      <tr>
        <td align="center"></td>
      </tr>
    </table>
    <div id="pager1" runat="server"></div>
  </div>
  <script type="text/javascript">
      document.getElementById('UserNameList').value = parent.document.getElementById('<%= m_UserInput %>').value;
      function add(objs,obj) { 
          if (objs.checked) {
              if (obj == "") { return false; }
              // parent.getval();
              if (parent.document.getElementById('<%= m_UserInput %>').value == "") {
                  parent.document.getElementById('<%= m_UserInput %>').value = obj;
                  document.getElementById('UserNameList').value = parent.document.getElementById('<%= m_UserInput %>').value;
                  return false;
              }
              var singleUserName = obj.split(",");
              var ignoreUserName = "";
              for (i = 0; i < singleUserName.length; i++) {
                  if (checkUserName(parent.document.getElementById('<%= m_UserInput %>').value, singleUserName[i])) {
                      ignoreUserName = ignoreUserName + singleUserName[i] + " ";
                  }
                  else {
                      parent.document.getElementById('<%= m_UserInput %>').value = parent.document.getElementById('<%= m_UserInput %>').value + "," + singleUserName[i];
                      document.getElementById('UserNameList').value = parent.document.getElementById('<%= m_UserInput %>').value;
                  }
              }
              if (ignoreUserName != "") {
                  alert(ignoreUserName + "用户已经存在，此操作已经忽略！");
              }
          }
          else {
              var strDel = parent.document.getElementById('<%= m_UserInput %>').value;
              var s = strDel.split(",");
              var str = "";
              //if (s.length > 1) {
                  for (var i = 0; i < s.length; i++) {

                      if (s[0] == obj) {
                          if (s[i] == obj) {
                              str += "";
                          }
                          else {
                              if (i == s.length) {
                                  str += s[i];
                              }
                              if (i == 1) {
                                  str = s[i];
                              }
                              else { str += "," + s[i]; }
                          }
                      }
                      else {
                          if (s[i] == obj) {
                              str += "";
                          }
                          else {
                              if (i == s.length) {
                                  str += s[i];
                              }
                              if (i == 0) {
                                  str = s[i];
                              }
                              else { str += "," + s[i]; }
                          }
                      }
                  }
              parent.document.getElementById('<%= m_UserInput %>').value = str;
        document.getElementById('UserNameList').value = parent.document.getElementById('<%= m_UserInput %>').value;
          }
    }
    function del(num) {
        if (num == 0 || parent.document.getElementById('<%= m_UserInput %>').value == "" || parent.document.getElementById('<%= m_UserInput %>').value == ",") {
            parent.document.getElementById('<%= m_UserInput %>').value = "";
            document.getElementById('UserNameList').value = "";
            
            return false;
        }

        var strDel = parent.document.getElementById('<%= m_UserInput %>').value;
        var s = strDel.split(",");
        parent.document.getElementById('<%= m_UserInput %>').value = strDel.substring(0, strDel.length - s[s.length - 1].length - 1);
        document.getElementById('UserNameList').value = parent.document.getElementById('<%= m_UserInput %>').value;
    }

    function checkUserName(UserNamelist, thisUserName) {
        if (UserNamelist == thisUserName) {
            return true;
        }
        else {
            var s = UserNamelist.split(",");
            for (j = 0; j < s.length; j++) {
                if (s[j] == thisUserName)
                    return true;
            }
            return false;
        }
    }
    function clearALL()
    {
        $(":checkbox").attr("checked",false);
    }
    function chkSome(ids)
    {
        clearALL();
        if (ids) {
            idArr = ids.split(',');
            for (var i = 0; i < idArr.length; i++) {
                $(":checkbox[value='" + idArr[i] + "']").attr("checked", true);
            }
        }
    }
        </script>
    </form>
</body>
</html>
