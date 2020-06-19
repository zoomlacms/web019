<%@ page language="C#" autoeventwireup="true" inherits="manage_Config_EditDataList, App_Web_kosneoaq" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html >
<html>
<head runat="server">
<META content="text/html; charset=UTF-8">
<title>系统全库概况</title>
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/Guide.css" />
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/index.css" />
<link type="text/css" rel="stylesheet" href="../../App_Themes/AdminDefaultTheme/main.css" /> 
 <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
 <script type="text/javascript" src="/js/j.dimensions.js"></script>
 <script type="text/javascript" src="/js/datalist.js"></script>
 <script type="text/javascript" src="/js/j.suggest.js"></script>
 <script type="text/javascript">
     $(function () {
           $("#TxtName").suggest(citys, { hot_list: commoncitys, dataContainer: '#arrcity_3word',onSelect:function(){$("#BntSearch").click();}, attachObject: '#suggest' });
     });
      
var commoncitys=new Array();
commoncitys[0]=new Array('NOD','节点表','ZL_Node','NO');
commoncitys[1]=new Array('USR','会员表','ZL_User','US');
commoncitys[2]=new Array('CMD','内容主表','ZL_CommonModel','CM');
commoncitys[3]=new Array('CDT','商城主表','ZL_Commodities','CD');
commoncitys[4]=new Array('UBS','会员详情表','ZL_UserBase','UB');
commoncitys[5]=new Array('UCT','会员购物车','ZL_UserCart','UC');
commoncitys[6]=new Array('ORD','会员订单','ZL_OrderInfo','OI');
commoncitys[7]=new Array('PGR','黄页申请表','ZL_PageReg','PR');
commoncitys[8]=new Array('QUE','问答表','ZL_Question','QT');
commoncitys[9]=new Array('ART','文章内容表','ZL_C_Article','CA'); 
<%=Session["dataArr"]%>
</script>
 <style type="text/css">
 #GridView2 td,#GridView2 th{ border:#FFF 1px solid; padding-left:5px;}
 h1{margin:0;padding:20px 0;font-size:16px;}
 ol{padding-left:20px;line-height:130%;}
 #box{width:600px;text-align:left;margin:0 auto;padding-top:80px;}
 #suggest,#suggest2{width:200px;}
 .gray{color:gray;}
 .ac_results {background:#fff;border:1px solid #7f9db9;position: absolute;z-index: 10000;display: none;}
 .ac_results ul{margin:0;padding:0;list-style:none;}
 .ac_results li a{white-space: nowrap;text-decoration:none;display:block;color:#05a;padding:1px 3px;}
.ac_results li{border:1px solid #fff;}
.ac_over,.ac_results li a:hover {background:#c8e3fc;}
.ac_results li a span{float:right;}
.ac_result_tip{border-bottom:1px dashed #666;padding:3px;}
 </style>
</head>
<body>
<form id="form1" runat="server">
<div class="r_navigation">
    <div style="float:left;">
  后台管理&gt;&gt;扩展功能&gt;&gt;<a href="RunSql.aspx">开发中心</a>&gt;&gt;<a href="DatalistProfile.aspx">系统全库概况</a> <asp:LinkButton ID="Link2" OnClientClick='return confirm("本操作将从云台获取默认数据库标注信息且会覆盖您的个性定义，是否确定？")' OnClick="Link1_Click" runat="server" style="color: #1e860b;"> [更新ZL_DataList表]</asp:LinkButton>  <span class="red"> [ <asp:LinkButton ID="LinkButton5" OnClick="Link2_Click" runat="server" >运行库概况</asp:LinkButton>]</span>&nbsp;<span class="line"><a href="ViewList.aspx" style="color:red;" >[视图概况]</a> </span>
      </div>
    <table  cellpadding="2" border="0" cellspacing="1" style="background:#fff;float:left;margin-left:10px;" class="l_input"><tr ><td>
      <asp:TextBox ID="TxtName" runat="server" BorderColor="#fff" CssClass="l_inpnon" Text="" ></asp:TextBox>
  <div id='suggest' class="ac_results"> </div>
 <input type="hidden" name="arrcity_3word" id="arrcity_3word" value="" />
 <asp:Button ID="BntSearch" runat="server" Text=""  class="C_sch" OnClick="sech_Click" />
        </td></tr></table>

</div>
     
  <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" Width="100%" AllowPaging="True" PageSize="20"   OnRowCommand="Lnk_Click" CssClass="border" OnRowDataBound="GridView2_RowDataBound">
        <Columns>
            <asp:BoundField HeaderText="序号" DataField="ID">
                <ItemStyle Width="3%" HorizontalAlign="Center" />
            </asp:BoundField>
             <asp:TemplateField HeaderText="数据表名">
                <ItemTemplate>
                    <%# Eval("TableName")%> 
                </ItemTemplate>
                <ItemStyle Width="15%" HorizontalAlign="left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="类型">
                <HeaderStyle Width="10%" />
                <ItemTemplate>
                
                  <a href="DatalistProfile.aspx?type=<%#Eval("Type")%>">  <%#GetType(Eval("Type","{0}"))%> </a>
                     <%--
                        <%#getzonetypename(DataBinder.Eval(Container.DataItem, "ZoneType").ToString())%> --%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="说明">
                <HeaderStyle  />
                <ItemTemplate>
                   <%# Eval("Explain")%> 
                </ItemTemplate>
                <ItemStyle HorizontalAlign="left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <HeaderStyle  Width="180px" />
                <ItemTemplate>
                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ID") %>'>修改</asp:LinkButton> | 
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="View" CommandArgument='<%# Eval("ID") %>'>表结构</asp:LinkButton> | 
                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="ViewData" CommandArgument='<%# Eval("ID") %>'>表数据</asp:LinkButton> | 
                <%--<asp:LinkButton ID="LinkButton4" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ID") %>'>表操作</asp:LinkButton> --%>
                <a href="javascript:alert('哎呦，这里还系在研发中~')">表操作</a>
                 </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                 </asp:TemplateField>
     </Columns>
      <RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
        <HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
        <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageText="" PreviousPageText="" Visible="False" />
      </asp:GridView>
     
     <div style="text-align: center" class="tdbg" id="dtlistPage" runat="server">
        <span style="text-align: center">共
            <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
            条数据
            <asp:Label ID="Toppage" runat="server" Text="" />
            <asp:Label ID="Nextpage" runat="server" Text="" />
            <asp:Label ID="Downpage" runat="server" Text="" />
            <asp:Label ID="Endpage" runat="server" Text="" />
            页次：
            <asp:Label ID="Nowpage" runat="server" Text="" />/
            <asp:Label ID="PageSize" runat="server" Text="" />页
            <asp:Label ID="pagess" runat="server" Text="" />
            <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="16px"
                Height="16px" OnTextChanged="txtPage_TextChanged"></asp:TextBox>
            条数据/页 转到第
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            页<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator>
        </span>
    </div> 
 <div id="RunOK" runat="server" >
提示：未初始化ZL_DataList数据字典表，是否初始化?（下载<asp:LinkButton ID="Link1" OnClick="Link1_Click" runat="server"> Update.zoomla.cn/ZL_DataList.sql</asp:LinkButton>执行查询）。
</div> 
</form>
</body>
</html>