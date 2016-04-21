package com.bit.kuku.chat;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.bit.kuku.dao.MongoDao;
import com.bit.kuku.service.ChatroomService;
import com.bit.kuku.vo.ChatVo;

public class ChatWebSocketHandler extends TextWebSocketHandler {
	
	@Autowired
	MongoDao mongoDao;
	
	@Autowired
	ChatroomService chatroomService;
	
	// 현재 접속자 세션 리스트
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		log(session.getId() + " 연결");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		log(session.getId() + " 연결 종료");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String payloadMessage = (String) message.getPayload();
		String[] msgArr = payloadMessage.split("/");
		String func = msgArr[0];
		
		System.out.println(payloadMessage);
		
		if(func.equals("add")) {
			
			System.out.println("-------------------add-------------------");
			String email = msgArr[1];
			
			if(users.containsKey(email)) {
				System.out.println(email + " - 기존 유저 소켓 세션  삭제");
				users.remove(email);
			}
			users.put(email, session);
			System.out.println(email + " - 유저 소켓 세션 리스트 추가");
			System.out.println("users in add "+ users);
			System.out.println("------------------------------------------");
			
		} else if(func.equals("remove")) {
			
			System.out.println("-------------------remove-------------------");
			String email = msgArr[1];
			
			if(users.containsKey(email)) {
				users.remove(email);
				System.out.println(email + " - 유저 소켓 세션 리스트 삭제");
				System.out.println("users in remove "+ users);
			}
			System.out.println("------------------------------------------");
			
		} else if (func.equals("chat")) {
			
			System.out.println("-------------------chat-------------------");
						
			String chatroom_idx = msgArr[1];
			String sender_email = msgArr[2];
			String receiver_email = msgArr[3];
			String userType = msgArr[4];
			String chat = msgArr[5];
			
			// 기존 채팅 정보 저장 
			ChatVo chatVo = new ChatVo();
			chatVo.setChatroom_num(chatroom_idx);
			chatVo.setSender_email(sender_email);
			chatVo.setReceiver_email(receiver_email);
			chatVo.setUser_type(userType);
			chatVo.setChat(chat);
			
			// 시간 정보 저장
			Date now = Calendar.getInstance().getTime();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			chatVo.setTime(formatter.format(now).toString());
			
			chatVo.setReceiver_response("false");
			
			// 몽고디비에 채팅 로그 저장
			System.out.println(chatVo);
			mongoDao.chat_insert(chatVo);
			System.out.println("몽고 데이터베이스에 채팅 로그 저장"); 
			
			// 가장 최근 대화 시간 채팅방 데이터베이스에 저장
			chatroomService.updateLastChatTime(chatroom_idx);
			
			// 채팅 전송
			String sendChat = chatroom_idx + '/' + sender_email + '/' + chat;
			System.out.println("sendChat : "+sendChat);
			System.out.println("users in chat "+ users+"///"+receiver_email);
			TextMessage msg = new TextMessage(sendChat);
			if(users.containsKey(receiver_email)) {
				System.out.println("if진입");
				WebSocketSession recv_session = users.get(receiver_email);
				recv_session.sendMessage(msg);
				System.out.println(receiver_email + "에게 채팅 전송");
			}
			System.out.println("------------------------------------------");
		} else if(func.equals("read")) {
			
			System.out.println("------------------read------------------");
			System.out.println("읽음");
			String chatroom_idx = msgArr[1];
			String receiver_email = msgArr[2];
			
			mongoDao.receiver_response_read(chatroom_idx, receiver_email);	

			System.out.println("------------------------------------------");
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
}