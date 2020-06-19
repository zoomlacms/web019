var speed2=18; 
var tab5=document.getElementById("demo5");
var tab3=document.getElementById("demo3");
var tab4=document.getElementById("demo4");
tab4.innerHTML=tab3.innerHTML;
function Marquee2(){
if(tab4.offsetWidth-tab5.scrollLeft<=0)
tab5.scrollLeft-=tab3.offsetWidth
else{
tab5.scrollLeft++;
}
}
var MyMar2=setInterval(Marquee2,speed2);
tab5.onmouseover=function() {clearInterval(MyMar2)};//鼠标移上时清除定时器达到滚动停止的目的
tab5.onmouseout=function() {MyMar2=setInterval(Marquee2,speed2)};//鼠标移开时重设定时器
var speed=30;
var tab=document.getElementById("demo");
var tab1=document.getElementById("demo1");
var tab2=document.getElementById("demo2");
tab2.innerHTML=tab1.innerHTML;          //克隆demo1为demo2
function Marquee(){
if(tab2.offsetTop-tab.scrollTop<=0)//当滚动至demo1与demo2交界时
tab.scrollTop-=tab1.offsetHeight  //demo跳到最顶端
else{
tab.scrollTop++
}
}
var MyMar=setInterval(Marquee,speed);
tab.onmouseover=function() {clearInterval(MyMar)};//鼠标移上时清除定时器达到滚动停止的目的
tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};//鼠标移开时重设定时器

