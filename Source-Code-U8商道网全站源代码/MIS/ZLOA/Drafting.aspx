<%@ page language="C#" autoeventwireup="true" inherits="MIS_ZLOA_Drafting, App_Web_kty3igex" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>公文起草</title>
<link href="CSS/ZLOA.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script> 
<style>
    .required {color:red;margin-left:3px;}
</style> 
</head>
<body>
<form id="form1" runat="server" enctype="multipart/form-data">
<div style="padding-left:10px; padding-right:10px;">
     <table class="table" cellspacing="0" cellpadding="0">
         <tr><td colspan="8" class="trhead">公文起草</td></tr>
                <tr >
                    <td>密 级</td>
                    <td>
                        <asp:DropDownList ID="Secret" runat="server">
                            <asp:ListItem Value="0">机密</asp:ListItem>
                            <asp:ListItem Value="1">绝密</asp:ListItem>
                            <asp:ListItem Value="2">秘密</asp:ListItem>
                            <asp:ListItem Value="3">一般</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>紧急程度</td>
                    <td>
                        <asp:DropDownList ID="Urgency" runat="server">
                            <asp:ListItem Value="0">较紧急</asp:ListItem>
                            <asp:ListItem Value="1">紧急</asp:ListItem>
                            <asp:ListItem Value="2">非常紧急</asp:ListItem>
                            <asp:ListItem Value="3">很紧急</asp:ListItem>
                            <asp:ListItem Value="3">一般</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>重要程度</td>
                    <td>
                        <asp:DropDownList ID="Importance"  runat="server">
                            <asp:ListItem Value="0">较重要</asp:ListItem>
                            <asp:ListItem Value="1">很重要</asp:ListItem>
                            <asp:ListItem Value="2">非常重要</asp:ListItem>
                            <asp:ListItem Value="3">一般</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>引入数据</td>
                    <td>
                        <asp:DropDownList ID="DropDownList4" runat="server">
                            <asp:ListItem Value="0">不使用数据引用</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>标 题:</td>
                    <td colSpan="3">
                       <asp:TextBox ID="Title" runat="server" style="width:95%;float:left;" /><span class="required">*</span>
                    </td>
                    <td>流程:</td>
                    <td>
                        <asp:DropDownList runat="server" ID="proDP" AutoPostBack="true" OnSelectedIndexChanged="proDP_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>模板</td>
                    <td><asp:DropDownList ID="Type" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Type_SelectedIndexChanged">
                            <asp:ListItem Value="0">请选择</asp:ListItem>
                            <asp:ListItem Value="1">发文演示模版</asp:ListItem>
                            <asp:ListItem Value="2">办公会抄告单</asp:ListItem>
                            <asp:ListItem Value="3">党办发文模版</asp:ListItem>
                            <asp:ListItem Value="4">党委会抄告单</asp:ListItem>
                            <asp:ListItem Value="5">党委会议纪要</asp:ListItem>
                            <asp:ListItem Value="6">纪检发文模版</asp:ListItem>
                            <asp:ListItem Value="7">行政办公会抄告单</asp:ListItem>
                            <asp:ListItem Value="7">行政公文模版（上行文)</asp:ListItem>
                            <asp:ListItem Value="7">行政公文模版（下行文）</asp:ListItem>
                            <asp:ListItem Value="7">院长办公会议纪要</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>主题词:</td>
                    <td colSpan="5"><asp:TextBox ID="Keywords" runat="server" CssClass="form-control"></asp:TextBox></td>
                    <td>起草日期</td>
                    <td><asp:TextBox ID="CreateTime" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" CssClass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>起草人</td>
                    <td colSpan="3"><asp:Label ID="Label1" runat="server" /></td>
                    <td>起草部门</td>
                    <td colSpan="3"><asp:Label ID="Label2" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="8">
                        <div style="height:500px;width:100%;">
                            <asp:TextBox id="Content" name="Content" TextMode="MultiLine" Width="100%" Height="400px" runat="server"></asp:TextBox>
                            <script type="text/javascript">
                                var editor = UE.getEditor('Content');
                            </script>
                        </div>
                    </td>
                </tr>
                <tr id="hasFileTR" runat="server" visible="true">
                    <td>已上传文件:<asp:HiddenField runat="server" ID="hasFileData" ClientIDMode="Static" /></td><td colspan="7" id="hasFileTD" runat="server"></td>
                </tr>
                <tr runat="server" visible="false" id="upFileTR">
                     <td style="text-align:center;" >
                   <input type="button" class="btn btn-primary" value="添加" onclick="addAttach();"/></td>
                     <td colspan="7" >
                         <table id="attachTB">
                             <tr><td> <input type="file" name="fileUP" class="fileUP" /><input type="button" value="删除" onclick="delAttach(this);" /></td></tr>
                         </table>
                     </td>
                </tr>
                <tr>
                    <td>操作</td>
                    <td colspan="7">
                        <asp:Button ID="saveBtn" CssClass="btn btn-primary" runat="server" Text="发布" OnClick="saveBtn_Click" />
                        <asp:Button ID="clearBtn" CssClass="btn btn-primary" runat="server" Text="重置" OnClick="clearBtn_Click" />
                    </td>
                </tr>
            </table>
    </div>
<script type="text/javascript">
        var uptr = '<tr><td><input type="file" name="fileUP" class="fileUP" /><input type="button" value="删除" onclick="delAttach(this);" /></td></tr>';
        function addAttach() {
            $("#attachTB").append(uptr);
        }
        function delAttach(obj) {
            $(obj).parent().remove();
        }
        function delHasFile(v, obj) {
            rv = $("#hasFileData").val().replace(v, "");
            $("#hasFileData").val(rv)
            $(obj).parent().remove();
        }
</script>
<style type="text/css">
    .fileUP {border:1px solid #428bca;float:left;width:500px;margin-right:5px;}
    .disupFile {margin-left:10px;}
    #attachTB tr td{padding:2px;}
</style>  
</form>
</body>
</html>
