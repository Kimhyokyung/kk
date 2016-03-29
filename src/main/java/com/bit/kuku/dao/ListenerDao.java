package com.bit.kuku.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.kuku.vo.ListenerVo;

@Repository("listenerDAO")
public class ListenerDao extends UserDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public ListenerVo get(String email) {
		ListenerVo listenerVo = sqlSession.selectOne("listener.selectByEmail", email);
		return listenerVo;
	}
	
	public ListenerVo get(String email, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "email", email );
		map.put( "password", password );
		System.out.println("input email : " + email + "password : " + password);
		ListenerVo listenerVo = sqlSession.selectOne( "listener.selectByEmailAndPassword", map );

		return listenerVo;
	}
	
	public void insert_listener(ListenerVo vo) {
		sqlSession.insert("listener.insert", vo);
	}
	
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectListenerList(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("talker.selectListenerList", map);
	}
}
