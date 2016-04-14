<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<html>
<head>
<title>kukuMental</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<script type="text/javascript">
	//이메일 중복확인
	$(function() {
		$("#button-checkemail").click( function() {
				var email = $("#email").val();
				console.log(email);
				if (email == "" || email == null || email == 'undefined') {
					alert("email을 입력해주세요.");
					return;
				}
				
				$.ajax({
					url : "/kuku/user/check_email?email=" + email,
					type : "get",
					dataType : "json",
					data : "",
					success : function(response) {
						console.log("success!");
						console.log(response);
						
						// UserController의 check_type함수에서 넘겨준  map값이 response에서 담겨온다
						// response에는 이메일이 존재하는지 판단하는 불린값이 있음
						if (response.exist == true) {
							alert("이미 존재하는 이메일입니다. 다른 이메일을 사용해 주세요");
							$("#email").focus();
							return;
						} else {
							alert("사용 가능한 이메일입니다.");
							document.getElementById('btn_next').disabled = false;
							$("#password").focus();
							return;
						}
					}
				});
		});
	});
	
	//토커 회원가입 
	function selectChkBox(button) {
		var joinform = document.getElementById('join-form');
		console.log(joinform.terms_cond);
		if (joinform.password.value == "") {
			alert("비밀번호를 입력하지 않았습니다.");
		} else if (joinform.password2.value == "") {
			alert("비밀번호를 입력하지 않았습니다.");
			//joinform.password2.focus();
			//return;
		} else if (joinform.password.value.length<4 || joinform.password.value.length>12) {
			alert("비밀번호를 4~12자까지 입력해주세요.");
			joinform.password.focus();
			return;
		} else if (joinform.nickname.value == "") {
			alert("닉네임을 입력하지 않았습니다.");
			joinform.nickname.focus();
			return;
		} else if (!(joinform.terms_cond.checked)) {
			
			alert("이용약관과 개인정보 수집 및 이용에 대한 안내를 모두 동의해 주세요.");
			joinform.terms_cond.focus();
			return;
		} 
		//비밀번호와 비밀번호 확인 일치여부 체크
		else if (joinform.password.value != joinform.password2.value) {
			alert("비밀번호가 일치하지 않습니다");
			joinform.pwdConfirm.focus();
			return;
		} else {
			var userType = "${sessionScope.userType}";
			console.log(userType);
			if (userType == "talker") {
				console.log("talker page");
				joinform.action = "join_talker";
				joinform.submit();
			} else if (userType == "listener") {
				console.log("listener page");
				joinform.action = "join_listener";
				joinform.submit();
			}
		}
	}
</script>
</head>
<body>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				
					<div id="login-full-wrapper">
						<div class="container">
							<div class="row">
								<div class="col-xs-12">
									<div id="login-box">
										<div class="row">
											<div class="col-xs-12">
												<header id="login-header">
													<div id="login-logo">
														<img
															src="${pageContext.request.contextPath}/assets/img/logo.png"
															alt="" />
													</div>
												</header>
												<div id="login-box-inner">
													<form id="join-form" name="joinForm" method="POST">
														<div class="row">
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-user"></i></span> <input class="form-control"
																	type="text" placeholder="이메일(ID)" name="email"
																	id="email">
															</div>

															<div id="remember-me-wrapper" class="row">
																<div class="col-xs-12">
																	<input class="btn btn-success col-xs-12"
																		id="button-checkemail" type="button" value="중복 확인 ">
																</div>
															</div>

															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-envelope"></i></span> <input class="form-control"
																	type="password" placeholder="패스워드" name="password">
															</div>

															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-envelope"></i></span> <input class="form-control"
																	type="password" placeholder="패스워드 확인" name="password2">
															</div>

															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-unlock-alt"></i></span> <input type="text"
																	class="form-control" placeholder="닉네임" name="nickname">
															</div>
															<div class="form-group">
																<h4 align="center">상담 주제를 선택해주세요. ^.^</h4><br>
																<select class="form-control" name="consulting_topic">
																	<option value="직장문제">직장문제</option>
																	<option value="학교문제">학교문제</option>
																	<option value="진로상담">진로상담</option>
																	<option value="금주/금연">금주/금연</option>
																	<option value="재정 문제">재정 문제</option>
																	<option value="다이어트">다이어트</option>
																	<option value="이성문제">이성문제</option>
																	<option value="기타">기타</option>
																</select>
															</div>
															<div id="remember-me-wrapper">
																<div class="row">
																	<div class="col-xs-12">
																		<div class="checkbox-nice">
																			<input type="checkbox" id="terms_cond" name="terms_cond"
																				checked="checked"/> <label for="terms_cond">
																				회원 가입에 동의하시겠습니까? </label>
																		</div>
																	</div>
																</div>
															</div>
															<div style="width: 315px; height: 80px; margin: auto">
																<button type="submit"
																	class="btn btn-primary col-xs-12 btn-facebook"
																	onClick="selectChkBox(this)" value="next"
																	disabled="disabled" id="btn_next">
																	다음으로
																</button>
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
</body>
</html>