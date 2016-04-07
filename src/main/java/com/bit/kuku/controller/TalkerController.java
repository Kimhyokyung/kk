package com.bit.kuku.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.kuku.service.ChatroomService;
import com.bit.kuku.service.SearchCriteria;
import com.bit.kuku.service.TalkerService;
import com.bit.kuku.service.UserService;
import com.bit.kuku.session.SessionHandler;
import com.bit.kuku.vo.ChatroomVo;
import com.bit.kuku.vo.ListenerVo;
import com.bit.kuku.vo.PageMaker;
import com.bit.kuku.vo.TalkerVo;
import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default;

@Controller
@RequestMapping("/talker")
public class TalkerController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	private TalkerService talkerService;
		
	@Autowired
	private ChatroomService chatroomService;

	@RequestMapping(value="/my_kuku_stat")
	public String my_kuku_stat() {
		return "talker/my_kuku_stat";
	}
		
	@RequestMapping(value = "/talker_listener_search", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model,
			@RequestParam(value="onlineType", required = false) String onlineType) throws Exception {
		
		System.out.println("onlineType :" + onlineType);
		// model.addAttribute("list", talkerService.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(talkerService.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		SessionHandler ssHandler = SessionHandler.getInstance();
		Map<String, HttpSession> list = ssHandler.selectUserMap();
		model.addAttribute("userMap", list);

		// 온라인 유저만 가져오기
		List<ListenerVo> searchListener = talkerService.listSearchCriteria(cri); // 기존 검색 유저
		System.out.println(searchListener);
		
		List<ListenerVo> onlineListener = new ArrayList<>(); // 온라인 유저

		if(onlineType == null) {
			System.out.println("onlineType null");
			model.addAttribute("list", searchListener);
		}
		else if(onlineType.equals("n")){
			System.out.println("onlineType n");
			model.addAttribute("list", searchListener);
		}
		else if(onlineType.equals("online")){
			System.out.println("onlineType online");
			// 온라인 유저 검색
			for(int i=0; i<searchListener.size(); i++) {
				ListenerVo ls = searchListener.get(i);
				String ls_email = ls.getEmail();
				if(ssHandler.selectOneUserMap(ls_email) != null) {
					onlineListener.add(ls);
				}
			}
			model.addAttribute("list", onlineListener);
		}
		else if(onlineType.equals("offline")){
			System.out.println("onlineType offline");
			// 온라인 유저 검색
			for(int i=0; i<searchListener.size(); i++) {
				ListenerVo ls = searchListener.get(i);
				String ls_email = ls.getEmail();
				if(ssHandler.selectOneUserMap(ls_email) == null) {
					onlineListener.add(ls);
				}
			}
			model.addAttribute("list", onlineListener);
		}
	}
	
	@RequestMapping(value="/createChatroom")
	public ModelAndView createChatroom(HttpServletRequest request, 
			@RequestParam(value="listener_email") String ls_email,
			@RequestParam(value="listener_nickname") String ls_nick) throws Exception {
		
		ModelAndView mv = new ModelAndView("/chat/my_chat");
		
		// 로그인 정보 가져오기
		HttpSession session = request.getSession();
		TalkerVo talker = (TalkerVo)session.getAttribute("authUser");
		String tk_email = talker.getEmail();
		String tk_nick = talker.getNickname();
		
		// 채팅방 존재유무 체크
		ChatroomVo chatroom = chatroomService.getChatroom(tk_email, ls_email);
		if(chatroom == null) {
			// 새로운 채팅방 만들기
			chatroomService.createChatroom(tk_email, tk_nick, ls_email, ls_nick);
		}
		
		// 현재 토커와 리스너의 채팅방 가져오기
		chatroom = chatroomService.getChatroom(tk_email, ls_email);
		mv.addObject("curChatroom", chatroom);
		
		// 현재 토커의 모든 채팅방 가져오기
		List<ChatroomVo> list = chatroomService.getTalkerChatroomList(tk_email);
		mv.addObject("chatroomList", list);
		
		return mv;
	}
	@RequestMapping(value="/my_kuku_stat2")
	public String register_first() {
		return "talker/my_kuku_stat2";
	}
}