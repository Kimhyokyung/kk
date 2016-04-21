package com.bit.kuku.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.kuku.dao.ListenerDao;
import com.bit.kuku.vo.ListenerVo;

@Service("talkerService")
public class TalkerService {

	@Resource(name="listenerDAO")
	private ListenerDao listenerDAO;
	
	@Autowired
	private ListenerDao dao;

	public List<ListenerVo> listAll() throws Exception {
		return dao.listAll();
	}

	public List<ListenerVo> listCriteria(Criteria cri) throws Exception {
		List<ListenerVo> list = dao.listCriteria(cri);
		return list;
	}

	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	public List<ListenerVo> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
}
