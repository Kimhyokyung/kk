package com.bit.kuku.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.kuku.service.ChatroomService;
import com.bit.kuku.service.Criteria;
import com.bit.kuku.service.RatingService;
import com.bit.kuku.service.UserService;
import com.bit.kuku.session.SessionHandler;
import com.bit.kuku.vo.ListenerVo;
import com.bit.kuku.vo.PageMaker;
import com.bit.kuku.vo.RatingVo;

@Controller
@RequestMapping("/listener")
public class ListenerController {

	@Autowired
	UserService userService;

	@Autowired
	private ChatroomService chatroomService;

	@Autowired
	RatingService ratingService;

	@RequestMapping(value = "/request_chatlist")
	public void my_kuku_stat(HttpServletRequest request, Criteria cri, Model model) throws Exception {
		HttpSession session = request.getSession();
		ListenerVo listener = (ListenerVo) session.getAttribute("authUser");
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

	@RequestMapping(value = "response_chat")
	@ResponseBody
	public Map<String, String> request_chat(@RequestParam(value = "idx") String idx) {
		Map<String, String> map = new HashMap<>();
		chatroomService.responseChatroom(idx);
		map.put("response", "success");
		return map;
	}

	@RequestMapping(value = "/listener_score")
	public ModelAndView talker_listener_search(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("listener/listener_score");
		ListenerVo listener = (ListenerVo) request.getSession().getAttribute("authUser");
		String ls_email = listener.getEmail();

		List<RatingVo> list = ratingService.getListenerRating(ls_email);

		int rateNum = list.size();
		int helpness = 0;
		int professionalism = 0;
		int sympathy = 0;
		int responsibility = 0;
		int total_avg = 0;
		for (int i = 0; i < rateNum; i++) {
			helpness += list.get(i).getHelpness();
			professionalism += list.get(i).getProfessionalism();
			sympathy += list.get(i).getSympathy();
			responsibility += list.get(i).getResponsibility();
			total_avg += list.get(i).getTotal_avg();
		}
		Map<String, Integer> calculatedScore = new HashMap<>();
		calculatedScore.put("rateNum", rateNum);
		if (rateNum != 0) {
			calculatedScore.put("helpness", Math.round(helpness / rateNum));
			calculatedScore.put("professionalism", Math.round(professionalism / rateNum));
			calculatedScore.put("sympathy", Math.round(sympathy / rateNum));
			calculatedScore.put("responsibility", Math.round(responsibility / rateNum));
			calculatedScore.put("total_avg", Math.round(total_avg / rateNum));
		} else{
			calculatedScore.put("helpness", 0);
			calculatedScore.put("professionalism", 0);
			calculatedScore.put("sympathy", 0);
			calculatedScore.put("responsibility", 0);
			calculatedScore.put("total_avg", 0);
		}
		mv.addObject("calculatedScore", calculatedScore);
		return mv;
	}
	
	@RequestMapping(value = "/evaluation_listener", method=RequestMethod.POST )
	@ResponseBody
	public Object evaluation_talker(HttpServletRequest request, @ModelAttribute RatingVo ratingVo)
	{
		// 새로운 평가 입력
		System.out.println(ratingVo);
		ratingService.ratingListener(ratingVo);
		
		// 리스너의 평점 계산
		String ls_email = ratingVo.getListener_email();
		List<RatingVo> list = ratingService.getListenerRating(ls_email);
		
		System.out.println("리스너 평점 갯수 : " + list.size());
		System.out.println("리스너 평점 리스트 : " + list);
		
		int ratingAVG = 0;
		for(int i=0; i<list.size(); i++) {
			RatingVo ls_rating = list.get(i);
			ratingAVG += ls_rating.getTotal_avg();
		}
		
		ratingAVG = Math.round(ratingAVG/list.size());
		System.out.println(ratingAVG);
		userService.update_score(ls_email, ratingAVG);
		
		Map<String, Object> map = new HashMap<>();
		map.put("lsemail", ls_email);
		return map;
	}
}
