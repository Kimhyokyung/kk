<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>kukuMental</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
$(function() {
// 	$("#email").change(function(){
// 		$("#button-checkEmail").show();
// 		$("#image-checkEmail").hide();
// 	});
	$("#button-checkemail").click(function() {
		var email = $("#email").val();
		console.log(email);
		if (email == "" || email == null || email == 'undefined') {
			alert("email을 입력해주세요.");
			return;
		}
		$.ajax({
			url : "/kuku/user/checkemail?email=" + email,
			type : "get",
			dataType : "json",
			data : "",
			
			//  contentType: "application/json",
			success : function(response) {
				console.log("success!");
				console.log(response);
				if (response.data == true) {
					alert("이미 존재하는 이메일입니다. 다른 이메일을 사용해 주세요");
					$("#email").focus();
					return;
				} else
					{
					alert("사용 가능한 이메일입니다.");
					$("#password").focus();
					return;
					}

				//이메일 사용 가능한 경우
// 				$("#button-checkEmail").hide();
// 				$("#image-checkEmail").show();
			}
		});
	});
});
</script>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<body>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				<c:import url="/WEB-INF/views/include/nav_sidebar.jsp"></c:import>
				<div id="content-wrapper">
					<div class="container">
						<div class="row">
							<div class="col-xs-12">
								<div id="login-box">
									<div class="row">
										<div class="col-xs-12">
											<header id="login-header">
												<div id="login-logo">
													<img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="" />
												</div>
											</header>
											<div id="login-box-inner">
												<script>
													function othersubmit(n) {
														if (n == 1) {
															document.otherform.action = "join";
														}
														if (n == 2) {
															document.otherform.action = "Listener_Questions.jsp";
														}
														document.other.submit();
													}
												</script>

												<form id="join-form" name="joinForm" method="post" action="join">
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-user"></i></span>
														<input class="form-control" type="text" placeholder="ID ( Email )" name="email" id="email">
													</div>
													
													<div id="remember-me-wrapper" class="row" >
													<div class="col-xs-12" >
														<input class="btn btn-success col-xs-12" id="button-checkemail" type="button" value="중복 확인 ">
<!-- 														<img src="/kukuMental/assets/images/check.png" id="image-checkemail" style="display:none; width:16px"> -->
													</div></div>			
													
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
														<input class="form-control"	type="password" placeholder="PassWord" name ="password">
													</div>
													
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-unlock-alt"></i></span>
														<input type="text" class="form-control" placeholder="NickName" name="nickname">
													</div>
													
													<div id="remember-me-wrapper"><div class="row">
															<div class="col-xs-12">
																<div class="checkbox-nice">
																	<input type="checkbox" id="terms-cond"	checked="checked" />
																	<label for="terms-cond"> I accept terms and conditions </label>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-xs-12 col-sm-6">
															<button type="submit"
																class="btn btn-primary col-xs-12 btn-facebook">
																</i> 토커로 회원가입
															</button>
														</div>
														<div class="col-xs-12 col-sm-6">
															<button type="submit"
																class="btn btn-primary col-xs-12 btn-twitter" formaction="join_Listener">
																</i> 리스너로 회원가입
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