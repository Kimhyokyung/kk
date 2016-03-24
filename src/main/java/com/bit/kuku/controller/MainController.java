package com.bit.kuku.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.bit.kuku.service.UserService;

@Controller
public class MainController {

	@Autowired
	UserService userService;

	@RequestMapping(value="/main")
	public String main() {
		
		return "main/index";
	}
	
}

