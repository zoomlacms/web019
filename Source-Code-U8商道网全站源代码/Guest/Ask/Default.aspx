<%@ page language="C#" autoeventwireup="true" inherits="Guestbook_Ask, App_Web_xwzmyvqh" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>问答中心首页</title> 
<link href="../../App_Themes/Guest/ask.css" rel="stylesheet" type="text/css" />
<script src="../../Plugins/Ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="../../JS/jquery.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8" src="../../Plugins/kindeditor/kindeditor.js"></script>    
<script type="text/javascript">
    g_site_url = 'http://help.Zoomla.cn/'; g_prefix = ''; g_suffix = '.html'; editor_options = { toolbars: [['FullScreen', 'Source', 'Undo', 'Redo', 'Bold', 'HighlightCode', 'InsertTable', 'InsertImage', 'attachment', 'InsertVideo', 'Map', 'Emotion']], wordCount: false, elementPathEnabled: false }; messcode = '1';</script>
    <script type="text/javascript">
        function supplyment() {
            var div = document.getElementById("divSupplyment");
            if (div.style.display == "none") {
                div.style.display = "block";
            }
            else {
                div.style.display = "none";
            }
        }
       /* function show() {
            var div = document.getElementById("show");
            if (div.style.display == "none") {
                div.style.display = "block";
            }
           // else {div.style.display = "none";}
        
        }*/
        function CheckDirty() {
            var oEditor = CKEDITOR.instances.TxtTContent;
            var value = oEditor.getData();
            var TxtTTitle = document.getElementById("TxtTTitle").value;
            var TxtValidateCode = document.getElementById("TxtValidateCode").value;

            if (value == "" || TxtTTitle == "" || TxtValidateCode == "") {
                if (value == "") {
                    var obj = document.getElementById("RequiredFieldValidator1");
                    obj.innerHTML = "<font color='red'>内容不能为空！</font>";
                }
                else {
                    var obj = document.getElementById("RequiredFieldValidator1");
                    obj.innerHTML = "";
                }
                if (TxtTTitle == "") {
                    var obj2 = document.getElementById("RequiredFieldValidator2");
                    obj2.innerHTML = "<font color='red'>留言标题不能为空！</font>";
                }
                else {
                    var obj2 = document.getElementById("RequiredFieldValidator2");
                    obj2.innerHTML = "";
                }
                if (TxtValidateCode == "") {
                    var obj3 = document.getElementById("sp1");
                    obj3.innerHTML = "<font color='red'>验证码不能为空！</font>";
                } else {
                    var obj3 = document.getElementById("sp1");
                    obj3.innerHTML = "";
                }
                return false;
            }
            else {
                var obj = document.getElementById("RequiredFieldValidator1");
                obj.innerHTML = "";
                var obj2 = document.getElementById("RequiredFieldValidator2");
                obj2.innerHTML = "";
                var obj3 = document.getElementById("sp1");
                obj3.innerHTML = "";
                document.getElementById("EBtnSubmit2").click();
            }
        }
    </script>
</head>
<body>
<div id="Tab"><ul><li><a href="../Default.aspx">留言</a></li><li><a href="../Baike/Default.aspx" >百科</a></li><li  class="hover"><a href="Ask/Default.aspx">问答</a></li> </ul><div class="clear"></div></div>
<form id="form2" runat="server">
 <div class="topnav" id="toptab"> 
