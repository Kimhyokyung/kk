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

import com.bit.kuku.service.ChatroomService;
import com.bit.kuku.service.UserService;
import com.bit.kuku.session.SessionHandler;
import com.bit.kuku.vo.ChatVo;
import com.bit.kuku.vo.ListenerVo;

@Controller
@RequestMapping("/listener")
public class ListenerController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	private ChatroomService chatroomService;

	@RequestMapping(value="/request_chatlist")
	public ModelAndView my_kuku_stat(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("listener/request_chatlist");
		
		HttpSession session = request.getSession();
		ListenerVo listener = (ListenerVo)session.getAttribute("authUser");
		String ls_email = listener.getEmail();
		
		// 리스너 요청 채팅 목록 가져오기
		List<Map<String, Object>> requestList = chatroomService.getListenerRequestChatroom(ls_email);
		mv.addObject("requestChat", requestList);
		System.out.println(requestList);
		
		SessionHandler ssHandler = SessionHandler.getInstance();
		Map<String, HttpSession> sessionList = ssHandler.selectUserMap();
		mv.addObject("userMap", sessionList);
		
		return mv;
	}
	
	@RequestMapping(value="response_chat")
	@ResponseBody
	public Map<String, String> request_chat(@RequestParam(value="idx") String idx) {
		Map<String, String> map = new HashMap<>();
		chatroomService.responseChatroom(idx);
		map.put("response", "success");
		return map;
	}
	
	@RequestMapping(value="/join_score")
	public String talker_listener_search() {
		
		return "listener/join_score";
	}
}
