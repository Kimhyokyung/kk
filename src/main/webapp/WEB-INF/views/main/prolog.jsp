<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description"
   content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet"
   href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/assets/css/bootstrap/navhead_custom.css" />
<title>Kukumental</title>
</head>
<body>
   <nav id="topNav" class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
         <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
               data-toggle="collapse" data-target="#bs-navbar">
               <span class="sr-only">Toggle navigation</span> <span
                  class="icon-bar"></span> <span class="icon-bar"></span> <span
                  class="icon-bar"></span>
            </button>
            <a class="navbar-brand page-scroll" href="#first"> <img
               src="${pageContext.request.contextPath}/assets/img/logo.png" />
            </a>
         </div>
         <div class="navbar-collapse collapse" id="bs-navbar">
            <ul class="nav navbar-nav">
               <li><a class="page-scroll" href="#one">Intro</a></li>
               <li><a class="page-scroll" href="#two">Member</a></li>
               <li><a class="page-scroll" href="#four">Features</a></li>
               <!--                <li><a class="page-scroll" href="#last">Contact</a></li> -->
            </ul>
            <ul class="nav navbar-nav navbar-right">
               <li><a href="/kuku/user/select_join_type">회원가입</a></li>
               <li><a href="/kuku/user/loginform">로그인</a></li>
               <li class="dropdown profile-dropdown"><a><span
                     class="hidden-xs">게스트님 안녕하세요</span></a></li>
            </ul>
         </div>
      </div>
   </nav>
   <header id="first">
      <div class="header-content">
         <div class="inner">
            <h1 class="cursive">Hello! for kukumental</h1>
            <h4>대화가 필요하신가요?</h4>
            <hr>
            <a href="#one" class="btn btn-primary btn-xl page-scroll">Get
               Started</a>
         </div>
      </div>

   </header>
   <section class="bg-primary" id="one">
      <div class="container">
         <div class="row">
<!--             <div class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 text-center"> -->
               <div class="col-md-8 col-md-offset-2 text-center">
                  <h1 class="margin-top-0 text-primary">
                     <b>Intro</b>
                  </h1>
                  <br>
                  <p class="text-faded" align="center">
                     쿠크에 오신것을 환영합니다!<br><br> 간단한 가입 절차를 통해 쿠크의 회원이 되어보세요!<br><br> 어떤 고민이
                     있든 익명으로 실시간 고민을 나눌 수 있습니다.<br><br> 쿠크의 리스너들은 당신의 고민을 경청해주고 <br> <br>소통할
                     준비가 되어있습니다.<br>
                  </p>
                  <a href="/kuku/user/loginform"
                     class="btn btn-default btn-xl page-scroll">Let's Talk !</a>
               </div>
            </div>
         </div>
   </section>
   <section id="two">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 text-center">
               <h1 class="margin-top-0 text-primary">
                  <b>Member</b>
               </h1>
               <hr class="primary">
            </div>
         </div>
      </div>
      <div class="container">
         <div class="row">
            <div class="col-lg-6 col-md-6 text-center">
               <div class="feature">
                  <img
                     src="${pageContext.request.contextPath}/assets/img/talker.png"
                     alt="" />
                  <h2>Talker</h2>
                  <p class="text-muted">당신의 이야기를 나눠 보세요. 대화를 통해 당신의 지친 멘탈을 힐링하세요!</p>
               </div>
            </div>
            <div class="col-lg-6 col-md-6 text-center">
               <div class="feature">
                  <img src="${pageContext.request.contextPath}/assets/img/listener.png" alt="" />
                  <h2>Listener</h2>
                  <p class="text-muted">이야기를 들어 주는 것만으로도 힘이 됩니다. 전문 상담가가 아닌 그 누구라도 리스너가 될 수 있습니다.</p>
               </div>
            </div>
         </div>
      </div>
   </section>

   <section class="bg-primary" id="four">
      <div class="row" style="padding-bottom: 220px;">
         <div
            class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
            <h1 class="text-center text-primary">
               <b>Features</b>
            </h1>
            <hr>
            <div class="media wow fadeInRight">
               <h3>실시간 상담</h3>
               <div class="media-body media-middle">
                  <h4>원하는 상담 주제와 리스너를 선택해서 언제나 이야기를 나눌 수 있습니다.</h4>
               </div>
               <div class="media-right">
                  <i class="icon-lg fa fa-weixin" aria-hidden="true"></i>
               </div>
            </div>
            <hr>
            <div class="media wow fadeIn">
               <h3>익명성과 간단한 절차</h3>
               <div class="media-left">
                  <i class="fa fa-users icon-lg" aria-hidden="true"></i>
               </div>
               <div class="media-body media-middle">
                  <h4>익명성으로 편하게 대화를 나눌 수 있고 까다로운 가입 절차가<br> 필요하지 않습니다.</h4>
               </div>
            </div>
            <hr>
            <div class="media wow fadeInRight">
               <h3>감정 분석</h3>
               <div class="media-body media-middle">
                  <h4>채팅 내용을 텍스트 마이닝하여 감정 분석을 통해 토커의 감정 상태를 한 눈에 볼 수 있습니다.</h4>
               </div>
               <div class="media-right">
                  <i class="icon-lg fa fa-bar-chart-o" aria-hidden="true"></i>
               </div>
            </div>
         </div>
      </div>
   </section>
   <script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
   <script
      src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
   <script src="//cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/navhead_custom.js"></script>
</body>
</html>