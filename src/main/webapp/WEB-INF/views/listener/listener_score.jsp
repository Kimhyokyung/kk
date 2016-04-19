<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<html>
<body>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				<div id="login-full-wrapper">
					<div class="container">
						<div class="row">
							<div class="col-xs-12">
								<div id="login-box2">
									<div class="row">
										<div class="col-xs-12">
											<header id="login-header">
												<div id="login-logo">
													<img src="${pageContext.request.contextPath}/assets/img/logo-black.png" alt="" />
												</div>
											</header>
											<div id="login-box-inner">
											<table id="rateTable">
												<caption>평가 수 : ${calculatedScore.rateNum}</caption>
												<tr class="profile-stars">
													<td> 도움성</td>
													<td> 
														<c:forEach var="hscore" begin="1" end="${calculatedScore.helpness}">
															<i class="fa fa-star"></i>
														</c:forEach>
														<c:choose>
															<c:when test="${calculatedScore.helpness <5}">
																<c:forEach var="hscore"
																	begin="${calculatedScore.helpness+1}" end="5">
																	<i class="fa fa-star-o"></i>
																</c:forEach>
															</c:when>
														</c:choose>
													</td>
												</tr>
												<tr class="profile-stars">
													<td> 전문성</td>
													<td> 
														<c:forEach var="hscore" begin="1" end="${calculatedScore.professionalism}">
															<i class="fa fa-star"></i>
														</c:forEach>
														<c:choose>
															<c:when test="${calculatedScore.professionalism <5}">
																<c:forEach var="hscore" begin="${calculatedScore.professionalism+1}" end="5">
																	<i class="fa fa-star-o"></i>
																</c:forEach>
															</c:when>
														</c:choose>
													</td>
												</tr>
												<tr class="profile-stars">
													<td>
														공감성</td>
														<td> 
														<c:forEach var="hscore" begin="1" end="${calculatedScore.sympathy}">
															<i class="fa fa-star"></i>
														</c:forEach>
														<c:choose>
															<c:when test="${calculatedScore.sympathy <5}">
																<c:forEach var="hscore" begin="${calculatedScore.sympathy+1}" end="5">
																	<i class="fa fa-star-o"></i>
																</c:forEach>
															</c:when>
														</c:choose>
													</td>
												</tr>
												<tr class="profile-stars">
													<td>
														응답 수준</td>
														<td> 
														<c:forEach var="hscore" begin="1" end="${calculatedScore.responsibility }">
															<i class="fa fa-star"></i>
														</c:forEach>
														<c:choose>
															<c:when test="${calculatedScore.responsibility <5 }">
																<c:forEach var="hscore" begin="${calculatedScore.responsibility+1 }" end="5">
																	<i class="fa fa-star-o"></i>
																</c:forEach>
															</c:when>
														</c:choose>
													</td>
												</tr>
												<tr class="profile-stars">
													<td> 총점</td>
													<td> 
														<c:forEach var="hscore" begin="1" end="${calculatedScore.total_avg }">
															<i class="fa fa-star"></i>
														</c:forEach>
														<c:choose>
															<c:when test="${calculatedScore.total_avg <5 }">
																<c:forEach var="hscore" begin="${calculatedScore.total_avg+1 }" end="5">
																	<i class="fa fa-star-o"></i>
																</c:forEach>
															</c:when>
														</c:choose>
													</td>
												</tr>
											</table>
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