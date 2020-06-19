<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.I.Template.LabelHtml, App_Web_v3onhe5z" masterpagefile="~/Manage/I/Default.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
     <style type="text/css">
        .editdiv {float:left;width:12%;margin-top:10px;
        }
        .spanfixdivchechk,.spanfixdiv{width:75%;height:30px;line-height:30px; border:1px solid #F6B9D6;background-color:#FFFBF5;overflow:hidden;text-align:center;margin-top:10px;
        }
    </style>
    <title>静态标签</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="2" align="center"><span id="LblTitle" style="font-weight: bold;">静态标签设置</span></td>
        </tr>
        <tr>
            <td align="right" style="width: 120px;"><strong>标签名称：&nbsp;</strong></td>
            <td align="left">
                <asp:TextBox ID="TxtLabelName" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator runat="server" ID="NReq" ControlToValidate="TxtLabelName" Display="Dynamic" ErrorMessage="请输入标签名称">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TxtLabelName" ErrorMessage="标签名称重复" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td align="right"><strong>标签分类：&nbsp;</strong></td>
            <td align="left">
                <asp:TextBox ID="TxtLabelType" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:DropDownList ID="DropLabelType" CssClass=" form-control" Width="150" runat="server" OnSelectedIndexChanged="SelectCate" AutoPostBack="true">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtLabelType" ErrorMessage="标签分类不能为空">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right"><strong>标签说明：&nbsp;</strong></td>
            <td align="left">
                <asp:TextBox ID="TxtLabelIntro" CssClass="form-control" runat="server" TextMode="MultiLine" Columns="50" Rows="3" Height="60px" Width="317px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align: center;">判断模式： </td>
            <td>
                <asp:CheckBox ID="boolmodel" runat="server" Text="开启判断模式" AutoPostBack="True" />
                <font color="red">[开启后将根据判断条件输出内容]</font>
                <iframe id="I1" frameborder="0" name="I1" scrolling="no" src="/manage/Template/label.htm" style="height: 30px; width: 530px; margin-left: 142px;"></iframe>
            </td>
        </tr>
        <tr id="isbool" runat="server" visible="false">
            <td style="text-align: center;">模式设置： </td>
            <td>
                <asp:DropDownList ID="Modeltypeinfo" CssClass="form-control" Width="100" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="计数判断">计数判断</asp:ListItem>
                    <asp:ListItem Value="用户登陆判断">用户登陆判断</asp:ListItem>
                    <asp:ListItem Value="参数判断">参数判断</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="Valueroot" runat="server" Width="179px" onmousedown="inputtxt(this)" onfocus="inputtxt(this)" value="这里放入标签"></asp:TextBox>
                <asp:DropDownList ID="addroot" CssClass="form-control" Width="100" runat="server" Visible="false" AutoPostBack="True">
                    <asp:ListItem Value="循环计算">循环计算</asp:ListItem>
                    <asp:ListItem Value="一直累加">一直累加</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="setroot" CssClass="form-control" Width="100" runat="server">
                    <asp:ListItem Value="大于">大于</asp:ListItem>
                    <asp:ListItem Value="等于" Selected="True">等于</asp:ListItem>
                    <asp:ListItem Value="小于">小于</asp:ListItem>
                    <asp:ListItem Value="不等于">不等于</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="Modelvalue" runat="server" CssClass="form-control" Style="max-width: 200px;"></asp:TextBox>
                <asp:Label ID="Label3" runat="server" ForeColor="#339933" Visible="False" Font-Bold="True"></asp:Label></td>
        </tr>
        <tr>
            <td style="text-align: left;" colspan="2">标签内容:
                <asp:Label ID="Label8" runat="server" Text="(<font color=red>满足</font>判断)" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 100%; text-align: right;" colspan="2">
                <table style="width: 100%">
                    <tr>
                        <td style="width: 276px; vertical-align: top;" id="frmTitle">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tbody id="ss">
                                    <tr align="center">
                                        <td>
                                            <div id="Tab1_header">
                                                <ul class="nav nav-tabs">
                                                    <li id="TabTitle0" class="active"><a href="#Tabs0" data-toggle="tab">自定标签</a></li>
                                                    <li id="TabTitle1"><a href="#Tabs1" data-toggle="tab">系统标签</a></li>
                                                    <li id="TabTitle2"><a href="#Tabs2" data-toggle="tab">扩展函数</a></li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div class="tab-pane active" id="Tabs0" runat="server">
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table table-striped table-bordered table-hover">
                                                            <tbody>
                                                                <tr align="center">
                                                                    <td>
                                                                        <asp:DropDownList ID="DDLCate" runat="server" OnSelectedIndexChanged="ChangeCate"
                                                                            AutoPostBack="true">
                                                                        </asp:DropDownList></td>
                                                                </tr>
                                                                <tr align="center">
                                                                    <td>
                                                                        <div style="overflow: auto; height: 370px">
                                                                            <asp:Label ID="LblLabel" runat="server"></asp:Label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="tab-pane" id="Tabs1" runat="server">
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table table-striped table-bordered table-hover">
                                                            <tbody>
                                                                <tr align="center">
                                                                    <td>
                                                                        <div style="overflow: auto; height: 410px">
                                                                            <asp:Label ID="LblSysLabel" runat="server"></asp:Label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="tab-pane" id="Tabs2" runat="server">
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table table-striped table-bordered table-hover">
                                                            <tbody>
                                                                <tr align="center">
                                                                    <td>
                                                                        <div style="overflow: auto; height: 410px">
                                                                            <asp:Label ID="LblFunLabel" runat="server"></asp:Label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td align="left">
                            <div id="Textarea">
                                 <textarea readonly="readonly" id="ln_txt" style="width:40px;background-color:gray;color:white;height:435px;float:left;position:absolute;text-align:right;padding-top:6px; padding-right:3px;overflow-y:hidden;"></textarea>
                                <asp:TextBox TextMode="MultiLine" CssClass="form-control" runat="server" ID="textContent" Style="max-width: 100%; height: 435px;padding-left:40px;" onkeydown="UpdateLine();" onscroll="SyncScroll();"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="s1" runat="server" visible="false">
            <td style="width: 100%; text-align: left;" colspan="2"><strong>标签内容:(<font color="red">不满足</font>判断)</strong></td>
        </tr>
        <tr id="s2" runat="server" visible="false" onmouseover="this.className='tdbgmouseover'"
            onmouseout="this.className='tdbg'">
            <td style="width: 100%; text-align: right;" colspan="2">
                <table style="width: 100%">
                    <tr>
                        <td align="left">
                            <asp:TextBox TextMode="MultiLine" runat="server" CssClass="form-control" ID="falsecontent" Style="max-width: 100%; height: 231px;"></asp:TextBox></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" class="text-center">
                <asp:HiddenField ID="HdnLabelID" runat="server" />
                    <asp:Button ID="BtnSave" runat="server" Text="保存" CssClass="btn btn-primary" OnClick="BtnSave_Click"
                        OnClientClick="PrepareSave()" Style="cursor: pointer; cursor: pointer;" />
                    <input id="BtnCancel" type="button" class="btn btn-primary" value="取消" onclick="window.location.href = 'LabelManage.aspx'" style="cursor: pointer; cursor: pointer;" />
                    <input type="button" id="buttons" name="buttons" value="可视化预览" class="btn btn-primary" onclick="createEditor()" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/js/Drag.js"></script>
    <script type="text/javascript" src="/js/Dialog.js"></script>
    <script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="/Plugins/Ckeditor/EditFile/sample.js"></script>
    <link type="text/css" href="/Plugins/Ckeditor/EditFile/sample.css" rel="stylesheet" />
    <script type="text/javascript" charset="utf-8" src="/Plugins/kindeditor/kindeditor.js"></script>

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
    <script type="text/javascript">
        function openurls(url) {
            Dialog.open({ URL: url });
        }
        function opentitle(url, title) {
            var diag = new Dialog();
            diag.Width = 800;
            diag.Height = 600;
            diag.Title = title;
            diag.URL = url;
            diag.show();
        }
        function closdlg() {
            Dialog.close();
        }

        function PrepareSave() {
            if (document.getElementById('Textarea').style.display == 'none') {
                var oEditor = FCKeditorAPI.GetInstance('DataFCKeditor');
                document.getElementById('textContent').value = oEditor.GetXHTML(true);
            }
        }
    </script>
    <script type="text/javascript">    
