package com.bit.kuku.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;	
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.kuku.service.UserService;

@Controller
@RequestMapping("/listener")
public class ListenerController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/my_chat")
	public String my_chat() {
		
		return "listener/my_chat";
	}

	@RequestMapping(value="/join_score")
	public String talker_listener_search() {
		
		return "listener/join_score";
	}
	
	@RequestMapping(value="/join_chatlist")
	public String my_kuku_stat() {
		
		return "listener/join_chatlist";
	}
	
	@RequestMapping(value="/logout" )
	public String logout( HttpServletRequest request ) {
		HttpSession session = request.getSession();
		if( session != null ) {
			session.removeAttribute("authUser");
			session.invalidate();
		}
		return "main/index";
	}

}
