package com.bit.kuku.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.kuku.dao.UserDao;
import com.bit.kuku.vo.UserVo;

@Service
public class UserService {
	@Autowired
	UserDao userDao;
	
	public List<UserVo> getUserList() {
		return userDao.getList();
	}

	public void join( UserVo vo ) {
		userDao.insert( vo );
	}
	
	public UserVo login( UserVo vo ) {
		UserVo userVo = userDao.get( vo.getEmail(), vo.getPassword() );
		return userVo;
	}

	public UserVo checkEmail(String email) {
		UserVo userVo = userDao.get(email);
		return userVo;
	}
	
}
