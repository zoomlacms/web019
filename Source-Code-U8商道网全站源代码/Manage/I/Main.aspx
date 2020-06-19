<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Main, App_Web_jruc42p2" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>新选项卡</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content"><!--每页14条数据-->
    <div class="main_nav" runat="server" id="navDiv">
        <asp:Literal runat="server" ID="model_Lit" EnableViewState="false"></asp:Literal>
        <div class="clearfix"></div>
        
        <asp:Literal runat="server" ID="page_Lit" EnableViewState="false"></asp:Literal>
<%--        <ul class="pagination"><li class="disabled"><a href="?page=1">«</a></li><li class="active"><a href="?page=1">1 <span class="sr-only">(current)</span></a></li><li><a href="?page=2">2 <span class="sr-only">(current)</span></a></li><li><a href="?page=3">3 <span class="sr-only">(current)</span></a></li><li><a href="?page=4">4 <span class="sr-only">(current)</span></a></li><li><a href="?page=5">5 <span class="sr-only">(current)</span></a></li><li><a href="?page=6">6 <span class="sr-only">(current)</span></a></li><li><a href="?page=7">7 <span class="sr-only">(current)</span></a></li><li><a href="?page=8">8 <span class="sr-only">(current)</span></a></li><li><a href="?page=9">9 <span class="sr-only">(current)</span></a></li><li><a href="?page=10">10 <span class="sr-only">(current)</span></a></li><li><a href="?page=10">»</a></li></ul>--%>
    </div>
    <div id="pageDiv" runat="server" visible="false" class="pageDiv">
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" EnableTheming="False"  AllowPaging="true" OnPageIndexChanging="EGV_PageIndexChanging" PageSize="15"
            EmptyDataText="没有匹配的页面，建议更换关键词!!"  class="table table-striped table-bordered table-hover">
            <Columns>
                <asp:BoundField DataField="Index" HeaderText="ID"/>
                <asp:BoundField DataField="DTitle" HeaderText="标题" HtmlEncode="false"/>
                <asp:TemplateField HeaderText="路径">
                    <ItemTemplate>
                        <a href="<%#Eval("Url") %>" title="点击访问"><%#Eval("Url") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="PPath" HeaderText="物理路径" />
            </Columns>
        </ZL:ExGridView>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style>
        .main_nav,.pageDiv{ margin-top:20px;}
        .padding5{ padding:0 10px;}
        .lg_height{ line-height:240px;}
        .img {width:25px;height:30px;margin-right:3px;margin-top:-5px;}
        .main_nav div a {height:180px;}
        #EGV td{text-align:left;}
    </style>
    <script>
        $().ready(function () {
            $(".breadcrumb").hide();
            parent.setLayout();
        })
    </script>
</asp:Content>