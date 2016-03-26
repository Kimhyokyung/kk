package com.bit.kuku.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.kuku.service.TalkerService;
import com.bit.kuku.service.UserService;

@Controller
@RequestMapping("/talker")
public class TalkerController {
	@Autowired
	UserService userService;
	
	@Resource(name="talkerService")
	private TalkerService talkerService;
	
	@RequestMapping(value="/my_chat")
	public String my_chat() {
		
		return "talker/my_chat";
	}

//	@RequestMapping(value="/talker_listener_search")
//	public String talker_listener_search() {
//		
//		return "talker/talker_listener_search";
//	}
	
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
	
	@RequestMapping(value="/talker_listener_search")
	public ModelAndView talker_listener_search(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/talker/talker_listener_search");
		
		List<Map<String,Object>> list = talkerService.selectListenerList(commandMap);
		mv.addObject("list",list);
		return mv;
	}
}