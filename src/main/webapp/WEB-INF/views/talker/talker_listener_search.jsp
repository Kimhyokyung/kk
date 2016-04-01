<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#searchBtn').on(
				"click",
				function(event) {
					self.location = "talker_listener_search"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" + $('#keywordInput').val();
				});
	});
</script>
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
									<h4 class="text-center" style="color: #000; font-size: 1.5rem;">누구와	이야기를 나누고 싶으 십니까??</h4>
<!--정렬추가부분 -->
									<div class="row">
										<div class="form-group col-xs-12 col-md-4 col-lg-4 col-xl-4">
											<label class="sr-only" for="expertise">Category</label>
											<select	name="searchType" id="expertise" class="form-control form-control-sm">
												<option value="n"
													<c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
												<option value="t"
													<c:out value="${cri.searchType eq 't'?'selected':''}"/>>상담 주제</option>
											</select>
										</div>
										<div class="form-group col-xs-12 col-md-4 col-lg-4 col-xl-4">
											<select name="keyword" id="keywordInput" class="form-control">
												<option value="직장문제">직장문제</option>
												<option value="학교문제">학교문제</option>
												<option value="진로상담">진로상담</option>
												<option value="금주/금연">금주/금연</option>
												<option value="재정문제">재정 문제</option>
												<option value="다이어트">다이어트</option>
												<option value="이성 문제">이성 문제</option>
												<option value="기타">기타</option>
											</select>
										</div>
										<button id='searchBtn' class="btn btn-success">Search</button>
									</div>
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
														<c:choose>
															<c:when test="${fn:length(list) > 0 }">
																<c:forEach items="${list }" var="ListenerVo">
																	<tr>
																		<td><img src="${pageContext.request.contextPath}/assets/img/samples/ryan.png" alt="">
																		${ListenerVo.nickname} <span class="user-subhead">Listener</span></td>
																	
																		<td>${ListenerVo.consulting_topic}</td>
																		
																		<td class="text-center"><span class="label label-success">접속</span></td>
																	
																		<td>${ListenerVo.email}</td>
																	
																		<td style="width: 20%;"><a href="#"	class="table-link"> <span class="fa-stack">
																		<i class="fa fa-square fa-stack-2x"></i>
																		<i class="fa fa-envelope-o fa-stack-1x fa-inverse"></i>
																</span>
															</a> <a href="#" class="table-link"> <span
																	class="fa-stack"> <i
																		class="fa fa-square fa-stack-2x"></i> <i
																		class="fa fa-comment fa-stack-1x fa-inverse"></i>
																</span>
															</a></td>
																	
																	</tr>
																</c:forEach>
															</c:when>
														
														<c:otherwise>
														<tr><td colspan="5">조회된 결과가 없습니다.</td></tr>
														</c:otherwise>
														</c:choose>
													</tbody>
												</table>
											</div>

											<div class="table-responsive">
												<ul class="pagination pull-right">
													<c:if test="${pageMaker.prev }">
														<li><a href="talker_listener_search${pageMaker.makeSearch(pageMaker.startPage -1) }">&laquo;</a></li>
													</c:if>

													<c:forEach begin="${pageMaker.startPage }"
														end="${pageMaker.endPage }" var="idx">
														<li
															<c:out value="${pageMaker.cri.page == idx?' class=active':''}" />>
															<a href="talker_listener_search${pageMaker.makeSearch(idx) }">${idx }</a>
														</li>
													</c:forEach>

													<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
														<li><a href="talker_listener_search${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
													</c:if>
												</ul>
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
