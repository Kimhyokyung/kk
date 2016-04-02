<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
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

	function clickChat(email, nick) {
		var listenerEmail = document.getElementById('listener_email');
		listenerEmail.value = email;
		
		var listenerNick = document.getElementById('listener_nick');
		listenerNick.value = nick;
		
		chatform = document.getElementById('chat-form');
		chatform.action = "/kuku/chat/my_chat_room";
		chatform.submit();
	}
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
									<h4 class="text-center" style="color: #000; font-size: 1.5rem;">누구와 이야기를 나누고 싶으십니까?</h4>
									<!--정렬추가부분 -->
									<div class="row">
										<div class="form-group col-xs-12 col-md-4 col-lg-4 col-xl-4">
											<label class="sr-only" for="expertise">Category</label> <select
												name="searchType" id="expertise"
												class="form-control form-control-sm">
												<option value="n"
													<c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
												<option value="t"
													<c:out value="${cri.searchType eq 't'?'selected':''}"/>>상담주제</option>
											</select>
										</div>
										<div class="form-group col-xs-12 col-md-4 col-lg-4 col-xl-4">
											<select name="keyword" id="keywordInput" class="form-control">
												<option value="직장문제">직장문제</option>
												<option value="학교문제">학교문제</option>
												<option value="진로상담">진로상담</option>
												<option value="금주/금연">금주/금연</option>
												<option value="재정문제">재정문제</option>
												<option value="다이어트">다이어트</option>
												<option value="이성문제">이성문제</option>
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
												<form id="chat-form" method="post" style="padding: 12px 12px 0">
												<table class="table user-list table-hover">
													<thead>
														<tr>
															<th><span>닉네임</span></th>
															<th><span>상담 주제</span></th>
															<th class="text-center"><span>접속 상태</span></th>
															<th><span>이메일</span></th>
															<th>채팅하기</th>
														</tr>
													</thead>
													<tbody>
														<c:choose>
															<c:when test="${fn:length(list) > 0 }">
																<c:forEach items="${list}" var="listener">
																	<tr>
																		<td>
																			${listener.nickname} 
																			<span class="user-subhead">Listener</span>
																		</td>
																		<td>${listener.consulting_topic}</td>
																		<td class="text-center">
																			<c:set var="isDoing" value="true" /> 
																			<c:forEach items="${userMap}" var="user">
																				<c:if test="${listener.email == user.key}">
																					<span class="label label-success">접속</span>
																					<c:set var="isDoing" value="false" />
																				</c:if>
																			</c:forEach>
																			<c:if test="${isDoing}">
																				<span class="label label-default">비접속</span>
																			</c:if>
																		</td>
																		<td>${listener.email}</td>
																		<td style="width: 20%;">
																			<span class="fa-stack">
																				<i class="fa fa-square fa-stack-2x"></i> 
																				<i class="fa fa-comment fa-stack-1x fa-inverse" onclick="clickChat('${listener.email}', '${listener.nickname}');"></i>
																			</span>
																		</td>
																	</tr>
																</c:forEach>
															</c:when>
															<c:otherwise>
																<tr>
																	<td colspan="5">조회된 결과가 없습니다.</td>
																</tr>
															</c:otherwise>
														</c:choose>
													</tbody>
												</table>
											<input type="hidden" name="listener_email" id="listener_email">
											<input type="hidden" name="listener_nick" id="listener_nick">
											</form>
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