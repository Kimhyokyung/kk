package com.bit.kuku.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.kuku.dao.MongoDao;
import com.bit.kuku.service.ChatroomService;
import com.bit.kuku.vo.ChatVo;
import com.bit.kuku.vo.ChatroomVo;
import com.bit.kuku.vo.ListenerVo;
import com.bit.kuku.vo.TalkerVo;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private ChatroomService chatroomService;
	
	@Autowired
	MongoDao mongoDao;
	
	@RequestMapping(value="/my_chat_room")
	public ModelAndView my_chat_room(HttpServletRequest request) {	
		
		ModelAndView mv = new ModelAndView("/chat/my_chat");
		
		// 로그인 정보 가져오기
		HttpSession session = request.getSession();
		
		// 유저 타입 가져오기(토커, 리스너)
		String userType = (String)session.getAttribute("userType");
		
		if(userType.equals("talker")) {		
			TalkerVo talker = (TalkerVo)session.getAttribute("authUser");
			String talker_email = talker.getEmail();
			System.out.println("talker_email : "+talker_email);
		
			// 현재 토커의 모든 채팅방 가져오기
			List<ChatroomVo> list = chatroomService.getTalkerChatroomList(talker_email);
			System.out.println("talker list : "+list);
			mv.addObject("chatroomList", list);
		} else if(userType.equals("listener")) {
			ListenerVo listener = (ListenerVo)session.getAttribute("authUser");
			String listener_email = listener.getEmail();
			
			System.out.println("listener_email : "+listener_email);
			
			
			// 현재 리스너 모든 채팅방 가져오기
	         List<ChatroomVo> list = chatroomService.getListenerChatroomList(listener_email);
	         System.out.println("listener list : "+list);
	         mv.addObject("chatroomList", list);
		}
		
		return mv;		
	}
	
	@RequestMapping(value="/my_chat")
	@ResponseBody
	public Map<String, List<ChatVo>> my_chat(@RequestParam("chatroom_idx") int chatroom_idx, HttpServletRequest request) {
		Map<String, List<ChatVo>> map = new HashMap<>();
		List<ChatVo> chatList = mongoDao.chat_select(chatroom_idx);
		map.put("chat", chatList);
		return map;
	}
}
