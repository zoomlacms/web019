<%@ page language="C#" autoeventwireup="true" inherits="manage_Search_AddSearch, App_Web_hhhhdfot" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>新增导航</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:HiddenField ID="hideid" runat="server" />
    <table width="100%" border="0" cellpadding="5" cellspacing="1" class="table table-striped table-bordered table-hover">
        <tr>
            <td class="spacingtitle" colspan="2" align="center">
                <asp:Literal ID="LTitle" runat="server" Text="添加搜索信息"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td valign="top" style="margin-top: 0px; margin-left: 0px;">
                <table width="100%" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover" style="margin: 0;">
                    <tbody id="Tabs0">
                        <tr>
                            <td style="width: 100px;">
                                <strong>功能名称：</strong>
                            </td>
                            <td style="height: 26px;">
                                <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>*方便记忆的名称
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="名称不能为空！" Display="Dynamic" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                <br />
                                <span runat="server" id="Span1"></span>
                            </td>
                        </tr>
                    </tbody>
                    <tbody id="Tabs1">
                        <tr>
                            <td>
                                <strong>文件路径：</strong>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFileUrl" runat="server" class="form-control"></asp:TextBox>
                                *您可以直接填入系统内文件名,以便后台访问,如[/manage/Config/SiteInfo.aspx]为系统配置,或输入外部网址提交</td>
                        </tr>
                        <tr onmouseover="this.className='tdbgmouseover'" onmouseout="this,className='tdbg'">
                            <td>
                                <strong>图标地址：</strong>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                <!-- Button trigger modal -->
                                <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">选择图标</button>
                                <!-- Modal -->
                                <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" style="width:1000px;">
                                        <div class="modal-content" style="width:1000px;">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalLabel">Glyphicons 图标</h4>
                                            </div>
                                            <div class="modal-body">
                                                <table class="table table-bordered">
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-adjust"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-adjust</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-adjust" checked="checked" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-align-center"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-align-center</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-align-center" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-align-justify"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-align-justify</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-align-justify" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-align-left"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-align-left</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-align-left" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-align-right"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-align-right</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-align-right" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-arrow-down"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-arrow-down</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-arrow-down" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-arrow-left"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-arrow-left</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-arrow-left" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-arrow-right"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-arrow-right</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-arrow-right" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-arrow-up"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-arrow-up</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-arrow-up" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-asterisk"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-asterisk</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-asterisk" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-backward"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-backward</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-backward" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-ban-circle"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-ban-circle</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-ban-circle" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-barcode"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-barcode</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-barcode" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-bell"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-bell</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-bell" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-bold"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-bold</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-bold" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-book"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-book</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-book" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-bookmark"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-bookmark</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-bookmark" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-briefcase"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-briefcase</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-briefcase" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-briefcase"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-briefcase</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-briefcase" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-calendar</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-calendar" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-camera"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-camera</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-camera" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-certificate"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-certificate</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-certificate" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-check"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-check</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-check" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-chevron-down"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-chevron-down</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-chevron-down" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-chevron-left"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-chevron-left</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-chevron-left" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-chevron-right"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-chevron-right</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-chevron-right" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-chevron-up"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-chevron-up</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-chevron-up" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-circle-arrow-down"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-circle-arrow-down</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-circle-arrow-down" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-circle-arrow-left"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-circle-arrow-left</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-circle-arrow-left" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-circle-arrow-left"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-circle-arrow-left</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-circle-arrow-left" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-circle-arrow-up"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-circle-arrow-up</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-circle-arrow-up" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-cloud"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-cloud</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-cloud" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-cloud-download"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-cloud-download</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-cloud-download" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-cloud-upload"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-cloud-upload</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-cloud-upload" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-cog"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-cog</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-cog" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-collapse-down"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-collapse-down</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-collapse-down" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-collapse-up"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-collapse-up</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-collapse-up" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-comment"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-comment</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-comment" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-compressed"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-compressed</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-compressed" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-copyright-mark"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-copyright-mark</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-copyright-mark" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-credit-card"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-credit-card</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-credit-card" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-cutlery"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-cutlery</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-cutlery" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-dashboard"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-dashboard</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-dashboard" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-download"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-download</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-download" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-download-alt"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-download-alt</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-download-alt" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-earphone"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-earphone</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-earphone" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-edit"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-edit</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-edit" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-eject"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-eject</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-eject" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-envelope"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-envelope</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-envelope" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-euro"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-euro</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-euro" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-exclamation-sign"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-exclamation-sign</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-exclamation-sign" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-expand"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-expand</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-expand" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-export"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-export</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-export" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-eye-close"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-eye-close</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-eye-close" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-eye-open"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-eye-open</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-eye-open" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-facetime-video"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-facetime-video</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-facetime-video" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-fast-backward"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-fast-backward</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-fast-backward" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-fast-forward"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-fast-forward</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-fast-forward" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-file"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-file</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-file" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-film"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-film</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-film" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-filter"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-filter</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-filter" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-fire"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-fire</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-fire" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-flag"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-flag</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-flag" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-flash"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-flash</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-flash" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-floppy-disk"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-floppy-disk</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-floppy-disk" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-floppy-open"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-floppy-open</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-floppy-open" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-floppy-remove"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-floppy-remove</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-floppy-remove" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-floppy-save"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-floppy-save</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-floppy-save" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-floppy-saved"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-floppy-saved</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-floppy-saved" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-folder-close"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-folder-close</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-folder-close" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-folder-open"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-folder-open</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-folder-open" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-font"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-font</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-font" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-forward"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-forward</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-forward" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-fullscreen"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-fullscreen</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-fullscreen" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-gbp"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-gbp</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-gbp" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-gift"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-gift</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-gift" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-glass"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-glass</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-glass" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-globe"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-globe</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-globe" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-hand-down"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-hand-down</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-hand-down" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-hand-left"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-hand-left</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-hand-left" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-hand-right"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-hand-right</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-hand-right" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-hand-up"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-hand-up</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-hand-up" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-hd-video"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-hd-video</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-hd-video" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-hdd"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-hdd</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-hdd" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-header"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-header</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-header" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-headphones"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-headphones</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-headphones" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-heart"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-heart</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-heart" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-heart-empty"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-heart-empty</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-heart-empty" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-home"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-home</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-home" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-import"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-import</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-import" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-import"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-import</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-import" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-indent-left"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-indent-left</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-indent-left" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-indent-right"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-indent-right</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-indent-right" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-info-sign"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-info-sign</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-info-sign" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-italic"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-italic</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-italic" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-leaf"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-leaf</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-leaf" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-link"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-link</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-link" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-list"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-list</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-list" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-list-alt"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-list-alt</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-list-alt" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-lock"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-lock</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-lock" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-log-in"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-log-in</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-log-in" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-log-out"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-log-out</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-log-out" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-magnet"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-magnet</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-magnet" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-map-marker"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-map-marker</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-map-marker" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-minus"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-minus</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-minus" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-minus-sign"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-minus-sign</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-minus-sign" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-move"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-move</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-move" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-music"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-music</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-music" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-new-window"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-new-window</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-new-window" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-off"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-off</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-off" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-ok"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-ok</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-ok" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-ok-circle"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-ok-circle</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-ok-circle" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-ok-sign"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-ok-sign</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-ok-sign" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-open"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-open</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-open" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-paperclip"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-paperclip</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-paperclip" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-pause"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-pause</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-pause" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-pencil"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-pencil</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-pencil" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-phone"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-phone</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-phone" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-phone-alt"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-phone-alt</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-phone-alt" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-picture"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-picture</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-picture" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-plane"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-plane</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-plane" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-open"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-play</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-play" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-play-circle"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-play-circle</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-play-circle" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-plus"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-plus</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-plus" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-plus-sign"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-plus-sign</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-plus-sign" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-print"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-print</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-print" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-pushpin"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-pushpin</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-pushpin" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-qrcode"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-qrcode</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-qrcode" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-question-sign"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-question-sign</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-question-sign" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-random"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-random</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-random" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-record"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-record</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-record" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-refresh"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-refresh</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-refresh" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-registration-mark"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-registration-mark</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-registration-mark" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-remove"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-remove</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-remove" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-remove-circle"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-remove-circle</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-remove-circle" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-remove-sign"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-remove-sign</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-remove-sign" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-repeat"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-repeat</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-repeat" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-resize-full"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-resize-full</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-resize-full" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-resize-horizontal"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-resize-horizontal</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-resize-horizontal" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-resize-small"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-resize-small</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-resize-small" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-resize-vertical"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-resize-vertical</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-resize-vertical" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-retweet"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-retweet</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-retweet" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-road"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-road</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-road" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-save"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-save</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-save" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-saved"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-saved</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-saved" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-screenshot"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-screenshot</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-screenshot" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-sd-video"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-sd-video</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-sd-video" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-search"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-search</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-search" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-send"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-send</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-send" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-share"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-share</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-share" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-share-alt"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-share-alt</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-share-alt" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-shopping-cart"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-shopping-cart</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-shopping-cart" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-signal"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-signal</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-signal" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-sort"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-sort</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-sort" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-sort-by-alphabet"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-sort-by-alphabet</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-sort-by-alphabet" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-sort-by-alphabet-alt"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-sort-by-alphabet-alt</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-sort-by-alphabet-alt" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-sort-by-attributes"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-sort-by-attributes</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-sort-by-attributes" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-sort-by-attributes-alt</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-sort-by-attributes-alt" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-sort-by-order"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-sort-by-order</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-sort-by-order" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-sort-by-order-alt"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-sort-by-order-alt</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-sort-by-order-alt" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-sound-5-1"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-sound-5-1</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-sound-5-1" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-sound-6-1"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-sound-6-1</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-sound-6-1" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-sound-7-1"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-sound-7-1</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-sound-7-1" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-sound-dolby"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-sound-dolby</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-sound-dolby" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-sound-stereo"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-sound-stereo</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-sound-stereo" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-star"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-star</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-star" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-star-empty"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-star-empty</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-star-empty" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-stats"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-stats</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-stats" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-step-backward"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-step-backward</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-step-backward" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-step-forward"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-step-forward</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-step-forward" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-subtitles"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-subtitles</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-subtitles" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-stop"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-stop</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-stop" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-tag"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-tag</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-tag" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-tags"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-tags</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-tags" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-tasks"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-tasks</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-tasks" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-text-height"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-text-height</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-text-height" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-text-width"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-text-width</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-text-width" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-th"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-th</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-th" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-th-large"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-th-large</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-th-large" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-th-list"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-th-list</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-th-list" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-thumbs-down"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-thumbs-down</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-thumbs-down" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-thumbs-up"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-thumbs-up</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-thumbs-up" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-time"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-time</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-time" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-tint"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-tint</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-tint" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-tower"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-tower</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-tower" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-transfer"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-transfer</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-transfer" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-trash"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-trash</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-trash" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-tree-conifer"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-tree-conifer</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-tree-conifer" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-tree-deciduous"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-tree-deciduous</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-tree-deciduous" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-unchecked"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-unchecked</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-unchecked" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-upload"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-upload</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-upload" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-usd"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-usd</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-usd" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-user"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-user</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-user" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-volume-down"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-volume-down</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-volume-down" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-volume-off"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-volume-off</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-volume-off" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-volume-off"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-volume-up</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-volume-up" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-warning-sign"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-warning-sign</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-warning-sign" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-wrench"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-wrench</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-wrench" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-zoom-in"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-zoom-in</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-zoom-in" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="glyphicon-class text-center" style="width:100px; padding:10px;">
                                                                <span class="glyphicon glyphicon-zoom-out"></span>
                                                                <span class="center-block text-center glyphicon-text">glyphicon glyphicon-zoom-out</span>
                                                                <input type="radio" name="glyphicon" value="glyphicon glyphicon-zoom-out" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                                                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="sureglyphicon()">确认选择</button>
                                            </div>

                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                    <!-- /.modal-dialog -->
                                </div>
                                <!-- /.modal -->
                                <!-- /.modal -->
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>打开方式：</strong>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rdoOpenType" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True" Value="0">原窗口打开</asp:ListItem>
                                    <asp:ListItem Value="1">新窗口打开</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>支持移动：</strong>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="SupportMobile" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True" Value="1">支持</asp:ListItem>
                                    <asp:ListItem Value="0">不支持</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>块大小：</strong>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="MotroSize" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True" Value="3">大</asp:ListItem>
                                    <asp:ListItem Value="2">中</asp:ListItem>
                                    <asp:ListItem Value="1">小</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td class="text-center" colspan="2">
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="添加导航" runat="server" OnClick="EBtnSubmit_Click" />
                <input type="button" class="btn btn-primary" name="Button2" value="返回列表" onclick="location.href = 'SearchFunc.aspx'" id="Button2" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Common.js" type="text/javascript"></script>
    <script>
        function sureglyphicon()
        {
            var ico = $("input[type=radio][name=glyphicon]:checked");
            $("#TextBox1").val(ico.val());
        }
        $().ready(function () {
            $("input[type=radio][name=glyphicon]").each(function () {
                $(this).attr("data-dismiss", "modal");
            })
            $("input[type=radio][name=glyphicon]").change(function () {
                $("#TextBox1").val($(this).val());
            })
        })
    </script>
    <style>
        .glyphicon-text{font-size:12px;}
        .glyphicon-class .glyphicon{ font-size:24px;}
        #myModal .table td{ vertical-align:top;}
    </style>
</asp:Content>
