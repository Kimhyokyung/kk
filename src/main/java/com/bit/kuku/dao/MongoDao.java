package com.bit.kuku.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

	public List<Object> chat_select(String chatroom_num) {
		MongoOperations mongoOperation = (MongoOperations) mongoTemplate;
		
		Query query = new Query();
		query.addCriteria(Criteria.where("chatroom_num").is(chatroom_num));
			
		List<Object> list = mongoOperation.find(query, Object.class, "chatlog");
		return list;
	}
}