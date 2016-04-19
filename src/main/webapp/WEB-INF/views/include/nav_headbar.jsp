<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
						$.ajax({
									url : "/kuku/main/nav_headbar",
									type : "post",
									dataType : "json",
									data : "",
									success : function(response) {
										console.log(response);
										console.log(window.location.href);
										//location.href = window.location.href;
										if ('${authUser}' == null
												|| '${authUser}' == ''
												|| '${authUser}' == 'undefined') {
											return;
										}

										if ('${userType}' == 'talker') {
											$('#aaa').load(
													window.location.href
															+ ' #tk-msg-cnt');
											var msg_div = document
													.getElementById('tk-msg-cnt');

											if (response.messageCount != 0) {
												msg_div.innerHTML = "<a href=\"/kuku/chat/my_chat_room\">나의 채팅<span class=\"badge badge-danger\">"
														+ response.messageCount
														+ "</span></a>";
											} else {
												msg_div.innerHTML = "<a href=\"/kuku/chat/my_chat_room\">나의 채팅<span class=\"badge badge-danger\"></span></a>";
											}
										} else if ('${userType}' == 'listener') {
											$('#aaa').load(
													window.location.href
															+ ' #ls-msg-cnt');
											var msg_div = document
													.getElementById('ls-msg-cnt');
											$('#aaa').load(
													window.location.href
															+ ' #ls-req-cnt');
											var req_div = document
													.getElementById('ls-req-cnt');
											if (response.messageCount != 0) {
												msg_div.innerHTML = "<a href=\"/kuku/chat/my_chat_room\">나의 채팅<span class=\"badge badge-danger\">"
														+ response.messageCount
														+ "</span></a>";
											} else {
												msg_div.innerHTML = "<a href=\"/kuku/chat/my_chat_room\">나의 채팅<span class=\"badge badge-danger\"></span></a>";
											}
											if (response.requestCount != 0) {
												req_div.innerHTML = "<a href=\"/kuku/listener/request_chatlist\">요청 보기<span class=\"badge badge-danger\">"
														+ response.requestCount
														+ "</span></a>";
											} else {
												req_div.innerHTML = "<a href=\"/kuku/listener/request_chatlist\">요청 보기<span class=\"badge badge-danger\"></span></a>";
											}
										}
									}
								});

						setInterval(
								function() {
									$
											.ajax({
												url : "/kuku/main/nav_headbar",
												type : "post",
												dataType : "json",
												data : "",
												success : function(response) {
													console.log(response);
													console
															.log(window.location.href);
													//location.href = window.location.href;
													if ('${authUser}' == null
															|| '${authUser}' == ''
															|| '${authUser}' == 'undefined') {
														return;
													}

													if ('${userType}' == 'talker') {
														$('#aaa')
																.load(
																		window.location.href
																				+ ' #tk-msg-cnt');
														var msg_div = document
																.getElementById('tk-msg-cnt');

														if (response.messageCount != 0) {
															msg_div.innerHTML = "<a href=\"/kuku/chat/my_chat_room\">나의 채팅<span class=\"badge badge-danger\">"
																	+ response.messageCount
																	+ "</span></a>";
														} else {
															msg_div.innerHTML = "<a href=\"/kuku/chat/my_chat_room\">나의 채팅<span class=\"badge badge-danger\"></span></a>";
														}
													} else if ('${userType}' == 'listener') {
														$('#aaa')
																.load(
																		window.location.href
																				+ ' #ls-msg-cnt');
														var msg_div = document
																.getElementById('ls-msg-cnt');
														$('#aaa')
																.load(
																		window.location.href
																				+ ' #ls-req-cnt');
														var req_div = document
																.getElementById('ls-req-cnt');
														if (response.messageCount != 0)
															msg_div.innerHTML = "<a href=\"/kuku/chat/my_chat_room\">나의 채팅<span class=\"badge badge-danger\">"
																	+ response.messageCount
																	+ "</span></a>";
														else
															msg_div.innerHTML = "<a href=\"/kuku/chat/my_chat_room\">나의 채팅<span class=\"badge badge-danger\"></span></a>";

														if (response.requestCount != 0) {
															req_div.innerHTML = "<a href=\"/kuku/listener/request_chatlist\">요청 보기<span class=\"badge badge-danger\">"
																	+ response.requestCount
																	+ "</span></a>";
														} else {
															req_div.innerHTML = "<a href=\"/kuku/listener/request_chatlist\">요청 보기<span class=\"badge badge-danger\"></span></a>";
														}
													}
												}
											});
								}, 5000); // 3000ms(3초)가 경과하면 이 함수가 실행됩니다.
								
					 	 $page = jQuery(location).attr('pathname');
						    if(!$page) {
						        $page = '/kuku/main/index';
						    }
						    console.log('page : '+$page);
						    $('.nav li a').each(function(){
						        var $href = $(this).attr('href');
						        console.log('href : '+$href);
						        if ( ($href == $page) || ($href == '') ) {
						            $(this).addClass('selected');
						        } else {
						            $(this).removeClass('selected');
						        }
						    }); 
					});
