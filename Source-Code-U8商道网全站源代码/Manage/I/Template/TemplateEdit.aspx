<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="Manage_I_Content_TemplateEdit, App_Web_kgjff2qc" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
        <style type="text/css">
        .editdiv {float:left;width:12%;margin-top:10px;}
        .spanfixdivchechk,.spanfixdiv{width:75%;height:30px;line-height:30px; border:1px solid #F6B9D6;background-color:#FFFBF5;overflow:hidden;text-align:center;margin-top:10px; }
    </style>
    <title>编辑模板</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table width="100%" cellpadding="2" border="0" cellspacing="1" class="table table-striped table-bordered" align="center">
        <tr class="title" style="font-weight: normal;">
            <td align="left" colspan="2">
                <span style="float:left; margin-left:10px; margin-right:10px; font-weight:bold; margin-top:0.3em;">请输入模板名称:</span>
               <div class="input-group" style="width: 300px; float:left">
                   <input runat="server" id="TxtFilename" style="text-align: right" class="form-control" />
                   <asp:Label runat="server" ID="name_L" class="input-group-addon">
                       .html
                   </asp:Label>
               </div>
                          <asp:HiddenField ID="HdnShowPath" runat="server" />
                <asp:HiddenField ID="Hdnmethod" runat="server" />
                <asp:HiddenField ID="HdnFilePath" runat="server" />
        </tr>
        <tr>
            <td align="left" style="height: 410px; width: 377px; vertical-align: top;">
                <div id="Tab1_header">
                    <ul class="nav nav-tabs">
                        <li id="TabTitle0" class="active"><a href="#Tabs0" data-toggle="tab" onclick="ShowTabs(0)">自定标签</a></li>
                        <li id="TabTitle1"><a href="#Tabs1" data-toggle="tab" onclick="ShowTabs(1);">字段标签</a></li>
                        <li id="TabTitle2"><a href="#Tabs2" data-toggle="tab" onclick="ShowTabs(2);">系统标签</a></li>
                        <li id="TabTitle3"><a href="#Tabs3" data-toggle="tab" onclick="ShowTabs(3);">扩展函数</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="Tabs0" runat="server">
                            <table border="0"  class="table table-striped table-bordered">
                            <tbody>
                                    <tr align="center">
                                        <td style="vertical-align:top;">
                                            <asp:DropDownList ID="DDLCate" runat="server" OnSelectedIndexChanged="ChangeCate" AutoPostBack="true"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td style="vertical-align:top;">
                                            <div style="overflow: auto; height: 410px">
                                                <asp:Label ID="LblLabel" runat="server"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                          <table class="table table-striped table-bordered table-hover">
                                <tbody id="Tabs4" runat="server"></tbody>
                                <tbody id="Tabs1" runat="server" style="display: none">
                                    <tr align="center">
                                        <td>
                                            <asp:DropDownList ID="DDLField" runat="server" OnSelectedIndexChanged="ChangeSourceField"
                                                AutoPostBack="true">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td>
                                            <div style="overflow: auto; height: 410px">
                                                <asp:Label ID="LblSourceField" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody id="Tabs2" style="display: none">
                                    <tr align="center">
                                        <td>
                                            <div style="overflow: auto; height: 410px">
                                                <asp:Label ID="lblSys" runat="server"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody id="Tabs3" style="display: none">
                                    <tr align="center">
                                        <td>
                                            <div style="overflow: auto; height: 410px">
                                                <asp:Label ID="lblFun" runat="server"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </td>
            <td>
                <iframe style="height: 30px; width: 530px; z-index: -1;" frameborder="0" name="I1" id="I1" scrolling="no" src="/manage/Template/label.htm"></iframe>
                <div id="Textarea">
                    <textarea id="ln_txt" style="width:40px;background-color:gray;color:white;height:530px;float:left;position:absolute;text-align:right;padding-top:6px; padding-right:3px;overflow-y:hidden;"></textarea>
                    <asp:TextBox TextMode="MultiLine" runat="server" CssClass="form-control" ID="textContent" style="width:100%;max-width:100%;height:530px;padding-left:40px;"  onkeydown="UpdateLine();" onscroll="SyncScroll();" />
                </div>
            </td>
        </tr>
        <tr>
            <td align="left" colspan="2">
                <div style="float: left; padding-left: 250px">
                    <asp:Button ID="btnSave" runat="server" Text="保存模板" Class="btn btn-primary" OnClick="btnSave_Click"
                        OnClientClick="PrepareSave()" UseSubmitBehavior="false"/>&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnReset" Class="btn btn-primary" runat="server" Text="取消操作" OnClick="btnReset_Click" UseSubmitBehavior="false"/>&nbsp;&nbsp;&nbsp;
                </div>
                <div id="Div1" style="float: left">
                    <%--<input type="button" id="buttons" name="buttons" value="可视化预览" class="btn btn-primary" onclick="opentitle('Default.aspx','可视化窗口')" />--%>
                </div>
            </td>
        </tr>
    </table>
    <script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/js/Drag.js"></script>
<script type="text/javascript" src="/js/Dialog.js"></script>
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>

    <script type="text/javascript">
        function hotkey() {
            var a = window.event.keyCode;
            if (window.event.altKey && a == 88) {
                opentitle("LabelPage.aspx", "选择标签[按ESC键关闭窗口]");
            }
            //window.event.returnValue = false; 
            //return false;
        } // end hotkey 
        document.onkeydown = hotkey; //当onkeydown 事件发生时调用hotkey函数 
        //--> 
</script>
    <script type="text/javascript">
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
            var targetEdit = document.getElementById('<% =textContent.ClientID %>');
        if (nn6) {
            var pre = targetEdit.value.substr(0, start);
            var post = targetEdit.value.substr(end);
            if (labeltype == '1') {
                targetEdit.value = pre + "{ZL.Label id=\"" + inserttext + "\"/}" + post;
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
                            targetEdit.value = pre + ret + post;
                        }
                    }
                }
                else {
                    window.open(link, window, 'modal=yes,width=500,height=300,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=no');
                }
            }
            else if (labeltype == '3') {
                targetEdit.value = pre + "{ZL.Source id=\"" + inserttext + "\"/}" + post;
                //oEditor.InsertHtml(pre + inserttext + post); 
            }
            else if (labeltype == '5') {
                targetEdit.text = "{ZL.Page id=\"" + inserttext + "\"/}";
            }
            else if (labeltype == '6') {
                targetEdit.text = "{ZL.Page id=\"" + inserttext + "\" num=\"500\"/}";
            }
            else {
                targetEdit.value = pre + inserttext + post;
                //oEditor.InsertHtml(pre + inserttext + post); 
            }
        }
        else {
            targetEdit.focus();
            var s = targetEdit.scrollTop; //获得滚动条的位置
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
            targetEdit.scrollTop = s; //把滚动条恢复到以前的位置
        }
    }

    function DragPos(textBox) {
        if (isdrag) {
            if (nn6) {
                textBox.focus();
            }
            else {
                var rng = textBox.createTextRange();
                try {
                    rng.moveToPoint(event.x, event.y);
                    rng.select();
                } catch (Error)
                { }
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

        function addubb(ubb) {
            //Form1.top.value=Form1.top.value+ubb;
            var textEl = form1.textContent;
            var text = ubb;
            if (textEl.createTextRange && textEl.caretPos) {
                var caretPos = textEl.caretPos;
                caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == ' ' ? text + ' ' : text;
            }
            else
                textEl.value = textEl.value + text;
        }
        function PrepareSave() {
            if (document.getElementById('Textarea').style.display == 'none') {
                var oEditor = FCKeditorAPI.GetInstance('DataFCKeditor');
                document.getElementById('textContent').value = oEditor.GetXHTML(true);
            }
        }

        var diag = new Dialog();
        function openurls(url) {
            Dialog.open({ URL: url });
        }
        function opentitle(url, title) {
            //        diag.Width = window.screen.width;
            //        diag.Height = window.screen.height;
            diag.Width = 800;
            diag.Height = 600;
            diag.Title = title;
            diag.URL = url;
            diag.show();
            skin: 'v2';
            enterMode: 2;
            shiftEnterMode: 2;
        }

        function closdlg() {
            Dialog.close();
        }
        function op() {
            window.open('../Template/Default.aspx', '', 'width=600,height=450,resizable=1,scrollbars=yes', 'createEditor()');
            return false;
        }
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
</script>
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