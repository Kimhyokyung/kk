package com.bit.kuku.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.kuku.service.Criteria;
import com.bit.kuku.service.SearchCriteria;
import com.bit.kuku.vo.ListenerVo;
import com.bit.kuku.vo.TalkerVo;

@Repository("listenerDAO")
public class ListenerDao extends UserDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "listener";
	
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
		sqlSession.insert("listener.insert", vo);
	}
	
	@SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectListenerList(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("listener.selectListenerList", map);
	}

	public ListenerVo read(Integer IDX) throws Exception {
		return session.selectOne(namespace+".selectListenerList", IDX);
	}
	 
	public List<ListenerVo> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}
	
	public List<ListenerVo> listPage(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return session.selectList(namespace + ".listPage", page);
	}
	
	public List<ListenerVo> listCriteria(Criteria cri) throws Exception {
		System.out.println("<2>BoardDAOImpl:listCriteria called");
		System.out.println(cri);
		List<ListenerVo> list = session.selectList("listener.listCriteria", cri);
		
		System.out.println(list);
		return session.selectList(namespace+".listCriteria", cri);
	}

	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace+".countPaging", cri);
	}

	public List<ListenerVo> listSearch(SearchCriteria cri) throws Exception {
		System.out.println("listSearch" + cri);
		return session.selectList(namespace + ".listSearch", cri);
	}

	public int listSearchCount(SearchCriteria cri) throws Exception {
		System.out.println("listSearchCount" + cri);
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

}