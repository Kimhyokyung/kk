package com.bit.kuku.dao;

import java.util.Map;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.kuku.service.Criteria;
import com.bit.kuku.service.SearchCriteria;
import com.bit.kuku.vo.ChatroomVo;
import com.bit.kuku.vo.ListenerVo;

@Repository
public class ChatroomDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	private SqlSession session;
	
	public ChatroomVo selectChatroom(String idx) {
		ChatroomVo chatroom = sqlSession.selectOne("chatroom.selectByIdx", idx);
		return chatroom;
	}
	
	public ChatroomVo selectChatroom(String tk_email,  String ls_email) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("talker_email", tk_email);
		map.put("listener_email", ls_email);
		
		ChatroomVo chatroom = sqlSession.selectOne("chatroom.selectByTalkerAndListener", map);
		return chatroom;
	}
	
	public void insertChatroom(String tk_email, String tk_nick, String ls_email, String ls_nick) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("talker_email", tk_email);
		map.put("talker_nickname", tk_nick);
		map.put("listener_email", ls_email);
		map.put("listener_nickname", ls_nick);
		
		sqlSession.insert("chatroom.insert", map);
	}
	
	public List<ChatroomVo> selectTalkerChatroomList(String talker_email) {
		List<ChatroomVo> list = sqlSession.selectList("chatroom.selectChatroomListByTalker", talker_email);
		return list;
	}
	
	public List<Map<String, Object>> selectListenerRequestChatroom(String listener_email) {
		List<Map<String, Object>> list = sqlSession.selectList("chatroom.selectListenerRequestChatroom", listener_email);
		return list;
	}
	
	public void updateListenerResponse(String idx) {
		sqlSession.update("chatroom.updateListenerResponse",  idx);
	}
	
	public List<ChatroomVo> selectListenerChatroomList(String listener_email) {
		List<ChatroomVo> list = sqlSession.selectList("chatroom.selectChatroomListByListener", listener_email);
		return list;
	}
	
	public List<Map<String, Object>> listAll() throws Exception{
		return session.selectList("chatroom" + ".listAll");
	}
	
	public List<Map<String, Object>> listPage(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		page = (page -1) * 10;
		return session.selectList("chatroom" + ".listPage", page);
	}
	
	public List<Map<String, Object>> listCriteria(Criteria cri, String ls_email) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());
		map.put("listener_email", ls_email);
		
		List<Map<String, Object>> list = session.selectList("chatroom.listCriteria", map);
		System.out.println(list);
		return session.selectList("chatroom"+".listCriteria", map);
	}
	
	public int countPaging(String ls_email) throws Exception {
		return session.selectOne("chatroom"+".countPaging", ls_email);
	}
	
	public List<Map<String, Object>> listSearch(SearchCriteria cri, String ls_email) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());
		map.put("listener_email", ls_email);
		
		return session.selectList("chatroom" + ".listSearch", map);
	}

	public int listSearchCount(SearchCriteria cri) throws Exception {
		System.out.println("listSearchCount" + cri);
		return session.selectOne("chatroom" + ".listSearchCount", cri);
	}
}
