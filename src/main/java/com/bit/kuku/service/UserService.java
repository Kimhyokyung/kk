package com.bit.kuku.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.kuku.dao.ListenerDao;
import com.bit.kuku.dao.TalkerDao;
//import com.bit.kuku.dao.TalkerDao;
import com.bit.kuku.dao.UserDao;
import com.bit.kuku.vo.ListenerVo;
import com.bit.kuku.vo.TalkerVo;
import com.bit.kuku.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	TalkerDao talkerDao;
	
	@Autowired
	ListenerDao listenerDao;
	
	public List<UserVo> getUserList() {
		return userDao.getList();
	}

	public void join( UserVo vo ) {
		userDao.insert( vo );
	}

	public void join_talker(TalkerVo vo) {
		userDao.insert_talker(vo);
	}
	
	public UserVo login( UserVo vo ) {
		UserVo userVo = userDao.get( vo.getEmail(), vo.getPassword() );
		return userVo;
	}
	
	public boolean checkEmail(String email, String userType) {
		boolean isExist = false;
				
		if(userType.equals("talker")) {
			
			TalkerVo talkerVo = talkerDao.get(email);
			if(talkerVo != null)
				isExist = true;
		} else if(userType.equals("listenr")) {
			
			ListenerVo listenerVo = listenerDao.get(email);
			if(listenerVo != null)
				isExist = true;
		} 		
		return isExist;
	}

	public void update(UserVo obj) {
		userDao.update(obj);
		System.out.println("update");
	}
}
