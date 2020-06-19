<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="CN_nite_Position_PositionManage, App_Web_xkismimu" clientidmode="Static" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="Head" runat="Server">
  <title>职位管理</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="Content" runat="Server">
  
  <div class="us_topinfo">

      <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">职位管理[<a href="AddPosition.aspx"><font color="red">添加职位</font></a>]</li>
         
    </ol><asp:HiddenField ID="Hidd" runat="server" /> 
    <div class="cleardiv"></div>
  </div>
  <div class="clearbox"> </div>
  <div style="margin-top:10px;" id="manageinfo" runat ="server">
    <table class="table table-hover table-bordered table-striped">
      <tr align="center">
        <td width="10%" class="title">职位ID</td>
        <td width="30%" class="title">职位名称</td>
        <td width="10%" class="title">人数</td>
        <td width="20%" class="title">结束日期</td>
        <td width="15%" class="title">状态</td>
        <td width="20%" class="title">操作</td>
      </tr>
      <Zl:ExGridView AllowPaging="true"  CssClass="table table-hover table-bordered table-striped" OnPageIndexChanging="gvCard_PageIndexChanging" EmptyDataText="<font color='red'>暂无数据</font>" ID="gvCard" runat="server">
          <Columns><asp:TemplateField  HeaderText="操作">
        <ItemTemplate>
          <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td height="22" align="center"><%#Eval("Jid")%></td>
            <td height="22" align="center"><%#Eval("Jname")%></td>
            <td height="22" align="center"><%#Eval("Jnum")%></td>
            <td height="22" align="center"><%#Eval("Jendtime")%></td>

            <td height="22" align="center"><a href="AddPosition.aspx?PositionID=<%#Eval("Jid") %>">修改</a> <a href="?menu=del&id=<%#Eval("Jid") %>"
                                onclick="return confirm('确定删除该信息吗？删除后该信息不可恢复!');">删除</a></td>
          </tr>
        </ItemTemplate>
              </asp:TemplateField></Columns>
      </Zl:ExGridView>
    </table>
  </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="ScriptContent" runat="Server">
  
</asp:Content>
