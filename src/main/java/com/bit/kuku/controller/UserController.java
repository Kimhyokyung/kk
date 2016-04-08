package com.bit.kuku.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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

import com.bit.kuku.service.TalkerService;
import com.bit.kuku.service.UserService;
import com.bit.kuku.session.SessionHandler;
import com.bit.kuku.vo.ListenerVo;
import com.bit.kuku.vo.TalkerVo;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/select_join_type")
	public String register_first() {
		return "user/select_join_type";
	}

	@RequestMapping(value="/check_type")
	@ResponseBody
	public Object check_type(@RequestParam("type") String type, HttpServletRequest request) {
		// 회원가입 유저 타입 저장(토커, 리스너)
		HttpSession session = request.getSession();
		session.setAttribute("userType", type);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		return map;
	}
	
	@RequestMapping(value="/check_email")
	@ResponseBody
	public Object check_email(@RequestParam("email") String email, HttpServletRequest request) {
		
		// 회원가입 유저 타입 가져오기
		HttpSession session = request.getSession();
		String userType = (String)session.getAttribute("userType");
		boolean isExist = userService.checkEmail(email, userType);
		System.out.println(userType);
		Map<String, Object> map = new HashMap<String, Object>();
		if(isExist) {
			map.put("exist", true);
		} else {
			map.put("exist", false);
		}
		
		return map;
	}
	
	

	
	
	@RequestMapping(value="/joinform")
	public String joinform() {
		return "user/joinform";
	}
	
	@RequestMapping(value="/join_talker")
	public String join_talker(HttpServletRequest request, @ModelAttribute TalkerVo talkerVo) {
		System.out.println("fwd : " +talkerVo);
		HttpSession session = request.getSession();
		session.setAttribute("talker", talkerVo);
		return "user/join_talker";
	}

	@RequestMapping(value="/join_listener")
	public String join_listener(HttpServletRequest request, @ModelAttribute ListenerVo listenerVo) {
		System.out.println("fwd : " +listenerVo);
		HttpSession session = request.getSession();
		session.setAttribute("listener", listenerVo);
		System.out.println(listenerVo);
		
		return "user/join_listener";
	}
	
	@RequestMapping(value ="/join_success")
	public String joinsuccess(HttpServletRequest request, 
			@RequestParam("stress_degree") String stress_degrees) {

		HttpSession session = request.getSession();
		TalkerVo talkerVo = (TalkerVo)session.getAttribute("talker");
		
		String stress_degree = stress_degrees;
			
		talkerVo.setEmail(talkerVo.getEmail());
		talkerVo.setPassword(talkerVo.getPassword());
		talkerVo.setNickname(talkerVo.getNickname());
		talkerVo.setStress_degree(stress_degree);
		talkerVo.setConsulting_topic(talkerVo.getConsulting_topic());
		System.out.println("fwd2 : " +talkerVo);
		userService.join_talker(talkerVo);
		return "user/join_success";
	}
	
	@RequestMapping(value ="/join_success2")
	public String joinsuccess(HttpServletRequest request){

		HttpSession session = request.getSession();
		ListenerVo listenerVo = (ListenerVo)session.getAttribute("listener");
		System.out.println("fwd2 : " +listenerVo);

		listenerVo.setEmail(listenerVo.getEmail());
		listenerVo.setPassword(listenerVo.getPassword());
		listenerVo.setNickname(listenerVo.getNickname());
		listenerVo.setConsulting_topic(listenerVo.getConsulting_topic());

		userService.join_listener(listenerVo);
		return "user/join_success";
	}
	
	@RequestMapping(value = "/loginform")
	public String login(Locale locale, Model model) {

		return "user/loginform";
	}
	

	@RequestMapping(value="/modify_check")
	@ResponseBody
	public Object check_modify(@RequestParam("modify_pw") String modify_pw,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String userType = (String)session.getAttribute("userType");

		Map<String, Object> map = new HashMap<String, Object>();
		
		if(userType.equals("talker")){
			TalkerVo authUser = (TalkerVo)session.getAttribute("authUser");
			String authPw = authUser.getPassword();
			if(authPw.equals(modify_pw)){
				map.put("isEqual", true);
				System.out.println("equal");
			}else{
				map.put("isEqual", false);
				System.out.println("not equal");
			}
			
		}else if (userType.equals("listener")){
			ListenerVo authUser = (ListenerVo)session.getAttribute("authUser");
			String authPw = authUser.getPassword();
			if(authPw.equals(modify_pw)){
				map.put("isEqual", true);
				System.out.println("equal");
			}else{
				map.put("isEqual", false);
				System.out.println("not equal");
			}
		}else{
			map.put("isEqual", false);
			
		}
		
		return map;
	}
	
	@RequestMapping(value = "/login", method=RequestMethod.POST )
	public String login( HttpSession session, 
			@ModelAttribute TalkerVo talkerVo,
			@ModelAttribute ListenerVo listenerVo,
			@RequestParam("userType") String userType) {
		
		System.out.println("login 컨트롤러 : " + userType);

		if (userType.equals("talker")) {
			TalkerVo authUser = userService.login_talker(talkerVo);
			if (authUser == null) {
				return "/user/login_fail";
			}
			// 인증 처리
			session.setAttribute("authUser", authUser);
			session.setAttribute("userType", userType);

			// 로그인 유저 세션 정보 리스트에 저장
			SessionHandler ssHandler = SessionHandler.getInstance();
			ssHandler.add(authUser.getEmail(), session);
		} else {
			ListenerVo authUser = userService.login_listener(listenerVo);
			if (authUser == null) {
				return "/user/login_fail";
			}
			// 인증 처리
			session.setAttribute("authUser", authUser);
			session.setAttribute("userType", userType);

			// 로그인 유저 세션 정보 리스트에 저장
			SessionHandler ssHandler = SessionHandler.getInstance();
			ssHandler.add(authUser.getEmail(), session);
		}

		// redirect
		return "main/index";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session != null) {
			SessionHandler ssHandler = SessionHandler.getInstance();
			// ssHandler.delete(session);

			String userType = (String) session.getAttribute("userType");
			System.out.println("usertype : "+userType);
			if (userType.equals("talker")) {
				TalkerVo authUser = (TalkerVo) session.getAttribute("authUser");
				System.out.println("logout talker");
				ssHandler.delete(authUser.getEmail());
			} else {
				ListenerVo authUser = (ListenerVo) session.getAttribute("authUser");
				System.out.println("logout listener");
				ssHandler.delete(authUser.getEmail());
			}
			
			session.removeAttribute("authUser");
			System.out.println("로그아웃안되는거니?");
			session.invalidate();
		}
		return "main/index";
	}
	
	
	
	
	@RequestMapping(value ="/modifyform")
	public String modify() {
		return "user/modifyform";
	}
	
	@RequestMapping(value ="/modify_lock")
	public String modify_lock() {
		return "user/modify_lock";
	}
	
	//회원 정보 수정
	@RequestMapping(value ="/update_user", method=RequestMethod.POST )
	public String update_user( HttpSession session, 
			@ModelAttribute TalkerVo talkerVo,
			@ModelAttribute ListenerVo listenerVo) {
		String userType = (String)session.getAttribute("userType");
		System.out.println("update 컨트롤러 : " + userType);

		if (userType.equals("talker")) {
			TalkerVo authUser = (TalkerVo) session.getAttribute("authUser");
			talkerVo.setEmail(authUser.getEmail());
			authUser = userService.update_talker(talkerVo);
			session.setAttribute("authUser", authUser);
			// 인증 처리
		} else {
			ListenerVo authUser = (ListenerVo) session.getAttribute("authUser");
			listenerVo.setEmail(authUser.getEmail());
			authUser = userService.update_listener(listenerVo);
			session.setAttribute("authUser", authUser);
			// 인증 처리
		}
		return "main/index";
	}
	
	//회원 탈퇴
	@RequestMapping(value ="/delete_user", method=RequestMethod.POST )
	public String delete_user( HttpSession session, 
			@ModelAttribute TalkerVo talkerVo,
			@ModelAttribute ListenerVo listenerVo) {
		String userType = (String)session.getAttribute("userType");
		System.out.println("delete 컨트롤러 : " + userType);

		if (userType.equals("talker")) {
			TalkerVo authUser = (TalkerVo) session.getAttribute("authUser");
			talkerVo.setEmail(authUser.getEmail());
			authUser = userService.delete_talker(talkerVo);
			session.setAttribute("authUser", authUser);
			// 인증 처리
		} else {
			ListenerVo authUser = (ListenerVo) session.getAttribute("authUser");
			listenerVo.setEmail(authUser.getEmail());
			authUser = userService.delete_listener(listenerVo);
			session.setAttribute("authUser", authUser);
			// 인증 처리
		}
		session.invalidate();
		return "main/index";
	}
	
	@RequestMapping(value = "/sessionout_exitbrowser")
	@ResponseBody
	public Object sessionout_exitbrowser( HttpServletRequest request) {

		// 회원가입 유저 타입 저장(토커, 리스너)
		HttpSession session = request.getSession();
		SessionHandler ssHandler = SessionHandler.getInstance();
		
		String userType = (String) session.getAttribute("userType");
		if (userType.equals("talker")) {
			TalkerVo authUser = (TalkerVo) session.getAttribute("authUser");
			ssHandler.delete(authUser.getEmail());
			System.out.println("exit browser talker"); 
		} else {
			ListenerVo authUser = (ListenerVo) session.getAttribute("authUser");
			ssHandler.delete(authUser.getEmail());
			System.out.println("exit browser listener"); 
		}
		return ssHandler.selectUserMap();
	}
}