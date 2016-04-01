package com.bit.kuku.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.kuku.dao.MongoDao;
import com.bit.kuku.service.UserService;
import com.bit.kuku.vo.ChatVo;

@Controller
public class MainController {

	@Autowired
	MongoDao mongoDao;
	
	@Autowired
	UserService userService;

	@RequestMapping(value="/main")
	public String main() {
		return "main/index";
	}
	
}

