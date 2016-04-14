package com.bit.kuku.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.kuku.dao.ChatroomDao;
import com.bit.kuku.vo.ChatroomVo;

@Service
public class ChatroomService {
	@Autowired
	ChatroomDao chatroomDao;
	
	public ChatroomVo getChatroom(String tk_email, String ls_email) {
		ChatroomVo chatroom = chatroomDao.selectChatroom(tk_email, ls_email);
		return chatroom;
	}
	
	public void createChatroom(String tk_email, String tk_nick, String ls_email, String ls_nick) {
		chatroomDao.insertChatroom(tk_email, tk_nick, ls_email, ls_nick);
	}
	
	public List<ChatroomVo> getTalkerChatroomList(String tk_email) {
		List<ChatroomVo> list = chatroomDao.selectTalkerChatroomList(tk_email);
		return list;
	}
	
	public List<Map<String, Object>> getListenerRequestChatroom(String ls_email) {
		List<Map<String, Object>> list = chatroomDao.selectListenerRequestChatroom(ls_email);
		return list;
	}
	
	public void responseChatroom(String idx) {
		chatroomDao.updateListenerResponse(idx);
	}
	
	public List<ChatroomVo> getListenerChatroomList(String ls_email) {
		List<ChatroomVo> list = chatroomDao.selectListenerChatroomList(ls_email);
		return list;
	}

	public List<Map<String, Object>> listAll() throws Exception {
		return chatroomDao.listAll();
	} 
	
	public List<Map<String, Object>> listCriteria(Criteria cri, String ls_email) throws Exception {
		
		List<Map<String, Object>> list = chatroomDao.listCriteria(cri, ls_email);
		return list;
	} 
	
	public int listCountCriteria(String ls_email) throws Exception {
		return chatroomDao.countPaging(ls_email);
	}
	
	public void updateLastChatTime(String chatroom_idx) {
		chatroomDao.updateLastChatTime(chatroom_idx);
	}
	
	public void updateUserNickname(String userType, String userEmail, String userNick) {
		chatroomDao.updateUserNickname(userType, userEmail, userNick);
	}
}
