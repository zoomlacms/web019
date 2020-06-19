<%@ WebHandler Language="C#" Class="Common" %>

using System;
using System.Web;
using System.Data;
using ZoomLa.BLL;
using ZoomLa.Model;

public class Common : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        string action = context.Request.Form["action"];
        string value = context.Request.Form["value"];
        switch (action)
        {
            case "Plat_CompUser"://获取公司中成员,用于@功能
                {
                    M_User_Plat upMod = B_User_Plat.GetLogin();
                    B_User_Plat upBll = new B_User_Plat();
                    DataTable dt = upBll.SelByCompWithAT(upMod.CompID);
                    string json = JsonHelper.JsonSerialDataTable(dt);
                    context.Response.Write(json); context.Response.Flush(); context.Response.End();
                }
                break;
            case "":
                {
                    
                }
                break;
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}