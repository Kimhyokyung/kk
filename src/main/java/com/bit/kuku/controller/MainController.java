package com.bit.kuku.controller;

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

import com.bit.kuku.service.UserService;
import com.bit.kuku.vo.UserVo;

@Controller
public class MainController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/main")
	public String main(Locale locale, Model model) {
		
		// ----------------------------------------------------
		// userList select문 테스트 예제
		List<UserVo> userList = userService.getUserList();
		for(int i=0; i<userList.size(); i++) {
			System.out.println(userList.get(i).toString());
		}
		// ----------------------------------------------------
		
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
	
	//회원가입 버튼 클릭
	@RequestMapping( value="/join", method=RequestMethod.POST )
	public String join( @ModelAttribute UserVo userVo ) {
		System.out.println( userVo );
		userService.join( userVo );
		return "user/join_talker";
	}
	
	@RequestMapping( value="/join_Listener", method=RequestMethod.POST )
	public String join_Listener( @ModelAttribute UserVo userVo ) {
		System.out.println( userVo );
		userService.join( userVo );
		return "user/Listener_Question";
	}
}
