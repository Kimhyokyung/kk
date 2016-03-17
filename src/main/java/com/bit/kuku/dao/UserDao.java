package com.bit.kuku.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.kuku.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<UserVo> getList() {
		List<UserVo> result = sqlSession.selectList("user.selectList");
		return result;
	}
}
