<%@ page language="C#" autoeventwireup="true" enableviewstatemac="false" inherits="ZoomLa.WebSite.Manage.Template.CssEdit, App_Web_v3onhe5z" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>样式编辑</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-striped table-bordered table-hover">
    <tr class="title" style="font-weight:normal;">
        <td> 
         <%--   <%=ShowPath.Trim()%> --%>
             <span style="float:left; margin-left:10px; margin-right:10px; font-weight:bold; margin-top:0.3em;">请输入风格名称:</span>
            <div class="input-group" style="width: 300px; float:left;">
                   <input runat="server" id="TxtFilename" style="text-align: right" class="form-control" />
                   <asp:Label ID="name_L" runat="server" class="input-group-addon">
                       .css
                   </asp:Label>
               </div>
    </td>
    </tr>
    <tr>
        <td>
          <textarea id="ln_txt" style="width:40px;background-color:gray;color:white;height:530px;float:left;position:absolute;text-align:right; padding-right:3px;overflow-y:hidden;"></textarea>
          <asp:TextBox ID="textContent" runat="server" TextMode="MultiLine" Width="99%" style="height:530px;padding-left:40px;"  onkeydown="UpdateLine();" onscroll="SyncScroll();"></asp:TextBox>
        </td>
    </tr>
</table>
<div style="text-align:center; width:100%">
    <asp:Button ID="Button1" runat="server" Text="保存风格" OnClick="Button1_Click" class="btn btn-primary"/>
    <asp:Button ID="Button2" runat="server" Text="取消操作" OnClick="Button2_Click" class="btn btn-primary"/>
  
</div>
    <asp:HiddenField ID="HdnShowPath" runat="server" />
    <asp:HiddenField ID="Hdnmethod" runat="server" />
    <asp:HiddenField ID="HdnFilePath" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
        <script type="text/javascript">
            function SyncScroll() {
                var txt_ln = document.getElementById('ln_txt');
                var txt_main = document.getElementById('textContent');
                txt_ln.scrollTop = txt_main.scrollTop;
            }
            //通过换行判断不准确
            function UpdateLine() {
                if (event.keyCode == 13) {
                    UpdateLineNum();
                }
            }
            function UpdateLineNum() {
                var txt_ln = document.getElementById('ln_txt');
                var txt_main = document.getElementById('textContent');
                txt_ln.value = "";
                lineNum = ($(txt_main).val().split("\n").length + 2);
                for (var i = 1; i <= lineNum; i++) {
                    txt_ln.value += i + '\n';
                }
            }
            $().ready(function () { UpdateLineNum(); });
    </script>
</asp:Content>