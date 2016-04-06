<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>kukuMental</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	
	
	//토커 회원가입 
	function selectChkBox(button) {
		console.log('selectChkBoc called');
		
		var updateform = document.getElementById('update-form');
		
		if (updateform.password.value == "") {
			alert("비밀번호를 입력하지 않았습니다.")
			updateform.password.focus()
			return;
		} else if (updateform.password2.value == "") {
			alert("비밀번호를 입력하지 않았습니다.")
			updateform.password2.focus()
			return;
		} else if (updateform.password.value.length<4 || updateform.password.value.length>12) {
			alert("비밀번호를 4~12자까지 입력해주세요.")
			updateform.password.focus()
			return;
		} else if (updateform.nickname.value == "") {
			alert("닉네임을 입력하지 않았습니다.")
			updateform.nickname.focus()
			return;
		}
		//비밀번호와 비밀번호 확인 일치여부 체크
		else if (updateform.password.value != updateform.password2.value) {
			alert("비밀번호가 일치하지 않습니다")
			updateform.pwdConfirm.focus()
			return;
		} else {	
			updateform.action = "update_user";
			updateform.submit();
		}
	}
	
	function deleteChkBox(button) {
		var updateform = document.getElementById('update-form');
		console.log('deleteChkBox called');
		updateform.action = "delete_user";
		updateform.submit();
	}
</script>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<body>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				<c:import url="/WEB-INF/views/include/nav_sidebar.jsp"></c:import>
				<div id="content-wrapper">
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
													<form id="update-form" name="updateForm" method="POST">
														<div class="row">
															<div class="input-group">
																<span class="input-group-addon"><i
																	class="fa fa-user"></i></span> <input class="form-control"
																	type="text" placeholder="${authUser.email}" name="email"
																	id="email" disabled>
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
																<h3 align="center">상담 주제를 선택해주세요. ^.^<br>
																</br> <select class="form-control" name="consulting_topic">
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
															<div style="width: 315px; height: 80px; margin: auto">
																<button
																	class="btn btn-primary col-xs-12 btn-facebook"
																	onClick="selectChkBox(this)" value="updateUser">
																	회원정보수정
																</button>
																<button
																	class="btn btn-danger col-xs-12"
																	onClick="deleteChkBox(this)" value="deleteUser">
																	회원탈퇴
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
	</div>
</body>
</html>