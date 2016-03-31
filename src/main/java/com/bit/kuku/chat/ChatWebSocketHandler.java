package com.bit.kuku.chat;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.bit.kuku.dao.ChatroomDao;
import com.bit.kuku.dao.MongoDao;
import com.bit.kuku.vo.ChatVo;
import com.sun.jmx.snmp.Timestamp;

public class ChatWebSocketHandler extends TextWebSocketHandler {
	
	@Autowired
	MongoDao mongoDao;
	
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
				System.out.println(email + " - 기존 유저 소켓 세션 리스트 삭제");
				users.remove(email);
			}
			users.put(email, session);
			System.out.println(email + " - 유저 소켓 세션 리스트 추가");
			System.out.println("------------------------------------------");
			
		} else if(func.equals("remove")) {
			
			System.out.println("-------------------remove-------------------");
			String email = msgArr[1];
			
			if(users.containsKey(email)) {
				users.remove(email);
				System.out.println(email + " - 유저 소켓 세션 리스트 삭제");
			}
			System.out.println("------------------------------------------");
			
		} else if (func.equals("chat")) {
			
			System.out.println("-------------------chat-------------------");
			
			String chatroom_idx = msgArr[1];
			String sender_email = msgArr[2];
			String receiver_email = msgArr[3];
			String chat = msgArr[4];
			
			ChatVo chatVo = new ChatVo();
			chatVo.setChatroom_num(chatroom_idx);
			chatVo.setSender_email(sender_email);
			chatVo.setReceiver_email(receiver_email);
			chatVo.setChat(chat);
			
			Date now = new Date();
			chatVo.setTime(now.toString());
			
			chatVo.setReceiver_response("false");
			
			// 몽고디비에 채팅 로그 저장
			mongoDao.chat_insert(chatVo);
			System.out.println("몽고 데이터베이스에 채팅 로그 저장"); 
			
			// 채팅 전송
			TextMessage msg = new TextMessage(chat);
			if(users.containsKey(receiver_email)) {
				WebSocketSession recv_session = users.get(receiver_email);
				recv_session.sendMessage(msg);
				System.out.println(receiver_email + "에게 채팅 전송");
			}
			session.sendMessage(msg);
			System.out		.println("------------------------------------------");
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