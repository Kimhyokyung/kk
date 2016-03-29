package com.bit.kuku.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.kuku.service.ChatroomService;
import com.bit.kuku.service.TalkerService;
import com.bit.kuku.service.UserService;
import com.bit.kuku.session.SessionHandler;
import com.bit.kuku.vo.ChatroomVo;
import com.bit.kuku.vo.TalkerVo;

@Controller
@RequestMapping("/talker")
public class TalkerController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	private TalkerService talkerService;
	
	@Autowired
	private ChatroomService chatroomService;
	
	@RequestMapping(value="/my_chat")
	public ModelAndView my_chat(HttpServletRequest request) {	
		
		ModelAndView mv = new ModelAndView("/talker/my_chat");
		
		// 로그인 정보 가져오기
		HttpSession session = request.getSession();
		TalkerVo talker = (TalkerVo)session.getAttribute("authUser");
		String talker_email = talker.getEmail();
		
		// 현재 토커의 모든 채팅방 가져오기
		List<ChatroomVo> list = chatroomService.getTalkerChatroomList(talker_email);
		mv.addObject("chatroomList", list);
		return mv;		
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
		return "main";
	}
	
	@RequestMapping(value="/talker_listener_search")
	public ModelAndView talker_listener_search(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/talker/talker_listener_search");
		
		List<Map<String,Object>> list = talkerService.selectListenerList(commandMap);
		SessionHandler ssHandler = SessionHandler.getInstance();
		Map<String, HttpSession> userMap = ssHandler.selectUserMap();
		mv.addObject("list",list);
		mv.addObject("userMap", userMap);
		return mv;
	}
	
	@RequestMapping(value="/createChatroom")
	public ModelAndView createChatroom(HttpServletRequest request, 
			@RequestParam(value="listener_email") String listener_email) throws Exception {
		
		ModelAndView mv = new ModelAndView("/talker/my_chat");
		
		// 로그인 정보 가져오기
		HttpSession session = request.getSession();
		TalkerVo talker = (TalkerVo)session.getAttribute("authUser");
		String talker_email = talker.getEmail();
		
		// 채팅방 존재유무 체크
		ChatroomVo chatroom = chatroomService.getChatroom(talker_email, listener_email);
		if(chatroom == null) {
			// 새로운 채팅방 만들기
			chatroomService.createChatroom(talker_email, listener_email);
		}
		
		// 현재 토커와 리스너의 채팅방 가져오기
		chatroom = chatroomService.getChatroom(talker_email, listener_email);
		mv.addObject("curChatroom", chatroom);
		
		// 현재 토커의 모든 채팅방 가져오기
		List<ChatroomVo> list = chatroomService.getTalkerChatroomList(talker_email);
		mv.addObject("chatroomList", list);
		return mv;
	}
}