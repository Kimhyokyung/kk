/**
 * 
 */
var clientX = 999;
var clientY = 999;
var scheduled = false;

var iX = 0;
var iY = 0;

window.onmousedown = function (event) {
  /* event = event || window.event;
    clientX = event.clientX;
    clientY = event.clientY;
    alert(clientX +" "+ clientY);*/
    
	
	iX = window.document.body.offsetWidth - window.event.clientX ;
	iY = window.event.clientY ;
    //alert(clientY+":"+clientX);
  /* if (!scheduled) {
    scheduled = true;
    setTimeout(function () {
      
      scheduled = false;
    }, 100);
  } */
}

window.onbeforeunload = function (event) {
/*  if (clientX <= 0 || clientY <= 0 ) {*/
	 if (iX <=30 && iY < 0 ) {


   // alert("window close");
    $.ajax({
        url : "/kuku/user/logout"  //스프링시큐리티 에서 적용시켜놓은 custom logout url
       }); 
  }else{
	 // alert("window refresh");
  }
};