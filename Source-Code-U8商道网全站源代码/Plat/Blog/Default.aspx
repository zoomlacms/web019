<%@ page language="C#" autoeventwireup="true" inherits="Plat_Task_Default, App_Web_o3cst4gs" masterpagefile="~/Plat/Main.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
    <link type="text/css" rel="stylesheet" href="/Plugins/Uploadify/style.css" />
    <link type="text/css" rel="stylesheet" href="/JS/atwho/jquery.atwho.css" />
    <script type="text/javascript" src="/JS/CalendarTable.js"></script>
    <script type="text/javascript" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
    <title><%:Call.SiteName %>_信息分享</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li><a href="/">首页</a></li><li><a href="/Plat/Blog/">能力中心</a></li><li class="active">信息分享</li>
        </ol>
    </div>
    <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
    <div>
        <div>
                <ul id="child_nav_ul">
                    <li onclick="MsgTypeFunc('.tab1');"><a href="javascript:;" data-type=".tab1" class="active">写分享</a></li>
                    <li onclick="MsgTypeFunc('.tab2');"><a href="javascript:;" data-type=".tab2">发投票</a></li>
                    <li><a href="javascript:$('#article_div').show();">写文章</a></li>
                    <li><a href="javascript:ShowFileUP('分享文件');">分享文件</a></li>
                </ul>
                <div style="clear:both;"></div>
            </div>
            <table id="votetable" class="votetable tab2">
                   <tr><td style="width:100px;">创建标题：</td><td><asp:TextBox runat="server" ID="VoteTitle_T" class="form-control required" /></td></tr>
                   <tr><td>投票选项：</td><td>  <label class='vote_op_label'>1.</label><input type="text" name="VoteOption_T1" class='vote_op_input form-control required' /></td></tr>
                   <tr class='votetr'><td></td><td><label class='vote_op_label'>2.</label><input type='text' name='VoteOption_T' class='vote_op_input form-control required' /></td></tr>
                   <tr><td></td><td><input type="button" value="添加选项" class="btn btn-primary btn-sm" onclick="AddVoteOP();"/></td></tr>
                   <tr><td>截止时间：</td><td><asp:TextBox runat="server" ID="EndDate_T" onfocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm'});" class="form-control required date"></asp:TextBox></td></tr>
                   <tr><td>匿名投票：</td><td><input type="checkbox" runat="server" id="IsAnony"/></td></tr>
                   <tr><td>投票结果：</td><td><input type="radio" name="IsView" value="1" checked="checked" id="IsView1" /><label for="IsView1">投票人可见</label></td></tr>
                   <tr><td></td><td><input type="radio" name="IsView" value="2" id="IsView2" /><label for="IsView2">发起人可见</label></td></tr>
           </table>
            <asp:TextBox runat="server" ID="MsgContent_T" Style="height: 120px; width: 100%; max-width: 100%;border-radius:0px;" class="form-control" placeholder="今天说点什么?" TextMode="MultiLine"></asp:TextBox>
            <div id="msg_view_div">
                <span class="glyphicon glyphicon-chevron-left" title="向左移动" style="margin-left:5px;"></span>
                <span class="glyphicon glyphicon-chevron-right" style="float:right;line-height:100px;margin-right:5px;" title="向右移动"></span>
            </div>
            <div class="msg_opdiv">
             <%--   <a href="javascript:;"><span class="spanico">@</span><span>话题</span></a>--%>
                <a href="javascript:;"  onclick="ShowDiv('ImgFace_Div');"><span class="glyphicon glyphicon-heart spanico"></span><span>表情</span>
                    <div id="ImgFace_Div" style="position: absolute;left:-6px;z-index: 3; display: none; ">
                         <asp:HiddenField runat="server" ID="ImgFace_Hid" Value="[]" />
                         <iframe src="" style="width:800px;height:380px;border:none;overflow:hidden;" id="ImgFace_if"></iframe>
                    </div>
                </a>
                <a href="javascript:;" onclick="ShowFileUP('图片上传');"><span class="glyphicon glyphicon-picture spanico"></span><span>图片</span>
                </a>
                <a href="javascript:;" onclick="ShowFileUP('附件上传');">
                    <span class="glyphicon glyphicon-paperclip spanico"></span>
                    <span>附件</span></a>
                <span class="msg_opdiv_span">
                    <asp:LinkButton runat="server" ID="Share_Btn" OnClientClick="return DataChk();" OnClick="Share_Btn_Click" class="tab1" style="color:#0066cc;">分享</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="Vote_Btn" OnClientClick="return VoteCheck();" OnClick="Vote_Btn_Click"  class="tab2" style="display:none;color:#0066cc;">发布</asp:LinkButton><!--OnClick="Vote_Btn_Click"-->
                </span>
                <a href="javascript:;" style="float:right;border-left:1px solid #ddd;" onclick="ShowDiv('viewgroup');">
                    <span class="glyphicon glyphicon-eye-open spanico" style="margin-right:5px;"></span>
                    <span>所有人可见</span>
                    <table id="viewgroup"  style="position: absolute;right:50px; width: 115px; background-color:#f7f7f7; border: 1px solid #cfcfcf; z-index: 3; display: none;">
                            <tr><td>所有人</td></tr>
                            <tr><td>仅自己</td></tr>
                            <asp:Repeater runat="server" ID="GroupRpt" EnableViewState="false">
                                <ItemTemplate>
                                    <tr><td>
                                            <input type="checkbox" name="GroupIDS_Chk" value="<%#Eval("ID") %>" checked="checked" />
                                            <%#Eval("GroupName") %>
                                        </td></tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                </a>
                <div style="clear: both;"></div>
            </div>
    </div><!--信息分区 End-->
    <div>
            <ul class="content_nav_ul">
                <li onclick="location='<%:GetUrl("?") %>';"><a href="javascript:;">全部</a></li>
                <li onclick="location='<%:GetUrl("?msgtype=1&liop=1") %>';"><a href="javascript:;">通知</a></li>
                <li onclick="location='<%:GetUrl("?msgtype=2&liop=2") %>';"><a href="javascript:;">投票</a></li>
                <li onclick="location='<%:GetUrl("?msgtype=1&liop=3") %>';"><a href="javascript:;">文章</a></li>
                <li onclick="location='<%:GetUrl("?filter=colled&liop=4") %>';"><a href="javascript::">收藏</a></li>
            </ul>
            <div style="clear:both;"></div>
        </div>
    <div id="contentDiv">
        <span class="alert alert-alert" id="Empty_Span" style="padding:3px;display:none;" runat="server" visible="false">你当前不属于任何组,无法查看信息</span>
        <asp:Repeater runat="server" ID="MsgRepeater" OnItemDataBound="MsgRepeater_ItemDataBound" EnableViewState="false">
            <ItemTemplate>
                <div class="msgmain_div" id="msgmain_div_<%#Eval("ID") %>">
                    <div class="msg_left_div padding0 col-lg-1 col-md-1 col-sm-1 col-xs-1">
                        <img class="imgface_mid" src="/Images/userface/noface.gif" />
                    </div>
                    <div class="msg_content_div padding0 col-lg-11 col-md-11 col-sm-11 col-xs-11"><!--信息内容-->
                        <div>
                               <a href="javascript:;" onclick="ShowUser(<%#Eval("CreateUser") %>);" title="用户详情"><%#Eval("CreateUName") %></a>
                                <%#GetColled() %>
                               <div style="clear: both;"></div>
                            </div>
                        <div id="normal" runat="server" visible="false">
                            <div class="msg_content_article_div"><%#Eval("MsgContent") %></div>
                            <%#GetAttach() %>
                            <%#GetForward() %>
                        </div>
                        <div id="vote" runat="server" visible="false">
                                <div class="vote_user_div" id="vote_user_div" runat="server">
                                    <ul class="vote_list_ul">
                                        <%#GetVoteLI() %>
                                    </ul>
                                    <div>
                                        <input type="button" value="投票" onclick="PostUserVote(<%#Eval("ID") %>);" class="btn btn-primary btn-sm"/>
                                        <input type="button" value="查看结果" onclick="ShowMsgDiv('<%#Eval("ID") %>','.vote_user_div','.vote_result_div');" class="btn btn-primary btn-sm"/>
                                    </div>
                                </div>
                                <div class="vote_result_div" id="vote_result_div" runat="server" style="display:none;"><!--结果页-->
                                    <asp:Repeater runat="server" EnableViewState="false" ID="VoteResultRep">
                                        <ItemTemplate>
                                            <div><%#Eval("opName") %></div>
                                            <div class="progress" style="width: 260px; display: inline-block; margin-bottom: 0px;">
                                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuemin="0" aria-valuemax="100" <%#"style='width:"+Eval("Percent")+"%;'" %>></div>
                                            </div>
                                            <label style="height: 20px; line-height: 20px; position: relative; top: -4px;">
                                                <%#Eval("count")+"人" %>
                                            </label>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <div style="clear: both;"></div>
                                    <div id="msg_op_btn_div" runat="server">
                                        <input value="返回投票" class="btn btn-primary btn-sm" onclick="ShowMsgDiv(<%#Eval("ID")%>,'.vote_result_div','.vote_user_div');" />
                                    </div>
                                </div>
                                <div><strong><%#GetVoteBottom() %></strong></div>
                            <div style="margin-bottom: 5px;"><%#Eval("MsgContent") %></div>
                    </div>
                        <div class="reply_op_div">
                            <%#GetReplyOP() %>
                             <span class="glyphicon glyphicon-comment" title="回复" onclick="$(this).parent().siblings('.reply').show();"></span>
                        </div>
                        <div class="msg_content_likeids_div">
                            <ul class="msg_content_likeids_div_ul">
                                <li>
                                    <a href="javascript::" class="msg_content_likeids_div_a" title="已点赞"><span class="glyphicon glyphicon-thumbs-up"></span></a>
                                </li>
                                <%#GetUserFace() %>
                            </ul>
                        </div>
                        <div class="reply" style="display:none;margin-bottom:5px;margin-top:5px;">
                            <input type="text" id="MsgContent_<%#Eval("ID") %>" class="form-control" style="margin-bottom:5px;max-width:100%;width:100%;"/>
                            <span class="glyphicon glyphicon-th-large"></span><span>表情</span>
                            <span>@</span><span>同事</span>
                            <input type="button" value="回复" onclick="AddReply(<%#Eval("ID") %>);" style="float:right;margin-right:5px;" class="btn btn-primary btn-sm"/>
                            <div style="clear:both;"></div>
                        </div>
                        <div id='reply_<%#Eval("ID") %>'>
                           <asp:Literal runat="server" ID="ReplyList_L" EnableViewState="false"></asp:Literal>
                        </div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <br />
            </ItemTemplate>
        </asp:Repeater>
        <asp:Literal runat="server" ID="MsgPage" EnableViewState="false"></asp:Literal>
    </div>
    <div>
        <asp:Literal runat="server" ID="MsgPage_L" EnableViewState="false"></asp:Literal>
    </div>
     <!--模态框-->
        <div style="display: none;" class="hidden_div">
            <a href="javascript:;" data-toggle="modal" data-target="#myModal" id="Model_Btn"></a>
            <a href="javascript:;" data-toggle="modal" data-target="#fileup_div" id="FileUP_Btn"></a>
            <a href="javascript:;" data-toggle="modal" data-target="#forward_div" id="Forward_Btn"></a>
            <asp:HiddenField runat="server" ID="UserInfo_Hid" />
        </div>
        <div class="modal fade" id="myModal">
        <div class="modal-dialog" style="width:1150px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <span class="modal-title">文件预览</span>
                    <a href="#" id="preview_down_a" title="下载该文档">下载</a>
                    <a href="#" title="全屏浏览">全屏</a>
                </div>
                <div class="modal-body">
                    <iframe id="preview_if"  style="border:none;width:100%;height:700px;overflow-y:hidden;"></iframe>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
        <div class="modal" id="fileup_div" style="position:fixed;top:35%;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <span class="modal-title" id="FileUP_Title"></span>
                    </div>
                    <div class="modal-body" style="height: 150px;">
                        <input type="file" id="file_upload_1" />
                        <input type="hidden" id="Attach_Hid" name="Attach_Hid" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="forward_div" style="position: fixed; top: 35%;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <span class="modal-title">内容转发</span></div>
                    <div class="modal-body">
                     <div id="forward_his_div">
                    </div>
                        <div id="forward_my_div" style="margin-top:5px;">
                            <asp:HiddenField runat="server" ID="Forward_ID_Hid"/>
                            <asp:TextBox runat="server" ID="ForMsg_Text" TextMode="MultiLine" style="width:100%;height:100px;border-radius:4px;border:1px solid #ddd;padding-top:5px;padding-left:8px;" placeholder="说说转发理由吧!!"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <asp:Button runat="server" ID="Froward_Btn" OnClick="Froward_Btn_Click" Text="转发" class="btn btn-primary"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="article_div" style="position:fixed;top:10%;z-index:5;">
            <div class="modal-dialog" style="width:1024px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" onclick="$('#article_div').hide();"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <span class="modal-title"><strong>撰写文章</strong></span>
                    </div>
                    <div class="modal-body" style="height:610px;overflow-y:scroll;">
                        <asp:TextBox runat="server" ID="Article_T" TextMode="MultiLine" Height="450px"></asp:TextBox>
                    </div>
                    <div class="modal-footer" style="text-align:center;">
                        <asp:Button runat="server" ID="ArtSave_Btn" Text="保存" OnClick="ArtSave_Btn_Click" CssClass="btn btn-primary"/>
                        <button type="button" class="btn btn-default" onclick="$('#article_div').hide();">关闭</button>
                    </div>
                </div>
            </div>
        </div>
   </div>
    <!--右边栏-->
    <div class="col-lg-3 col-md-3 hidden-sm hidden-xs">
        <div class="right_nav_divide">日期</div>
            <div style="display: none;">
                <span id="times"></span>
            </div>
            <div style="width:310px;">
                <table class="table table-striped table-bordered" id="caltable" style="margin-bottom: 0px;">
                    <thead>
                        <tr style="vertical-align: middle; text-align: center;">
                            <td colspan="7" style="line-height: 34px;">
                                <a href="javaScript:subMonth();" title="上一月" class="DayButton"><%=lang.Get("m_Worktables_last")%></a>
                                <input name="year" id="year" class="form-control" type="text" style="text-align: center; width: 65px; display: inline;" size="4" maxlength="4" onkeydown="if (event.keyCode==13){setDate()}" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onpaste="this.value=this.value.replace(/[^0-9]/g,'')" />
                                <%=lang.Get("m_Worktables_year")%>
                                <input name="month" id="month" type="text" class="form-control" style="text-align: center; width: 45px; display: inline;" size="1" maxlength="2" onkeydown="if (event.keyCode==13){setDate()}" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onpaste="this.value=this.value.replace(/[^0-9]/g,'')" />
                                <%=lang.Get("m_Worktables_month")%> <a href="JavaScript:addMonth();" title="下一月" class="DayButton"><%=lang.Get("m_Worktables_next")%></a></td>
                        </tr>
                        <tr style="vertical-align: middle; text-align: center;">
                            <script>
                                document.write("<td class=\"DaySunTitle\" id=\"diary\" name=\"diary\" >" + days[0] + "</td>");
                                for (var intLoop = 1; intLoop < days.length - 1; intLoop++) {
                                    document.write("<td class=\"DayTitle\" id=\"diary\" name=\"diary\">" + days[intLoop] + "</td>");
                                }
                                document.write("<td class=\"DaySatTitle\" id=\"diary\" name=\"diary\" >" + days[intLoop] + "</td>");
                            </script>
                        </tr>
                    </thead>
                    <tbody id="calendar" class="text-center">
                        <script type="text/javascript">
                            for (var intWeeks = 0; intWeeks < 6; intWeeks++) {
                                document.write("<TR style=\"cursor: hand\">");
                                for (var intDays = 0; intDays < days.length; intDays++) document.write("<td class=\"CalendarTD\" onMouseover=\"buttonOver();\" onMouseOut=\"buttonOut();\"></td>");
                                document.write("</TR>");
                            }
                        </script>
                    </tbody>
                </table>
                <script type="text/javascript">
                    Calendar();
                </script>
            </div>
        <div class="right_nav_divide"><span>最新投票</span><span style="float:right;margin-right:10px;font-size:12px;"><a href="javascript:location='?msgtype=2&liop=2';">查看更多></a></span></div>
            <div>
                <ul id="newvote_ul">
                    <asp:Repeater runat="server" ID="newvote_Rep" EnableViewState="false">
                        <ItemTemplate>
                            <li><div>
                                    <img src="/Images/userface/noface.gif" class="imgface_mini" title="admin" />
                                    <span style="margin-left: 20px;"><a href="#"><%#Eval("Title") %></a></span></div>
                                <div><span style="float: right;"><%#Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy年MM月dd日") %></span></div>
                                <div style="clear: both;"></div></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        <div class="right_nav_divide"><span>最近日程</span><span style="float:right;margin-right:10px;font-size:12px;"><a href="DailyPlan.aspx">查看更多></a></span></div>
        <div><ul id="newdaily_ul">
                    <asp:Repeater runat="server" ID="newdaily_Rep" EnableViewState="false">
                        <ItemTemplate>
                            <li><div><span><a href="#">名称：<%#Eval("Name") %></a></span></div>
                                <div><span><a href="#">地点：<%#Eval("Place") %></a></span></div>
                                <div style="text-align:right;">
                                    <span><%#Convert.ToDateTime(Eval("StartDate")).ToString("MM月dd日")+"---" %></span>
                                    <span><%#Convert.ToDateTime(Eval("EndDate")).ToString("MM月dd日") %></span>
                                </div></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul></div>
    </div>
    <div class="right_InfoDiv" id="ShowUser_Div">
            <iframe style="width:100%;border:0px;height:1000px;" id="ShowUser_if"></iframe>
        </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style type="text/css">
        .msgmain_div {border-bottom:1px solid #ddd;min-height:80px;padding-bottom:10px;}
        .uploadify {float:left;}
        .msg_content_attach {display:inline-block;cursor:pointer;margin-top:2px;margin-bottom:2px;}
        .colled{color:red;cursor:pointer;font-size:1.5em;float:right;margin-right:10px;}
        .nocolled{color:#7fB2E5;cursor:pointer;font-size:1.5em;float:right;margin-right:10px;}
        #child_nav_ul{padding-left:0px;}
        #child_nav_ul li{float:left;padding:10px 0 10px 0;padding-right:20px;font-size:18px;margin:0 2px 0 2px;}
        #child_nav_ul li a{text-decoration:none;color:black;}
        #child_nav_ul li a:hover{color:#0066cc;}
        #child_nav_ul li .active{color:#0066cc;}
        /*内容列表导航*/
        .content_nav_ul{border-bottom:1px solid #ddd;padding-left:0px;padding-top:20px;padding-bottom:10px;}
        .content_nav_ul li{display:inline; padding:20px 20px 10px 20px; margin:0 2px 0 2px;font-size:16px;text-align:center;cursor:pointer;}
        .content_nav_ul li:hover{border-bottom:3px solid #0066cc;}
        .content_nav_ul .active{border-bottom:3px solid #0066cc;}
        .content_nav_ul li a{color:black;text-decoration:none;}
        .content_nav_ul li a:hover{color:#08C;}
        #msg_view_div{border:1px solid #dadada;height:110px;line-height:100px;border-top:none;display:none;padding-top:5px;}
        .purview_img{width:100px;height:100px;overflow:hidden;cursor:pointer;padding:0 0 5px 5px;border:1px solid #fff;}
        .purview_img:hover{border:1px solid #1796BF;}
        .msg_opdiv{border:1px solid #dadada;border-right:none; height:43px;background-color:#fafafa;position:relative;top:-2px;}
        .msg_opdiv a{height:43px;line-height:43px;text-align:center;color:#9a9a9a;padding:0 10px 0 10px;text-decoration:none;border-right:1px solid #ddd;display:inline-block;margin:0 0 0 0;float:left;}
        .msg_opdiv a:hover{background-color:#ebebeb;}
        .msg_opdiv .spanico{margin-right:8px;}
        #viewgroup tr{border:1px solid #ddd;border-top:none;}
        #viewgroup tr:hover{background-color:#ebebeb;}
        .right_nav_divide{border-bottom:1px solid #ddd;margin-bottom:10px;padding-bottom:10px;padding-top:20px;font-size:16px; width:310px;}
        .reply_op_div{text-align:right;}
        .reply_op_div span{font-size:1.3em;margin:5px;cursor:pointer;}
        .reply_op_div span:hover{color:#1796BF;}
        /*.icon-arrow{background:url(/Plat/images/icon-arrow.jpg) no-repeat; width:16px;height:15px;display:inline-block;position:relative;left:20px;bottom:-10px;background-color:white;}*/
        /*投票*/
       .votetable{border:1px solid #ddd;border-bottom:none;width:100%;}
       .votetable tr td{padding:5px 5px 5px 10px;text-align:left;height:25px;line-height:25px;}
       .votetable .glyphicon{padding-left:3px;}
       .votetable .glyphicon:hover{color:#0066cc;}
       .votetable a{text-decoration:none;}
       .vote_op_label{position:absolute;padding-left:6px;padding-top:5px;}
       .vote_op_input{padding-left:20px;}
       .msg_opdiv_span{float:right;}
       .vote_list_ul li{cursor:pointer;}
       .tab2{display:none;}
        /*转发与点赞*/
       .msg_content_forward_div{border:1px solid #ddd;background-color:#f7f7f7;padding:5px;}
       .msg_haslike_span{color:#0066cc;}
       .msg_content_likeids_div img{width:25px;height:25px;border-radius:50%;}
       .msg_content_likeids_div_a{border-radius:50%;background-color:#0088cc;color:white;height:28px;width:28px;text-align:center;display:inline-block;padding-top:4px;}
       .msg_content_likeids_div_ul {list-style-type:none;}
       .msg_content_likeids_div_ul li{display:inline-block;height:30px;width:30px;}
       /*最近投票,文章*/
       #newvote_ul li{padding:3px 0 0 0;border-bottom:1px dashed #ddd; width:310px;}
       #newdaily_ul li{padding:3px 0 0 0;border-bottom:1px dashed #ddd;}
       .imgface_mini{width: 30px; height: 30px; border-radius: 50%;}
       .imgface_mid{width:50px;height:50px;border-radius:50%;}
    </style>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/atwho/jquery.atwho.js"></script>
    <script type="text/javascript" src="/Plugins/Uploadify/jquery.uploadify.js"></script>
    <%=Call.GetUEditor("Article_T",2) %>
    <script type="text/javascript">
        $().ready(function(){//初始化位置的CSS，在此定义指定
            var liop="<%:Request.QueryString["liop"]%>";
            if(!liop||liop=="")
            {
                $(".content_nav_ul li")[0].className="active";
            }
            else
            {
                $(".content_nav_ul li")[liop].className="active";
            }
            PostToCS2("/Plat/Common/Common.ashx","Plat_CompUser","",function(data){InitAt(data);});
            //$("#MsgContent_T").bind("matched.atwho",function(){console.log("123123");});
        });
        function InitAt(json)
        {
            json=eval(json);
            $("#MsgContent_T").atwho({
                tpl: "<li data-value='${atwho-at}${name}${suffix}'>${imageUrl}&nbsp;${name}</li>",
                at: "@",
                search_key: "name",
                title: "请选择要@的同事名称",
                data:json,
                limit: 8,
                max_len: 20,
                start_with_space: false,
                //data:jsonArr,
                callbacks: {
                    remote_filter:function(query,callback)//@之后的语句
                    {
                        //callback(json);
                    }
                }//callback
            });
        }
        //------------
        //1,如何插入值
        //var jsonArr=[{id:"855096428423",imageUrl:"<img src='/Images/userface/noface.gif' width='25' style='width:25px;height:25px;'>",name:"wtwt",suffix:"[uid:855096428423]",type:"user"},
        //    {id:"855096428423",imageUrl:"<img src='/Images/userface/noface.gif' width='25' style='width:25px;height:25px;'>",name:"asdf",suffix:"[uid:855096428423]",type:"user"}//
        //];
        //------------
        function GetMsgMainID(id)
        {
            return "msgmain_div_"+id;
        }
        function DataChk() {
            var val = $("#MsgContent_T").val().replace(" ", "");
            if (val == "") {
                TextAlert("MsgContent_T", 3);
                return false;
            }
        }
        //背景色警告
        function TextAlert(id, time) {
            if (!time || time < 1) time = 3;
            for (var i = 0, span = 200; i < time; i++) {
                setTimeout(function () { $("#" + id).css("background-color", "#f9f2f4") }, span);
                span += 200;
                setTimeout(function () { $("#" + id).css("background-color", "white") }, span);
                span += 200;
            }
        }
        function ShowDiv(id) {
            if ($("#" + id).is(":visible"))
                $("#" + id).hide();
            else
            {
                switch(id)
                {
                    case "ImgFace_Div":
                        if($("#ImgFace_if").attr("src")==""){
                            $("#ImgFace_if").attr("src","/Plugins/Ueditor/dialogs/emotion/ImgFace.html");
                        }
                        break;
                }
                $("#" + id).show();
            }
        }
        function DisReply() {
            $(event.srcElement).parent().parent().parent().find(".reply").show();
        }
        function DisReplyOP() {
            $(event.srcElement).parent().siblings(".replyOP").show();
        }
        //-------
        $(function () {
            var img="<img src='{0}' class='purview_img'/>";
            $("#file_upload_1").uploadify({
                //按钮宽高
                width: 120,
                height: 35,
                auto: true,
                swf: '/Plugins/Uploadify/uploadify.swf',
                uploader: '/Plugins/Uploadify/UploadFileHandler.ashx',
                buttonText: "上传附件",
                buttonCursor: 'hand',
                fileTypeExts: "*.*",
                fileTypeDesc: "请选择文件",
                fileSizeLimit: "50000KB",
                formData: { "action": "Blog"},
                queueSizeLimit: 1,
                removeTimeout: 2,
                multi: false,
                onUploadStart: function (file) { },
                onUploadSuccess: function (file, data, response) {//暂只允许上传一个文件,后期根据业务需要看是否更改, //json,result,tru||false
                    $("#msg_view_div").show();
                    $("#msg_view_div").append(img.replace("{0}",data));
                    $("#Attach_Hid").val(file.name);
                },
                onQueueComplete: function (queueData){},
                onUploadError: function (file) { alert(file.name + "上传失败"); }
            });
        });
        function PreView(vpath)
        {
            $("#Model_Btn").click();
            if (vpath != $("#preview_down_a").attr("href"))//如果预览的文件变更，则重新加载
            {
                $("#preview_down_a").attr("href", vpath);
                $("#preview_if").attr("src", "/PreView.aspx?vpath=" + escape(vpath));
            }
        }
        function ShowFileUP(t)
        {
            $("#FileUP_Title").text(t);
            $("#FileUP_Btn").click();
        }
        function LoadReply(pid,pageSize,pageIndex)
        {
            $("#reply_" + pid).load("ReplyList.aspx?pid=" + pid + "&PageSize=" + pageSize + "&PageIndex=" + pageIndex + " start");
        }
        var pageSize =<%=replyPageSize%>
        function ClearChk(name){
            $("input[name='GroupIDS_Chk']").each(function () { this.checked = false; });
        }
        //--------------投票相关JS
        function MsgTypeFunc(css)
        {
            var s=".tab1,.tab2";
            $(s).hide();
            $(css).show();
            $("#child_nav_ul a").each(function(){
                if($(this).attr("data-type")==css)
                {
                    $(this).addClass("active");
                }
                else{$(this).removeClass("active");}
            });
        }
        function AddVoteOP()
        {
            var index = parseInt($(".vote_op_label").last().text().replace(".", ""))+1;
            var tr = "<tr class='votetr'><td></td><td><label class='vote_op_label'>" + index + ".</label><input type='text' name='VoteOption_T' class='vote_op_input form-control' /><span class='glyphicon glyphicon-remove' onclick='RemoveVoteOP();'></span></td></tr>";
            $(".votetr").last().after(tr);
        }
        function RemoveVoteOP()
        {
            $(".votetr").last().remove();
        }
        function VoteCheck()
        {
            var validator = $("#form1").validate({meta: "validate"}); 
            return validator.form();
        }
        //this,与控件参数
        function ShowMsgDiv(id,args1,arsg2)
        {
            var parent=$("#"+GetMsgMainID(id));
            $(parent).find(args1).hide();
            $(parent).find(arsg2).show();
        }
        //转发
        function ShowForWard(id)
        {
            $("#Forward_ID_Hid").val(id);
            var text=" 转发内容：<br />"+$("#"+GetMsgMainID(id)).find(".msg_content_article_div").text();
            $("#forward_his_div").html(text);
            $("#Forward_Btn").click();
        }
        //表情
        function InsertSmiley(json)
        {
            var arr=JSON.parse($("#ImgFace_Hid").val()); arr.push(json);
            $("#ImgFace_Div").hide();
            $("#ImgFace_Hid").val(JSON.stringify(arr));
            $("#MsgContent_T").val($("#MsgContent_T").val()+json.title);
        }
        //显示用户详情
        function ShowUser(uid)
        {
            $("#ShowUser_Div").show();
            $("#ShowUser_if").attr("src","/Plat/Common/UserDetail.aspx?ID="+uid);
        }
        //----------------AJAX区
        function PostDelMsg(msgid)
        {
            if(confirm("确定要删除该条信息吗!!"))
            {
                $("#"+GetMsgMainID(msgid)).remove();
                PostToCS("DeleteMsg",msgid,null);
            }
        }
        //增加自己的头像链接,移除自己的头像链接
        function PostLike(id)//点赞
        {
            var $obj=$(event.srcElement);
            var html="<li title='{0}'><a href='javascript:;'><img src='{1}' /></a></li>";
            var a="";
            var mainid=GetMsgMainID(id);
            var uname=$("#UserInfo_Hid").val().split(':')[0];
            if($obj.hasClass("msg_haslike_span"))
            {
                a="RemoveLike";
                $obj.removeClass("msg_haslike_span");
                $("#"+mainid).find(".msg_content_likeids_div_ul").find("li[title='"+uname+"']").remove();
            }
            else
            {
                a="AddLike";
                $obj.addClass("msg_haslike_span");
                var uface=$("#UserInfo_Hid").val().split(':')[1];
                html=html.replace("{0}",uname).replace("{1}",uface);
                $("#"+mainid).find(".msg_content_likeids_div_ul").append(html);
            }
            PostToCS(a,id,function(){});     
        }
        function PostUserVote(id) {
            var name="vote_"+id;
            console.log();
            var v = $("input:radio[name='" + name + "']:checked").val();//opid
            if (v) {
                v=id+":"+v;
                PostToCS("UserVote", v, function (data) {location=location; });
            }
            else{console.log('选项不存在');}
        }
        function CollFunc(obj,id)//收藏,取消收藏
        {
            if ($(obj).hasClass("colled"))//如已收藏,取消收藏
            {
                $(obj).removeClass("colled").addClass("nocolled");
                PostToCS("CancelColl", id, function () { });
            }
            else//加入收藏
            {
                $(obj).removeClass("nocolled").addClass("colled");
                PostToCS("AddColl", id, function () { });
            }
        }
        function AddReply(id) {//回复主信息
            var msg = $("#MsgContent_" + id).val();
            if (msg == "") { alert('信息不能为空!!'); return; }
            var value = id + ":" + msg;
            PostToCS("AddReply", value, function () { LoadReply(id, pageSize, 1); });
        }
        function AddMessage(id) {//对回复者回复
            var msg = $("#MsgContent_" + id).val();
            var pid = $("#MsgInfo_" + id + "_Hid").val().split(':')[0];
            if (msg == "") { alert('信息不能为空!!'); return; }
            var value = pid + ":" + id + ":" + msg;
            PostToCS("AddReply2", value, function () { LoadReply(pid, pageSize, 1); });
        }
        function PostToCS(a, v, CallBack) {
            PostToCS2("/Plat/Blog/Default.aspx",a,v,CallBack);
        }//Post To CS end;
        function PostToCS2(u,a,v,CallBack)
        {
            $.ajax({
                type: "Post",
                url:u,
                data: { action: a, value: v },
                success: function (data) {
                    CallBack(data);
                },
                error: function (data) {
                }
            });
        }
    </script>
</asp:Content>