package com.bit.kuku.dao;

import org.apache.ibatis.session.SqlSession;
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
}
