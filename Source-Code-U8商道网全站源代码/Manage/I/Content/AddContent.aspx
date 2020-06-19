<%@ page language="C#" autoeventwireup="true" inherits="V_Content_AddContent, App_Web_51yxiush" masterpagefile="~/Manage/I/Default.master" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
<title><asp:Literal runat="server" ID="Title_L"></asp:Literal></title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="/Plugins/Ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Content">
<asp:HiddenField ID="HiddenField1" runat="server" />
<asp:HiddenField ID="nodename" runat="server" />
    <div class="tabbable">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#ConInfo" data-toggle="tab">内容信息</a></li>
            <li><a href="#InfoAttr" data-toggle="tab">信息属性</a></li>
            <li><a href="#Process " data-toggle="tab">流程控制</a></li>
            <li><a href="#Reward " data-toggle="tab">悬赏定义</a></li>
        </ul>
        <div class="tab-content" style="margin-bottom:10px;">
            <div class="tab-pane active" id="ConInfo">
                <table id="mainTable" class="table table-bordered table_padding0">
                    <tr>
                        <td align="right" style="width:100px;"><asp:Label ID="bt_txt" runat="server" Text="标题"></asp:Label>&nbsp;&nbsp;</td>
                        <td>
                            <asp:TextBox ID="txtTitle" style="max-width:715px;background:url(/Images/bg1.gif) repeat-x;" CssClass="form-control pull-left" onblur="getstrKeys()" onkeyup="isgoEmpty('txtTitle','span_txtTitle');Getpy('txtTitle','PYtitle')"  runat="server"></asp:TextBox>
                            <span style="color:#f00;line-height:36px;margin-left:10px;">*</span>
                            <input id="Button11" type="button" class="btn btn-primary btn-xs" value="标题属性" onclick="open_style()" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="标题不能为空" ForeColor="Red" Display="Dynamic" />
                            <span id="span_txtTitle" name="span_txtTitle"></span>
                            <asp:HiddenField ID="ThreadStyle" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right"><asp:Label ID="py" runat="server" Text="拼音缩写"></asp:Label>&nbsp;&nbsp;</td>
                        <td>
                            <asp:TextBox ID="PYtitle" CssClass="form-control pull-left" runat="server" />
                        </td>
                    </tr>
                    <tr runat="server">
                        <td class="tdbgleft" style="width: 20%" align="right">
                            <asp:Label ID="gjz_txt" runat="server" Text="关键字"></asp:Label>
                            &nbsp;
                        </td>
                        <td class="bqright">
                            <asp:TextBox ID="TxtTagKey" runat="server" Text='' Width="41%"  CssClass="form-control pull-left"></asp:TextBox>
                            <input id="FindKeyWord" type="button" value="提取关键字" onclick="getstrKeys()" class="C_input" style="width: 110px;" />&nbsp;
                    <span style="color: #0000ff">[</span><a href="#" onclick="SelectKey();"><span style="text-decoration: underline; color: Green;">选择关键字</span></a><span style="color: #0000ff">]</span>
                            (使用空格分隔每个关键字)
                        </td>
                       </tr>
                    <tr runat="server">
                        <td align="right"><asp:Label ID="Label4" runat="server" Text="副标题"></asp:Label>&nbsp;&nbsp;</td>
                        <td>
                            <asp:TextBox ID="Subtitle" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
                     <tr id="attPic" runat="server">
                        <td style="width: 20%; line-height: 100px; height: 100px" align="right">
                            <div style="float: left; height: 100px; width: 150px; text-align: center;">
                                <label id="picview" name="picview"></label>
                            </div>
                            <asp:Label ID="Label6" runat="server" Text="附属图片"></asp:Label>&nbsp;
                        </td>
                        <td style="line-height: 100px; height: 100px">
                            <select name="selectpic" id="selectpic" onchange="ShowPic(this.value)" onclick="LoadImg('txt_content')" class="form-control">
                                <option value="" selected="selected">不指定附属图片</option>
                            </select>
                        </td>
                    </tr>
                    <tr id="CreateHTML" runat="server">
                        <td align="right">
                            <asp:Label ID="Label1" runat="server" Text="生成"></asp:Label>&nbsp;
                        </td>
                        <td>
                            <asp:CheckBox ID="quickmake" runat="server" Checked="false" Text="是否立即生成" />&nbsp;
                        </td>
            </tr>
                </table>
            </div>
            <div class="tab-pane fade" id="InfoAttr">
                <table class="table table-bordered table_padding0">
                    <tr>
                        <td align="right">录入者</td>
                        <td>
                            <asp:TextBox ID="txtInputer" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">添加时间</td>
                        <td>
                            <asp:TextBox ID="txtAddTime" CssClass="form-control" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right"><asp:Label ID="gx_time" runat="server" Text="Label"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtdate" CssClass="form-control" onClick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right"><asp:Label ID="hits_txt" runat="server" Text="Label"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtNum" CssClass="form-control" runat="server">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">指定个性模板</td>
                        <td>
                            <asp:TextBox ID="TxtTemplate" CssClass="form-control" runat="server"></asp:TextBox>
                            <input type="button" value="选择模板" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText='+escape('TxtTemplate')+'&FilesDir=',650,480)" class="btn btn-primary" />

                        </td>
                    </tr>
                    <tr>
                        <td align="right">生成PDF文件</td>
                        <td>
                            <asp:CheckBox ID="Makepdf" runat="server" Text="启用" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="tab-pane fade" id="Process">
                <table class="table table-bordered table_padding0">
                    <tr>
                        <td align="right">
                            <asp:Label ID="tj_txt" runat="server" Text="推荐级别"></asp:Label></td>
                        <td>
                            <asp:CheckBox ID="ChkAudit" runat="server" />推荐
                        </td>
                    </tr>
                    <tr id="contentsk" runat="server">
                        <td align="right"><asp:Label ID="zht_txt" runat="server" Text="状态"></asp:Label></td>
                        <td>
                            <asp:RadioButtonList ID="ddlFlow" runat="server" RepeatColumns="5">
                            <%--    <asp:ListItem Value="99" Selected="True">已审</asp:ListItem>
                                <asp:ListItem Value="0">待审</asp:ListItem>
                                <asp:ListItem Value="-1">退稿</asp:ListItem>--%>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="tab-pane fade" id="Reward">
                <table class="table table-bordered table_padding0">
                    <tr>
                        <td align="right">发布悬赏</td>
                        <td>
                            <asp:DropDownList ID="BidType" CssClass="form-control" runat="server" onchange="changevalue(this.value);">
                                <asp:ListItem Value="0">选择方式</asp:ListItem>
                                <asp:ListItem Value="1">单人中标</asp:ListItem>
                                <asp:ListItem Value="2">记件工资</asp:ListItem>
                            </asp:DropDownList>
                            <div id="changeins" style="display: none">
                                我想要<asp:TextBox ID="pronum" Width="30px" runat="server" CssClass="l_input">0</asp:TextBox>
                                 个方案，每个
                                <asp:TextBox ID="bidmoney" Width="30px" runat="server" CssClass="l_input">0</asp:TextBox>
                                元
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">项目完成周期 </td>
                        <td>
                            <asp:TextBox ID="proweek" CssClass="form-control" runat="server"></asp:TextBox>天
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="Conent_fix">
        <asp:HiddenField ID="HdnNode" runat="server" />
        <asp:HiddenField ID="HdnModel" runat="server" />
        <asp:HiddenField ID="HdnMapid" runat="server" />
        <asp:HiddenField ID="docParamValue" runat="server" Value="" />
        <asp:HiddenField ID="docTitle" runat="server" Value="" />
        <asp:HiddenField ID="isDoc" runat="server" Value="" />
        <asp:HiddenField ID="hidGID" runat="server" />
        <asp:Button ID="EBtnSubmit" CssClass="btn btn-primary" Text="添加项目" OnClick="EBtnSubmit_Click" runat="server" />
        <asp:Button ID="DraftBtn" CssClass="btn btn-primary" runat="server" OnClick="DraftBtn_Click" Text="存为草稿" />
        <asp:Button ID="BtnDoc" CssClass="btn btn-primary" runat="server" OnClientClick="return generate2('docTitle','docParamValue');" Visible="false" OnClick="BtnDoc_Click" Text="生成文档" />
        <asp:Button ID="BtnBack" CssClass="btn btn-primary" runat="server" Text="返回" OnClick="BtnBack_Click" UseSubmitBehavior="False" CausesValidation="False" />
