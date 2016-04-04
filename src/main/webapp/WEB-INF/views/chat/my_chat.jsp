<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.0.3/sockjs.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	var sock;
	var chatroom_num;
	var receiver_email;
	var receiver_nick;

	sock_conn();

	// 현재 선택된 채팅방 정보 보여주기
	if('${curChatroom}' == null || '${curChatroom}' == 'undefined' || '${curChatroom}' == '') {
		// 현재 선택된 채팅방이 없다면 채팅 입력 숨기기
		$('.conversation-new-message').hide();
	} else {
		// 현재 선택된 채팅방이 있다면 채팅 로그 정보 보여주기
		if('${userType}' == 'talker') {
			clickChatroom('${curChatroom.idx}', '${curChatroom.listener_email}', '${curChatroom.listener_nickname}');	
		} else {
			clickChatroom('${curChatroom.idx}', '${curChatroom.talker_email}', '${curChatroom.talker_nickname}');
		}
	}
	
	function sock_conn() {
		if (sock == null) {
			sock = new SockJS('/kuku/chat');

			sock.onopen = function() {
				console.log('[Connect]');
				addUser();
			};

			sock.onmessage = function(event) {
				console.log('[Onmessage]' + event.data);
				var chat = event.data;
				var chatArr = chat.split('/');
				if (chatArr[0] == chatroom_num) {
					createReceiveChat(chatArr[1], chatArr[2], null);
				} else {
					// 내가 보고 있지 않은 채팅방에 새로운 메세지가 도착
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

	// 채팅방 클릭 시 호출되는 함수
	function clickChatroom(chatroom, email, nick) {
		
		chatroom_num = chatroom;
		receiver_email = email;
		receiver_nick = nick;

		// 채팅창 입력 부분 보여주기
		$('.conversation-new-message').show();
		
		// 현재 채팅방 선택 상태로 변경
		$("#table-example").ready(function() {
			$("tr").click(function() {
				$(this).addClass('active');
				$(this).siblings().removeClass('active');
			})
		});

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
				+ receiver_email + '/' + chat;
		sock.send(msg);
		console.log('[Chat]');

		document.getElementById('chat').value = '';
	}

	// 메세지 보낼 때나 받을 때 현재 시간 설정
	function setDate() {
		var now = new Date();
		var yyyy = now.getFullYear().toString();
		var MM = pad(now.getMonth() + 1, 2);
		var dd = pad(now.getDate(), 2);
		var hh = pad(now.getHours(), 2);
		var mm = pad(now.getHours(), 2);
		var ss = pad(now.getSeconds(), 2);

		return yyyy + "-" + MM + "-" + dd + " " + hh + ":" + mm + ":" + ss;
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
</script>
<html>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<body onbeforeunload="return removeUser()">
	<div id="theme-wrapper">
		<c:import url="/WEB-INF/views/include/nav_headbar.jsp"></c:import>
		<div id="page-wrapper" class="container">
			<div class="row">
				<c:import url="/WEB-INF/views/include/nav_sidebar.jsp"></c:import>
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
									<div class="main-box-body clearfix">
										<div class="table-responsive">
											<table id="table-example" class="table table-hover dataTable no-footer" role="grid">
												<tbody>
													<c:choose>
														<c:when test="${fn:length(chatroomList) > 0}">
															<c:forEach items="${chatroomList}" var="chatroom">
																<c:choose>
																	<c:when test="${userType=='talker'}">
																		<tr onclick="clickChatroom('${chatroom.idx}','${chatroom.listener_email}','${chatroom.listener_nickname}');">
																			<td>${chatroom.listener_nickname}</td>
																		</tr>
																	</c:when>
																	<c:otherwise>
																		<tr onclick="clickChatroom('${chatroom.idx}','${chatroom.talker_email}','${chatroom.talker_nickname}');">
																			<td>${chatroom.talker_nickname}</td>
																		</tr>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</c:when>
													</c:choose>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-9 col-md-8 col-sm-8">
								<div class="main-box clearfix">
									<div class="tabs-wrapper profile-tabs">
										<div class="conversation-wrapper">
											<div class="conversation-content" id="divChatPanel" style="overflow: auto; width: 100%; height: 350px; overflow-X: hidden">
												<div class="conversation-inner" id="chat-div"></div>
												<div class="conversation-item item-left clearfix">
												</div>
											</div>
											<div id="chat-input">
												<div class="conversation-new-message" id="conversation-new-message">
													<div class="form-group">
														<textarea id="chat" class="form-control" rows="2"
															placeholder="Enter your message..."></textarea>
													</div>
													<div class="clearfix">
														<button class="btn btn-info pull-right"
															onclick="clickChat()">Send message</button>
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