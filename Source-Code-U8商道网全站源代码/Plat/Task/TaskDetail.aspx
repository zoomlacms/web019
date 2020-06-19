<%@ page language="C#" autoeventwireup="true" inherits="Plat_Task_TaskDetail, App_Web_gb04m1ch" clientidmode="Static" masterpagefile="~/Plat/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="Head">
     <style type="text/css">
        #TaskDetail_Div{width:600px;}
        .task_top_div{height:40px;line-height:40px;background-color:#f7f7f7;padding-left:10px;}
        .task_info_div{padding:10px;border-bottom:1px solid #ddd;}
        .task_info_detail_div{padding:10px;}
        .glyphicon{cursor:pointer;color:black;}
        .glyphicon:hover{color:#0066cc;}
        .imgface{border-radius:50%;width:30px;height:30px;}
        #idsTable{margin-top:5px;margin-bottom:5px;}
        #TaskMsg_ul{padding-top:10px;}
        #TaskMsg_ul li{padding:5px;border-bottom:1px solid #ddd;}
        .colorSpan_F {padding:2px;display:inline-block;border:2px solid white;border-radius:50%;margin-left:5px;margin-right:5px;cursor:pointer; position:relative;}
        .colorSpan {width:30px;height:30px;border-radius:50%;float:left;}
        .colorSpan_F:hover {border:2px solid #0066cc;}
    </style>
    <script type="text/javascript">

    </script>
    <title>任务详情</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
      <div id="TaskDetail_Div">
          <div class="task_top_div">
              <div class="col-xs-3">
                  <img src="/Images/userface/noface.gif" class="imgface" />
                  <asp:Label runat="server" ID="CreateUName_L"></asp:Label>
                  <span style="margin-left:5px;">创建</span>
              </div>
              <div class="col-xs-3"><span class="glyphicon glyphicon-road"></span><span style="margin-left:5px;">进行中</span></div>
              <div class="col-xs-3">
                  <span class="colorSpan_F"><span class="colorSpan" style="background-color: #3bb3ff;border:1px solid #0084ff;"></span></span>
              </div>
               <div class="col-xs-3" style="text-align:right;">
                       <span class='glyphicon glyphicon-remove' title='关闭' onclick="parent.HideTaskDiv();"></span>
               </div>
            </div>
          <div class="task_info_div">
              <div style="padding-top:5px;padding-bottom:5px;">
                  <input type="checkbox" id="completeTask" title="标识任务已完成" />
                  <asp:Label runat="server" ID="TName_L"></asp:Label>
                  <span class="glyphicon glyphicon-lock" title="公开该任务" style="float:right;"></span>
              </div>
              <div>
                  <asp:Label runat="server" ID="BTime_L"></asp:Label> --
                  <asp:Label runat="server" ID="ETime_L"></asp:Label>
              </div>
          </div>
          <div class="task_info_detail_div">
              <div>
                  <span>任务描述：</span>
                  <asp:TextBox runat="server" ID="TaskContent_T" TextMode="MultiLine" style="width:100%;height:50px;" placeholder="任务描述"></asp:TextBox>
              </div>
              <div>
                  <table id="idsTable">
                       <tr><td>负责人：</td><td>
                           <asp:Label runat="server" ID="LeaderIDS"></asp:Label>
                                        </td></tr>
                       <tr><td>任务成员：</td><td>
                           <asp:Label runat="server" ID="PartTakeIDS"></asp:Label>
                                         </td></tr>
                  </table>
              </div>
              <div style="margin-bottom:5px;padding-bottom:5px;border-bottom:1px solid #ddd;">
                  <div style="margin-bottom:5px;">
                      <asp:TextBox runat="server" ID="MsgContent_T" TextMode="MultiLine" Style="width: 100%;height:80px;margin-top:10px;  padding-left: 5px;" placeholder="我也说一句"></asp:TextBox>
                  </div>
                  <div>
                      <span class="glyphicon glyphicon-paperclip" style="font-size:1.2em;"></span>
                      <asp:Button runat="server" Text="评论" CssClass="btn btn-primary btn-sm" ID="AddMsg_Btn" OnClick="AddMsg_Btn_Click" style="float:right;margin-right:10px;" />
                  </div>
                  <div style="clear:both;"></div>
              </div>
              <!--回复-->
              <div>
                      <ul id="TaskMsg_ul">
                          <asp:Repeater runat="server" ID="TaskMsg_Rep">
                              <ItemTemplate>
                                  <li>
                                      <span class="col-lg-2"><img src="/Images/userface/noface.gif" class="imgface" /></span>
                                      <div class="col-lg-10">
                                          <div style="text-align:right;">
                                              <span style="float:left;"><strong><%#Eval("UserName") %></strong></span> 
                                              <span><strong><%#Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy年MM月dd日 HH:mm") %></strong></span>
                                          </div>
                                          <div><%#Eval("MsgContent") %></div>
                                      </div>
                                      <div style="clear:both;"></div>
                                  </li>
                              </ItemTemplate>
                          </asp:Repeater>
                      </ul>
                  </div>
          </div>
        </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>