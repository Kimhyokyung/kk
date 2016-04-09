package com.bit.kuku.dao;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.kuku.vo.RatingVo;

@Repository
public class RatingDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public void insert_Rating(RatingVo vo) {
		System.out.println(vo.getTalker_email());
		sqlSession.insert("rating.insert", vo);
	}
	
	public RatingVo selectRating(String tk_email, String ls_email) {
		Map<String, String> map = new HashMap<>();
		map.put("talker_email", tk_email);
		map.put("listener_email", ls_email);
		return sqlSession.selectOne("rating.selectByTalkerAndListener", map);
	}
	
	public List<RatingVo> selectListenerRating(String ls_email) {
		return sqlSession.selectList("rating.selectByListener", ls_email);
	}
}
