<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap/rate.css" />
<script src="${pageContext.request.contextPath}/assets/js/modernizr.custom.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/classie.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/modalEffects.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.0.3/sockjs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	var sock;
	var chatroom_num;
	var receiver_email;
	var receiver_nick;

	sock_conn();
	
	$("#chat-table").ready(function() {
		$("tr").click(function() {
			$(this).addClass('active');
			$(this).siblings().removeClass('active');
		})
	});
	
	// 현재 선택된 채팅방 정보 보여주기
	if('${curChatroom}' == null || '${curChatroom}' == 'undefined' || '${curChatroom}' == '') {
		// 현재 선택된 채팅방이 없다면 채팅 입력 숨기기
		$('.conversation-new-message').hide();
	} else {
		// 현재 선택된 채팅방이 있다면 채팅 로그 정보 보여주기
		if('${userType}' == 'talker') {	//talker가 sender일 때!
			clickChatroom('${curChatroom.idx}', '${curChatroom.listener_email}', '${curChatroom.listener_nickname}');	
		} else {
			clickChatroom('${curChatroom.idx}', '${curChatroom.talker_email}', '${curChatroom.talker_nickname}');
		}
	}
	
	function sock_conn() {
		if (sock == null) {
			sock = new SockJS('/kuku/chat');

			sock.onopen = function() {	//ChatWebHandler에서 afterConnectionEstablised
				console.log('[Connect]');
				addUser();
			};

			sock.onmessage = function(event) {
				console.log('[Onmessage]' + event.data);
				var chat = event.data;
				var chatArr = chat.split('/');
				if (chatArr[0] == chatroom_num) {
					createReceiveChat(chatArr[1], chatArr[2], null);
					readMsg();
				} else {
					// 내가 보고 있지 않은 채팅방에 새로운 메세지가 도착
					console.log("안 읽은 메시지 도착");
					//setInterval(function(){reloadChatList();}, 2500);
					reloadChatList();
				}
			};

			sock.onclose = function(event) {
				console.log('[Disconnect]');
				sock = null;
			};
		}
	}

	// 채팅 유저 추가
	function addUser() {
		var msg = 'add/' + '${authUser.email}';
		sock.send(msg);
		console.log('[Add]');
	}

	// 채팅 유저 삭제
	function removeUser() {
		var msg = 'remove/' + '${authUser.email}';
		sock.send(msg);
		console.log('[Remove]');
	}

	function reloadChatList(){
		$('#ajax-div').load('/kuku/chat/my_chat_room #ajax-div');	//ajax 유저테이블리스트 리로딩
	}
	
	// 채팅방 클릭 시 호출되는 함수
	function clickChatroom(chatroom, email, nick) {
		chatroom_num = chatroom;
		receiver_email = email;
		receiver_nick = nick;

		// 토커 평가 조건 확인
		checkRating(chatroom_num);
		
		// 채팅창 상대방 닉네임 보여주기
		showReceiverNickname(receiver_email, receiver_nick);
		
		// 채팅창 입력 부분 보여주기
		$('.conversation-new-message').show();

		// 현재 채팅방 로그 정보 가져오기
		$.ajax({
			url : "/kuku/chat/my_chat?chatroom_num=" + chatroom_num,
			type : "get",
			dataType : "json",
			data : "",
			success : function(response) {
				var chatDiv = document.getElementById("chat-div");
				chatDiv.innerHTML = '';

				var chatArr = response.chat;
				for (var i = 0; i < chatArr.length; i++) {
					if ('${authUser.email}' == chatArr[i].receiver_email) {
						createReceiveChat(receiver_nick, chatArr[i].chat,
								chatArr[i].time);
					} else {
						createSendChat('${authUser.nickname}', chatArr[i].chat,
								chatArr[i].time);
					}
				}
			}
		});
		readMsg();
	}
	
	function showReceiverNickname(email, nickname){
		var newHtml1 = "<div style=\"padding:10px\"><h2>"+nickname+"</h2></div>";

		var senderNicDiv = document.getElementById("sender-nickname-div");
		senderNicDiv.innerHTML = newHtml1;
	}
	
	function readMsg(){
		var msg = 'read/' + chatroom_num + '/' + '${authUser.email}';
		sock.send(msg);
		console.log('[Update]');
		reloadChatList();
	}

	// 채팅 버튼 클릭 시 호출되는 함수
	function clickChat() {
		sock_conn();

		var chat = document.getElementById('chat').value;
		if (chat == null || chat == 'undefined' || chat == '') {
			alert('채팅 내용을 입력하세요');
			return;
		}

		createSendChat('${authUser.nickname}', chat, null);

		var msg = 'chat/' + chatroom_num + '/' + '${authUser.email}' + '/'
				+ receiver_email + '/' + '${userType}' + '/' + chat;
		sock.send(msg);
		console.log('[Chat]');

		document.getElementById('chat').value = '';
		
		reloadChatList();
	}

	// 메세지 보낼 때나 받을 때 현재 시간 설정
	function setDate() {
		var now = new Date();
		var yyyy = now.getFullYear().toString();
		var MM = pad(now.getMonth() + 1, 2);
		var dd = pad(now.getDate(), 2);
		var hh = pad(now.getHours(), 2);
		var mm = pad(now.getMinutes(), 2);

		return yyyy + "-" + MM + "-" + dd + " " + hh + ":" + mm;
	}
	
	function pad(number, length) {
		var str = '' + number;
		while (str.length < length) {
			str = '0' + str;
		}
		return str;
	}

	// 메세지 보낼 때 말풍선 생성
	function createSendChat(sender, chat, time) {
		var chatHtml;

		chatHtml = "<div class=\"conversation-item item-right clearfix\" style=\"right:-40px\">";
		chatHtml += "<div class=\"conversation-body\">";
		chatHtml += "<div class=\"name\">" + sender + "</div>";

		if (time == null) {
			chatHtml += "<div class=\"time hidden-xs\">" + setDate() + "</div>";
		} else {
			chatHtml += "<div class=\"time hidden-xs\">" + time + "</div>";
		}

		chatHtml += "<div class=\"text\">" + chat + "</div>";
		chatHtml += "</div></div>";

		var chatDiv = document.getElementById("chat-div");
		chatDiv.innerHTML += chatHtml;

		// 스크롤 아래로 이동
		var divChatPanel = document.getElementById("divChatPanel");
		if (divChatPanel.scrollHeight > 0) {
			divChatPanel.scrollTop = divChatPanel.scrollHeight;
		}
	}

	// 메세지 받을 때 말풍선 생성
	function createReceiveChat(sender, chat, time) {
		var chatHtml;

		chatHtml = "<div class=\"conversation-item item-left clearfix\" style=\"left:-60px\">";
		chatHtml += "<div class=\"conversation-body\">";
		chatHtml += "<div class=\"name\">" + sender + "</div>";

		if (time == null) {
			chatHtml += "<div class=\"time hidden-xs\">" + setDate() + "</div>";
		} else {
			chatHtml += "<div class=\"time hidden-xs\">" + time + "</div>";
		}

		chatHtml += "<div class=\"text\">" + chat + "</div>";
		chatHtml += "</div></div>";

		var chatDiv = document.getElementById("chat-div");
		chatDiv.innerHTML += chatHtml;

		// 스크롤 아래로 이동
		var divChatPanel = document.getElementById("divChatPanel");
		if (divChatPanel.scrollHeight > 0) {
			divChatPanel.scrollTop = divChatPanel.scrollHeight;
		}
	}
	
	// 리스너 평가 조건 확인
	function checkRating(chatroom_num) {
		// 현재 로그인 유저가 토커인지 확인
		if('${userType}' != 'talker')
			return;
		
		$.ajax({
			url : "/kuku/talker/check_rating?chatroom_num=" + chatroom_num + "&talker_email=" + '${authUser.email}' + "&listener_email="+receiver_email,
			type : "get",
			dataType : "json",
			data : "",
			success : function(response) {
				if(response.show) {
					console.log('show rating btn');
					$('#listener_rating').show();
				} else {
					console.log('hide rating btn');
					$('#listener_rating').hide();
				}
			}
		});
	}
	
	function callModal() {
		var email = receiver_email;
		var nick = receiver_nick;
		
		var now = new Date();
		var month = (now.getMonth() + 1);
		var day = now.getDate();
		if (month < 10)
			month = "0" + month;
		if (day < 10)
			day = "0" + day;
	
		var today = now.getFullYear() + '-' + month + '-' + day;
		$('#datePicker').val(today);
		
		$("#modalHeader").empty();
		$("#modalHeader").append("<button class=\"md-close close\" id=\"lsModalClose\">&times;</button>"+nick+"님 감정그래프<br>");
		
		$("#kukugraph").empty();
		
  		$('#lsModalClose').on('click', function () {
			  $("#lsModal").modal("hide");
	  	})
	  	
		$('#clickbargraph').on('click', function () {
			console.log(this);
			click_graph(this, email);
		})
		
		$('#clickpiegraph').on('click', function () {
			console.log(this);
			click_graph(this, email);
  		})
	  	
		$("#lsModal").modal({backdrop:false});
	}
	
	function click_graph(button, email) {
		var kukuday = $('#datePicker').val();
		var fileName = email + kukuday + button.value + '_graph';
		
		// 현재 채팅방 로그 정보 가져오기
		$.ajax({
			url : "/kuku/talker/saveEmotionImage?fileName=" + fileName,
			type : "get",
			dataType : "json",
			data : "",
			success : function(response) {
			}
		});
		
		var html = '<img src=' + '${pageContext.request.contextPath}' + '/assets/graph_image/' + fileName + '.png>';
		console.log(html);

		var graphDiv = document.getElementById("kukugraph");
		graphDiv.innerHTML = html;
	}
