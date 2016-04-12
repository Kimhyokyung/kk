package com.bit.kuku.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.kuku.dao.ListenerDao;
import com.bit.kuku.dao.TalkerDao;
import com.bit.kuku.vo.ListenerVo;
import com.bit.kuku.vo.TalkerVo;

@Service
public class UserService {
	
	@Autowired
	TalkerDao talkerDao;
	
	@Autowired
	ListenerDao listenerDao;

	public void join_talker(TalkerVo vo) {
		talkerDao.insert_talker(vo);
	}
	
	public void join_listener(ListenerVo vo) {
		listenerDao.insert_listener(vo);
	}
	
	public TalkerVo login_talker( TalkerVo vo ) {
		TalkerVo talkerVo = talkerDao.get( vo.getEmail(), vo.getPassword() );
		return talkerVo;
	}
	
	public ListenerVo login_listener( ListenerVo vo ) {
		ListenerVo listenerVo = listenerDao.get( vo.getEmail(), vo.getPassword() );
		return listenerVo;
	}
	
	public boolean checkEmail(String email, String userType) {
		boolean isExist = false;
		if(userType.equals("talker")) {
			
			TalkerVo talkerVo = talkerDao.get(email);
			if(talkerVo != null)
				isExist = true;
		} else if(userType.equals("listener")) {
			
			ListenerVo listenerVo = listenerDao.get(email);
			if(listenerVo != null)
				isExist = true;
		}
		
		return isExist;
	}
	
	public void update_talker(TalkerVo vo) {
		talkerDao.update_talker(vo);
	}
	
	public ListenerVo update_listener( ListenerVo vo ) {
		vo = listenerDao.update_listener( vo);
		return vo;
	}
	
	public void delete_talker(String email) {
		talkerDao.delete_talker(email);
	}
	
	public void delete_listener(String email) {
		listenerDao.delete_listener(email);
	}
	
	public ListenerVo update_score(String ls_email, int ratingAVG) {
		ListenerVo listenerVo = listenerDao.updateScore(ls_email, ratingAVG);
		return listenerVo;
	}
}
