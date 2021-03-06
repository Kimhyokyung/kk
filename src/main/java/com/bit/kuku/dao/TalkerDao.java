package com.bit.kuku.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.kuku.vo.TalkerVo;

@Repository
public class TalkerDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public TalkerVo get(String email) {
		TalkerVo talkerVo = sqlSession.selectOne("talker.selectByEmail", email);
		return talkerVo;
	}
	
	public TalkerVo get(String email, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "email", email );
		map.put( "password", password );
		TalkerVo talkerVo = sqlSession.selectOne("talker.selectByEmailAndPassword", map);

		return talkerVo;
	}
	
	public void insert_talker(TalkerVo vo) {
		sqlSession.insert("talker.insert", vo);
	}
	
	public void update_talker(TalkerVo vo) {
		sqlSession.update("talker.update", vo);
	}
	
	public void delete_talker(String email) {
		sqlSession.delete("talker.delete", email);
	}
}
