package com.bit.kuku.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.bit.kuku.vo.ChatVo;

@Repository
public class MongoDao {
	
	@Autowired
	private MongoTemplate mongoTemplate;
	
	@Autowired
	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}

	public void chat_insert(ChatVo chat) {
		
		MongoOperations mongoOperation = (MongoOperations) mongoTemplate;
		mongoOperation.save(chat, "chatlog");
	}

	public void chat_select(int chatroom_id) {
		MongoOperations mongoOperation = (MongoOperations) mongoTemplate;
		List<ChatVo> list = mongoOperation.find(new Query(Criteria.where("chatroom_id").is(chatroom_id)), ChatVo.class, "chatlog");

		for (int i = 0; i < list.size(); i++)
			System.out.println(list.get(i).toString());
	}
}