﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Page_AdduserField, App_Web_5jbettm4" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>添加模型字段</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/JS/Common.js"></script>
<script type="text/javascript" src="/JS/ModelField.js"></script>
<script type="text/javascript" src="../../JS/chinese.js"></script>
    <style id="sty" runat="server" type="text/css"></style>

</head>
<body>
<form id="form1" runat="server">
    <div id="nav_box">
<div class="r_navigation">
	<span>后台管理</span> &gt;&gt; 企业黄页 &gt;&gt; <a href="UserModelManage.aspx">黄页申请设置</a>
&gt;&gt; <a href="UserModelField.aspx?ModelID=<%=Request.QueryString["ModelID"] %>">样式字段列表</a>
&gt;&gt; 添加[<asp:Label ID="lblModel" runat="server" Text="Label"></asp:Label>]字段
</div>
</div>
    <div style="height:27px;"></div>
<div class="clearbox"></div>        
<table class="border" cellspacing="1" cellpadding="0" border="0" width="99%">
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft" style="width: 200px;">
                <strong>字段别名：</strong>
            </td>
            <td>
                <asp:TextBox ID="Alias" runat="server"  class="l_input" MaxLength="20" onkeyup="Getpy('Alias','Name')"></asp:TextBox>
                  <span style="color:#ff0066">*</span><span class="tips" style="color: #808000"> 如：文章标题</span></td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft">
                <strong>字段名称：</strong>
            </td>
            <td>
                <asp:TextBox ID="Name" MaxLength="50" class="l_input" runat="server"></asp:TextBox>
                <span style="color:#ff0066">*</span><span class="tips" style="color: #808000">字段名由字母、数字、下划线组成</span>
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft">
                <strong>字段提示：</strong>
            </td>
            <td>
                <asp:TextBox ID="Tips" MaxLength="50" class="l_input" runat="server"></asp:TextBox><span class="tips" style="color: #808000">显示在字段别名下方作为重要提示的文字</span>
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft">
                <strong>字段描述：</strong>
            </td>
            <td class="tdgb">
                <asp:TextBox ID="Description" class="l_input" runat="server" Columns="40" 
                    Rows="6" TextMode="MultiLine" Height="60px"></asp:TextBox></td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft">
                <strong>是否必填：</strong>
            </td>
            <td>
                <asp:RadioButtonList ID="IsNotNull" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="True">是</asp:ListItem>
                    <asp:ListItem Selected="True" Value="False">否</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft">
               <strong>是否在前台显示：</strong>
            </td>
            <td>
            <asp:RadioButtonList ID="IsShow" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="true" Value="True">是</asp:ListItem>
                    <asp:ListItem  Value="False">否</asp:ListItem>
                </asp:RadioButtonList>
                <span style="color: #808000">选择“否”可作为相关隐藏识别符而不能输出在前台(仅能后台录入)。</span></td>
        </tr>
        <tbody id="tbSearch" style="">
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft">
                <strong>是否在搜索表单显示：</strong>
            </td>
            <td>
                <asp:RadioButtonList ID="IsSearchForm" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="True">是</asp:ListItem>
                    <asp:ListItem Selected="True" Value="False">否</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        </tbody>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft">
                <strong>字段类型：</strong>
            </td>
            <td>
                <asp:RadioButtonList ID="Type" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" onclick="SelectModelType()">
                    <asp:ListItem Value="TextType" Selected="True">单行文本</asp:ListItem>
                    <asp:ListItem Value="MultipleTextType">多行文本(不支持Html)</asp:ListItem>
                    <asp:ListItem Value="MultipleHtmlType">多行文本(支持Html)</asp:ListItem>
                    <asp:ListItem Value="OptionType">单选项</asp:ListItem>
                    <asp:ListItem Value="ListBoxType">多选项</asp:ListItem>
                    <asp:ListItem Value="DateType">日期时间</asp:ListItem>
                    <asp:ListItem Value="PicType">图片</asp:ListItem>
                    <asp:ListItem Value="MultiPicType">多图片</asp:ListItem>
                    <asp:ListItem Value="SmallFileType">文件</asp:ListItem>
                    <asp:ListItem Value="FileType">多文件</asp:ListItem>
                    <asp:ListItem Value="NumType">数字</asp:ListItem>
                    <asp:ListItem Value="OperatingType">运行平台</asp:ListItem>
                    <asp:ListItem Value="SuperLinkType">超链接</asp:ListItem>
                    <asp:ListItem Value="GradeOptionType">多级选项</asp:ListItem>
                    <asp:ListItem Value="ColorType">颜色代码</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <!--  单行文本   -->
        <tbody id="DivTextType" >
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>文本框长度：</strong></td>
                <td><asp:TextBox ID="TitleSize" class="l_input" runat="server" Columns="10" MaxLength="4">35</asp:TextBox></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>是否为密码：</strong></td>
                <td><asp:RadioButtonList ID="IsPassword" runat="server" RepeatDirection="Horizontal"
                    CssClass="input1">
                    <asp:ListItem Value="password">是</asp:ListItem>
                    <asp:ListItem Selected="True" Value="text">否</asp:ListItem>
                </asp:RadioButtonList></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>默认值：</strong></td>
                <td><asp:TextBox ID="TextType_DefaultValue" class="l_input" runat="server" Columns="10"></asp:TextBox></td>
            </tr>
        </tbody>
        <!--  多行文本(不支持Html)    -->
        <tbody id="DivMultipleTextType" style="display:none">
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>显示的宽度：</strong></td>
                <td><asp:TextBox ID="MultipleTextType_Width" class="l_input" runat="server" Columns="10" MaxLength="4">500</asp:TextBox>px</td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>显示的高度：</strong></td>
                <td><asp:TextBox ID="MultipleTextType_Height" class="l_input" runat="server" Columns="10" MaxLength="4">200</asp:TextBox>px</td>
            </tr>
        </tbody>
        <!--  多行文本(支持Html)    -->
        <tbody id="DivMultipleHtmlType" style="display:none">
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>编辑器类型：</strong></td>
                <td><asp:DropDownList ID="IsEditor" runat="server">
                    <asp:ListItem Value="1">简洁型编辑器</asp:ListItem>
                    <asp:ListItem Value="2">标准型编辑器</asp:ListItem>
                    <asp:ListItem Value="3">增强型编辑器</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>显示的宽度：</strong></td>
                <td><asp:TextBox ID="MultipleHtmlType_Width" class="l_input" runat="server" Columns="10" MaxLength="4">715</asp:TextBox>px</td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>显示的高度：</strong></td>
                <td><asp:TextBox ID="MultipleHtmlType_Height" class="l_input"  runat="server" Columns="10" MaxLength="4">400</asp:TextBox>px</td>
            </tr>
        </tbody>
        <!--  单选项    -->
        <tbody id="DivOptionType" style="display:none">
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>分行键入每个选项：</strong></td>
                <td><input id="Button3" type="button" value="从数据字典中选择选项" class= "C_input" onclick="SelectDictionary('RadioType_Content')" /><input 
                    id="Button6" type="button" class= "C_input"  value="添加数据字段" onclick='SubPage("RadioType_Content")' /><br />
                    <asp:TextBox ID="RadioType_Content" class="l_input" runat="server" 
                        TextMode="MultiLine" Columns="40" Rows="6" Height="60px" Width="345px"></asp:TextBox> <span style="color: red">*</span></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>默认值：</strong>
                        </td>
                <td><asp:TextBox ID="RadioType_Default" class="l_input" runat="server"></asp:TextBox> <span style="color: #808000">注：没有数据录入的默认值，与前台显示无关.</span></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">显示选项：</td>
                <td><asp:RadioButtonList ID="RadioType_Type" runat="server">
                    <asp:ListItem Selected="True" Value="1">单选下拉列表框</asp:ListItem>
                    <asp:ListItem Value="2">单选按钮</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>是否设置属性值：</strong>
                        </td>
                <td>
                    <asp:RadioButtonList ID="RadioType_Property" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="True" Selected="True">是</asp:ListItem>
                    <asp:ListItem Value="False">否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
        </tbody>
        <!--  多选项    -->
        <tbody id="DivListBoxType" style="display:none">
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>分行键入每个选项：</strong></td>
                <td><input id="Button4" type="button" value="从数据字典中选择选项" class="C_input"  onclick="SelectDictionary('ListBoxType_Content')" /><input 
                    id="Button5"  class="C_input" type="button" value="添加数据字段" onclick='SubPage("ListBoxType_Content")' /><br />
                    <asp:TextBox ID="ListBoxType_Content" class="l_input" runat="server" 
                        TextMode="MultiLine" Columns="40" Rows="6" Height="60px" Width="346px"></asp:TextBox> <span style="color: red">*</span></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>显示选项：</strong></td>
                <td><asp:RadioButtonList ID="ListBoxType_Type" runat="server">
                    <asp:ListItem Selected="True" Value="1">复选框</asp:ListItem>
                    <asp:ListItem Value="2">多选列表框</asp:ListItem>
                    <asp:ListItem Value="3">多填选项框</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
        </tbody>
        <!--  日期型    -->
        <tbody id="DivDateType" style="display:none">                
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>搜索范围：</strong>                    
                </td>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" border="0" align="center">
                        <tr class="tdbg">
                            <td>
                            <asp:RadioButtonList ID="DateSearchType" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Selected="True" >开始-结束日期</asp:ListItem>
                                <asp:ListItem Value="0">自定范围</asp:ListItem>
                            </asp:RadioButtonList>
                            </td>
                            <td>                               
                            
                            </td>
                        </tr> 
                        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                            <td>
                                <asp:TextBox ID="DateSearchRang" class="l_input"  runat="server" 
                                    TextMode="MultiLine" Columns="40" Rows="6" Height="60px"></asp:TextBox><br />
                                <asp:RadioButtonList ID="DateSearchUnit" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0" Selected="True" >小时</asp:ListItem>
                                    <asp:ListItem Value="1">天</asp:ListItem>
                                    <asp:ListItem Value="2">月</asp:ListItem>
                                    <asp:ListItem Value="3">年</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <font color="red">选择了自定范围时请输入此项内容,格式：范围名|范围<br /> 分行输入范围，单位选择 天 如：<br />
                                    3天内|0-3<br />7天内|0-7<br />7天-15天|7-15<br />
                                    1个月内|0-30</font>  
                            </td>
                        </tr>
                    </table>                        
                </td>
            </tr>
        </tbody>
        <!--  图片类型    -->
        <tbody id="DivPicType" style="display:none">
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>图片是否加水印：</strong></td>
                <td>
                    <asp:RadioButtonList ID="RBLPicWaterMark" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">是</asp:ListItem>
                        <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>允许上传的图片大小：</strong></td>
                <td>
                    <asp:TextBox ID="TxtSPicSize" runat="server" Columns=5 class="l_input">1024</asp:TextBox>KB <span style="color: blue">
                        提示：1 KB = 1024 Byte，1 MB = 1024 KB</span> <span style="color: red">*</span></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>允许上传的图片类型：</strong></td>
                <td>
                    <asp:TextBox ID="TxtPicExt" runat="server" Columns="30" class="l_input"></asp:TextBox><span style="color: red">*</span>
                <span style="color: Blue">注：允许多个类型请用“|”号分割，如：jpg|gif|bmp等等</span></td>
            </tr>
        </tbody>
        <!--  多图片    -->
        <tbody id="DivMultiPicType" style="display:none">
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>缩略图选项：</strong></td>
                <td>
                    <asp:CheckBox ID="ChkThumb" runat="server" Text="是否保存缩略图地址" />&nbsp;&nbsp;保存缩略图地址字段：
                    <asp:TextBox ID="TxtThumb" runat="server" Columns="20" class="l_input"></asp:TextBox><span style="color:Red;display:none;">保存缩略图地址字段名不能与主字段名重复！</span></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>图片是否加水印：</strong></td>
                <td>
                    <asp:RadioButtonList ID="RBLWaterMark" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">是</asp:ListItem>
                        <asp:ListItem Selected="True" Value="0">否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>允许上传的图片大小：</strong></td>
                <td>
                    <asp:TextBox ID="TxtPicSize" runat="server" Columns=5 class="l_input">1024</asp:TextBox>KB <span style="color: blue">
                        提示：1 KB = 1024 Byte，1 MB = 1024 KB</span> <span style="color: red">*</span></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>允许上传的图片类型：</strong></td>
                <td>
                    <asp:TextBox ID="TextImageType" runat="server" Columns="30" class="l_input"></asp:TextBox> <span style="color: red">*</span>
                <span style="color: Blue">注：允许多个类型请用“|”号分割，如：jpg|gif|bmp等等</span></td>
            </tr>
        </tbody>            
         <!--  文件类型    -->
    <tbody id="DivSmallFileType" style="display: none">
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft">
                <strong>允许上传的文件大小：</strong>
            </td>
            <td>
                <asp:TextBox ID="TxtMaxFileSizes" runat="server" Columns="5" class="l_input">1024</asp:TextBox>KB <span style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span> <span style="color: red">*</span>
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft">
                <strong>允许上传的文件类型：</strong>
            </td>
            <td>
                <asp:TextBox ID="TxtUploadFileTypes" runat="server" Columns="30" class="l_input"></asp:TextBox>
                <span style="color: red">*</span> <span style="color: Blue">注：允许多个类型请用“|”号分割，如：rar|jpg|gif|bmp等等</span>
            </td>
        </tr>
    </tbody>
     <!--  多文件类型    -->
    <tbody id="DivFileType" style="display: none">
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft">
                <strong>保存文件大小设置：</strong>
            </td>
            <td>
                <asp:CheckBox ID="ChkFileSize" runat="server" Text="是否保存文件大小" Checked="True" /><br />
                保存文件大小字段名：
                <asp:TextBox ID="TxtFileSizeField" runat="server" Columns="20" class="l_input"></asp:TextBox><br />
                <span style="color: Red; display: none;">注：字段名由字母、数字、下划线组成，并且仅能字母开头，不以下划线结尾。不能与已有字段名重复</span>
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft">
                <strong>允许上传的文件大小：</strong>
            </td>
            <td>
                <asp:TextBox ID="TxtMaxFileSize" runat="server" Columns="5" class="l_input">1024</asp:TextBox>KB <span style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span> <span style="color: red">*</span>
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft">
                <strong>允许上传的文件类型：</strong>
            </td>
            <td>
                <asp:TextBox ID="TxtUploadFileType" runat="server" Columns="30" class="l_input"></asp:TextBox>
                <span style="color: red">*</span> <span style="color: Blue">注：允许多个类型请用“|”号分割，如：jpg|gif|bmp等等</span>
            </td>
        </tr>
    </tbody>
        <!--  运行平台    -->
        <tbody id="DivOperatingType" style="display:none">
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>分行键入&nbsp;&nbsp;<br />
                    每个平台选项：</strong></td>
                <td>
                    <asp:TextBox ID="TxtOperatingOption" runat="server" TextMode="MultiLine" 
                        Columns="40" Rows="6" class="l_input" Height="60px"></asp:TextBox> <span style="color: red">*</span> <span style="color: blue">注：一行一个默认项</span></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>文本框长度：</strong></td>
                <td><asp:TextBox ID="OperatingType_TitleSize" runat="server" Columns="10" MaxLength="4" class="l_input">35</asp:TextBox><span style="color: red">*</span></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>默认值：</strong></td>
                <td><asp:TextBox ID="OperatingType_DefaultValue" runat="server" Columns="30" class="l_input"></asp:TextBox><span style="color: green">例：Win2000|XP|Win2003</span> </td>
            </tr>
        </tbody>
        <!--  超链接    -->
        <tbody id="DivSuperLinkType" style="display:none">
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>文本框长度：</strong></td>
                <td><asp:TextBox ID="SuperLinkType_TitleSize" runat="server" Columns="10" MaxLength="4" class="l_input">50</asp:TextBox></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>默认值：</strong></td>
                <td><asp:TextBox ID="SuperLinkType_DefaultValue" runat="server" Columns="30" class="l_input"></asp:TextBox><span style="color: green">例：http://127.0.0.1/</span></td>
            </tr>
        </tbody> 
        <!--  多级选项    -->
        <tbody id="DivGradeOptionType" style="display:none">
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>选择分级数据分类：</strong></td>
                <td>
                    <asp:DropDownList ID="GradeOptionType_Cate" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>                
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>选项下拉框排列格式化：</strong></td>
                <td>
                    <asp:RadioButtonList ID="GradeOptionType_Direction" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">一行横排</asp:ListItem>
                        <asp:ListItem Value="1">多行竖排</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr> 
        </tbody>                
        <!--  数字类型    -->
        <tbody id="DivNumType" style="display:none">
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>文本框长度：</strong></td>
                <td><asp:TextBox ID="NumberType_TitleSize" runat="server" Columns="10" MaxLength="4" class="l_input">35</asp:TextBox></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>数字类型：</strong></td>
                <td>
                    <asp:RadioButtonList ID="NumberType_Style" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">整数</asp:ListItem>
                        <asp:ListItem Value="2">小数</asp:ListItem>
                        <asp:ListItem Value="3">货币</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft"><strong>默认值：</strong></td>
                <td><asp:TextBox ID="NumberType_DefaultValue" runat="server" Columns="10" class="l_input"></asp:TextBox></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                <strong>搜索设置：</strong>
                </td>
                <td>
                    <asp:RadioButtonList ID="NumSearchType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Selected="True" >精确搜索</asp:ListItem>
                        <asp:ListItem Value="0">范围搜索</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                <td class="tdbgleft">
                    <strong>搜索范围：</strong>                   
                </td>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" border="0" align="center">
                        <tr class="tdbg">
                            <td>
                            <asp:RadioButtonList ID="NumRangType" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Selected="True" >下限-上限</asp:ListItem>
                                <asp:ListItem Value="0">自定范围</asp:ListItem>
                            </asp:RadioButtonList>
                            </td>
                            <td>                               
                                <font color="red">选择了范围搜索时，此设置才有效</font>
                            </td>
                        </tr> 
                        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                            <td>
                                <asp:TextBox ID="NumSearchRange" runat="server" TextMode="MultiLine" 
                                    Columns="40" Rows="6" class="l_input" Height="60px"></asp:TextBox><br />                                    
                            </td>
                            <td>
                                <font color="red">选择了自定范围时请输入此项内容,格式：范围名|范围<br /> 分行输入范围如：<br />
                                    500元以下|0-500<br />500元-1000元|500-1000<br />1000元以上|1000</font>  
                            </td>
                        </tr>
                    </table>                        
                </td>
            </tr>
        </tbody>
        <!--  颜色代码   -->
        <tbody id="DivColorType" style="display: none" runat="server">
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td class="tdbgleft">
                <strong>默认颜色值：</strong>
            </td>
            <td>

                <asp:TextBox ID="ColorDefault" runat="server"  MaxLength="7"  Columns="7"  style="font-size: 9pt; height: 15px;" class="l_input"></asp:TextBox>
                
                <img onclick="SelectColor(this,'ColorDefault');" src="/App_Themes/AdminDefaultTheme/Images/selectclolor.gif" align="absmiddle" style="border-width: 0px; cursor: pointer" />
            </td>
        </tr>
    </tbody>
        <tr class="tdbg">
            <td class="tdbgleft">
            </td>
            <td height="50">
                <asp:Button ID="Button1" runat="server" Text=" 添加字段 " class="C_input" OnClientClick="return isok()" OnClick="Button1_Click" />
                &nbsp;&nbsp;
                <input id="Button2" type="button" value=" 返回字段列表 " class="C_input" onclick="javascript:window.location.href='UserModelField.aspx?ModelID=<%=Request.QueryString["ModelID"] %>'" />
                <asp:HiddenField ID="HdfModelID" runat="server" /><asp:HiddenField ID="HdfTableName" runat="server" />
            </td>
        </tr>
    </table>

</form>
</body>
</html>
