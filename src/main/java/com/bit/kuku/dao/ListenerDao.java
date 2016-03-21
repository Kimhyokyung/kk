package com.bit.kuku.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.kuku.vo.UserVo;

@Repository
public class ListenerDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	SqlSession session;
	
	public List<UserVo> getList() {
		List<UserVo> result = sqlSession.selectList("user.selectList");
		return result;
	}

	public void insert(UserVo vo) {
		sqlSession.insert( "user.insert", vo );		
	}
	
	public UserVo get(Long no) {
		UserVo userVo = sqlSession.selectOne("user.selectByNo", no);
		return userVo;
	}
	
	public UserVo get(String email) {
		UserVo userVo = sqlSession.selectOne("user.selectByEmail", email);
		return userVo;
	}
	
	public UserVo get(String email, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "email", email );
		map.put( "password", password );
		System.out.println("input email : " + email + "password : " + password);
		UserVo userVo = sqlSession.selectOne( "user.selectByNoAndPassword", map );

		return userVo;
	}

	public void update(UserVo vo) {
		sqlSession.update("user.update", vo);
	}
}
