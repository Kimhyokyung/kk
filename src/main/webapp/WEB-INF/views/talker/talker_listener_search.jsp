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
						<div class="col-lg-12">
							<div class="main-box no-header clearfix">
								<div class="col-lg-12">
									<h4 class="text-center" style="color: #000; font-size: 1.5rem;">누구와
										이야기를 나누고 싶으 십니까??</h4>
									<form action="/BrowseListeners/" method="get" role="form"
										style="padding: 12px 12px 0">
										<div class="row">
											<div class="form-group col-xs-12 col-md-6 col-lg-6 col-xl-6">
												<label class="sr-only" for="expertise">Category</label> <select
													name="expertise" id="expertise"
													class="form-control form-control-sm">
													<option value="">상담 주제</option>
													<option value="직장문제">직장문제</option>
													<option value="학교문제">학교문제</option>
													<option value="진로상담">진로상담</option>
													<option value="금주/금연">금주/금연</option>
													<option value="재정 문제">재정 문제</option>
													<option value="다이어트">다이어트</option>
													<option value="이성 문제">이성 문제</option>
													<option value="기타">기타</option>
												</select>
											</div>
											<div class="form-group col-xs-12 col-md-6 col-lg-6 col-xl-6">
												<label class="sr-only" for="sortby">Sort By</label> <select
													name="sortby" id="sortby"
													class="form-control form-control-sm">
													<option value="">정렬 기준</option>
													<option value="availability">Availability</option>
													<option value="screenname">Screen Name</option>
													<option value="cheers">Cheers</option>
													<option value="chats">Chats</option>
													<option value="rating">Listener Rating</option>
												</select>
											</div>
										</div>
										<div style="margin-left: 450" class="form-group col-xs-3">
											<button type="submit" class="btn btn-info btn-sm btn-block">Search</button>
										</div>
									</form>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="main-box no-header clearfix">
										<div class="main-box-body clearfix">
											<div class="table-responsive">
												<table class="table user-list table-hover">
													<thead>
														<tr>
															<th><span>Nickname</span></th>
															<th><span>상담 주제</span></th>
															<th class="text-center"><span>접속 상태</span></th>
															<th><span>이메일</span></th>
															<th>&nbsp;</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><img
																src="${pageContext.request.contextPath}/assets/img/samples/george.png"
																alt=""> <a href="#" class="user-link">Hong</a></td>
															<td>직장 문제</td>
															<td class="text-center"><span
																class="label label-success">접속</span></td>
															<td><a href="#">hong@hong</a></td>
															<td style="width: 20%;"><a href="#"
																class="table-link"> <span class="fa-stack"> <i
																		class="fa fa-square fa-stack-2x"></i> <i
																		class="fa fa-envelope-o fa-stack-1x fa-inverse"></i>
																</span>
															</a> <a href="#" class="table-link"> <span
																	class="fa-stack"> <i
																		class="fa fa-square fa-stack-2x"></i> <i
																		class="fa fa-comment fa-stack-1x fa-inverse"></i>
																</span>
															</a></td>
														</tr>
														<tr>
															<td><img
																src="${pageContext.request.contextPath}/assets/img/samples/user-profile-1.png"
																alt=""> <a href="#" class="user-link">Kim</a> <span
																class="user-subhead">Admin</span></td>
															<td>진로 상담</td>
															<td class="text-center"><span
																class="label label-default">비접속</span></td>
															<td><a href="#">kim@kim</a></td>
															<td style="width: 20%;"><a href="#"
																class="table-link"> <span class="fa-stack"> <i
																		class="fa fa-square fa-stack-2x"></i> <i
																		class="fa fa-envelope-o fa-stack-1x fa-inverse"></i>
																</span>
															</a> <a href="#" class="table-link"> <span
																	class="fa-stack"> <i
																		class="fa fa-square fa-stack-2x"></i> <i
																		class="fa fa-comment fa-stack-1x fa-inverse"></i>
																</span>
															</a></td>
														</tr>
														<tr>
															<td><img
																src="${pageContext.request.contextPath}/assets/img/samples/emma.png"
																alt=""> <a href="#" class="user-link">Ha</a></td>
															<td>학업 문제</td>
															<td class="text-center"><span
																class="label label-default">비접속</span></td>
															<td><a href="#">ha@ha</a></td>
															<td style="width: 20%;"><a href="#"
																class="table-link"> <span class="fa-stack"> <i
																		class="fa fa-square fa-stack-2x"></i> <i
																		class="fa fa-envelope-o fa-stack-1x fa-inverse"></i>
																</span>
															</a> <a href="#" class="table-link"> <span
																	class="fa-stack"> <i
																		class="fa fa-square fa-stack-2x"></i> <i
																		class="fa fa-comment fa-stack-1x fa-inverse"></i>
																</span>
															</a></td>
														</tr>
														<tr>
															<td><img
																src="${pageContext.request.contextPath}/assets/img/samples/robert.png"
																alt=""> <a href="#" class="user-link">Taek</a> <span
																class="user-subhead">Admin</span></td>
															<td>금주/금연</td>
															<td class="text-center"><span
																class="label label-success">접속</span></td>
															<td><a href="#">taek@taek</a></td>
															<td style="width: 20%;"><a href="#"
																class="table-link"> <span class="fa-stack"> <i
																		class="fa fa-square fa-stack-2x"></i> <i
																		class="fa fa-envelope-o fa-stack-1x fa-inverse"></i>
																</span>
															</a> <a href="#" class="table-link"> <span
																	class="fa-stack"> <i
																		class="fa fa-square fa-stack-2x"></i> <i
																		class="fa fa-comment fa-stack-1x fa-inverse"></i>
																</span>
															</a></td>
														</tr>
														<tr>
															<td><img
																src="${pageContext.request.contextPath}/assets/img/samples/ryan.png"
																alt=""> <a href="#" class="user-link">KKu</a> <span
																class="user-subhead">Admin</span></td>
															<td>기타</td>
															<td class="text-center"><span
																class="label label-success">접속</span></td>
															<td><a href="#">kku@kku</a></td>
															<td style="width: 20%;"><a href="#"
																class="table-link"> <span class="fa-stack"> <i
																		class="fa fa-square fa-stack-2x"></i> <i
																		class="fa fa-envelope-o fa-stack-1x fa-inverse"></i>
																</span>
															</a> <a href="#" class="table-link"> <span
																	class="fa-stack"> <i
																		class="fa fa-square fa-stack-2x"></i> <i
																		class="fa fa-comment fa-stack-1x fa-inverse"></i>
																</span>
															</a></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="text-center loadMore">
												<button onclick="showMore()" class="btn btn-info">더
													많은 리스너 보기</button>
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





























