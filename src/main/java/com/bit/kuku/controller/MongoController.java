package com.bit.kuku.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.kuku.vo.ChatVo;

@Controller
//@RequestMapping("/talker")
public class MongoController {

	@Autowired
	private MongoTemplate mongoTemplate;

	//@RequestMapping(value = "/chat_insert", method = RequestMethod.GET)
	public void chat_insert() {
		MongoOperations mongoOperation = (MongoOperations) mongoTemplate;

		ChatVo chatvo = new ChatVo("1", "sender", "receiver", "chat_log", "time", "false");
		System.out.println("몽고디비에 넣기");
		mongoOperation.save(chatvo);

	}

	//@RequestMapping(value = "/chat_select", method = RequestMethod.GET)
	public void chat_select() {
		MongoOperations mongoOperation = (MongoOperations) mongoTemplate;
		List<ChatVo> chatvo_return = mongoOperation.find(new Query(Criteria.where("Sender_email").is("sender")),
				ChatVo.class);

		int count = chatvo_return.size();
		for (int i = 0; i < count; i++)
			System.out.println(chatvo_return.get(i).toString());
	}

}