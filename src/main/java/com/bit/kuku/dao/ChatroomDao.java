package com.bit.kuku.dao;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.kuku.vo.ChatroomVo;

@Repository
public class ChatroomDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public ChatroomVo selectChatroom(String talker_email, String listener_email) {
		Map<String, Object> map = new HashMap<>();
		map.put("talker_email", talker_email);
		map.put("listener_email", listener_email);
		
		ChatroomVo chatroom = sqlSession.selectOne("chatroom.selectByTalkerAndListener", map);
		return chatroom;
	}
	
	public void insertChatroom(String talker_email, String listener_email) {
		Map<String, Object> map = new HashMap<>();
		map.put("talker_email", talker_email);
		map.put("listener_email", listener_email);
		
		sqlSession.insert("chatroom.insert", map);
	}
	
	public List<ChatroomVo> selectChatroomList(String talker_email) {
		List<ChatroomVo> list = sqlSession.selectList("chatroom.selectChatroomListByTalker", talker_email);
		return list;
	}
}
