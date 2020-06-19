<%@ page language="C#" autoeventwireup="true" inherits="manage_Mobile_Camera, App_Web_rgid0rzo" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head>
<title>拍照</title>
<script src="/JS/jquery-1.9.1.min.js" type="text/javascript"></script>
</head>
<body>
<video id="video" autoplay="autoplay"></video>
<br />
<input type="button" value="拍照" onclick="shoot()" /><br />
拍照結果：
<div id="result">
</div>
<script type="text/javascript">
 
    var video = document.getElementById("video");  
        navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia;  
           if (navigator.getUserMedia) //  
          {  
                  if (navigator.webkitURL)//  
               {  
                      navigator.getUserMedia({video:true}, function (stream) {  
                                video.src = window.webkitURL.createObjectURL(stream);  
                           }, function (error) { alert(error); });  
                  }  
                   else //  
                  {  
                      navigator.getUserMedia({video:true}, function (stream) {  
                                video.src = window.webkitURL.createObjectURL(stream);  
                            }, function (error) { alert(error); });  
               }  
              }   
   
    //執行拍照
    function shoot() {

        var video = $("#video")[0];
        var canvas = capture(video);


        $("#result").empty();
        $("#result").append(canvas); //呈現圖像(拍照結果)
        var imgData = canvas.toDataURL("image/jpg");
        var base64String = imgData.substr(22); //取得base64字串

        //上傳，儲存圖片
        $.ajax({
            url: "../Common/CameraUp.ashx",
            type: "post",
            data: { data: base64String },
            async: true,
            success: function (htmlVal) {
                alert("图片保存成功！");
            }, error: function (e) {
                alert(e.responseText); //alert錯誤訊息
            }

        });
    }

    //從video元素抓取圖像到canvas
    function capture(video) {

        var canvas = document.createElement('canvas'); //建立canvas js DOM元素
        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;
        var ctx = canvas.getContext('2d');
        ctx.drawImage(video, 0, 0);
        return canvas;
    }
</script>
</body>
</html>
