<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.0.3/sockjs.js"></script>
<script type="text/javascript">
	var sock;
	var chatroom_idx;
	var receiver_email;

	sock_conn();

	function sock_conn() {
		if (sock == null) {
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
            	sock=null;
            	sock_conn();
            };
		}
	}

	function clickChatroom(chatroom, receiver) {
		chatroom_idx = chatroom;
		receiver_email = receiver;
		console.log(chatroom_idx);
		console.log(receiver_email);
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
		var chat = document.getElementById('chat').value;
		if(chat == null || chat == 'undefined' || chat == '') {
			alert('채팅 내용을 입력하세요');
			return;
		}
		
		var msg = 'chat/' +chatroom_idx + '/' + '${authUser.email}' + '/' +receiver_email + '/' + chat;
		sock.send(msg);
		document.getElementById('chat').value = null;
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
																			<td><p onclick="clickChatroom('${chatroom.idx}','${chatroom.listener_email}');">${chatroom.listener_nickname}</p></td>
																		</tr>
																	</c:when>
																	<c:otherwise>
																		<tr>
																			<td><p onclick="clickChatroom('${chatroom.idx}','${chatroom.talker_email}');">${chatroom.talker_nickname}</p></td>
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
											<div class="conversation-content" style="overflow:auto; width:100%; height:350px;">
												<div class="conversation-inner">
													<div class="conversation-item item-left clearfix">
														<div class="conversation-user">
															<img
																src="${pageContext.request.contextPath}/assets/img/samples/ryan.png"
																alt="" />
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
															<img
																src="${pageContext.request.contextPath}/assets/img/samples/kunis.png"
																alt="" />
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
															<img
																src="${pageContext.request.contextPath}/assets/img/samples/kunis.png"
																alt="" />
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
															<img
																src="${pageContext.request.contextPath}/assets/img/samples/ryan.png"
																alt="" />
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
															<img
																src="${pageContext.request.contextPath}/assets/img/samples/kunis.png"
																alt="" />
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
														<div class="conversation-body">
															<div class="name">Mila Kunis</div>
															<div class="time hidden-xs">September 21, 2013
																12:45</div>
															<div class="text">Normally, both your asses would
																be dead as fucking fried chicken, but you happen to pull
																this shit while I'm in a transitional period so I don't
																wanna kill you, I wanna help you.</div>
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