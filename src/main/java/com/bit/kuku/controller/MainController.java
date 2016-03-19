package com.bit.kuku.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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

import oracle.net.aso.s;

@Controller
public class MainController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/main")
	public String main(Locale locale, Model model) {
		
		return "main/index";
	}
	
	@RequestMapping(value ="/login")
	public String login(Locale locale, Model model) {
		
		return "/user/login";
	}
	
	@RequestMapping( value="/login2", method=RequestMethod.POST )
	public String login( HttpSession session, @ModelAttribute UserVo userVo ) {
		UserVo authUser = userService.login( userVo );
		
		if( authUser == null ) {
			return "/user/login_fail";
		}
		
		// 인증 처리
		session.setAttribute( "authUser", authUser);
		
		// redirect
		return "/main/index";
	}
	/*
	@RequestMapping( value="/login_talker", method=RequestMethod.POST )
	public String login( HttpSession session, @ModelAttribute TalkerVo talkerVo ) {
		TalkerVo authUser = userService.login_talker( talkerVo );
		
		if( authUser == null ) {
			return "/user/login_fail";
		}
		
		// 인증 처리
		session.setAttribute( "authUser", authUser);
		
		// redirect
		return "/main/index";
	}*/
	
	@RequestMapping( value="/logout" )
	public String logout( HttpServletRequest request ) {
		HttpSession session = request.getSession();
		if( session != null ) {
			//request.removeAttribute( "authUser" );
			session.removeAttribute("authUser");
			session.invalidate();
		}
		return "/main/index";
	}
	
	@RequestMapping(value ="/registration")
	public String register(Locale locale, Model model) {
		
		return "/user/registration";
	}
	
	@RequestMapping( value="/join_talker")
	public String join_talker(HttpServletRequest request, @ModelAttribute UserVo userVo) {
		System.out.println("fwd : " +userVo);
		HttpSession session = request.getSession();
		session.setAttribute("user", userVo);
		return "user/join_talker";
	}
	
	@RequestMapping(value ="/joinsuccess")
	public String joinsuccess(HttpServletRequest request, @RequestParam("stress_degree") String stress_degrees,
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
			return "/user/joinsuccess";
		} else {
			// 리스너 가입
		
		}
		return "/user/joinsuccess";
	}
}
