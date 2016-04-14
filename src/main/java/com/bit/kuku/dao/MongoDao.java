package com.bit.kuku.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.bit.kuku.vo.ChatVo;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;

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
	
	public int receiver_response_count(String chatroom_num, String receiver_email) {
		MongoOperations mongoOperation = (MongoOperations) mongoTemplate;
		
		Query query = new Query();
		query.addCriteria(Criteria.where("chatroom_num").is(chatroom_num).and("receiver_email").is(receiver_email).and("receiver_response").is("false"));
		
		List<Object> list = mongoOperation.find(query, Object.class, "chatlog");
		
		return list.size();		
	}
	
	public int receiver_response_count_sum(String receiver_email) {
		MongoOperations mongoOperation = (MongoOperations) mongoTemplate;
		
		Query query = new Query();
		query.addCriteria(Criteria.where("receiver_email").is(receiver_email).and("receiver_response").is("false"));
		
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
	}
	
	public int chatroom_chat_count(String chatroom_num) {
		MongoOperations mongoOperation = (MongoOperations) mongoTemplate;
		
		Query query = new Query();
		query.addCriteria(Criteria.where("chatroom_num").is(chatroom_num));
		int chatroomCnt = mongoOperation.find(query, Object.class, "chatlog").size();
		System.out.println(chatroom_num + "번 채팅방 채팅 갯수 : " + chatroomCnt);
		
		return chatroomCnt;
	}
	
	public void saveEmotionImage(String fileName) {
		System.out.println("파일 저장 함수 호출");
		try {
			GridFS gridFs = new GridFS(mongoTemplate.getDb(), "photo");
		    GridFSDBFile outputImageFile = gridFs.findOne(fileName);
		    System.out.println("몽고다오:"+fileName);
		    System.out.println(outputImageFile);
		    
		    //윈도우
		    //String graph_image_path = "C://Users//bit-user//git//kk//src//main//webapp//assets//graph_image//";
		    //리눅스
		    String graph_image_path = "//usr//local//tomcat8//webapps//kuku//assets//graph_image//";;
		    String imageLocation = graph_image_path + fileName + ".png";
		    
		    try {
		    	File file = new File(imageLocation);
		    	FileInputStream fis = new FileInputStream(file);
		    } catch(NullPointerException nullExcp) {
		    	nullExcp.printStackTrace();
		    } catch(FileNotFoundException fileExcp) {
		    	
		    	try {
			    	// 새로운 감정분석 이미지 저장
			    	outputImageFile.writeTo(imageLocation);
			    	
			    	// 3초 동안 무조건 타임슬립 코드(3초 이상 걸릴 경우 작동 제대로 안함)
				    long time = 5;
			    	TimeUnit.SECONDS.sleep(time);
			    	System.out.println("3초간 타임슬립");
		    	} catch(InterruptedException e) {
		    		
		    	}
		    }
		    
		    /*System.out.println("파일 저장 체크 while문 진입");
		    boolean isSaved = false;
		    File file = null;
		    while(!isSaved) {
				try {
					file = new File(imageLocation);
					System.out.println(file);
				} catch(NullPointerException e) {
					System.out.println("파일 아직 저장 안됨");
					continue;
				}
				System.out.println("파일 저장 완료");
				isSaved = true;
		    }
		    System.out.println("파일 저장 체크 while문 벗어남");	*/	
		} catch (IOException e) {
			
		}
	}
}