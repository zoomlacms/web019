<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="Zoomla.Website.manage.Shop.Producer, App_Web_hcif15qs" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加厂商</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
      <tr align="center">
        <td colspan="2" class="spacingtitle">
            <asp:Label ID="Label1" runat="server" Text="添加厂商"></asp:Label></td>
      </tr>
      <tr>
        <td height="22" class="tdbgleft" style="width: 20%"><strong>厂商名称：</strong></td>
        <td width="66%" valign="middle">
            <asp:TextBox ID="Producername" runat="server" class="form-control"  /><span style="color:red;margin-left:5px;">*</span>
            <asp:HiddenField ID="ID" runat="server" />
            <asp:HiddenField ID="uptype" runat="server" />
        </td>
      </tr>
      <tr>
        <td class="tdbgleft" style="height: 22px; width: 20%;"><strong>厂商缩写：</strong></td>
        <td valign="middle" style="height: 22px">
            <asp:TextBox ID="Smallname" runat="server" class="form-control" ></asp:TextBox></td>
      </tr>
      <tr>
        <td height="22" class="tdbgleft" style="width: 20%"><strong>创建日期：</strong> </td>
        <td height="22" valign="middle">
            <asp:TextBox ID="CreateTime" runat="server" class="form-control" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox>
            </td>
      </tr>
      <tr>
        <td height="22" class="tdbgleft" style="width: 20%"><strong>公司地址：</strong></td>
        <td height="22" valign="middle">
            <asp:TextBox ID="Coadd" runat="server" class="form-control" ></asp:TextBox><span style="color:red;margin-left:5px;">*</span></td>
      </tr>
      <tr>
        <td height="22" class="tdbgleft" style="width: 20%"><strong>联系电话：</strong></td>
        <td height="22" valign="middle">
            <asp:TextBox ID="Telpho" runat="server" class="form-control"></asp:TextBox><span style="color:red;margin-left:5px;">*</span> </td>
      </tr>
      <tr>
        <td height="22" class="tdbgleft" style="width: 20%"><strong>传真号码：</strong></td>
        <td height="22" valign="middle">
            <asp:TextBox ID="FaxCode" runat="server" class="form-control"></asp:TextBox></td>
      </tr>
      <tr>
        <td class="tdbgleft" style="width: 20%; height: 22px"><strong>邮政编码：</strong></td>
        <td valign="middle" style="height: 22px">
            <asp:TextBox ID="PostCode" runat="server" class="form-control"></asp:TextBox></td>
      </tr>
      <tr>
        <td height="22" class="tdbgleft" style="width: 20%"><strong>厂商主页：</strong></td>
        <td height="22" valign="middle">
            <asp:TextBox ID="CoWebsite" runat="server" class="form-control" ></asp:TextBox></td>
      </tr>
      <tr> 
        <td height="22" class="tdbgleft" style="width: 20%"><strong>电子邮件：</strong></td>
        <td height="22" valign="middle">
            <asp:TextBox ID="Email" runat="server" class="form-control"></asp:TextBox></td>
      </tr>
      <tr>
        <td height="22" class="tdbgleft" style="width: 20%"><strong>厂商分类：</strong></td>
        <td height="22" valign="middle">
            <asp:RadioButtonList ID="CoClass" runat="server" RepeatDirection="Horizontal"
                Width="420px">
                <asp:ListItem Selected="True">大陆厂商</asp:ListItem>
                <asp:ListItem>港台厂商</asp:ListItem>
                <asp:ListItem>日韩厂商</asp:ListItem>
                <asp:ListItem>欧美厂商</asp:ListItem>
                <asp:ListItem>其他厂商</asp:ListItem>
            </asp:RadioButtonList></td>
      </tr>
      <tr>
        <td height="22" class="tdbgleft" style="width: 20%"><strong>厂商照片：</strong></td>
        <td height="22" valign="middle">
            <asp:TextBox ID="CoPhoto" class="form-control" runat="server" Width="321px"></asp:TextBox><iframe id="proimgs" style="top:2px" src="../../Shop/fileupload.aspx?menu=CoPhoto" width="100%" height="25px" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe></td>
      </tr>
      <tr class="WebPart">
        <td height="22" class="tdbgleft" style="width: 20%"><strong>厂商简介：</strong></td>
        <td height="22" valign="middle">
            <%--<asp:HiddenField ID="Content" runat="server" /><iframe id="infoeditor" src="../../editor/fckeditor_1.html?InstanceName=Content&Toolbar=Default" width="580px" height="350px" frameborder="no" scrolling="no"></iframe>--%>
        <textarea   id="Content"  Class="form-control"  name="Content"   runat="server" style="width:99%"  rows="20"></textarea>
 <script id="headscript" type="text/javascript">
     UE.getEditor('Content');
    </script>
        
        </td>
      </tr>
      <tr class="tdbg">
        <td colspan="2" align="center" class="tdbg" style="height: 49px">
            <asp:Button ID="Button1" runat="server" class="btn btn-primary"  Text="保存设置" OnClick="Button1_Click" OnClientClick="return checkValue()"/></td>
      </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="/Plugins/kindeditor/kindeditor.js" charset="utf-8"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        function checkValue() {
            var a = document.getElementById("<%=Producername.ClientID%>").value;
        var b = document.getElementById("<%=Coadd.ClientID%>").value;
        var c = document.getElementById("<%=Telpho.ClientID%>").value;
        if (a == "" || b == "" || c == "") {
            alert("请将必要信息填满");
            return false;
        }
        return true;
    }
    </script>
</asp:Content>