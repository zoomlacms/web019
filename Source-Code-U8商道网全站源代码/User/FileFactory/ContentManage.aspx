<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.ContentManage, App_Web_03cspg1s" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title><%=lang.Get("m_ContentManage_content")%></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<ol class="breadcrumb">
    	<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ContentManage.aspx">文件工厂</a></li>
        <li class="active"><%= str%></li>
    </ol>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="divTranPross" style="display: none; z-index: 998; filter: alpha(opacity=40,style=0); opacity: 0.4; background-color: #77C6FE; text-align: center; height: 150%; width: 100%; border: 0px solid black; position: absolute; left: 0px; right: 0px;">
            </div>
            <div id="divBackPross" style="display: none; z-index: 999; text-align: center; height: 150%; width: 100%; border: 0px solid black; position: absolute; left: 0px; top: 0px;">
                <table style="height: 50%; width: 100%;" class="table table-striped table-bordered table-hover">
                    <tr>
                        <td style="vertical-align: middle;">
                            <div style="margin-left: auto; margin-right: auto; line-height: 30px; vertical-align: middle; width: 200px; height: 30px; background-color: #0D6FC3; position: relative;">
                                <div id="divPross" style="width: 10px; height: 30px; background-color: #77C6FE; position: absolute; left: 0px; top: 0px;">
                                </div>
                                <%=lang.Get("m_ContentManage_inport")%>...
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="us_topinfo">
        <span>会员中心</span> &gt;&gt; <span><a href="ContentManage.aspx">文件工厂</a></span> &gt;&gt; <span>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span>
    </div>
    <div class="divline" id="toolbar2" style="padding-left: 5px; margin-top: 5px;">
        <table class="table table-bordered">
            <tr>
                <td>
                    <b onclick="OpenAddContent()">
                        <%=lang.Get("m_ContentManage_operate")%>：</b><asp:Label ID="lblAddContent" runat="server" Text="" />
                </td>
                <td align="right">
                    <div id="toolbar3" style="display: none">
                        <%=lang.Get("m_ContentManage_reason")%>：
                    <asp:TextBox ID="TextBox3" runat="server" Width="147px" CssClass="l_input"></asp:TextBox>
                    </div>
                </td>
                <td align="right" width="150">
                    <%=lang.Get("m_ContentManage_acount")%>:<asp:Label ID="WZS" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div class="clearbox"></div>
    <% if (Request.QueryString["isDivImp"] != null && Request.QueryString["isDivImp"] == "1")
       { %>
    <div id="divImp" class="divline" style="padding-left: 10px; display: block">
        <%=lang.Get("m_ContentManage_sourse")%>：<asp:FileUpload ID="fileImp" runat="server" />
        <font color="red">*</font><font style="color: #0E529D;"><%=lang.Get("m_ContentManage_download")%>[<%=getNodeName()%>]的<%=this.bmode.GetModelById(ZoomLa.Common.DataConverter.CLng(int.Parse(this.Request.QueryString["ModelID"]))).ItemName %><%=lang.Get("m_ContentManage_template")%></font></asp:LinkButton>(<%=lang.Get("m_ContentManage_rule")%>)       
    </div>
    <div class="clearbox">
    </div>
    <%} %>
    <asp:UpdatePanel ID="Article" UpdateMode="Always" runat="server">
        <ContentTemplate>
            <div id="nodeTreeDiv" style="float: left; width: 15%">
                <asp:TreeView ID="tvNav" runat="server" ExpandDepth="1" ShowLines="True" EnableViewState="true" NodeIndent="10">
                    <NodeStyle BorderStyle="None" ImageUrl="~/Images/TreeLineImages/plus.gif" />
                    <ParentNodeStyle ImageUrl="~/Images/TreeLineImages/plus.gif" />
                    <SelectedNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
                    <RootNodeStyle ImageUrl="~/Images/TreeLineImages/dashminus.gif" />
                </asp:TreeView>
            </div>
            <div id="Div1" style="float: left;width: 85%" class="editdocLi">
                <ul>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <li onmouseover="this.className='liborder'" onmouseout="this.className=''">
                                <%# "<a href='showContent.aspx?GID="+Eval("GeneralID")+"&modeid="+Eval("ModelID", "{0}")+"' title=录入人:"+Eval("inputer")+" style='background:url(/App_Themes/AdminDefaultTheme/images/System13.png) no-repeat top center;' >"+Eval("Title")+"<br/><span class='fileDis'>"+DataBinder.Eval(Container.DataItem,"CreateTime","{0:yyyy年M月d日}")+"</span></a>"%>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <table class="table table-striped table-bordered table-hover">
                    <tr>
                        <td class="tdbg">
                            <div style="text-align: center">
                                <span style="text-align: center">
                                    <%=lang.Get("m_ContentManage_total")%>
                                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                                    <%=lang.Get("m_ContentManage_data")%>
                                    <asp:Label ID="Toppage" runat="server" Text="" />
                                    <asp:Label ID="Nextpage" runat="server" Text="" />
                                    <asp:Label ID="Downpage" runat="server" Text="" />
                                    <asp:Label ID="Endpage" runat="server" Text="" />
                                    <asp:HiddenField ID="CurrentPage" runat="server" Value="1" />
                                    <asp:HiddenField ID="HiddenNodeID" runat="server" />
                                    <%=lang.Get("m_ContentManage_pages")%>：
                        <asp:Label ID="Nowpage" runat="server" Text="1" />/
                        <asp:Label ID="PageSize" runat="server" Text="" /><%=lang.Get("m_ContentManage_page")%>
                                    <asp:Label ID="pagess" runat="server" Text="" />
                                    <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" OnTextChanged="txtPage_TextChanged"
                                        Width="30px"></asp:TextBox>
                                    <%=lang.Get("m_ContentManage_turn")%>
                                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <%=lang.Get("m_ContentManage_page")%><asp:RangeValidator ID="RangeValidator1" runat="server"
                                        ControlToValidate="txtPage" ErrorMessage="仅支持数字" Type="Integer" MaximumValue="100000"
                                        MinimumValue="0"></asp:RangeValidator></span>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <!--Repeater1 End-->
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="clearbox">
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/js/Drag.js"></script>
    <script type="text/javascript" src="/JS/Dialog.js"></script>
    <script type="text/javascript">
        var diag = new Dialog();
        if (!window.ActiveXObject)//如果非IE，则清除上面的Iframe，避免兼容性问题
        {
            alert("请使用IE浏览器访问文件工厂，否则无法使用生成文档功能!");
        }
        function openurls(url) {
            Dialog.open({ URL: url });
        }
        function open_title(ModelID, NodeID) {
            diag.Width = 800;
            diag.Height = 600;
            diag.Title = "添加内容<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
            diag.URL = "AddContent.aspx?ModelID=" + ModelID + "&NodeID=" + NodeID;
            diag.show();
        }

        function opentitle(url, title) {
            diag.Width = 800;
            diag.Height = 600;
            diag.Title = title;
            diag.URL = url;
            diag.show();
        }

        function closdlg() {
            Dialog.close();
        }
    </script>
    <script type="text/javascript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2", "TabTitle3", "TabTitle4");
        window.onload = function () {
            pload();
        }
        function ShowTabs(ID) {
            location.href = 'ContentManage.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&id=' + ID + '&type=' + ID;
        }

        function pload() {
            var ID = '<%=Request.QueryString["id"]%>';
            if (ID != tID) {
                document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
                tID = ID;
            }
        }

        function chechs() {
        }

        function getinfo(cid) {
            //alert(cid);
            //location.href = 'ContentShow.aspx?id=' + id;
        }
        function dialogOpen() {
            document.getElementById("divTranPross").style.display = "block";
            document.getElementById("divBackPross").style.display = "block";
        }

        function dialogClose() {
            document.getElementById("divTranPross").style.display = "none";
            document.getElementById("divBackPross").style.display = "none";
        }
    </script>
    <script type="text/javascript" src="/JS/pacalendar.js"></script>
</asp:Content>
