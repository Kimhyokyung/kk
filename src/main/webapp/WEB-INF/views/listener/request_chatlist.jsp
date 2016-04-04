<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
<script type="text/javascript">

	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "request_chatlist"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});
			});

	function clickRequest(idx) {
		$.ajax({
			url : "/kuku/listener/response_chat?idx=" + idx,
			type : "get",
			dataType : "json",
			data : "",
			success : function(response) {

				console.log(response.response);

				var listenerEmail = document.getElementById('idx');
				listenerEmail.value = idx;

				chatform = document.getElementById('request-form');
				chatform.action = "/kuku/chat/my_chat_room";
				chatform.submit();
			}
		})
	}
</script>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<body>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				<c:import url="/WEB-INF/views/include/nav_sidebar.jsp"></c:import>
				<div class="container">
					<div id="content-wrapper">
						<div class="row">
							<div class="col-lg-12">
								<div class="row">
									<div class="col-lg-12">
										<div class="main-box no-header clearfix">
											<div class="main-box-body clearfix">
												<div class="table-responsive">
													<form id="request-form" method="post" style="padding: 12px 12px 0">
													<table class="table user-list table-hover">
														<thead>
															<tr>
																<th><span>채팅요청목록</span></th>
																<th><span>상담주제</span></th>
																<th class="text-center"><span>접속상태</span></th>
																<th>요청응답</th>
															</tr>
														</thead>
														<tbody>
															<c:choose>
																<c:when test="${fn:length(list) > 0 }">
																	<c:forEach items="${list}" var="request">
																		<tr>
																			<td>${request.TALKER_NICKNAME}</td>
																			<td>${request.CONSULTING_TOPIC}</td>
																			<td class="text-center">
																				<c:set var="isDoing" value="true"/> 
																				<c:forEach items="${userMap}" var="user">
																					<c:if test="${request.TALKER_EMAIL == user.key}">
																						<span class="label label-success">접속</span>
																						<c:set var="isDoing" value="false" />
																					</c:if>
																				</c:forEach>
																				<c:if test="${isDoing}">
																					<span class="label label-default">비접속</span>
																				</c:if>
																			</td>
																			<td style="width: 20%;">
																				<span class="fa-stack">
																					<i class="fa fa-square fa-stack-2x"></i> 
																					<i class="fa fa-comment fa-stack-1x fa-inverse" onclick="clickRequest('${request.IDX}');"></i>
																				</span>
																			</td>
																		</tr>
																	</c:forEach>
																</c:when>
															</c:choose>
														</tbody>
													</table>
													<input type="hidden" name="idx" id="idx">
													</form>
												</div>
												<div class="table-responsive">
													<ul class="pagination pull-right">
														<c:if test="${pageMaker.prev }">
															<li><a href="request_chatlist${pageMaker.makeQuery(pageMaker.startPage -1) }">&laquo;</a></li>
														</c:if>

														<c:forEach begin="${pageMaker.startPage }"
															end="${pageMaker.endPage }" var="idx">
															<li
																<c:out value="${pageMaker.cri.page == idx?' class=active':''}" />>
																<a href="request_chatlist${pageMaker.makeQuery(idx) }">${idx }</a>
															</li>
														</c:forEach>
														<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
															<li><a href="request_chatlist${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
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
	</div>
</body>
</html>
