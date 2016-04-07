package com.bit.kuku.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.kuku.dao.MongoDao;
import com.bit.kuku.service.RatingService;
import com.bit.kuku.service.SearchCriteria;
import com.bit.kuku.service.TalkerService;
import com.bit.kuku.service.UserService;
import com.bit.kuku.session.SessionHandler;
import com.bit.kuku.vo.ListenerVo;
import com.bit.kuku.vo.PageMaker;
import com.bit.kuku.vo.RatingVo;

@Controller
@RequestMapping("/talker")
public class TalkerController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	private TalkerService talkerService;
	
	@Autowired
	private RatingService ratingService;
	
	@Autowired
	private MongoDao mongoDao;

	@RequestMapping(value="/my_kuku_stat")
	public String my_kuku_stat() {
		return "talker/my_kuku_stat";
	}
	
	@RequestMapping(value="/my_kuku_stat2")
	public String register_first() {
		return "talker/my_kuku_stat2";
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
	
	@RequestMapping(value = "/check_rating")
	@ResponseBody
	public Map<String, Boolean> check_rating(
			@RequestParam("chatroom_num") String chatroom_num,
			@RequestParam("talker_email") String tk_email,
			@RequestParam("listener_email") String ls_email) {
		Map<String, Boolean> map = new HashMap<>();
		
		boolean isShow = false;
		
		RatingVo ratingVo = ratingService.getRating(tk_email, ls_email);
		// 만약 기존 평가가 존재하지 않는다면
		if(ratingVo == null) {
			int chatCnt = mongoDao.chatroom_chat_count(chatroom_num);
			if(chatCnt >= 1) {
				isShow = true;
			}
		}
		
		map.put("show", isShow);
		return map;
	}
}