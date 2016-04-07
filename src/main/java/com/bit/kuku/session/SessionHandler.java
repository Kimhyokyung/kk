package com.bit.kuku.session;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

public class SessionHandler {
	private static SessionHandler instance;
	
	//로그인을하면 userMap추가. 로그아웃하면 userMap삭제
	Map<String, HttpSession> userMap = new HashMap<String, HttpSession>();
	
	private SessionHandler(){
	}
	
	public static SessionHandler getInstance(){
		if(instance == null)
			instance = new SessionHandler();
		return instance;
	}
	
	public void add(String email, HttpSession session) {
		userMap.put(email, session);
		System.out.println("email : "+ email);
		System.out.println("session : "+ session);
		System.out.println("added : "+ userMap);
	}
	
	public void delete(String email) {
		userMap.remove(email);
		System.out.println("deleted : "+userMap);
	}
	
	public Map<String, HttpSession> selectUserMap(){
		return userMap;
	}

	public HttpSession selectOneUserMap(String email){
		return userMap.get(email);
	}
}
