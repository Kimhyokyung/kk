package com.bit.kuku.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.kuku.vo.ListenerVo;
import com.bit.kuku.vo.UserVo;

@Repository
public class ListenerDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public ListenerVo get(String email) {
		ListenerVo listenerVo = sqlSession.selectOne("listener.selectByEmail", email);
		return listenerVo;
	}
}
