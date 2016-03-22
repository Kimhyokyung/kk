package com.bit.kuku.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.kuku.vo.ListenerVo;
import com.bit.kuku.vo.TalkerVo;

@Repository
public class ListenerDao {
	
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
		ListenerVo listenerVo = sqlSession.selectOne( "listener.selectByNoAndPassword", map );

		return listenerVo;
	}
	
	public void insert_listener(ListenerVo vo) {
		
		//System.out.println(vo);
		sqlSession.insert("listener.insert", vo);
	}
}
