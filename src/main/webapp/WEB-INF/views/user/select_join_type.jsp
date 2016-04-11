<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn_talker").click( function() {
				var type = $("#btn_talker").val();
				console.log(type);
				$.ajax({
					url : "/kuku/user/check_type?type=" + type,
					type : "get",
					dataType : "json",
					data : "",
					
					success : function(response) {
						console.log("success!");
						var joinForm = document.getElementById('join-form');
						joinForm.action="joinform";
						joinForm.submit();
					}
				});
		});
		
		$("#btn_listener").click( function() {
			var type = $("#btn_listener").val();
			console.log(type);
			$.ajax({
				url : "/kuku/user/check_type?type=" + type,
				type : "get",
				dataType : "json",
				data : "",
				success : function(response) {
					console.log("success!");
					var joinForm = document.getElementById('join-form');
					joinForm.action="joinform";
					joinForm.submit();
				}
			});
	});
});
</script>
<body>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				
					<div id="login-full-wrapper">
						<div id="login-box">
							<div id="login-box-holder">
					<!-- 	<div class="container"> -->
							<div class="row">
								<div class="col-xs-12">
										<div id="login-box1">
											<div class="row">
												<div class="col-md-12">
													<header id="login-header">
														<div id="login-logo">
															<img src="${pageContext.request.contextPath}/assets/img/logo.png"/>
														</div>
													</header>
													<div id="login-box-inner">
														<form id="join-form" name="joinForm" method="POST" action="joinform">
															<div class="row">
																<div align="center" style="height:40px">쿠크맨탈 회원가입</div>
																<div class="col-xs-12 col-sm-6">
																	<input type="button"
																		class="btn btn-primary col-xs-12 btn-facebook"
																		value="talker"
																		id="btn_talker">
																</div>
																<div class="col-xs-12 col-sm-6">
																	<input type="button"
																		class="btn btn-primary col-xs-12 btn-twitter"
																		value="listener"
																		id="btn_listener">
																</div>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>