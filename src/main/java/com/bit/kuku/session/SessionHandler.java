package com.bit.kuku.session;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

public class SessionHandler {
	private static SessionHandler instance;
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