<div class="topright"> 
<a href="/">返回首页</a>
<a href="javascript:void(0)" onclick="SetHomepage()">设为首页</a>
<a href="javascript:void(0)" onclick="addfavorite()">收藏本站</a></div> 
<span  style="<%=getstyle()%>"> 您好！<a href="/user/" target="_blank"><asp:Label runat="server"  ID="user"></asp:Label></a> 欢迎来<%Call.Label("{$SiteName/}"); %>问答系统！ [<a href="<%=ResolveUrl("~/User/logout.aspx") %>?url=/Guest/Default.aspx">退出登录</a>]</span> 
<span  style="<%=getstyles()%>">[<a  href="/user/Login.aspx?ReturnUrl=/guest/">请登录</a>] [<a  href="/user/register.aspx?ReturnUrl=/guest/">免费注册</a>]</span>
</div>
    <div class="header">
        <div class="h_top">
            <div class="logo">
                <a href="/guest/Ask/Default.aspx" title="问答系统" target="_top">
                <img src="<%Call.Label("{$LogoUrl/}"); %>" alt="<%Call.Label("{$SiteName/}"); %>问答系统" />
                </a>
            </div> 
        </div>
            <div class="clear"></div>
        <div class="h_mid">
            <div class="h_mid_l"></div>
            <div id="tdh" class="h_mid_m">
                <span style="<%=getstyle()%>"><a href="MyAskList.aspx?QueType=">我的提问</a> <a href="MyAnswerlist.aspx">我的回答</a> </span>
                <ul>
                    <li class="on"><a title="问答首页" href="Default.aspx">问答首页</a> </li>
                    <!-- <li><a title="知识专题" href="Topic.aspx">知识专题</a></li>-->
                    <li><a title="问答之星" href="Star.aspx">问答之星</a></li>
                    <li><a title="分类大全" href="Classification.aspx">分类大全</a></li>
                </ul>
            </div>
            <div class="h_mid_r"></div>
        </div>
        <div class="clr"></div>
        <div class="h_b">
            <div class="h_b_l"></div>
            <div class="h_b_m">
                <div class="question_count">
                    <span class="count">最佳回答采纳率:</span><span class="adopt" ><%=getAdoption() %></span><br />
                    <span class="count">已解决问题数:</span><span class="countques" ><% =getSolvedCount() %></span><br />
                    <span class="count">待解决问题数:</span><span class="countques" ><% =getSolvingCount() %></span>
                </div>
                <div class="h_b_input">
                    <asp:TextBox runat="server" ID="txtAsk" onmouseover="this.focus()" autocomplete="off"
                    class="searchinput" Style="vertical-align: middle;" MaxLength="100" TabIndex="1"
                    value="" Width="243px"></asp:TextBox>
                    <asp:Button runat="server" ID="btnSearch" AccessKey=" " class="sub" Text=" " OnClick="btnSearch_Click"
                    />
                    <asp:Button runat="server" ID="btnAsk" class="but" Text=" " OnClick="btnAsk_Click"
                    />
                    <asp:Button runat="server" ID="btnAnswer" class="answer" Text="" OnClick="btnAnswer_Click"
                    />
                </div>
                <div class="sybz">
                    <a href="http://help.Zoomla.cn/?index/help.html" title="帮助" target="_blank">使用<br />帮助</a>
                </div>
                <div class="tongji">
                    <div id="move">
                        <span class="count">当前在线:</span><%=getLogined() %><br />
                        <span class="count">注册用户:</span><%=getUserCount() %><br />
                    </div>
                </div>
                <div class="clr"></div>
            </div>
            <div class="h_b_r"></div>
        </div>
        <div class="clr"></div>
</div>

