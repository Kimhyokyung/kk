package com.bit.kuku.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.kuku.vo.TalkerVo;

@Repository("talkerDAO")
public class TalkerDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public TalkerVo get(String email) {
		TalkerVo talkerVo = sqlSession.selectOne("talker.selectByEmail", email);
		System.out.println(talkerVo);
		return talkerVo;
	}
	
	public TalkerVo get(String email, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "email", email );
		map.put( "password", password );
		System.out.println("input email : " + email + "password : " + password);
		TalkerVo talkerVo = sqlSession.selectOne( "talker.selectByEmailAndPassword", map );

		return talkerVo;
	}
	
	public void insert_talker(TalkerVo vo) {
		sqlSession.insert("talker.insert", vo);
	}
}
