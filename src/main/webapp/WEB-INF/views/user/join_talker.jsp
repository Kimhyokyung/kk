<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<body>
	<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
	<div id="page-wrapper">
		<div class="row">
			<c:import url="/WEB-INF/views/include/nav_sidebar.jsp"></c:import>
			<div id="content-wrapper">

				<div class="container">
					<div id="login-full-wrapper">
						<div class="row" margin:auto>
							<div class="col-xs-12">
								<div style="width: 510px; height: 420px;">

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
														action="joinsuccess">
														스트레스정도 :
															<input type="radio" name="stress_degree" value="1">1
															<input type="radio" name="stress_degree" value="2">2
															<input type="radio" name="stress_degree" value="3">3
															<input type="radio" name="stress_degree" value="4">4
															<input type="radio" name="stress_degree" value="5">5
															<input type="radio" name="stress_degree" value="6">6
															<input type="radio" name="stress_degree" value="7">7
															<input type="radio" name="stress_degree" value="8">8
															<input type="radio" name="stress_degree" value="9">9
															<input type="radio" name="stress_degree" value="10">10
														

														<div class="form-group">
															<label>상담주제를 선택하여 주세요^.^</label></br> <select
																class="form-control" name="consulting_topic">
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
														<div style="width: 340px; height: 80px; margin: auto">
															<button type="submit"
																class="btn btn-primary col-xs-12 btn-facebook">
																</i> 회원가입완료
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
