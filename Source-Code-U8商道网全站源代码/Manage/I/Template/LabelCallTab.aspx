<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_LabelCallTab, App_Web_kgjff2qc" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .editdiv {float:left;width:12%;margin-top:10px;
        }
        .spanfixdivchechk,.spanfixdiv{width:75%;height:30px;line-height:30px; border:1px solid #F6B9D6;background-color:#FFFBF5;overflow:hidden;text-align:center;margin-top:10px;
        }
    </style>
    <title>标签助手</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered" >
        <tr>
            <td align="left" style="height: 410px;width: 377px;vertical-align:top;">
                <div id="Tab1_header">
                    <ul class="nav nav-tabs" id="myTab">
                        <li class="active" onclick="ShowTabs(this);" tab="Tabs0"><a href="javascript:;">自定标签</a></li>
                        <li onclick="ShowTabs(this);" tab="Tabs1" style="cursor:pointer;"><a href="javascript:;">字段标签</a></li>
                        <li onclick="ShowTabs(this);" tab="Tabs2" style="cursor:pointer;"><a href="javascript:;">系统标签</a></li>
                        <li onclick="ShowTabs(this);" tab="Tabs3" style="cursor:pointer;"><a href="javascript:;">扩展函数</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="Tabs0" runat="server">
                            <table class="table table-striped table-bordered">
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
                    <table runat="server" visible="false" enableviewstate="false">
                        <tr align="center" style="vertical-align:top;">
                            <td id="TabTitle0" runat="server" class="titlemouseover" onclick="ShowTabs(0)">自定标签
                            </td>
                            <td id="TabTitle1" runat="server" class="tabtitle" onclick="ShowTabs(1)">数据字段
                            </td>
                            <td id="TabTitle2" class="tabtitle" onclick="ShowTabs(2)">系统标签
                            </td>
                            <td id="TabTitle3" class="tabtitle" onclick="ShowTabs(3)">扩展函数
                            </td>
                            <td>&nbsp;
                                
                            </td>
                        </tr>
                    </table>

                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                          <table class="table table-striped table-bordered">
                                <tbody id="Tabs4" class="tab-pane" runat="server"></tbody>
                                <tbody id="Tabs1" class="tab-pane" runat="server" style="display: none">
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
                                <tbody id="Tabs2" class="tab-pane" style="display: none">
                                    <tr align="center">
                                        <td>
                                            <div style="overflow: auto; height: 410px">
                                                <asp:Label ID="lblSys" runat="server"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody id="Tabs3" class="tab-pane" style="display: none">
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
                    <asp:TextBox TextMode="MultiLine" runat="server" CssClass="form-control" ID="textContent" Style="max-width: 100%; height: 530px;" Width="100%" Height="435px"></asp:TextBox>
                </div>
            </td>
        </tr>
    </table>
<%--    <script type="text/javascript" src="/js/Drag.js"></script>--%>
    <script type="text/javascript" src="/JS/Common.js"></script>
    <script type="text/javascript" src="/js/Dialog.js"></script>
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
                    targetEdit.value = pre + "{ZL.Page id=\"" + inserttext + "\"/}";
                }
                else if (labeltype == '6') {
                    targetEdit.value = pre + "{ZL.Page id=\"" + inserttext + "\" num=\"500\"/}";
                }
                else {
                    targetEdit.value = pre + inserttext + post;
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
                        if (ret.replace(/^\s+|\s+$/g, "") == "") { alert("不能输入空值"); }
                        else { range.text = ret; }
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

    function ci2(labeltype, inserttext) {
        var targetEdit = document.getElementById('<% =textContent.ClientID %>');
        if (nn6) {
            var pre = targetEdit.value.substr(0, start);
            var post = targetEdit.value.substr(end);

            if (labeltype == '1') {
                targetEdit.value = pre + "{ZL.Label id=\"" + inserttext + "\"/}" + post;
            }
            else if (labeltype == '2') {
                var name = '<%=GetParam()%>';
                if (name != "") {
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
                else {
                    range.text = "{ZL.Label id=\"" + inserttext + "\"/}";
                }
            }
            else if (labeltype == '3') {
                targetEdit.value = pre + "{ZL.Source id=\"" + inserttext + "\"/}" + post;
            }
            else if (labeltype == '4') {
                range.text = "{ZL.Label id=\"" + inserttext + "\"/}";
            }
            else if (labeltype == '5') {
                targetEdit.text = "{ZL.Page id=\"" + inserttext + "\"/}";
            }
            else if (labeltype == '6') {
                targetEdit.text = "{ZL.Page id=\"" + inserttext + "\" num=\"500\"/}";
            }
            else {
                targetEdit.value = pre + inserttext + post;
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
             var name = '<%= GetParam()%>';
                     if (name != "") {
                         var link = "Insertlabel.aspx?n=" + escape(inserttext);
                         if (window.showModalDialog != null) {
                             var ret = showModalDialog(link, '', 'dialogWidth:500px; dialogHeight:300px; help: no; scroll: no; status: no; edge: sunken;');
                             if (ret != null) {
                                 if (ret.replace(/^\s+|\s+$/g, "") == "") { alert("不能输入空值"); }
                                 else { range.text = ret; }
                             }
                         }
                         else {
                             window.open(link, window, 'modal=yes,width=500,height=300,menubar=no,toolbar=no,location=no,resizable=no,status=no,scrollbars=no');
                         }
                     }
                     else {
                         range.text = "{ZL.Label id=\"" + inserttext + "\"/}";
                     }
                 }
                 else if (labeltype == '3') {
                     range.text = "{ZL.Source id=\"" + inserttext + "\"/}";
                 }
                 else if (labeltype == '4') {
                     range.text = "{ZL.Label id=\"" + inserttext + "\"/}";
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
        function ShowTabs(obj)
        {
            $(obj).siblings("li[tab]").each(function () { $(this).removeClass("active"); id = $(this).attr("tab"); $("#" + id).hide(); });
            var sid = $(obj).attr("tab");
            $(obj).addClass("active");
            $("#" + sid).show();
        }
    </script>
</asp:Content>