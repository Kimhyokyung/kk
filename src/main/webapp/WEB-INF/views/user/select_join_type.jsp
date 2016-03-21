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
<script type="text/javascript">
function clickTypeBtn(typeBtn) {
	var joinform = document.getElementById('join-form');
	
	if (typeBtn.value == "talker") {
		joinform.action = "joinform";
		joinform.submit();
	} else if (typeBtn.value == "listener") {
		joinform.action = "joinform";
		joinform.submit();
	}
}
</script>
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
										<div id="login-box1">
											<div class="row">
												<div class="col-md-12">
													<header id="login-header">
													<div id="login-logo">
														<img src="${pageContext.request.contextPath}/assets/img/logo.png"/>
													</div>
													</header>
													<div id="login-box-inner">
														<form id="join-form" name="joinForm" method="POST">
															<div class="row">
																<div class="col-xs-12 col-sm-6">
																	<button type="submit"
																		class="btn btn-primary col-xs-12 btn-facebook"
																		onClick="clickTypeBtn(this)" value="talker"
																		id="btn_talker">
																		</i> <h2>토커로 회원가입</h2>
																	</button>
																</div>
																<div class="col-xs-12 col-sm-6">
																	<button type="submit"
																		class="btn btn-primary col-xs-12 btn-twitter"
																		onClick="clickTypeBtn(this)" value="listener"
																		id="btn_listener">
																		</i> <h2>리스너로 회원가입</h2>
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