<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<script type="text/javascript">
	$(function() {
		$("#button-unlock").click(
				function() {
					var modify_pw = $("#password-unlock").val();
					console.log(modify_pw);
					if (modify_pw == "" || modify_pw == null
							|| modify_pw == 'undefined') {
						alert("비밀번호를 입력해주세요.");
						return;
					}
					$.ajax({
						url : "/kuku/user/modify_check?modify_pw=" + modify_pw,
						type : "get",
						dataType : "json",
						data : "",
						success : function(response) {
							console.log("뀨 리스폰 success!");
							console.log(response);

							if (response.isEqual == true) {
								var modify_lock = document.getElementById('modify_lock');
								modify_lock.action ="modifyform";
								modify_lock.submit();

							} else {
								alert("비밀번호를 확인하세요.");
								$("#password-unlock").focus();
								return;
							}
						}
					});
				});
	});
</script>
<html>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
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
													<div id="login-logo"></div>
												</header>
												<div id="login-box-inner">
													<form role="form" method="post" id="modify_lock">

														<div class="input-group">
															<span class="input-group-addon"><i
																class="fa fa-lock"></i></span> <input type="password"
																class="form-control" id="password-unlock"
																placeholder="Enter password">
														</div>
														<div class="row">
															<div class="col-xs-12">
																<button id="button-unlock" type="submit"
																	class="btn btn-success col-xs-12">Unlock</button>
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