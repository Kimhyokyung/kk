package com.bit.kuku.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.kuku.service.ChatroomService;
import com.bit.kuku.service.Criteria;
import com.bit.kuku.service.UserService;
import com.bit.kuku.session.SessionHandler;
import com.bit.kuku.vo.ChatVo;
import com.bit.kuku.vo.ListenerVo;
import com.bit.kuku.vo.PageMaker;

@Controller
@RequestMapping("/listener")
public class ListenerController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	private ChatroomService chatroomService;

	@RequestMapping(value="/request_chatlist")
	public void my_kuku_stat(HttpServletRequest request, Criteria cri, Model model) throws Exception {
		HttpSession session = request.getSession();
		ListenerVo listener = (ListenerVo)session.getAttribute("authUser");
		String ls_email = listener.getEmail();
		
		List<Map<String, Object>> requestList = chatroomService.listCriteria(cri, ls_email);
		System.out.println(requestList);
		model.addAttribute("list", requestList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(chatroomService.listCountCriteria(ls_email));
		
		model.addAttribute("pageMaker", pageMaker);
		SessionHandler ssHandler = SessionHandler.getInstance();
		Map<String, HttpSession> sessionList = ssHandler.selectUserMap();
		model.addAttribute("userMap", sessionList);
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
