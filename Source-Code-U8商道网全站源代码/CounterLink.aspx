﻿<%@ page language="C#" autoeventwireup="true" inherits="CounterLink, App_Web_cawubjca" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
document.write("<iframe id='aaa' style='width:0px;height:0px;border:1px;display:none' src='<%="http://"+HttpContext.Current.Request.Url.Authority%>/CallCounter.aspx?ref="+document.referrer+"&random="+Math.random()+"'></iframe>");