</script>
<html>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<body onbeforeunload="return removeUser()">
	<div class="container">
		<div class="modal fade" id="tkModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="md-close close">&times;</button>
						<h4 class="modal-title" align="center">리스너 평가하기</h4>
					</div>
					<div class="modal-body">
						<form role="form">
							<div class="form-inline">
								<div class="form-group">
									<label>도움성</label>
								</div>
								<div class="form-group">
									<fieldset class="rating" id="helpness">
										 <input type="radio" id="help_start5" name="helpness" value="5" />
										 <label class="full" for="help_start5"></label>
										 <input type="radio" id="help_star4" name="helpness" value="4" /> 
										 <label class="full" for="help_star4"></label> 
										 <input type="radio" id="help_star3" name="helpness" value="3" /> 
										 <label class="full" for="help_star3"></label> 
										 <input type="radio" id="help_star2" name="helpness" value="2" /> 
										 <label class="full" for="help_star2"></label> 
										 <input type="radio" id="help_star1" name="rating" value="1" /> 
										 <label class="full" for="help_star1"></label>
									</fieldset>
								</div>
							</div>
							<div class="form-inline">
								<div class="form-group">
									<label>전문성</label>
								</div>
								<div class="form-group">
									<fieldset class="rating" id="professionalism">
										 <input type="radio" id="prof_start5" name="professionalism" value="5" />
										 <label class="full" for="prof_start5"></label>
										 <input type="radio" id="prof_star4" name="professionalism" value="4" /> 
										 <label class="full" for="prof_star4"></label> 
										 <input type="radio" id="prof_star3" name="professionalism" value="3" /> 
										 <label class="full" for="prof_star3"></label> 
										 <input type="radio" id="prof_star2" name="professionalism" value="2" /> 
										 <label class="full" for="prof_star2"></label> 
										 <input type="radio" id="prof_star1" name="professionalism" value="1" /> 
										 <label class="full" for="prof_star1"></label>
									</fieldset>
								</div>
							</div>
							<div class="form-inline">
								<div class="form-group">
									<label>공감성</label>
								</div>
								<div class="form-group">
									<fieldset class="rating" id="sympathy">
										 <input type="radio" id="sym_start5" name="sympathy" value="5" />
										 <label class="full" for="sym_start5"></label>
										 <input type="radio" id="sym_star4" name="sympathy" value="4" /> 
										 <label class="full" for="sym_star4"></label> 
										 <input type="radio" id="sym_star3" name="sympathy" value="3" /> 
										 <label class="full" for="sym_star3"></label> 
										 <input type="radio" id="sym_star2" name="sympathy" value="2" /> 
										 <label class="full" for="sym_star2"></label> 
										 <input type="radio" id="sym_star1" name="sympathy" value="1" /> 
										 <label class="full" for="sym_star1"></label>
									</fieldset>
								</div>
							</div>
							<div class="form-inline">
								<div class="form-group">
									<label>응답성</label>
								</div>
								<div class="form-group">
									<fieldset class="rating" id="responsibility">
										 <input type="radio" id="res_start5" name="responsibility" value="5" />
										 <label class="full" for="res_start5"></label>
										 <input type="radio" id="res_star4" name="responsibility" value="4" /> 
										 <label class="full" for="res_star4"></label> 
										 <input type="radio" id="res_star3" name="responsibility" value="3" /> 
										 <label class="full" for="res_star3"></label> 
										 <input type="radio" id="res_star2" name="responsibility" value="2" /> 
										 <label class="full" for="res_star2"></label> 
										 <input type="radio" id="res_star1" name="responsibility" value="1" /> 
										 <label class="full" for="res_star1"></label>
									</fieldset>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary">제출하기</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="lsModal" role="dialog" align="center">
			<div class="modal-show">
				<div class="modal-content">
					<div class="modal-header" id="modalHeader">
					</div>
					<div class="modal-body" align="center" id="modalbody">
						 <div class="main-box clearfix">
							<div class="btn-group pagination pull-left" style="padding: 10px">
								<input type="date" id="datePicker">
							</div>
							<div class="btn-group pagination pull-right" style="padding: 10px">
							   <button class="btn btn-outline btn-primary btn-xs" value="bar" id="clickbargraph">bar grape</button>
							   <button class="btn btn-outline btn-primary btn-xs" value="pie" id="clickpiegraph">pie graph</button>
							</div>
							<div id="kukugraph"></div>
						 </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				<div id="content-wrapper">
					<div id="page-wrapper" class="container">
						<div class="row">
							<div class="col-lg-12">
								<h1>My Chat</h1>
							</div>
						</div>
						<div class="row" id="user-profile">
							<div class="col-lg-3 col-md-4 col-sm-4">
								<div class="main-box clearfix">
									<div class="main-box-body clearfix" id="ajax-div">
										<div class="table-responsive" style="overflow: auto; height: 480px; overflow-X: hidden">
											<table id="chat-table" class="table table-hover dataTable no-footer" role="grid">
												<tbody>
													<c:forEach items="${chatroomList}" var="chatroom" varStatus="status">
														<c:choose>
															<c:when test="${userType=='talker'}">	<!-- talker가 sender일 때! -->
																<tr onclick="clickChatroom('${chatroom.idx}','${chatroom.listener_email}','${chatroom.listener_nickname}');">
																	<td>${chatroom.listener_nickname}</td>
																	<td>${chatroom.last_chat_time}</td>
																	<c:choose>
																		<c:when test = "${cntList[status.index] != 0}">
																			<td><span class="badge badge-danger">${cntList[status.index]}</span></td>	
																		</c:when>
																		<c:otherwise>
																			<td></td>
																		</c:otherwise>
																	</c:choose>
																</tr>
															</c:when>
															<c:otherwise>
																<tr onclick="clickChatroom('${chatroom.idx}','${chatroom.talker_email}','${chatroom.talker_nickname}');">
																	<td>${chatroom.talker_nickname}</td>
																	<td>${chatroom.last_chat_time}</td>
																	<c:choose>
																		<c:when test = "${cntList[status.index] != 0}">
																			<td><span class="badge badge-danger">${cntList[status.index]}</span></td>	
																		</c:when>
																	</c:choose>	
																</tr>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-9 col-md-8 col-sm-8">
								<div class="main-box clearfix">
										<header class="main-box-header clearfix" id="sender-nickname-div">
										</header>
									<div class="tabs-wrapper profile-tabs">
										<div class="conversation-wrapper">
											<div class="conversation-content" id="divChatPanel" style="overflow: auto; width: 100%; height: 500px; overflow-X: hidden">
												<div class="conversation-inner" id="chat-div"></div>
												<div class="conversation-item item-left clearfix">
												</div>
											</div>
											<div id="chat-input">
												<div class="conversation-new-message" id="conversation-new-message" hidden="hidden">
													<div class="form-group">
														<textarea id="chat" class="form-control" rows="2" style="overflow-Y:hidden"
														placeholder="Enter your message..." onkeypress="if(event.keyCode==13){clickChat();return false; }"></textarea>
													</div>
													<div class="clearfix">
														<c:choose>
															<c:when test="${userType=='talker'}">	<!-- talker가 sender일 때! -->
																<button type="button" class="btn btn-info pull-left" data-toggle="modal" data-target="#tkModal" id="listener_rating">리스너 평가하기</button>
															</c:when>
															<c:otherwise>
																<button type="button" class="btn btn-info pull-left" onclick="callModal();">토커 감정그래프</button>
															</c:otherwise>
														</c:choose>
														<button class="btn btn-info pull-right" onclick="clickChat()">메세지 전송</button>
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