</script>
<header>
	<nav id="topNav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="/kuku/main" id="logo" class="navbar-brand"> <img
					src="${pageContext.request.contextPath}/assets/img/logo.png" alt=""
					class="normal-logo logo-white" /> <img
					src="${pageContext.request.contextPath}/assets/img/logo-black.png"
					alt="" class="normal-logo logo-black" /> <img
					src="${pageContext.request.contextPath}/assets/img/logo-small.png"
					alt="" class="small-logo hidden-xs hidden-sm hidden" />
				</a>
			</div>
			<div class="clearfix">
				<div class="nav-no-collapse pull-right" id="header-nav">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>

				<div class="collapse navbar-collapse navbar_static-top">
					<ul class="nav navbar-nav navbar-right">
						<c:set var="userType" value="${userType}" />
						<c:choose>
							<c:when test="${empty authUser}">
								<ul class="nav navbar-nav navbar-center">
									<li><a href="/kuku/user/select_join_type">회원가입</a></li>
									<li><a href="/kuku/user/loginform">로그인</a></li>
									<li class="dropdown profile-dropdown"><a><span
											class="hidden-xs">게스트님 안녕하세요</span></a></li>
								</ul>
							</c:when>
							<c:when test="${userType eq 'talker'}">
								<ul class="nav navbar-nav navbar-center">
									<li id="tk-msg-cnt"><a href="/kuku/chat/my_chat_room">나의
											채팅<span class="badge badge-danger"></span>
									</a></li>
									<li><a href="/kuku/talker/talker_listener_search">리스너
											찾기</a></li>
									<li><a href="/kuku/talker/my_kuku_stat">내 쿠크 상태</a></li>
									<li><a href="/kuku/user/modify_lock">마이 페이지</a></li>
									<li><a href="/kuku/user/logout">로그아웃</a></li>
								</ul>
								<li class="dropdown profile-dropdown"><a><span
										class="hidden-xs"><h7 style="color:#000;">${sessionScope.authUser.nickname}</h7>님안녕하세요</span></a></li>
							</c:when>
							<c:when test="${userType eq 'listener' }">
								<ul class="nav navbar-nav navbar-center">
									<li id="ls-msg-cnt"><a href="/kuku/chat/my_chat_room">나의
											채팅<span class="badge badge-danger"></span>
									</a></li>
									<li id="ls-req-cnt"><a
										href="/kuku/listener/request_chatlist">요청 보기<span
											class="badge badge-danger"></span></a></li>
									<li><a href="/kuku/listener/listener_score">평가 보기</a></li>
									<li><a href="/kuku/user/modify_lock">마이 페이지</a></li>
									<li><a href="/kuku/user/logout">로그아웃</a></li>
								</ul>
								<li class="dropdown profile-dropdown"><a><span
										class="hidden-xs"><h7 style="color:#000;">${sessionScope.authUser.nickname}</h7>님안녕하세요</span></a></li>
							</c:when>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</header>