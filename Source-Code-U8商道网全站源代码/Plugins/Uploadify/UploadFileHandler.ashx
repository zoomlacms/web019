<%@ WebHandler Language="C#" Class="UploadFileHandler" %>
using System;
using System.Web;
using System.IO;
using ZoomLa.BLL;
using ZoomLa.BLL.Plat;
using ZoomLa.Model;
using ZoomLa.Common;
using ZoomLa.Components;
using System.Linq;
   
/*
 *用于文件工厂,OA附件上传
 */ 

public class UploadFileHandler : IHttpHandler {

    B_DocModel bll = new B_DocModel();
    M_DocModel model = new M_DocModel();
    B_Admin badmin = new B_Admin();
    //不允许上传html等
    /// <summary>
    /// true包含不允许上传的后缀名
    /// </summary>
    public bool extFilter(string fileName) 
    {
        string[] extArr = new string[] {"aspx","asp","html","htm","php","jsp","exe","swf" };
        bool flag = false;
        string extName = fileName.Split('.')[(fileName.Split('.').Length-1)].ToLower().Trim();
        flag=extArr.Select(p => p).Contains(extName);
        return flag;
    }
    public void ProcessRequest(HttpContext context)
    {
        B_User.CheckIsLogged();
        B_User buser = new B_User();
        M_UserInfo mu = buser.GetLogin();

        context.Response.ContentType = "text/plain";
        HttpPostedFile file = context.Request.Files["Filedata"];
        string uploadPath = "";
        string action = HttpContext.Current.Request.Params["action"];
        if (SafeSC.FileNameCheck(file.FileName))
        {
            context.Response.Write("不允许上传该后缀名的文件"); context.Response.End();
        }
        string ppath = "", result = "0";
        uploadPath = SiteConfig.SiteOption.UploadDir;
        switch (action)
        {
            case "OAattach"://OA--公文||事务--附件
                uploadPath += "OA/" + mu.UserName + mu.UserID + "/";
                ppath = context.Server.MapPath(uploadPath);
                //判断是否有同名文件的存在
                break;
            case "Blog"://能力中心--博客
                uploadPath = B_Plat_Common.GetDirPath(B_Plat_Common.SaveType.Blog);
                ppath = context.Server.MapPath(uploadPath);
                break;
            case "Plat_Doc"://能力中心--我的文档
                uploadPath = B_Plat_Common.GetDirPath(B_Plat_Common.SaveType.Person) + SafeSC.PathDeal(context.Request.Form["Dir"]);
                ppath = context.Server.MapPath(uploadPath);
                break;
            case "Plat_Doc_Common"://能力中心--公司文档
                uploadPath = B_Plat_Common.GetDirPath(B_Plat_Common.SaveType.Company) + SafeSC.PathDeal(context.Request.Form["Dir"]);
                ppath = context.Server.MapPath(uploadPath);
                break;
        }
        if (!Directory.Exists(ppath))
        { Directory.CreateDirectory(ppath); }
        SafeSC.SaveFile(uploadPath, file);
        result = function.PToV(uploadPath + file.FileName);
        //switch (action)//存储完成后操作
        //{
        //    case "Plat_Doc"://能力中心--我的文档,后期替换为异步,FileSize移除,VPath移除
        //        M_Plat_CompDoc docMod = new M_Plat_CompDoc();
        //        B_Plat_CompDoc docBll = new B_Plat_CompDoc();
        //        docMod.UserID = mu.UserID;
        //        docMod.Name = file.FileName;
        //        docMod.CreateTime = DateTime.Now;
        //        docMod.DocType=2;
        //        docBll.Insert(docMod);
        //        break;
        //}
        context.Response.Write(result); context.Response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}