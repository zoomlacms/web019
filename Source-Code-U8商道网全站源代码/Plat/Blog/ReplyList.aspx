<%@ page language="C#" autoeventwireup="true" inherits="Plat_Blog_ReplyList, App_Web_o3cst4gs" enableviewstate="false" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
    <form id="form1" runat="server">
        <start>
        <asp:Repeater runat="server" ID="ReplyList">
            <ItemTemplate>
                <div style="background-color: #ddd; padding-left: 5px; padding-top: 5px;">
                    <div style="float: left;">
                        <img style="width: 30px; height: 30px;" src="/Images/userface/noface.gif" />
                    </div>
                    <div style="margin-left: 45px;">
                        <div>
                            <%#GetReplyStr(Eval("ReplyID")) %>
                        </div>
                        <div style="padding-top: 5px;">
                            <%#Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy年MM月dd日 HH:mm") %>
                            <a href="javascript:;" onclick="DisReplyOP();" style="margin-left: 10px;">回复他</a>
                        </div>
                        <div class="replyOP" style="display: none;">
                            <input type="hidden" id="MsgInfo_<%#Eval("ID") %>_Hid" value="<%#Eval("Pid")+":"+Eval("ID")%>"/>
                            <input type="text" id="MsgContent_<%#Eval("ID") %>"/>
                            <a href="javascript:;" onclick="AddMessage(<%#Eval("ID") %>);">回复</a>
                        </div>
                    </div>
                    <div style="border-bottom: 1px solid gray; width: 98%; margin-left: 1%;"></div>
                </div>
            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </asp:Repeater></start>
    </form>