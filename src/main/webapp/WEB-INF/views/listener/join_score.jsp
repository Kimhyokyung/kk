<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
</head>
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
									<div style="width: 510px; height: 420px; margin-left: 550; margin-top: 70;">
										<div id="login-box2">
											<div class="row">
												<div class="col-md-12">
													<header id="login-header">
														<div id="login-logo">
															<img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="" />
														</div>
													</header>
													<div id="login-box-inner">
													<h2>평가 수 : ${calculatedScore.rateNum }</h2>
													<h3></h3>
														
														<div class="profile-stars">
															<h2>도움성 
															<c:forEach var="hscore" begin = "1" end="${calculatedScore.helpness }" >
																<i class="fa fa-star"></i>
															</c:forEach>
															<c:choose>
																<c:when test="${calculatedScore.helpness <5 }">
																	<c:forEach var="hscore" begin = "${calculatedScore.helpness+1 }" end= "5">
																		<i class="fa fa-star-o"></i>
																	</c:forEach>
																</c:when>
															</c:choose>
															</h2>
														</div>
														
														<div class="profile-stars">
															<h2>전문성 
															<c:forEach var="hscore" begin = "1" end="${calculatedScore.professionalism }" >
																<i class="fa fa-star"></i>
															</c:forEach>
															<c:choose>
																<c:when test="${calculatedScore.professionalism <5 }">
																	<c:forEach var="hscore" begin = "${calculatedScore.professionalism+1 }" end= "5">
																		<i class="fa fa-star-o"></i>
																	</c:forEach>
																</c:when>
															</c:choose>
															</h2>
														</div>
														
														<div class="profile-stars">
															<h2>공감성 
															<c:forEach var="hscore" begin = "1" end="${calculatedScore.sympathy }" >
																<i class="fa fa-star"></i>
															</c:forEach>
															<c:choose>
																<c:when test="${calculatedScore.sympathy <5 }">
																	<c:forEach var="hscore" begin = "${calculatedScore.sympathy+1 }" end= "5">
																		<i class="fa fa-star-o"></i>
																	</c:forEach>
																</c:when>
															</c:choose>
															</h2>
														</div>
														<div class="profile-stars">
															<h2>응답 수준 
															<c:forEach var="hscore" begin = "1" end="${calculatedScore.responsibility }" >
																<i class="fa fa-star"></i>
															</c:forEach>
															<c:choose>
																<c:when test="${calculatedScore.responsibility <5 }">
																	<c:forEach var="hscore" begin = "${calculatedScore.responsibility+1 }" end= "5">
																		<i class="fa fa-star-o"></i>
																	</c:forEach>
																</c:when>
															</c:choose>
															</h2>
														</div>
														<h3></h3>
														
														<div class="profile-stars">
															<h2>총점 
															<c:forEach var="hscore" begin = "1" end="${calculatedScore.total_avg }" >
																<i class="fa fa-star"></i>
															</c:forEach>
															<c:choose>
																<c:when test="${calculatedScore.total_avg <5 }">
																	<c:forEach var="hscore" begin = "${calculatedScore.total_avg+1 }" end= "5">
																		<i class="fa fa-star-o"></i>
																	</c:forEach>
																</c:when>
															</c:choose>
															</h2>
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
		</div>
	</div>
</body>
</html>