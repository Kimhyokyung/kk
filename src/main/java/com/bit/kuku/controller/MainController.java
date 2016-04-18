package com.bit.kuku.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.kuku.dao.MongoDao;
import com.bit.kuku.service.ChatroomService;
import com.bit.kuku.vo.ListenerVo;
import com.bit.kuku.vo.TalkerVo;

@Controller
@RequestMapping(value = "/main")
public class MainController {

	@Autowired
	MongoDao mongoDao;

	@Autowired
	ChatroomService chatroomService;

	@RequestMapping()
	public String main1(HttpServletRequest request) {
		// 로그인 정보 가져오기
				HttpSession session = request.getSession();
				if(session.getAttribute("authUser") != null) {
				return "main/index";
				}
		return "main/prolog";
	}
	
	@RequestMapping("/index")
	public String main2() {
		return "main/index";
	}

	@RequestMapping(value = "/nav_headbar", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> headbarAlarm(HttpServletRequest request) {
		Map<String, Integer> map = new HashMap<>();
		int messageCount = 0, requestCount = 0;
		
		// 로그인 정보 가져오기
		HttpSession session = request.getSession();
		if(session.getAttribute("authUser") == null) {
			map.put("messageCount", messageCount);
			map.put("requestCount", requestCount);
			return map;
		}
		
		// 유저 타입 가져오기(토커, 리스너)
		String userType = (String) session.getAttribute("userType");
		if (userType.equals("talker")) { // receiver가 talker
			TalkerVo talker = (TalkerVo) session.getAttribute("authUser");
			
			String tk_email = talker.getEmail();
			messageCount = mongoDao.receiver_response_count_sum(tk_email);
		} else if (userType.equals("listener")) {
			ListenerVo listener = (ListenerVo) session.getAttribute("authUser");
			
			String ls_email = listener.getEmail();
			messageCount = mongoDao.receiver_response_count_sum(ls_email);
			requestCount = chatroomService.getListenerRequestCount(ls_email);
		}
		
		map.put("messageCount", messageCount);
		map.put("requestCount", requestCount);
		return map;
	}
}
