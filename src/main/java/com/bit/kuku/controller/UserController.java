package com.bit.kuku.controller;

import java.util.HashMap;
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

import com.bit.kuku.service.UserService;
import com.bit.kuku.vo.TalkerVo;
import com.bit.kuku.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value ="/select_join_type")
	public String register_first() {
		return "user/select_join_type";
	}
	
	@RequestMapping("/check_email")
	@ResponseBody
	public Object checkEmail(@RequestParam("email") String email) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 이메일 중복 확인
		UserVo userVo = userService.checkEmail(email);
		if(userVo != null)
		{
			System.out.println(userVo.getEmail() + "유저 존재");
			map.put("exist", true);
		} else {
			map.put("exist", false);
		}
		
		return map;
	}
	
	@RequestMapping(value ="/joinform")
	public String register_second() {
		return "user/joinform";
	}

	@RequestMapping(value="/join_talker")
	public String join_talker(HttpServletRequest request, @ModelAttribute UserVo userVo) {
//		System.out.println("fwd : " +userVo);
//		HttpSession session = request.getSession();
//		session.setAttribute("user", userVo);
		return "user/join_talker";
	}

	@RequestMapping(value="/join_listener")
	public String join_listener(HttpServletRequest request, @ModelAttribute UserVo userVo) {
//		System.out.println("fwd : " +userVo);
//		HttpSession session = request.getSession();
//		session.setAttribute("user", userVo);
		return "user/join_listener";
	}
	
	@RequestMapping(value ="/join_success")
	public String joinsuccess(HttpServletRequest request, 
			@RequestParam("stress_degree") String stress_degrees,
			@RequestParam("consulting_topic") String consulting_topics) {

		HttpSession session = request.getSession();
		UserVo userVo = (UserVo)session.getAttribute("user");
		if(stress_degrees != null && consulting_topics != null) {
			// 토커 가입
			String stress_degree = stress_degrees;
			String consulting_topic = consulting_topics;

			TalkerVo talkerVo = new TalkerVo();
			talkerVo.setEmail(userVo.getEmail());
			talkerVo.setPassword(userVo.getPassword());
			talkerVo.setNickname(userVo.getNickname());
			talkerVo.setStress_degree(stress_degree);
			talkerVo.setConsulting_topic(consulting_topic);


			userService.join_talker(talkerVo);
			return "/user/join_success";
		} else {
			// 리스너 가입

		}
		return "user/joinsuccess";
	}

	@RequestMapping(value ="/loginform")
	public String login(Locale locale, Model model) {

		return "user/login";
	}
	
	@RequestMapping( value="/login", method=RequestMethod.POST )
	public String login( HttpSession session, @ModelAttribute UserVo userVo ) {
		UserVo authUser = userService.login( userVo );

		if( authUser == null ) {
			return "/user/login_fail";
		}

		// 인증 처리
		session.setAttribute( "authUser", authUser);

		// redirect
		return "main/index";
	}
	
	@RequestMapping( value="/logout" )
	public String logout( HttpServletRequest request ) {
		HttpSession session = request.getSession();
		if( session != null ) {
			//request.removeAttribute( "authUser" );
			session.removeAttribute("authUser");
			session.invalidate();
		}
		return "main/index";
	}
	
	@RequestMapping(value ="/Listener_Modify", method=RequestMethod.GET)
	public String Listener_Modify() {
		return "user/Listener_Modify";
	}

	//회원 정보 수정
	@RequestMapping(value ="/update_user", method=RequestMethod.POST)
	public String update_user(@RequestParam("email") String email,
			@RequestParam("password") String password,
			@RequestParam("nickname") String nickname) {

		System.out.println("Listener_Modify"); 

		UserVo user = new UserVo();
		user.setEmail(email);
		user.setPassword(password);
		user.setNickname(nickname);

		System.out.println(user.getEmail());
		System.out.println(user.getPassword());
		System.out.println(user.getNickname());

		userService.update(user);

		return "user/Listener_Modify"; 
	}
}