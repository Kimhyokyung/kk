<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<header class="navbar" id="header-navbar">
	<div class="container">
		<a href="/kuku/main" id="logo" class="navbar-brand"> <img
			src="${pageContext.request.contextPath}/assets/img/logo.png" alt=""
			class="normal-logo logo-white" /> <img
			src="${pageContext.request.contextPath}/assets/img/logo-black.png"
			alt="" class="normal-logo logo-black" /> <img
			src="${pageContext.request.contextPath}/assets/img/logo-small.png"
			alt="" class="small-logo hidden-xs hidden-sm hidden" />
		</a>
		<div class="clearfix">
			<div class="nav-no-collapse pull-right" id="header-nav">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>
			<div class="collapse navbar-collapse navbar_static-top">
				<ul class="nav navbar-nav pull-right">
					<c:set var="userType" value="${userType}" />
					<c:choose>
						<c:when test="${empty authUser}">
							<li><a href="/kuku/user/select_join_type">회원가입</a></li>
							<li><a href="/kuku/user/loginform">로그인</a></li>
							<li class="dropdown profile-dropdown">
							<a><span class="hidden-xs">게스트님 안녕하세요</span></a></li>
							<b class="caret"></b>

						</c:when>
						<c:when test="${userType eq 'talker'}">
							<ul class="nav navbar-nav navbar-center">
								<li><a href="/kuku/chat/my_chat_room">나의 채팅</a></li>
								<li><a href="/kuku/talker/talker_listener_search">리스너
										찾기</a></li>
								<li><a href="/kuku/talker/my_kuku_stat">내 쿠크 상태</a></li>
								<li><a href="/kuku/user/modify_lock">마이 페이지</a></li>
								<li><a href="/kuku/user/logout">로그아웃</a></li>
							</ul>
							<li class="dropdown profile-dropdown">
							<a><span class="hidden-xs"><B>${sessionScope.authUser.nickname}</B>님안녕하세요</span></a></li>
							<b class="caret"></b>
						</c:when>
						<c:when test="${userType eq 'listener' }">
							<ul class="nav navbar-nav navbar-center">
								<li><a href="/kuku/chat/my_chat_room">나의 채팅</a></li>
								<li><a href="/kuku/listener/request_chatlist">요청 보기</a></li>
								<li><a href="/kuku/listener/listener_score">평가 보기</a></li>
								<li><a href="/kuku/user/modify_lock">마이 페이지</a></li>
								<li><a href="/kuku/user/logout">로그아웃</a></li>
							</ul>
							<li class="dropdown profile-dropdown">
							<a><span class="hidden-xs"><B>${sessionScope.authUser.nickname}</B>님안녕하세요</span></a></li>
							<b class="caret"></b>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</header>

