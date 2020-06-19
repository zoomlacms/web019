<%@ control language="C#" autoeventwireup="true" inherits="Manage_I_ASCX_UserGuide, App_Web_32urkbih" %>
<div class="menu_tit"><span class="glyphicon glyphicon-globe"></span>会员管理</div>
<div id="nodeNav">
    <div class="input-group">
        <input type="text" ID="keyWord" class="form-control" onkeydown="return ASCX.OnEnterSearch('<%:CustomerPageAction.customPath2+"I/User/UserManage.aspx?keyWord=" %>',this);" placeholder="请输入用户名" />
        <span class="input-group-btn">
            <button class="btn btn-default" type="button" onclick="ASCX.Search('<%:CustomerPageAction.customPath2+"I/User/UserManage.aspx?keyWord=" %>','keyWord');"><span class="glyphicon glyphicon-search"></span></button>
            <asp:Button runat="server" ID="search_Btn" Style="display: none;" />
        </span>
    </div>
    <div class="tvNavDiv">
        <div class="left_ul">
            <ul>
                <li class="guideli"><a onclick="ShowMain('','User/UserManage.aspx')"><%=lang.Get("m_UserGuide_member")%></a></li>
                <li class="guideli"><a onclick="ShowMain('','User/GroupManage.aspx')"><%=lang.Get("m_UserGuide_groups")%></a></li>
                <li class="guideli"><a onclick="ShowMain('','User/PointGroup.aspx')"><%=lang.Get("m_UserGuide_level")%></a></li>
                <li class="guideli"><a onclick="ShowMain('','User/SystemUserModel.aspx')"><%=lang.Get("m_UserGuide_regist")%></a></li>
                <li class="guideli"><a onclick="ShowMain('','Polymeric/ClassManage.aspx')"><%=lang.Get("m_UserGuide_aggregate")%></a></li>
                <li class="guideli"><a onclick="ShowMain('','Polymeric/ConfigSet.aspx')"><%=lang.Get("m_UserGuide_set")%></a></li>
                <li class="guideli"><a onclick="ShowMain('','User/UserDay.aspx')"><%=lang.Get("m_UserGuide_remind")%></a></li>
                <li class="guideli"><a onclick="ShowMain('','User/UserDayManage.aspx')"><%=lang.Get("m_UserGuide_holiday")%></a></li>
                <li class="guideli"><a onclick="ShowMain('','Config/UserConfig.aspx')"><%=lang.Get("m_UserGuide_data")%></a></li>
                <li class="guideli"><a onclick="ShowMain('','APP/Suppliers.aspx')">社会化登陆</a></li>
                <li class="guideli"><a onclick="ShowMain('','APP/Ucenter.aspx')">跨域网站接入</a></li>
                <li class="guideli"><a onclick="ShowMain('','User/UserApi.aspx')"><%=lang.Get("m_UserGuide_api")%></a></li>
            </ul>
        </div>
    </div>
</div>
