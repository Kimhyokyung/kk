package com.bit.kuku.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		return "index";
	}
	
	@RequestMapping(value ="/login")
	public String login(Locale locale, Model model) {
		
		return "login";
	}
	
	@RequestMapping(value ="/register")
	public String register(Locale locale, Model model) {
		
		return "registration";
	}
}