<!--
    var start = 0, end = 0;
    var x, y;
    var dragspan;
    var inserttext;
    var nn6 = document.getElementById && !document.all;
    var isdrag = false;
    var labeltype = '0';
    function initDrag(e) {
        var oDragHandle = nn6 ? e.target : event.srcElement;
        if (oDragHandle.className == "spanfixdiv" || oDragHandle.className == "spanfixdivchechk") {
            isdrag = true;
            dragspan = document.createElement('div');
            dragspan.style.position = "absolute";
            dragspan.className = "dragspandiv";
            y = nn6 ? e.clientY + 5 : event.clientY + 5;
            x = nn6 ? e.clientX + 10 : event.clientX + 10;
            dragspan.style.width = oDragHandle.style.width;
            dragspan.style.height = oDragHandle.style.height;
            dragspan.style.top = y + "px";
            dragspan.style.left = x + "px";
            dragspan.innerHTML = oDragHandle.innerHTML;
            document.body.appendChild(dragspan);
            document.onmousemove = moveMouse;
            inserttext = oDragHandle.getAttribute("code");
            labeltype = oDragHandle.getAttribute("outtype");
            return false;
        }
    }

    function moveMouse(e) {
        if (isdrag) {
            dragspan.style.top = (nn6 ? e.clientY : event.clientY) + document.documentElement.scrollTop + 5 + "px";
            dragspan.style.left = (nn6 ? e.clientX : event.clientX) + document.documentElement.scrollLeft + 10 + "px";
            return false;
        }
    }

    function dragend(textBox) {
        if (isdrag) {
            savePos(textBox);
            cit();
        }
    }

    function savePos(textBox) {
        if (typeof (textBox.selectionStart) == "number") {
            start = textBox.selectionStart;
            end = textBox.selectionEnd;
        }
    }

    function cit() {
        //var oEditor = FCKeditorAPI.GetInstance('textContent');
        var target = document.getElementById('<% =textContent.ClientID %>');
        if (nn6) {
            var pre = target.value.substr(0, start);
            var post = target.value.substr(end);
            if (labeltype == '1') {
                target.value = pre + "{ZL.Label id=\"" + inserttext + "\"/}" + post;
                //oEditor.InsertHtml(pre + "{ZL.Label id=\"" + inserttext + "\"/}" + post);           
            }
            else if (labeltype == '2') {
                var link = "Insertlabel.aspx?n=" + escape(inserttext);
                if (window.showModalDialog != null) {
                    var ret = showModalDialog(link, '', 'dialogWidth:500px; dialogHeight:300px; help: no; scroll: no; status: no; edge: sunken;');
                    if (ret != null) {
                        if (ret.replace(/^\s+|\s+$/g, "") == "") {
                            alert("不能输入空值");
                        }
                        else {
                            target.value = pre + ret + post;
                        }
                    }
                }
                else {
                    window.open(link, window, 'modal=yes,width=500,height=300,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=no');
                }
            }
            else if (labeltype == '3') {
                target.value = pre + "{ZL.Source id=\"" + inserttext + "\"/}" + post;
                //oEditor.InsertHtml(pre + inserttext + post); 
            }
            else if (labeltype == '5') {
                target.text = "{ZL.Page id=\"" + inserttext + "\"/}";
            }
            else if (labeltype == '6') {
                target.text = "{ZL.Page id=\"" + inserttext + "\" num=\"500\"/}";
            }
            else {
                target.value = pre + inserttext + post;
                //oEditor.InsertHtml(pre + inserttext + post); 
            }
        }
        else {
            target.focus();
            var s = target.scrollTop; //获得滚动条的位置
            var range = document.selection.createRange();

            if (labeltype == "21") {
                var link = "Insertlabel.aspx?n=<%=Server.UrlEncode("日期格式转星期")%>";
                if (window.showModalDialog != null) {
                    var ret = showModalDialog(link, '', 'dialogWidth:500px; dialogHeight:300px; help: no; scroll: no; status: no; edge: sunken;');
                    if (ret != null) {
                        if (ret.replace(/^\s+|\s+$/g, "") == "") {
                            alert("不能输入空值");
                        }
                        else {
                            range.text = ret;//直接返回，后面的东西作用是将你选定的值加上
                            return;
                        }
                    }
                }
            }
            if (labeltype == '1') {
                range.text = "{ZL.Label id=\"" + inserttext + "\"/}";
            }
            else if (labeltype == '2') {
                var link = "Insertlabel.aspx?n=" + escape(inserttext);
                if (window.showModalDialog != null) {
                    var ret = showModalDialog(link, '', 'dialogWidth:500px; dialogHeight:300px; help: no; scroll: no; status: no; edge: sunken;');
                    if (ret != null) {
                        if (ret.replace(/^\s+|\s+$/g, "") == "") {
                            alert("不能输入空值");
                        }
                        else {
                            range.text = ret;
                        }
                    }
                }
                else {
                    window.open(link, window, 'modal=yes,width=500,height=300,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=no');
                }
            }
            else if (labeltype == '3') {
                range.text = "{ZL.Source id=\"" + inserttext + "\"/}";
            }
            else if (labeltype == '5') {
                range.text = "{ZL.Page id=\"" + inserttext + "\"/}";
            }
            else if (labeltype == '6') {
                range.text = "{ZL.Page id=\"" + inserttext + "\" num=\"500\"/}";
            }
            else {
                range.text = inserttext;
            }
            range.select();
            target.scrollTop = s; //把滚动条恢复到以前的位置
        }
    }

    function DragPos(textBox) {
        if (isdrag) {
            if (nn6) {
                textBox.focus();
            }
            else {
                var rng = textBox.createTextRange();
                rng.moveToPoint(event.x, event.y);
                rng.select();
            }
        }
    }
    document.onmousedown = initDrag;
    document.onmouseup = function () {
        isdrag = false;
        if (dragspan != null) {
            document.body.removeChild(dragspan);
            dragspan = null;
        }
    }

    function inputtxt(cc) {
        if (cc.value == "这里放入标签") {
            cc.value = '';
        }
    }
    </script>
    <script type="text/javascript" language="javascript">
        var editor;
        function createEditor() {
            var html = document.getElementById('textContent').value;
            if (document.getElementById("buttons").value == "可视化预览") {
                document.getElementById('textContent').style.display = "none";
                editor = CKEDITOR.replace('<% =textContent.ClientID %>',
		{
		    skin: 'v2',
		    enterMode: 2,
		    shiftEnterMode: 2,
		    width: "100%", height: 410,
		    toolbar: [['Source', '-', 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink', 'Smiley', 'ShowBlocks', 'Maximize', 'About']]
		});
                editor.setData(html);
                document.getElementById("buttons").value = "返回代码编辑";
            } else {
                if (editor) {
                    var oEditor = CKEDITOR.instances.textContent;
                    document.getElementById('textContent').value = editor.getData();
                    document.getElementById('textContent').style.display = '';
                    editor.destroy();
                    editor = null;
                    document.getElementById("buttons").value = "可视化预览";
                }
            }
        }
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2");
        var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2");
        function ShowTabss(SID) {
            if (SID != tID) {
                if (document.getElementById(arrTabTitle[tID].toString()) != null)
                    document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                if (document.getElementById(arrTabTitle[SID].toString()) != null)
                    document.getElementById(arrTabTitle[SID].toString()).className = "titlemouseover";
                if (document.getElementById(arrTabs[tID].toString()) != null)
                    document.getElementById(arrTabs[tID].toString()).style.display = "none";
                if (document.getElementById(arrTabs[SID].toString()) != null)
                    document.getElementById(arrTabs[SID].toString()).style.display = "";
                tID = SID;
            }
        }
    </script>
    <script language="javascript" type="text/javascript">
        function addubb(ubb) {
            var textEl = document.getElementById("<%=textContent.ClientID %>");
            var text = ubb;
            if (textEl.createTextRange && textEl.caretPos) {
                var caretPos = textEl.caretPos;
                caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == ' ' ? text + ' ' : text;
            }
            else
                textEl.value = textEl.value + text;
        }
    </script>
</asp:Content>