<!--加载广告--><div class="content">
<!--左边分类开始-->
<div class="left">
    <!--问题分类开始-->
    <div class="wtfl">
        <div class="wtfl_t"></div>
        <div class="wtfl_m">
            <div class="wtfl_m_t">
                <div class="wt_l">&nbsp;问题分类
                </div>
                <div class="clr"></div>
                <div id="rmc"></div>
            </div>
            <div id="siderbar">
                <div id="secNav">
                    <ul id="secNavList">
                        <asp:Repeater ID="Repeater1" runat="server"  OnItemDataBound="Repeater1_ItemDataBound">
                            <ItemTemplate>
                                <li>
                                    <div class="iconBg"><a href="Classification.aspx?GradeID=<%#Eval("GradeID") %>" title="<%#Eval("GradeName") %>"><%#Eval("GradeName") %></a></div>
                                    <div class="listcon">
                                       <ul>
                                        <asp:Repeater ID="Repeater2" runat="server">
                                            <ItemTemplate>
                                            <li class="listconList"><a href="Classification.aspx?ParentID=<%#Eval("ParentID") %>&GradeID=<%#Eval("GradeID") %>" title="<%#Eval("GradeName") %>"><%#Eval("GradeName") %></a></li>
                                            </ItemTemplate>
                                        </asp:Repeater> <div class="clear"></div>
                                        </ul><div class="clear"></div> 
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater> 
                        <div class="clear"></div>
                    </ul>
                </div>
                <div class="more"><a target="_top" title="查看更多分类" href="Classification.aspx">查看更多分类&gt;&gt;</a></div>
            </div>          
        </div>
        <div class="wtfl_b"></div>
    </div>
    <!--问题分类结束-->
    <div class="topscore">
        <div class="l_b_t"></div>
        <div class="l_b_m">
            <div class="l_b_m_t">
                <div class="mc"><div class="ivote"></div>积分排行榜</div>
                <div class="phb">
                    <ul>
                        <li id="weektab" class="on" onmouseover="showtop('week')">本周排行</li>
                        <li id="alltab" class="" onmouseover="showtop('all')">总排行</li>
                    </ul>
                    <div class="clr"></div>
                </div>
            </div>
            <div class="clr"></div>
            <div class="l_b_m_m">
                <div id="weektop" class="yshy" style="display: block;">
                    <ul> 
                        <asp:Repeater ID="Repeater10" runat="server"  OnItemDataBound="Repeater10_ItemDataBound">
                            <ItemTemplate>
                                <li>
                                <span class="hyname"><img align="absmiddle" src="/App_Themes/Guest/images/num1.gif" id="ph" runat="server"> <a target="_blank" href="/ShowList.aspx?id=<%#Eval("UserID") %>"><%#Eval("UserName") %></a></span>
                                &nbsp;<img align="absmiddle" src="/App_Themes/Guest/images/up.gif">
                                <%#Eval("GuestScore") %>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
                <div id="alltop" class="yshy" style="display:none;">
                    <ul>
                        <asp:Repeater ID="Repeater9" runat="server" OnItemDataBound="Repeater9_ItemDataBound">
                            <ItemTemplate>
                                <li>
                                <span class="hyname"><img align="absmiddle" src="/App_Themes/Guest/images/num1.gif" id="ph" runat="server"> <a target="_blank" href="/ShowList.aspx?id=<%#Eval("UserID") %>"><%#Eval("UserName") %></a></span>
                                &nbsp;<img align="absmiddle" src="/App_Themes/Guest/images/up.gif">
                                <%#Eval("GuestScore") %>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div class="clear"></div>
                    </ul>
                </div>
                <div class="listcon"></div>
             <%--    <div class="more"><a target="_top" title="查看更多排行榜" href="http://help.Zoomla.cn/us-1.html">查看更多排行榜&gt;&gt;</a></div>--%>
            </div>
        </div>
        <div class="l_b_b"></div>
    </div>
    <!--知道小贴士开始-->
    <div class="cjjb">
        <div class="l_b_t"></div>
        <div class="l_b_m">
            <div class="l_b_m_t1">
                <div class="mc"><div class="irelate"></div>知道小贴士</div>
            </div>
            <div class="clr"></div>
            <div class="l_b_m_m">
                <div class="xts">
                    <ul>
                        <li><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a></li>
                        <li><a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a></li>
                        <li><a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a></li>
                        <li><a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></li>
                    </ul>
                </div>
                <div class="tsyjy"> 如要投诉或提出意见，请点击<br><a title="投诉与建议" href="/guest/" target="_blank"> 建议反馈 </a></div>
            </div>
        </div>
        <div class="l_b_b"></div>
    </div>
    <!--知道小贴士结束-->
</div>
 
