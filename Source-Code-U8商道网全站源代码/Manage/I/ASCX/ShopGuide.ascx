<%@ control language="C#" autoeventwireup="true" inherits="Manage_I_ASCX_ShopGuide, App_Web_kp2um5rz" %>
<div class="tvNavDiv">
    <div class="input-group">
        <input type="text" ID="keyWord" class="form-control" onkeydown="return ASCX.OnEnterSearch('<%:CustomerPageAction.customPath2+"I/Shop/ProductManage.aspx?keyWord=" %>',this);" placeholder="请输入IDC订单号" />
        <span class="input-group-btn">
            <button class="btn btn-default" type="button" onclick="ASCX.Search('<%:CustomerPageAction.customPath2+"I/Shop/ProductManage.aspx?keyWord=" %>','keyWord');"><span class="glyphicon glyphicon-search"></span></button>
        </span>
    </div>
    <div class="left_ul">
        <ul>
            <li><a href="CartManage.aspx"><%=lang.Get("m_OrderLink_record")%></a></li>
            <li><a href="OrderList.aspx"><%=lang.Get("m_OrderLink_list")%></a></li>
            <li><a href="UserOrderlist.aspx?type=0"><%=lang.Get("m_OrderLink_shop")%></a></li>
            <li><a href="/User/Shopfee/OrderList.aspx"><%=lang.Get("m_OrderLink_purchase")%></a></li>
            <li><a href="OrderSql.aspx"><%=lang.Get("m_OrderLink_ApplyReceipt")%></a></li>
            <li><a href="OtherOrder/Hotel_Order_Manager.aspx"><%=lang.Get("m_OrderLink_hotel")%></a></li>
            <li><a href="OtherOrder/Flight_Order_Management.aspx"><%=lang.Get("m_OrderLink_ticket")%></a></li>
            <li><a href="OtherOrder/TravelOrder_Manager.aspx"><%=lang.Get("m_OrderLink_travel")%></a></li>
            <li><a href="OtherOrder/DomainOrder.aspx?OrderType=5">域名订单管理</a></li>
            <li><a href="OtherOrder/IDCOrder.aspx?OrderType=7">IDC服务订单</a></li>
            <li><a href="FillOrder.aspx">补订单</a></li>
            <li><a href="LocationReport.aspx"><%=lang.Get("m_OrderLink_LocationReport")%></a>
            <li><a href="MonthlyReport.aspx"><%=lang.Get("m_OrderLink_MonthReport")%></a></li>
            <li><a href="OrderConfi.aspx"><%=lang.Get("m_OrderLink_info")%></a></li>
            <li><a href="SystemOrderModel.aspx?Type=site"><%=lang.Get("m_OrderLink_config")%></a></li>
            <li><a href="SystemOrderModel.aspx?Type=shop"><%=lang.Get("m_OrderLink_shopconfig")%></a></li>
        </ul>
    </div>
</div>
