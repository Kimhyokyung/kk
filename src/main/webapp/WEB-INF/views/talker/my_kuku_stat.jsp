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
					<div class="row" id="user-profile">
						<div class="main-box clearfix">
							<header class="main-box-header clearfix">
								<h1>${sessionScope.authUser.nickname}</h1>
							</header>
							<div class="main-box-body clearfix">
								<div class="profile-status">
									<i class="fa fa-circle"></i> Online
								</div>

								<img src="${pageContext.request.contextPath}/assets/img/samples/scarlet-159.png" alt=""
									class="profile-img img-responsive center-block">

								<div class="profile-stars">
									<i class="fa fa-star-half"></i> 
									<i class="fa fa-star"></i> 
									<i class="fa fa-star"></i> 
									<i class="fa fa-star-o"></i> 
									<i class="fa fa-star:before"></i></br><span>내 쿠크 점수</span>
								</div>
								<div class="profile-details">
									<ul class="fa-ul">
										<li><i class="fa-li fa fa-user"></i>팔로우 수: <span> 3</span></li>
										<li><i class="fa-li fa fa-comment"></i>대화 창 수: <span> 2</span></li>
										<li><i class="fa-li fa fa-arrow-left"></i>전 방문 일자: <span> 2016-03-22</span></li>
									</ul>
								</div>

								<div class="profile-message-btn center-block text-center">
									<a href="/kuku/talker/my_kuku_stat2" class="btn btn-info"> <i
										class="fa fa-bar-chart-o"></i> 감정그래프 보기
									</a>
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