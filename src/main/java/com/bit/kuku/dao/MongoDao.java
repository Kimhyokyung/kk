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
import org.springframework.data.mongodb.core.query.Update;
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
		System.out.println("mongo insert");
	}

	public List<Object> chat_select(String chatroom_num) {
		MongoOperations mongoOperation = (MongoOperations) mongoTemplate;
		
		Query query = new Query();
		query.addCriteria(Criteria.where("chatroom_num").is(chatroom_num));
			
		List<Object> list = mongoOperation.find(query, Object.class, "chatlog");
		return list;
	}
	
	public int receiver_response_count(String chatroom_num, String receiver_email){
		MongoOperations mongoOperation = (MongoOperations) mongoTemplate;
		
		Query query = new Query();
		query.addCriteria(Criteria.where("chatroom_num").is(chatroom_num).and("receiver_email").is(receiver_email).and("receiver_response").is("false"));
			
		List<Object> list = mongoOperation.find(query, Object.class, "chatlog");
		
		return list.size();		
	}
	
	public void receiver_response_read(String chatroom_num, String receiver_email){
		MongoOperations mongoOperation = (MongoOperations) mongoTemplate;
		
		Query query = new Query();
		query.addCriteria(Criteria.where("chatroom_num").is(chatroom_num).and("receiver_email").is(receiver_email).and("receiver_response").is("false"));
			
		Update update = new Update();
		update.set("receiver_response", "true");
		mongoOperation.updateMulti(query, update, "chatlog");
		System.out.println(query.toString());
		
		//List<Object> list = mongoOperation.findAndModify(query, update, Object.class, "chatlog");
	}
}