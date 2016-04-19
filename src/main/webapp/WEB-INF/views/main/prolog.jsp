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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap/navhead_custom.css" />
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css" />
<link rel="stylesheet"
	href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
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
					src="${pageContext.request.contextPath}/assets/img/logo.png"
					style="height: 70px" />
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
				<h4>A free landing page theme with video background</h4>
				<hr>
				<a href="#video-background" id="toggleVideo" data-toggle="collapse"
					class="btn btn-primary btn-xl">Toggle Video</a> &nbsp; <a
					href="#one" class="btn btn-primary btn-xl page-scroll">Get
					Started</a>
			</div>
		</div>
		<video src="" autoplay loop="loop"
			class="fillWidth fadeIn wow collapse in"></video>

	</header>
	<section class="bg-primary" id="one">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 text-center">
					<h1 class="margin-top-0 text-primary">
						<b>Welcome !</b>
					</h1>
					<br>
					<p class="text-faded">우리 쿠쿠는 정서적 건강과 웰빙 서비스로 예약이나 까다로운 절차 없이
						익명으로 간단한 가입을 통하여 친구처럼 실시간으로 고민을 나눌수 있습니다. 다양한 경험을 가지고있는 수 많은 리스너들은
						당신에게 문제를 해결 하고 직접적인 답을 내려 주는 것이 아니라 경청해주고 소통을 나눕니다. 마음이 지치고, 힘들고,
						홀로 외로울 때, 나만의 고통 속에서 몸부림 칠 때... 언제든지 편안한 마음으로 찾아와 마음속 응어리를 털어
						놓으세요.</p>
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

	<section class="bg-primary" id="four">
		<div class="row">
			<div
				class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
				<h2 class="text-center text-primary">Features</h2>
				<hr>
				<div class="media wow fadeInRight">
					<h2>실시간 상담</h2>
					<div class="media-body media-middle">
						<p>원하는 상담 주제를 선택해서 상담을 해주거나 받아볼 수 있습니다!</p>
					</div>
					<div class="media-right">
						<i class="icon-lg ion-ios-bolt-outline"></i>
					</div>
				</div>
				<hr>
				<div class="media wow fadeIn">
					<h3>감정 분석</h3>
					<div class="media-left">
						<a href="#alertModal" data-toggle="modal"
							data-target="#alertModal"><i
							class="icon-lg ion-ios-cloud-download-outline"></i></a>
					</div>
					<div class="media-body media-middle">
						<p>상담하면 감정분석을 해준다규!</p>
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
					<h2 class="margin-top-0 wow fadeIn">
						<b>메일 문의</b>
					</h2>
					<hr class="primary">
					<p>사이트 이용시 궁금한 점이나 건의 사항을 보내주세요.</p>
				</div>
				<div class="col-lg-10 col-lg-offset-1 text-center">
					<form class="contact-form row">
						<div class="col-md-4">
							<label></label> <input type="text" class="form-control"
								placeholder="이름">
						</div>
						<div class="col-md-4">
							<label></label> <input type="text" class="form-control"
								placeholder="이메일">
						</div>
						<div class="col-md-4">
							<label></label> <input type="text" class="form-control"
								placeholder="전화번호">
						</div>
						<div class="col-md-12">
							<label></label>
							<textarea class="form-control" rows="9"
								placeholder="건의 사항이나 불편 사항이 있다면 알려주세요^^ "></textarea>
						</div>
						<div class="col-md-4 col-md-offset-4">
							<label></label><br>
							<br>
							<button type="button" data-toggle="modal"
								data-target="#alertModal"
								class="btn btn-default btn-xl page-scroll">
								Send <i class="ion-android-arrow-forward"></i>

							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<div id="galleryModal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<img src="//placehold.it/1200x700/222?text=..." id="galleryImage"
						class="img-responsive" />
					<p>
						<br />
						<button class="btn btn-primary btn-lg center-block"
							data-dismiss="modal" aria-hidden="true">
							Close <i class="ion-android-close"></i>
						</button>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div id="alertModal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body text-center">
					<!-- 					<h2 class="text-center">준비중 입니다 ㅠ_ㅠ</h2> -->
					<p class="text-center">메일 문의 서비스 준비중입니다 ㅠ_ㅠ</p>
					<br />
					<button class="btn btn-default btn-xl page-scroll"
						data-dismiss="modal" aria-hidden="true">
						OK <i class="ion-android-close"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
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