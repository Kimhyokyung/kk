package com.bit.kuku.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.kuku.service.UserService;

@Controller
@RequestMapping("/talker")
public class TalkerController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/my_chat")
	public String my_chat() {
		
		return "talker/my_chat";
	}

	@RequestMapping(value="/talker_listener_search")
	public String talker_listener_search() {
		
		return "talker/talker_listener_search";
	}
	
	@RequestMapping(value="/my_kuku_stat")
	public String my_kuku_stat() {
		
		return "talker/my_kuku_stat";
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
