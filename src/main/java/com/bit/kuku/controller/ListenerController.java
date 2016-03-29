package com.bit.kuku.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;	
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.kuku.service.ChatroomService;
import com.bit.kuku.service.UserService;
import com.bit.kuku.vo.ChatroomVo;
import com.bit.kuku.vo.ListenerVo;
import com.bit.kuku.vo.TalkerVo;

@Controller
@RequestMapping("/listener")
public class ListenerController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	private ChatroomService chatroomService;
	
	@RequestMapping(value="/my_chat")
	public ModelAndView my_chat(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("/listener/my_chat");
		
		// 로그인 정보 가져오기
		HttpSession session = request.getSession();
		ListenerVo listener = (ListenerVo)session.getAttribute("authUser");
		String listener_email = listener.getEmail();
		
		// 현재 리스너 모든 채팅방 가져오기
		List<ChatroomVo> list = chatroomService.selectListenerChatroomList(listener_email);
		System.out.println(list);
		mv.addObject("chatroomList", list);
		return mv;
	}

	@RequestMapping(value="/join_score")
	public String talker_listener_search() {
		
		return "listener/join_score";
	}
	
	@RequestMapping(value="/join_chatlist")
	public String my_kuku_stat() {
		
		return "listener/join_chatlist";
	}
	
	@RequestMapping(value="/logout")
	public String logout( HttpServletRequest request ) {
		HttpSession session = request.getSession();
		System.out.println(session );
		if( session != null ) {
			session.removeAttribute("authUser");
			session.invalidate();
		}
		return "main";
	}
}
