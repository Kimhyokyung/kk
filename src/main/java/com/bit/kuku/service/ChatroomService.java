package com.bit.kuku.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.kuku.dao.ChatroomDao;
import com.bit.kuku.vo.ChatroomVo;

@Service
public class ChatroomService {
	@Autowired
	ChatroomDao chatroomDao;
	
	public ChatroomVo getChatroom(String talker_email, String listener_email) {
		ChatroomVo chatroom = chatroomDao.selectChatroom(talker_email, listener_email);
		return chatroom;
	}
	
	public void createChatroom(String talker_email, String listener_email) {
		chatroomDao.insertChatroom(talker_email, listener_email);
	}
	
	public List<ChatroomVo> getTalkerChatroomList(String talker_email) {
		List<ChatroomVo> list = chatroomDao.selectTalkerChatroomList(talker_email);
		return list;
	}
	
	public List<ChatroomVo> selectListenerChatroomList(String listener_email) {
		List<ChatroomVo> list = chatroomDao.selectListenerChatroomList(listener_email);
		return list;
	}
}
