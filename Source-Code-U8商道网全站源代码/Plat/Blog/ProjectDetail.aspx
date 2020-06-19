<%@ page language="C#" autoeventwireup="true" inherits="Plat_Blog_ProjectDetail, App_Web_o3cst4gs" masterpagefile="~/Plat/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
    <title>项目详情</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <div style="width:600px;">
        <div style="background-color:#f7f7f7; width: 100%;height:50px;line-height:50px;padding-left:10px;">
        <asp:TextBox runat="server" ID="Name" CssClass="form-control required"></asp:TextBox>
        <span class="glyphicon glyphicon-paperclip" title="添加附件" style="margin-left:10px;"></span>
       <asp:LinkButton runat="server" ID="Del_Btn" OnClick="Del_Btn_Click" OnClientClick="return confirm('确定要删除吗!!');">
                    <span class="glyphicon glyphicon-trash" title="删除" style="margin-left:10px;"></span>
                </asp:LinkButton>
        </div>
        <div style="padding-left:1em; padding-top:10px;">         
           <table id="DetailTable">
                    <tr>
                        <td>
                            <span class="glyphicon glyphicon-calendar"></span>
                            <span>时间： </span></td>
                        <td>
                            <asp:TextBox class="form-control" ID="StartDate" runat="server" onclick="WdatePicker();" Style="width: 150px;"></asp:TextBox>- 
                            <asp:TextBox class="form-control" ID="EndDate" runat="server" onclick="WdatePicker();" Style="width: 150px;">></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <span class="glyphicon glyphicon-user"></span>
                            <a href="javascript:;" target="_blank"><asp:Label runat="server" ID="CUser_T"></asp:Label></a>
                            <span style="margin-left:10px;">创建</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="glyphicon glyphicon-user"></span>
                            <span>主负责人：</span>
                            <a href="#"><span class="glyphicon glyphicon-plus-sign" title="添加" onclick="selRuser();"></span></a>
                            <asp:HiddenField runat="server" ID="LeaderIDS_Hid" />
                        </td>
                        <td><asp:Label runat="server" ID="LeaderIDS_L"></asp:Label></td>
                    </tr>
               <tr>
                   <td>
                       <span class="glyphicon glyphicon-user"></span>
                       <span>任务成员：</span>
                       <a href="#"><span class="glyphicon glyphicon-plus-sign" title="添加" onclick="selCuser();"></span></a>
                       <asp:HiddenField runat="server" ID="ParterIDS_Hid" />
                   </td>
                   <td>
                       <asp:Label runat="server" ID="ParterIDS_L"></asp:Label>
                   </td>
               </tr>
                    <tr>
                        <td><span class="glyphicon glyphicon-list-alt"></span><span>项目详情：</span></td>
                        <td><asp:TextBox runat="server" ID="Describe" CssClass="form-control required date" TextMode="MultiLine" style="max-width:100%;width:100%;height:60px;"></asp:TextBox></td>
                    </tr>
               <tr>
                   <td><span class="glyphicon glyphicon-bookmark"></span><span>是否公开：</span></td>
                   <td><asp:RadioButtonList runat="server" ID="IsOpen_Rad" RepeatDirection="Horizontal" style="height:40px;">
                       <asp:ListItem Value="1">是</asp:ListItem>
                       <asp:ListItem Value="0">否</asp:ListItem></asp:RadioButtonList></td>
               </tr>
                    <tr>
                        <td colspan="2" runat="server">
                            <asp:Button runat="server" ID="Edit_Btn" Text="保存" OnClick="Edit_Btn_Click" CssClass="btn btn-primary" />
                            <input type="button" value="关闭" class="btn btn-default" onclick="parent.HideMe();" />
                        </td>
                    </tr>
                </table>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
      .glyphicon{color:#AFAFAF;font-size:1.3em;margin-right:5px;}
      .glyphicon:hover{color:#0066cc;}
      #DetailTable tr td{padding-top:10px;padding-bottom:10px;}
    </style>
    <script type="text/javascript">
        function selRuser() {
            parent.ChildSelRuser();
        }
        function selCuser() {
            parent.ChildSelCuser();
        }
        </script>
</asp:Content>