<div class="b_right">
    <div class="middle"> 
        <div class="m_wt">
            <div class="m_wtt">
                <ul>
                    <li class="a1"></li>
                    <li class="a2">
                        <div class="a2t">精彩推荐的问题</div>
                        <div class="more"><a target="_top" title="更多问题" href="MoreProblems.aspx?type=0">更多问题</a> </div>
                    </li>
                    <li class="a3"></li>
                </ul>
                <div class="clr"></div>
            </div>
            <div class="m_wtm">
                <div id="weijieList2">
                    <ul>
                            <asp:Repeater ID="Repeater3" runat="server">
                            <ItemTemplate>
                            <li>&nbsp;<td> <a target="_self" href="SearchDetails.aspx?ID=<%#Eval("ID")%>"><%#GetLeftString(Eval("Qcontent").ToString(),25) %></a></td><span class="lei">[<td><a target="_self" href="AskList.aspx?QueType=<%#Eval("QueType")%>&strwhere="><%#gettype(Eval("QueType","{0}"))%></a></td>]</span><span class="qanswers"><%#getcount(Eval("ID", "{0}"))%>回答</span></li>
                            </ItemTemplate>
                            </asp:Repeater>                                               
                    </ul>
                </div>
            </div>
            <div class="m_wtb"></div>
        </div>
        <!--精彩推荐结束-->
        <!--广告位1-->
                    <!--待解决问题开始-->
        <div class="m_wt">
            <div class="m_wtt">
                <ul>
                    <li class="a1"></li>
                    <li class="a2">
                        <div class="a2t">大家都在问什么</div>
                        <div class="more"><a target="_top" title="更多问题" href="MoreProblems.aspx?type=1">更多问题</a> </div>
                    </li>
                    <li class="a3"></li>
                </ul>
                <div class="clr"></div>
            </div>
            <div class="m_wtm">
                <div id="weijieList1">
                    <ul>
                      <asp:Repeater ID="Repeater4" runat="server">
                            <ItemTemplate>
                            <li> <a target="_self" href="MyAnswer.aspx?ID=<%#Eval("ID")%>"><%#GetLeftString(Eval("Qcontent").ToString(),25) %></a>&nbsp;<span class="lei">[<a target="_self" href="List.aspx?QueType=<%#Eval("QueType")%>&strwhere="><%#gettype(Eval("QueType","{0}"))%></a>]</span><span class="qanswers"><td><%#getanswers(Eval("ID", "{0}"))%></td>回答</span></li>
                            </ItemTemplate>
                            </asp:Repeater>                       
                    </ul>
                </div>
            </div>
            <div class="m_wtb"></div>
        </div>
        <!--待解决问题结束-->
        <!--广告位2-->
                    <!--悬赏问题开始-->
        <div class="m_wt">
            <div class="m_wtt">
                <ul>               
                    <li class="a1"></li>
                    <li class="a2">
                        <div class="a2t">悬赏求答案的问题</div>
                        <div class="more"><a target="_top" target="_blank" title="更多问题" href="MoreProblems.aspx?type=2">更多问题</a> </div>
                    </li>
                    <li class="a3"></li>                   
                </ul>
                <div class="clr"></div>
            </div>
            <div class="m_wtm">
                <div id="weijieList">
                    <ul> <asp:Repeater runat="server" ID="Repeater5"> <ItemTemplate>                                                    
                        <li><img  alt=" " src="/App_Themes/Guest/images/TB2.gif" /><td><%#Eval("Score")%></td><td><a target="_self"  href="SearchDetails.aspx?ID=<%#Eval("ID")%>"><%#GetLeftString(Eval("Qcontent").ToString(),25) %>&nbsp;</a></td><span class="lei">[<a target="_self" href="AskList.aspx?QueType=<%#Eval("QueType")%>&strwhere="><%#gettype(Eval("QueType","{0}"))%>]</a></span><span class="qanswers"><td><%#getanswers(Eval("ID", "{0}"))%></td>回答</span></li>
                     </ItemTemplate></asp:Repeater></ul>
                </div>
            </div>
            <div class="m_wtb"></div>
        </div>
        <!--悬赏问题结束-->
        <!--广告位3-->
        <!--已解决问题开始-->
        <div class="m_wt">
            <div class="m_wtt">
                <ul>
                    <li class="a1"></li>
                    <li class="a2">
                        <div class="a2t">最新已解决的问题</div>
                        <div class="more"><a target="_top" title="更多问题" href="MoreProblems.aspx?type=3">更多问题</a></div>
                    </li>
                    <li class="a3"></li>
                </ul>
                <div class="clr"></div>
            </div>
            <div id="jieList" class="m_wtm">
                <ul>
                    <asp:Repeater runat="server" ID="Repeater6"><ItemTemplate>                                            
                        <li>
                            <td>
                                <a target="_self" href="SearchDetails.aspx?ID=<%#Eval("ID")%>"><%#GetLeftString(Eval("Qcontent").ToString(),25) %>
                                </a>
                            </td>
                            &nbsp;<span class="lei">[<td>
                                <a target="_self" href="List.aspx?QueType=<%#Eval("QueType")%>&strwhere="><%#gettype(Eval("QueType","{0}"))%>
                                </a>
                            </td>]</span><span class="qanswers"><td><%#getanswers(Eval("ID", "{0}"))%></td>回答</span>
                        </li>
                    </ItemTemplate></asp:Repeater>                       
                </ul>
            </div>
            <div class="m_wtb"></div>
        </div>
        <!--已解决问题结束-->
    </div>
    <div class="right">
        <div class="ty">
            <div class="tyt"></div>
            <div class="tym">
                <div class="tym_t">
                    <div class="mc">
                        <img src="/App_Themes/Guest/images/note.gif" class="noteicon"/>
                        站內公告
                    </div>
                </div>
                <div class="tym_m">
                    <ul>      
                        <%Call.Label("{ZL.Label id=\"输出指定节点标题_无时间属性\" NodeID=\"1\" TitleNum=\"25\" ShowNum=\"6\" /}"); %>
                    </ul>
                    <div class="more1"><a href="<%Call.Label("{ZL:GetNodeLinkUrl(1)/}"); %>" target="_blank" title="查看全部公告">查看全部公告</a></div>
                </div>
            </div>
            <div class="tyb"></div>
        </div>
        <div class="zjzt">
            <div class="zjztt">
                <ul>
                    <li class="a1"></li>
                    <li class="a2">热点关键词</li>
                    <li class="a3"></li>
                </ul>
            </div>
            <div class="zjztm">  
                <div class="zjztinter"> 
                    <ul>    
                          <asp:Repeater runat="server" ID="Repeater11"><ItemTemplate>   <li class="listconList"> <a target="_self" href="List.aspx?QueType=<%#Eval("QueType")%>&strwhere="><%#gettype(Eval("QueType","{0}"))%>
                                </a></li>  </ItemTemplate></asp:Repeater> 
                    </ul> 
                 </div>            
            </div>
            <div class="zjztb"></div>
        </div>
                    <div class="rb_zj">
            <div class="rb_zj_t"></div>
            <div class="rb_zj_m">
                <div class="rb_zj_mt">
                    <h3><div class="istar"></div>本周推荐之星</h3>
                    <div class="more2"><a href="Star.aspx" target="_blank" title="历届问答之星">历届之星>> </a></div>
                </div>
               <asp:Repeater runat="server" ID="Repeater7" OnItemDataBound="Repeater7_ItemDataBound">
                   <ItemTemplate> 
               <div class="rb_zj_mm">
                                                <div class="rb_zj_mmc">
                                                            <div class='zjimg'>
                                <img src="/Images/InitHead.gif" width='50px' height='50px' />
                            </div>
                            <div class='jbzl'>
                                <a href="/ShowList.aspx?id=<%#Eval("UserID")%>" target='_blank'><%#Eval("UserName")%></a><br/>
                                回答数:<%#getanswer(Eval("UserID","{0}"))%><br />
                                提问数:<%#getask(Eval("UserID","{0}"))%>
                            </div>
                            <div class='clr'></div>
                            精选解答:
                                   <a class="button1" id="fix" runat="server">向TA提问</a>
                                   <asp:Repeater runat="server" ID="Repeater8"><ItemTemplate>                         
                            <ul>
                                <li><a href="SearchDetails.aspx?ID=<%#Eval("ID")%>" target='_blank' title=" "><%#Eval("Qcontent")%></a></li>
                                
                                <%--<li><a href="SearchDetails.aspx?ID=<%#Eval("ID")%>" target='_blank' title=" "><%#Eval("Supplyment")%></a></li>--%>
                            </ul></ItemTemplate></asp:Repeater>
                  </div>
                        <div class="clr"></div>
                        
                </div>
              </ItemTemplate></asp:Repeater>
                </div>
                <div class="rb_zj_b"></div>
            </div>
           
    </div>
        <div class="clr"></div>
  </div>
