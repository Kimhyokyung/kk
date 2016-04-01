package com.bit.kuku.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.kuku.dao.ListenerDao;
import com.bit.kuku.vo.ListenerVo;
import com.sun.istack.internal.logging.Logger;

@Service("talkerService")
public class TalkerService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="listenerDAO")
	private ListenerDao listenerDAO;
	
	@Autowired
	private ListenerDao dao;
	
	public List<Map<String, Object>> selectListenerList(Map<String, Object> map) throws Exception {
        return listenerDAO.selectListenerList(map);
    }

	public List<ListenerVo> listAll() throws Exception {
		return dao.listAll();
	}

	public List<ListenerVo> listCriteria(Criteria cri) throws Exception {
		System.out.println("<1>TalkerServiceImpl:listCriteria Call");
		System.out.println(dao);
		System.out.println(cri);
		
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
