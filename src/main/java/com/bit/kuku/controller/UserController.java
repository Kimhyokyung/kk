package com.bit.kuku.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.kuku.service.UserService;
import com.bit.kuku.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserService userService;
	
	@RequestMapping("/checkemail")
	@ResponseBody
	public Object checkEmail(@RequestParam("email") String email){
		
		System.out.println(email);
		
		UserVo userVo = userService.checkEmail(email);
		if(userVo != null)
			System.out.println(userVo.getEmail() + "유저 존재");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		map.put("data", userVo != null ); //true 존재함, false 존재하지 않음.
		return map;
	}
}
