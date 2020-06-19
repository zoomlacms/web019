<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.User.UserApi, App_Web_cdtmwr4r" enableviewstatemac="false" debug="true" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
    <title>Api接口配置</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="r_navigation"><%if(GetOpenHelp.IsopenHelp()=="1")
    { %>
      <div id="help"> <a onclick="help_show('107')" title="帮助"></a></div>
  <%} %></div>
  <table class="table table-striped table-bordered table-hover">
    <tr>
      <td class="spacingtitle" align="center" colspan="2" valign="middle"　style="height: 23px"> Discuz论坛Api接口整合配置</td>
    </tr>
    <tr >
      <td class="tdbgleft" align="right" style="height: 23px" valign="middle"><strong>是否启用Discuz!NT论坛：</strong></td>
      <td >
          <input type="checkbox" runat="server" id="RBLDZ" class="switchChk"/>
      </td>
    </tr>
    <tr>
      <td class="tdbgleft" align="right" style="height: 23px" valign="middle"><strong>是否启用Discuz!论坛：</strong></td>
      <td >
           <input type="checkbox" runat="server" id="Discuz" class="switchChk"/>
      </td>
    </tr>
    <tr>
      <td class="title" align="center" style="height: 23px" valign="middle" colspan="2"><strong>DPO(Dvbbs、PowerEasy、Oblog)接口整合信息配置</strong></td>
    </tr>
    <tr>
      <td class="tdbgleft" align="right" style="height: 23px" valign="middle"><strong>是否启用接口：</strong></td>
      <td >
          <input type="checkbox" runat="server" id="RBLEnable" class="switchChk"/>
      </td>
    </tr>
    <tr>
      <td class="tdbgleft" align="right" style="height: 23px" valign="middle"><strong>接口ID：</strong></td>
      <td ><asp:Label ID="LblAppID" runat="server" Text="other"></asp:Label></td>
    </tr>
    <tr>
      <td class="tdbgleft" align="right" style="height: 23px" valign="middle"><strong>系统键值：</strong></td>
      <td ><asp:TextBox ID="TxtSysKey" class="form-control"  runat="server"  ></asp:TextBox>
        <strong>&nbsp; </strong></td>
    </tr>
    <tr>
      <td class="tdbgleft" align="right" style="height: 23px" valign="middle"><strong>接口地址：</strong></td>
      <td ><asp:TextBox ID="TxtUrls" class="form-control"  runat="server"></asp:TextBox>
        <strong>&nbsp;
        将接口地址用"|"隔开，地址必须以http://开头</strong></td>
    </tr>
    <tr class="tdbg">
      <td class="tdbgleft" colspan="2" style="height: 23px" align="center"><asp:Button ID="btnSubmit" class="btn btn-primary"  runat="server" OnClick="btnSubmit_Click" Text="保存" />
        &nbsp;
        <asp:Button ID="btnCancel" class="btn btn-primary"  runat="server" Text="取 消" OnClick="btnCancel_Click" /></td>
    </tr>
  </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/Common.js"></script>

</asp:Content>
