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
tab5.onmouseover=function() {clearInterval(MyMar2)};//�������ʱ�����ʱ���ﵽ����ֹͣ��Ŀ��
tab5.onmouseout=function() {MyMar2=setInterval(Marquee2,speed2)};//����ƿ�ʱ���趨ʱ��
var speed=30;
var tab=document.getElementById("demo");
var tab1=document.getElementById("demo1");
var tab2=document.getElementById("demo2");
tab2.innerHTML=tab1.innerHTML;          //��¡demo1Ϊdemo2
function Marquee(){
if(tab2.offsetTop-tab.scrollTop<=0)//��������demo1��demo2����ʱ
tab.scrollTop-=tab1.offsetHeight  //demo�������
else{
tab.scrollTop++
}
}
var MyMar=setInterval(Marquee,speed);
tab.onmouseover=function() {clearInterval(MyMar)};//�������ʱ�����ʱ���ﵽ����ֹͣ��Ŀ��
tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};//����ƿ�ʱ���趨ʱ��

