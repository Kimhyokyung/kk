package com.bit.kuku.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bit.kuku.vo.ListenerVo;

//@Service("talkerService")
public interface TalkerService {
	List<Map<String, Object>> selectListenerList(Map<String, Object> map) throws Exception;
}
