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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap/navhead_custom.css" />
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css" />
	<link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
	<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
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
				<a class="navbar-brand page-scroll" href="#first">
						<img src="${pageContext.request.contextPath}/assets/img/logo.png" style="height:70px"/>
				</a>
			</div>
			<div class="navbar-collapse collapse" id="bs-navbar">
				<ul class="nav navbar-nav">
					<li><a class="page-scroll" href="#one">Intro</a></li>
					<li><a class="page-scroll" href="#two">Highlights</a></li>
					<li><a class="page-scroll" href="#four">Features</a></li>
					<li><a class="page-scroll" href="#last">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/kuku/user/select_join_type">회원가입</a></li>
					<li><a href="/kuku/user/loginform">로그인</a></li>
					<li class="dropdown profile-dropdown">
					<a><span class="hidden-xs">게스트님 안녕하세요</span></a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header id="first">
		<div class="header-content">
			<div class="inner">
				<h1 class="cursive">Simple, One Page Design</h1>
				<h4>A free landing page theme with video background</h4>
				<hr>
				<a href="#video-background" id="toggleVideo" data-toggle="collapse"
					class="btn btn-primary btn-xl">Toggle Video</a> &nbsp; <a
					href="#one" class="btn btn-primary btn-xl page-scroll">Get
					Started</a>
			</div>
		</div>
		<video src="" autoplay loop="loop" class="fillWidth fadeIn wow collapse in"></video>

	</header>
	<section class="bg-primary" id="one">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 text-center">
					<h1 class="margin-top-0 text-primary" ><b>Welcome !</b></h1>
					<br>
					<p class="text-faded"> 마음의 무거운 짐을 덜어내세요. 당신의 얘기, 진심으로 귀 기울이겠습니다. 무슨 고민 있어? 너의 편이 되어줄게. 괜찮다고 말해줄게. 다 잘 될거라고 넌 빛날거라고 넌 소중하다고 
					너무 힘들고 지칠때 "괜찮아"라는 말이 필요하다면 쿠크하세요! 쿠크~
					함께 대화를 나누는 것 만큼 사람의 마을을 알아주는 것은 없다. 당신의 하루가 온통 기쁨이었으면 좋겠습니다.
					The less you care, the happier you will be (조금 덜 걱정한다면, 당신은 더 행복해 질거에요
					쿠쿠에서 당신의 이야기를 나눠보세요.
					말 못할 소통의 어려움 쿠쿠에서 이겨내요.</p>
					<a href="#three" class="btn btn-default btn-xl page-scroll">Let's Talk !</a>
				</div>
			</div>
		</div>
	</section>
	<section id="two">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="margin-top-0 text-primary">Flexible Layouts</h2>
					<hr class="primary">
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4 text-center">
					<div class="feature">
						<i class="icon-lg ion-android-laptop wow fadeIn"
							data-wow-delay=".3s"></i>
						<h3>Responsive</h3>
						<p class="text-muted">Your site looks good everywhere</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 text-center">
					<div class="feature">
						<i class="icon-lg ion-social-sass wow fadeInUp"
							data-wow-delay=".2s"></i>
						<h3>Customizable</h3>
						<p class="text-muted">Easy to theme and customize with SASS</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 text-center">
					<div class="feature">
						<i class="icon-lg ion-ios-star-outline wow fadeIn"
							data-wow-delay=".3s"></i>
						<h3>Consistent</h3>
						<p class="text-muted">A mature, well-tested, stable codebase</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="container-fluid" id="four">
		<div class="row">
			<div
				class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
				<h2 class="text-center text-primary">Features</h2>
				<hr>
				<div class="media wow fadeInRight">
					<h3>Simple</h3>
					<div class="media-body media-middle">
						<p>What could be easier? Get started fast with this landing
							page starter theme.</p>
					</div>
					<div class="media-right">
						<i class="icon-lg ion-ios-bolt-outline"></i>
					</div>
				</div>
				<hr>
				<div class="media wow fadeIn">
					<h3>Free</h3>
					<div class="media-left">
						<a href="#alertModal" data-toggle="modal"
							data-target="#alertModal"><i
							class="icon-lg ion-ios-cloud-download-outline"></i></a>
					</div>
					<div class="media-body media-middle">
						<p>Yes, please. Grab it for yourself, and make something
							awesome with this.</p>
					</div>
				</div>
				<hr>
				<div class="media wow fadeInRight">
					<h3>Unique</h3>
					<div class="media-body media-middle">
						<p>Because you don't want your Bootstrap site, to look like a
							Bootstrap site.</p>
					</div>
					<div class="media-right">
						<i class="icon-lg ion-ios-snowy"></i>
					</div>
				</div> 
				<hr>
				<div class="media wow fadeIn">
					<h3>Popular</h3>
					<div class="media-left">
						<i class="icon-lg ion-ios-heart-outline"></i>
					</div>
					<div class="media-body media-middle">
						<p>There's good reason why Bootstrap is the most used frontend
							framework in the world.</p>
					</div>
				</div>
				<hr>
				<div class="media wow fadeInRight">
					<h3>Tested</h3>
					<div class="media-body media-middle">
						<p>Bootstrap is matured and well-tested. It's a stable
							codebase that provides consistency.</p>
					</div>
					<div class="media-right">
						<i class="icon-lg ion-ios-flask-outline"></i>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="last">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 text-center">
					<h2 class="margin-top-0 wow fadeIn">Get in Touch</h2>
					<hr class="primary">
					<p>We love feedback. Fill out the form below and we'll get back
						to you as soon as possible.</p>
				</div>
				<div class="col-lg-10 col-lg-offset-1 text-center">
					<form class="contact-form row">
						<div class="col-md-4">
							<label></label> <input type="text" class="form-control"
								placeholder="Name">
						</div>
						<div class="col-md-4">
							<label></label> <input type="text" class="form-control"
								placeholder="Email">
						</div>
						<div class="col-md-4">
							<label></label> <input type="text" class="form-control"
								placeholder="Phone">
						</div>
						<div class="col-md-12">
							<label></label>
							<textarea class="form-control" rows="9"
								placeholder="Your message here.."></textarea>
						</div>
						<div class="col-md-4 col-md-offset-4">
							<label></label>
							<button type="button" data-toggle="modal"
								data-target="#alertModal"
								class="btn btn-primary btn-block btn-lg">
								Send <i class="ion-android-arrow-forward"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<div id="alertModal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<h2 class="text-center">Nice Job!</h2>
					<p class="text-center">You clicked the button, but it doesn't
						actually go anywhere because this is only a demo.</p>
					<p class="text-center">
						<a href="http://www.bootstrapzero.com">Learn more at
							BootstrapZero</a>
					</p>
					<br />
					<button class="btn btn-primary btn-lg center-block"
						data-dismiss="modal" aria-hidden="true">
						OK <i class="ion-android-close"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>	
	<script src="${pageContext.request.contextPath}/assets/js/navhead_custom.js"></script>
</body>
</html>