<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<body>
			<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
			<div id="page-wrapper">
				<div class="row" >
					<c:import url="/WEB-INF/views/include/nav_sidebar.jsp"></c:import>
					<div id="content-wrapper" >
					<div class="row-eq-height" >
						<div class="container" >
							<div class="row" align="center">
								<div class="col-xs-6" >
									<div id="login-box2">
										<div class="row">
											<div class="container">
												<header id="login-header">
													<div id="login-logo">
														<img
															src="${pageContext.request.contextPath}/assets/img/logo.png"
															alt="" />
													</div>
												</header>
												<div id="login-box-inner">
													<form id="join-form" name="joinForm" method="post"
														action="join">
													스트레스정도 :  <button type="button" class="btn btn-info">1</button>
													<button type="button" class="btn btn-info">2</button>
													<button type="button" class="btn btn-info">3</button>
													<button type="button" class="btn btn-info">4</button>
													<button type="button" class="btn btn-info">5</button>
													<button type="button" class="btn btn-warning">6</button>
													<button type="button" class="btn btn-warning">7</button>
													<button type="button" class="btn btn-danger">8</button>
													<button type="button" class="btn btn-danger">9</button>
													<button type="button" class="btn btn-danger">10</button></br></br>
														<div class="container">
															<div class="btn-group col-xs-12">
																<button type="button" class="btn btn-primary col-xs-12" >상담주제를 선택하여 주세요^.^</button>
																<button type="button"
																	class="btn btn-primary dropdown-toggle col-xs-12"
																	data-toggle="dropdown">
																	<span class="caret"></span>
																</button>
																<ul class="dropdown-menu" role="menu">
																	<li><a href="#">직장문제</a></li>
																	<li><a href="#">학교문제</a></li>
																	<li><a href="#">진로상담</a></li>
																	<li><a href="#">금주/금연</a></li>
																	<li><a href="#">재정 문제</a></li>
																	<li><a href="#">다이어트</a></li>
																	<li><a href="#">이성문제</a></li>
																	<li><a href="#">기타</a></li>
																</ul>
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