</div>
<div class="clr"></div>
<!--友情链接-->
<div class="jklm">
    <div class="jklmm">
        
        <div class="lm"> <h3>友情链接</h3>           
            <a target="_blank" href="http://www.zoomla.cn" title="Zoomla！逐浪CMS"> Zoomla！逐浪CMS  </a>            
            <a target="_blank" href="http://www.hx008.com" title="华夏互联">  华夏互联 </a>            
            <a target="_blank" href="http://bbs.zoomla.cn " title="逐浪论坛"> 逐浪论坛  </a>            
            <a target="_blank" href="http://help.zoomla.cn" title="帮助中心"> 帮助中心 </a>
        </div>
    </div>
</div>
<div class="clr"></div>
<script src="http://www.zoomla.cn/js/slides.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        $('#slides').slides({
            preload: true,
            generateNextPrev: false,
            play: 5000,
            container: 'slides_container'

        });
    });
    function showtop(type) {
        if (type == 'week') {
            document.getElementById("weektab").className="on";
            document.getElementById("alltab").className="";
            document.getElementById("weektop").style.display="";
            document.getElementById("alltop").style.display="none";
            //$("#weektab").attr('class', 'on');
            //$("#alltab").attr('class', '');
            //$("#alltop").hide();
            //$("#weektop").show();
        } else {
            document.getElementById("weektab").className="";
            document.getElementById("alltab").className="on";
            document.getElementById("weektop").style.display="none";
            document.getElementById("alltop").style.display="";
            //$("#alltab").attr('class', 'on');
            //$("#weektab").attr('class', '');
            //$("#weektop").hide();
            //$("#alltop").show();
        }
    }
</script>  
    <asp:HiddenField runat="server" ID="hfid" />
    </form>
    <!-- 版权信息 -->
    <div id="bottom" class="footer"> 
        <p>
  <!--          <script language="javascript" type="text/javascript"> 

                var year = "";
                mydate = new Date();
                myyear = mydate.getYear();
                year = (myyear > 200) ? myyear : 1900 + myyear;
                document.write(year); 

            </script>--> 
            &copy; &nbsp;Copyright&nbsp;
            <%Call.Label("{$SiteName/}"); %>
            All rights reserved.</p>
    </div>
</body>
</html>