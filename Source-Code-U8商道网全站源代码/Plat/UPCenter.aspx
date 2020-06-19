<%@ page language="C#" autoeventwireup="true" inherits="Plat_RegisterDetail, App_Web_xmg0q3sl" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>公司详情</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="Content">
        <div id="Content_Head">
            <ol class="breadcrumb"><li><a href="/">首页</a></li><li><a href="/Plat/Blog/">能力中心</a></li><li class="active">个人信息</li></ol>
        </div>
        <div id="user_div" runat="server" visible="false">
             <table class="table table-bordered table-hover table-striped">
                <tr>
                    <td  class="tdname">用户名：</td>
                    <td class="tdcontent">
                        <asp:TextBox ID="UserName_T" CssClass="form-control " ReadOnly="true" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="tdname">状态：</td>
                    <td class="tdcontent">
                        <asp:TextBox ID="Status_T" ReadOnly="true" Text="正常" onkeydown="return GetEnterCode('focus','TrueName_T');" CssClass="form-control " runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                     <td class="tdname">真实姓名：</td>
                     <td class="tdcontent">
                         <asp:TextBox ID="TrueName_T"  onkeydown="return GetEnterCode('focus','Mobile_T');" CssClass="form-control" runat="server"></asp:TextBox>
                     </td>
                 </tr>
                  <tr>
                     <td class="tdname">移动电话：
                     </td>
                     <td class="tdcontent">
                         <asp:TextBox ID="Mobile_T"  onkeydown="return GetEnterCode('focus','Post_T');" CssClass="form-control" runat="server"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td class="tdname">工作岗位：</td>
                     <td class="tdcontent">
                         <asp:TextBox ID="Post_T" ReadOnly="true" onkeydown="return GetEnterCode('click','Save_Btn');" CssClass="form-control" runat="server"></asp:TextBox>
                     </td>
                 </tr>
                  <tr>
                    <td class="tdname">个人头像：</td>
                    <td>
                        <asp:FileUpload ID="File_Up" runat="server" Style="margin-top:20px;display:inline;" />
                        <asp:Button ID="ImgUP_Btn" CausesValidation="false" runat="server" ToolTip="上传图片" CssClass="btn btn-primary" Text="上传" OnClick="ImgUP_Btn_Click" />
                        <span id="img_D" title="图片预览"><asp:Image runat="server" ID="pre_img" style="width:150px;height:80px; margin-left:30px;" /></span>
                    </td>
                </tr>
                 <tr>
                     <td colspan="2">
                         <asp:Button runat="server" CssClass="btn btn-primary" ID="Save_Btn" OnClick="AdminSave_Btn_Click" Text="提交修改" /></td>
                 </tr>
             </table>
        </div>
        <div id="admin_div" runat="server" visible="false">
             <table class="table table-bordered table-hover table-striped">
                <tr>
                    <td  class="tdname">用户名：</td>
                    <td class="tdcontent">
                        <asp:TextBox ID="UserName_T2" CssClass="form-control " ReadOnly="true" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="tdname">用户组：</td>
                     <td class="tdcontent">
                        <asp:TextBox ID="Plat_Group_T2" onkeydown="return GetEnterCode('focus','Status_T2');" CssClass="form-control " runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="tdname">状态：</td>
                    <td class="tdcontent">
                        <asp:TextBox ID="Status_T2" onkeydown="return GetEnterCode('focus','TrueName_T2');" CssClass="form-control " runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                     <td class="tdname">真实姓名：</td>
                     <td class="tdcontent">
                         <asp:TextBox ID="TrueName_T2" onkeydown="return GetEnterCode('focus','Mobile_T2');" CssClass="form-control" runat="server"></asp:TextBox>
                     </td>
                 </tr>
                  <tr>
                     <td class="tdname">移动电话：</td>
                     <td class="tdcontent">
                         <asp:TextBox ID="Mobile_T2" onkeydown="return GetEnterCode('focus','Post_T2');" CssClass="form-control" runat="server"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td class="tdname">工作岗位：</td>
                     <td class="tdcontent">
                         <asp:TextBox ID="Post_T2" onkeydown="return GetEnterCode('click','Save_Btn');" CssClass="form-control" runat="server"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td colspan="2">
                         <asp:Button runat="server" CssClass="btn btn-primary" ID="AdminSave_Btn" OnClick="AdminSave_Btn_Click" Text="提交修改" /></td>
                 </tr>
             </table>
        </div>
        <div id="Content_foot">
        </div>
    </div>
  
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/DatePicker/WdatePicker.js" type="text/javascript"></script>
<style type="text/css">
#Content_Body {margin-top:15px;}
.tdname {text-align: right; width:10%;}
.tdcontent{text-align: left;}
</style>
    <script type="text/javascript">
        $().ready(function () {
            var focus = document.getElementById("Plat_Group_T");
            focus.focus();
            document.getElementById("Content_Body2").style.display="none";
        });
    </script>
</asp:Content>
