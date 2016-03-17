<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<body>
		<div id="theme-wrapper">
			<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
			<div id="page-wrapper" class="container">
				<div class="row">
					<c:import url="/WEB-INF/views/include/nav_sidebar.jsp"></c:import>
					<div id="content-wrapper">
						<div id="login-box">
							<div id="login-box-holder">
								<div class="row">
									<div class="col-xs-12">
										<header id="login-header">
											<div id="login-logo">
												<img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="" />
											</div>
										</header>
										<div id="login-box-inner">
											<form role="form" action="index.html">
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-user"></i></span>
													<input class="form-control" type="text"
														placeholder="Email address">
												</div>
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-key"></i></span>
													<input type="password" class="form-control"
														placeholder="Password">
												</div>
												<div id="remember-me-wrapper">
													<div class="row">
														<div class="col-xs-6">
															<div class="checkbox-nice">
																<input type="checkbox" id="remember-me" checked="checked" />
																<label for="remember-me"> Remember me </label>
															</div>
														</div>
														<a href="forgot-password.html" id="login-forget-link"
															class="col-xs-6"> Forgot password? </a>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-12">
														<button type="submit" class="btn btn-success col-xs-12">Login</button>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-12">
														<p class="social-text">Or login with</p>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-12 col-sm-6">
														<button type="submit"
															class="btn btn-primary col-xs-12 btn-facebook">
															<i class="fa fa-facebook"></i> facebook
														</button>
													</div>
													<div class="col-xs-12 col-sm-6">
														<button type="submit"
															class="btn btn-primary col-xs-12 btn-twitter">
															<i class="fa fa-twitter"></i> Twitter
														</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<div id="login-box-footer">
								<div class="row">
									<div class="col-xs-12">
										Do not have an account? <a href="registration.html">
											Register now </a>
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