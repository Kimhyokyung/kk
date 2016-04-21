package com.bit.kuku.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.kuku.service.Criteria;
import com.bit.kuku.service.SearchCriteria;
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
		map.put("email", email);
		map.put("password", password);
		ListenerVo listenerVo = sqlSession.selectOne("listener.selectByEmailAndPassword", map);

		return listenerVo;
	}
	
	public void insert_listener(ListenerVo vo) {
		sqlSession.insert("listener.insert", vo);
	}
	
	public ListenerVo update_listener(ListenerVo vo) {
		sqlSession.update("listener.update", vo);
		return vo;
	}
	
	public void delete_listener(String email) {
		sqlSession.delete("listener.delete", email);
	}
	 
	public List<ListenerVo> listAll() throws Exception {
		return sqlSession.selectList("listener.listAll");
	}
	
	public List<ListenerVo> listPage(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		
		return sqlSession.selectList("listener.listPage", page);
	}
	
	public List<ListenerVo> listCriteria(Criteria cri) throws Exception {
		//List<ListenerVo> list = sqlSession.selectList("listener.listCriteria", cri);
		return sqlSession.selectList("listener.listCriteria", cri);
	}

	public int countPaging(Criteria cri) throws Exception {
		return sqlSession.selectOne("listener.countPaging", cri);
	}

	public List<ListenerVo> listSearch(SearchCriteria cri) throws Exception {
		System.out.println("listSearch" + cri);
		return sqlSession.selectList("listener.listSearch", cri);
	}

	public int listSearchCount(SearchCriteria cri) throws Exception {
		System.out.println("listSearchCount" + cri);
		return sqlSession.selectOne("listener.listSearchCount", cri);
	}
	
	public ListenerVo updateScore(String email, int score) {
		Map<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("score", score);
		ListenerVo listenerVo = sqlSession.selectOne("listener.update_score", map);
		return listenerVo;
	}
}