<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<script type="text/javascript">
	var talker_email;
		
	function callModal(idx, email, nick) {
		talker_email = email;
		
		// 오늘 날짜 정보 가져오기
		var now = new Date();
		var month = (now.getMonth() + 1);
		var day = now.getDate();
		if (month < 10)
			month = "0" + month;
		if (day < 10)
			day = "0" + day;
		var today = now.getFullYear() + '-' + month + '-' + day;
		$('#datePicker').val(today);
		
		$('#bar').hide();
		$('#pie').show();
		$('#bar').on('click', function() {
			$('#pie').show();
			$('#bar').hide();
		})
		$('#pie').on('click', function() {
			$('#bar').show();
			$('#pie').hide();
		})
		
		$("#modalHeader").empty();
		$("#modalHeader").append("<button class=\"md-close close\" id=\"lsModalClose\">&times;</button>"+nick+"님 감정그래프<br>");
		
  		$('#lsModalClose').on('click', function() {$("#myModal").modal("hide");})
		$('#gochat').on('click', function () {clickRequest(idx);})
		$("#myModal").modal({backdrop:false});
		
		click_graph(null);
	}
	
	function click_graph(button) {
		var kukuday = $('#datePicker').val();
		var fileName;
		if (button == null) {
			fileName = talker_email + kukuday + 'bar_graph';
		} else {
			fileName = talker_email + kukuday + button.value + '_graph';
		}
		
		// 감정그래프 불러오기
		$.ajax({
			beforeSend : function() {
				var html = '<img src=' + '${pageContext.request.contextPath}' + '/assets/img/loading.gif>';
				var graphDiv = document.getElementById("kukugraph");
				graphDiv.innerHTML = html;
			},
			error : function() {
				var html = '<img src=' + '${pageContext.request.contextPath}' + '/assets/img/empty_data.png>';
				var graphDiv = document.getElementById("kukugraph");
				graphDiv.innerHTML = html;
			},
			url : "/kuku/talker/saveEmotionImage?fileName=" + fileName,
			type : "get",
			dataType : "json",
			data : "",
			success : function(response) {
				var html = '<img src=' + '${pageContext.request.contextPath}' + '/assets/graph_image/' + fileName + '.png>';
				var graphDiv = document.getElementById("kukugraph");
				graphDiv.innerHTML = html;
			}
		});
	}
	
	function clickRequest(idx) {
		$.ajax({
			url : "/kuku/listener/response_chat?idx=" + idx,
			type : "get",
			dataType : "json",
			data : "",
			success : function(response) {
				var listenerEmail = document.getElementById('idx');
				listenerEmail.value = idx;
				
				chatform = document.getElementById('request-form');
				chatform.action = "/kuku/chat/my_chat_room";
				chatform.submit();
			}
		})
	}
</script>
<html>
<body>
	<div class="modal fade" id="myModal" role="dialog" align="center">
		<div class="modal-show">
			<div class="modal-content modal-dialog">
				<div class="modal-header" id="modalHeader"></div>
				<div class="modal-body" align="center" id="modalbody">
					<div class="btn-group pagination" style="padding: 10px">
						<input type="date" id="datePicker" style="text-align: center">
					</div>
					<div class="btn-group pagination" style="padding: 10px">
						<button class="btn btn-outline btn-primary btn-xs" value="bar"
							id="bar" onclick="click_graph(this)">막대그래프 결과보기</button>
						<button class="btn btn-outline btn-primary btn-xs" value="pie"
							id="pie" onclick="click_graph(this)">원그래프 결과보기</button>
					</div>
					<div align="center" style="height: 80%">
						<div id="kukugraph"></div>
						<br />
						<button type="button" class="btn btn-primary" id="gochat">채팅하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row" style="width: 70%; margin: 10 auto;">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-12">
							<div class="main-box no-header clearfix" style="margin: 60px">
								<div class="main-box-body clearfix">
									<div class="table-responsive">
										<form id="request-form" method="post"
											style="padding: 12px 12px 0">
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
																	<td class="text-center"><c:set var="isDoing"
																			value="true" /> <c:forEach items="${userMap}"
																			var="user">
																			<c:if test="${request.TALKER_EMAIL == user.key}">
																				<span class="label label-success">접속</span>
																				<c:set var="isDoing" value="false" />
																			</c:if>
																		</c:forEach> <c:if test="${isDoing}">
																			<span class="label label-default">비접속</span>
																		</c:if></td>
																	<td style="width: 20%;"><span class="fa-stack">
																			<i class="fa fa-square fa-stack-2x"></i> <i
																			class="fa fa-square fa-stack-2x"></i> <i
																			class="fa fa-comment fa-stack-1x fa-inverse"
																			onclick="callModal('${request.IDX}', '${request.TALKER_EMAIL}', '${request.TALKER_NICKNAME}');"></i>
																	</span></td>
																</tr>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<tr>
																<td align="center" colspan="4">토커의 요청이 존재하지 않습니다</td>
															</tr>
														</c:otherwise>
													</c:choose>
												</tbody>
											</table>
											<input type="hidden" id="idx">
										</form>
									</div>
									<div class="table-responsive">
										<ul class="pagination pull-right">
											<c:if test="${pageMaker.prev }">
												<li><a
													href="request_chatlist${pageMaker.makeQuery(pageMaker.startPage -1) }">&laquo;</a></li>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }"
												end="${pageMaker.endPage }" var="idx">
												<li
													<c:out value="${pageMaker.cri.page == idx?' class=active':''}" />>
													<a href="request_chatlist${pageMaker.makeQuery(idx) }">${idx }</a>
												</li>
											</c:forEach>
											<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
												<li><a
													href="request_chatlist${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
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
</body>
</html>