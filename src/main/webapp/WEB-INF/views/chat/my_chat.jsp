<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.0.3/sockjs.js"></script>
<style>.a{background:000000}</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
<script type="text/javascript">
	var sock;
	var chatroom_idx;
	var receiver_email;

	sock_conn();

	function sock_conn() {
		
		if (sock == null) 
		{
			sock = new SockJS('/kuku/chat');
			
	       	sock.onopen = function () {
	       		console.log('[Connect]');
	       		addUser();
           };
	           
           sock.onmessage = function (event) {
           	console.log('[Onmessage]' + event.data);
           	
           };
           
           sock.onclose = function (event) {
           	console.log('[Disconnect]');
           };
		}
	}


	
	function clickChatroom(chatroom, receiver) {
		console.log("clickChatroom");
		chatroom_idx = chatroom;
		receiver_email = receiver;
		console.log(chatroom_idx);
		console.log(receiver_email);
		
		$.ajax({
			url : "/kuku/chat/my_chat?chatroom_idx=" + chatroom_idx,
			type : "get",
			dataType : "json",
			data : "",
			success : function(response)  {
				console.log("success!");
				
				var chatArr = response.chat;
				
				var chatDiv = document.getElementById("chat-div");
				
				for(var i=0; i<chatArr.length; i++) {
					if(receiver_email == chatArr[i].receiver_email) {
						createReceiveChat(chatArr[i].sender_email, chatArr[i].chat);
					} else {
						createSendChat(chatArr[i].sender_email, chatArr[i].chat);
					}
				}
				
				// 스크롤 아래로 이동
				var divChatPanel = document.getElementById("divChatPanel");
				
				if(divChatPanel.scrollHeight > 0) {
					divChatPanel.scrollTop = divChatPanel.scrollHeight;
				}
			}
		});
	}

	function addUser() {
		var msg = 'add/' + '${authUser.email}';
		sock.send(msg);
		console.log('[Add]');
	}

	function removeUser() {
		var msg = 'remove/' + '${authUser.email}';
		sock.send(msg);
		console.log('[Remove]');
	}
	
	function clickChat() {
		console.log('clickChat');
		
		var chat = document.getElementById('chat').value;
		if(chat == null || chat == 'undefined' || chat == '') {
			alert('채팅 내용을 입력하세요');
			return;
		}
		createSendChat('${authUser.nickname}', chat);
// 		createReceiveChat("khk", chat);

		var msg = 'chat/' +chatroom_idx + '/' + '${authUser.email}' + '/' +receiver_email + '/' + chat;
		sock.send(msg);
		console.log('[Chat]');
		
		document.getElementById('chat').value = '';
	}
	
	// 보냈을 때 말풍선 생성
	function createSendChat(sender, chat) {
		var chatDiv = document.getElementById("chat-div");
		time = new Date()
		console.log(chatDiv);

		var chatHtml = "<div class=\"conversation-item item-right clearfix\" style=\"right:-40px\">";
		chatHtml += "<div class=\"conversation-body\">";
		chatHtml += "<div class=\"name\">" + sender + "</div>";
		chatHtml += "<div class=\"time hidden-xs\">" + time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate()+" "+time.getHours()+":"
		+time.getMinutes()+":"+time.getSeconds()+"</div>";
		chatHtml += "<div class=\"text\">" + chat + "</div>";
		chatHtml += "</div></div>";
		
		chatDiv.innerHTML += chatHtml;
		
		// 스크롤 아래로 이동
		var divChatPanel = document.getElementById("divChatPanel");
		
		if(divChatPanel.scrollHeight > 0) {
			divChatPanel.scrollTop = divChatPanel.scrollHeight;
		}
	}
	
	// 받았을 때 말풍선 생성
	function createReceiveChat(sender, chat) {
		var chatDiv = document.getElementById("chat-div");
		console.log(chatDiv);
		time = new Date()
		
		var chatHtml = "<div class=\"conversation-item item-left clearfix\" style=\"left:-60px\">";
		chatHtml += "<div class=\"conversation-body\">";
		chatHtml += "<div class=\"name\">" + sender + "</div>";
		chatHtml += "<div class=\"time hidden-xs\">" + time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate()+" "+time.getHours()+":"
		+time.getMinutes()+":"+time.getSeconds()+"</div>";
		chatHtml += "<div class=\"text\">" + chat + "</div>";
		chatHtml += "</div></div>";
		
		chatDiv.innerHTML += chatHtml;
		
		// 스크롤 아래로 이동
		var divChatPanel = document.getElementById("divChatPanel");
		
		if(divChatPanel.scrollHeight > 0) {
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
											<table id="table-example"
												class="table table-hover dataTable no-footer" role="grid">
												<tbody>
													<c:choose>
														<c:when test="${fn:length(chatroomList) > 0}">
															<c:forEach items="${chatroomList}" var="chatroom">
																<c:choose>
																	<c:when test="${userType=='talker'}">
																		<tr>
																			<td><p onclick="clickChatroom('${chatroom.idx}','${chatroom.listener_email}');">${chatroom.listener_email}</p></td>
																		</tr>
																	</c:when>
																	<c:otherwise>
																		<tr>
																			<td><p onclick="clickChatroom('${chatroom.idx}','${chatroom.talker_email}');">${chatroom.talker_email}</p></td>
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
											<div class="conversation-content" id="divChatPanel" style="overflow:auto; width:100%; height:350px; overflow-X:hidden">
												<div class="conversation-inner" id="chat-div"></div>
													<div class="conversation-item item-left clearfix">
													<c:choose>
														<c:when test="${fn:length(chatList) > 0}">
															<c:forEach items="${chatList}" var="chat">
																<c:choose>
																	<c:when test="${chat.sender_email==authUser.email}">
																		<div class="conversation-item item-right clearfix">
																			<div class="conversation-body">
																				<div class="name">${chat.sender_email}</div>
																				<div class="time hidden-xs">${chat.time }</div>
																				<div class="text">${chat.chat}</div>
																			</div>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="conversation-item item-left clearfix">
																			<div class="conversation-body">
																				<div class="name">${chat.sender_email} </div>
																				<div class="time hidden-xs">${chat.time }</div>
																				<div class="text">${chat.chat}</div>
																			</div>
																		</div>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</c:when>
													</c:choose>
												</div>
											</div>
											
											<div class="conversation-new-message">
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
</body>
</html>