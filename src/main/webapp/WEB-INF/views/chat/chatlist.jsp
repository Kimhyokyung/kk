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
					<div id="page-wrapper" class="container">
						<div class="row">
							<div class="col-lg-12">
								<ol class="breadcrumb">
									<li><a href="#">Home</a></li>
									<li><a href="#">Users</a></li>
									<li class="active"><span>User Profile</span></li>
								</ol>
								<h1>User Profile</h1>
							</div>
						</div>

						<div class="row" id="user-profile">
							<div class="col-lg-3 col-md-4 col-sm-4">
								<div class="main-box clearfix">
									<header class="main-box-header clearfix">
										<h2>Scarlett Johansson</h2>
									</header>

									<div class="main-box-body clearfix">
										<div class="profile-status">
											<i class="fa fa-circle"></i> Online
										</div>

										<img src="${pageContext.request.contextPath}/assets/img/samples/scarlet-159.png" alt=""
											class="profile-img img-responsive center-block" />

										<div class="profile-label">
											<span class="label label-danger">Admin</span>
										</div>

										<div class="profile-stars">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i> <span>Super User</span>
										</div>

										<div class="profile-since">Member since: Jan 2012</div>

										<div class="profile-details">
											<ul class="fa-ul">
												<li><i class="fa-li fa fa-truck"></i>Orders: <span>456</span></li>
												<li><i class="fa-li fa fa-comment"></i>Posts: <span>828</span></li>
												<li><i class="fa-li fa fa-tasks"></i>Tasks done: <span>1024</span></li>
											</ul>
										</div>

										<div class="profile-message-btn center-block text-center">
											<a href="#" class="btn btn-success"> <i
												class="fa fa-envelope"></i> Send message
											</a>
										</div>
									</div>

								</div>
							</div>

							<div class="col-lg-9 col-md-8 col-sm-8">
								<div class="main-box clearfix">
									<div class="tabs-wrapper profile-tabs">
										<div class="conversation-wrapper">
											<div class="conversation-content">
												<div class="conversation-inner">

													<div class="conversation-item item-left clearfix">
														<div class="conversation-user">
															<img src="${pageContext.request.contextPath}/assets/img/samples/ryan.png" alt="" />
														</div>
														<div class="conversation-body">
															<div class="name">Ryan Gossling</div>
															<div class="time hidden-xs">September 21, 2013
																18:28</div>
															<div class="text">I don't think they tried to
																market it to the billionaire, spelunking, base-jumping
																crowd.</div>
														</div>
													</div>
													<div class="conversation-item item-right clearfix">
														<div class="conversation-user">
															<img src="${pageContext.request.contextPath}/assets/img/samples/kunis.png" alt="" />
														</div>
														<div class="conversation-body">
															<div class="name">Mila Kunis</div>
															<div class="time hidden-xs">September 21, 2013
																12:45</div>
															<div class="text">Normally, both your asses would
																be dead as fucking fried chicken, but you happen to pull
																this shit while I'm in a transitional period so I don't
																wanna kill you, I wanna help you.</div>
														</div>
													</div>
													<div class="conversation-item item-right clearfix">
														<div class="conversation-user">
															<img src="${pageContext.request.contextPath}/assets/img/samples/kunis.png" alt="" />
														</div>
														<div class="conversation-body">
															<div class="name">Mila Kunis</div>
															<div class="time hidden-xs">September 21, 2013
																12:45</div>
															<div class="text">Normally, both your asses would
																be dead as fucking fried chicken, but you happen to pull
																this shit while I'm in a transitional period so I don't
																wanna kill you, I wanna help you.</div>
														</div>
													</div>
													<div class="conversation-item item-left clearfix">
														<div class="conversation-user">
															<img src="${pageContext.request.contextPath}/assets/img/samples/ryan.png" alt="" />
														</div>
														<div class="conversation-body">
															<div class="name">Ryan Gossling</div>
															<div class="time hidden-xs">September 21, 2013
																18:28</div>
															<div class="text">I don't think they tried to
																market it to the billionaire, spelunking, base-jumping
																crowd.</div>
														</div>
													</div>
													<div class="conversation-item item-right clearfix">
														<div class="conversation-user">
															<img src="${pageContext.request.contextPath}/assets/img/samples/kunis.png" alt="" />
														</div>
														<div class="conversation-body">
															<div class="name">Mila Kunis</div>
															<div class="time hidden-xs">September 21, 2013
																12:45</div>
															<div class="text">Normally, both your asses would
																be dead as fucking fried chicken, but you happen to pull
																this shit while I'm in a transitional period so I don't
																wanna kill you, I wanna help you.</div>
														</div>
													</div>

												</div>
											</div>
											<div class="conversation-new-message">
												<form>
													<div class="form-group">
														<textarea class="form-control" rows="2"
															placeholder="Enter your message..."></textarea>
													</div>

													<div class="clearfix">
														<button type="submit" class="btn btn-success pull-right">Send
															message</button>
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