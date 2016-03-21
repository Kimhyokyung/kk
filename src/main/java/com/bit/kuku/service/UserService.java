package com.bit.kuku.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.bit.kuku.dao.TalkerDao;
import com.bit.kuku.dao.UserDao;
import com.bit.kuku.vo.TalkerVo;
import com.bit.kuku.vo.UserVo;

@Service
public class UserService {
	@Autowired
	UserDao userDao;
	//TalkerDao talkerDao;
	
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
	/*
	public TalkerVo login_talker( TalkerVo vo ) {
		TalkerVo talkerVo = talkerDao.get_talker( vo.getEmail(), vo.getPassword() );
		return talkerVo;
	}
	*/
	public UserVo checkEmail(String email) {
		UserVo userVo = userDao.get(email);
		return userVo;
	}

	public void update(UserVo obj) {
		userDao.update(obj);
		System.out.println("update");
	}
}
