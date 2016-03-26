package com.bit.kuku.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bit.kuku.dao.ListenerDao;
import com.bit.kuku.dao.TalkerDao;
import com.sun.istack.internal.logging.Logger;

@Service("talkerService")
public class TalkerServiceImpl implements TalkerService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="listenerDAO")
	private ListenerDao listenerDAO;
	
	public List<Map<String, Object>> selectListenerList(Map<String, Object> map) throws Exception {
        return listenerDAO.selectListenerList(map);
    }
}