</div>
<script type="text/javascript" src="/JS/Dialog.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/chinese.js"></script>
<script type="text/javascript"  src="/JS/Common.js"></script>
<script>
		$().ready(function () {
			$(".tabbable").find(":input[type=button]").addClass("btn btn-primary btn-xs");
			$("tr").removeClass("tdbg");
		})
		function isgoEmpty(Str, FS_Alert) {
		    var Obj = document.getElementById(Str);
		    var value = Obj.value.replace(/(^\s*)|(\s*$)/g, "");
		    if (value == "") {
		        document.getElementById(FS_Alert).innerHTML = "<span style=\"color:Red\">不能为空</span>";
		        return false;
		    } else {
		        var Str_Len = "";
		        var Len_Color = "";
		        Str_Len = value.length;
		        if (Str_Len <= 50) {
		            Len_Color = "006600";
		        }
		        else if (Str_Len > 50 && Str_Len <= 100) {
		            Len_Color = "3300FF";
		        }
		        else if (Str_Len > 100) {
		            Len_Color = "FF0000";
		        }
		        document.getElementById(FS_Alert).innerHTML = "<span>字数：<font style=\"color:#" + Len_Color + ";font-weight:bold;\">" + Str_Len + "</font></span>";
		        return true;
		    }
		}
		function getstrKeys() {
		    document.getElementById("TxtTagKey").value = "";
		    var strKeys = "";
		    var strkey = "<%=getKey()%>";
            var strTitle = document.getElementById("txtTitle").value;
            var keys = new Array();
            keys = strkey.split(",");
            for (var i = 0; i < keys.length; i++) {
                if (!(strTitle.indexOf(keys[i]) < 0)) {
                    if (i == 0) {
                        strKeys = keys[i];
                    }
                    else {
                        strKeys = strKeys + " " + keys[i];
                    }
                }
            }
            var strtxt = document.getElementById("TxtTagKey").value;
            document.getElementById("TxtTagKey").value = strtxt + strKeys;
        }
		function query(ontxt, id) {
			var str = document.getElementById(ontxt).value.trim();
			if (str == "") return;
			var arrRslt = makePy(str);
			if (arrRslt.length > 0) {
				document.getElementById(id).value = arrRslt.toString().toLowerCase().substring(0, 1);
			}
		}
		$().ready(function () {
			$(".nav").find("li ul li a").each(function () {
				var href = $(this).attr("href");
				if (href.toLowerCase() == '<%= Request.FilePath.Replace("/manage/",customPath2).ToLower()%>') {
					$(this).parent().addClass("active");
				}
			});
		})
	//$(window).resize(function () { SetEditor("txt_content"); });
	function open_style()
	{
		var diag = new Dialog();
		diag.Width = 600;
		diag.Height = 400;
		diag.Title = "设置标题字体<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
		diag.URL = "/Common/SelectStyle.htm";
		diag.show();
	}
	function closdlg()
	{
		Dialog.close();
	}
	var diag = new Dialog();
	function opentitle(url, title) {
		diag.Width = 1000;
		diag.Height = 750;
		diag.Title = title;
		diag.URL = url;
		diag.show();
	}
	function editnode(NodeID) {
		var answer = confirm("该栏目未绑定模板，是否立即绑定");
		if (answer == false) {
			return false;
		}
		else {
			open_page(NodeID, "EditNode.aspx?NodeID=");
		}
	}
	function open_page(NodeID, strURL) {
		var diag = new Dialog();
		diag.Width = 1000;
		diag.Height = 750;
		diag.Title = "配置节点<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
		diag.URL = strURL + NodeID;
		diag.show();
	}
	function GetPicurl(imgurl) {
		var optlen = document.getElementById("selectpic").options.length;
		var isin = 0;

		for (var i = 0; i < optlen; i++) {
			var doctxt = document.getElementById("selectpic").options.item(i);
			if (doctxt.value.toLowerCase() == imgurl.toLowerCase() || imgurl.toLowerCase().indexOf("http://") > -1) {
				isin = 1;
			}
		}

		if (isin == 0) {
			var option = document.createElement("option");
			option.text = imgurl;
			option.value = imgurl;
			document.getElementById("selectpic").add(option);
		}
	}
	function SelectKey() {
	    window.open('/Common/KeyList.aspx?OpenerText=<%=TxtTagKey.ClientID %>', '', 'width=600,height=450,resizable=0,scrollbars=yes');
     }

	function ShowPic(content) {
		if (content != "") {
			document.getElementById("picview").innerHTML = "<img width=100px height=100px src=" + content + " />";
		} else {
			document.getElementById("picview").innerHTML = "";
		}
	}
	function LoadImg(content) {
		eval("var oEditor = CKEDITOR.instances." + content);

		var contenttxt = $("#" + content).val().toLowerCase();

		var myregexp = /src=\"(.*?).(gif|jpg|png)/img;
		var match = myregexp.exec(contenttxt);
		while (match != null) {
			var picurl = match[0];

			if (picurl.indexOf("http://") == -1) {
				picurl = picurl.replace("src=\"", "")
				GetPicurl(picurl);
			}
			else {
				picurl = picurl.replace("src=\"", "")
			GetPicurl(picurl);
		}
		match = myregexp.exec(contenttxt);
	}
}
</script>
<style>
#txt_synopsis {width:auto;}
#txtTitle{ width:715px;}
</style>
</asp:Content>