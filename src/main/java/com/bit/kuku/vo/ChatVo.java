package com.bit.kuku.vo;

public class ChatVo {

	private String chatroom_num;
	private String user_type;
	private String sender_email;
	private String receiver_email;
	private String chat;
	private String time;
	private String receiver_response;//0이면 안읽은거고 1이면 읽은 메시지

	public String getChatroom_num() {
		return chatroom_num;
	}

	public void setChatroom_num(String chatroom_num) {
		this.chatroom_num = chatroom_num;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public String getSender_email() {
		return sender_email;
	}

	public void setSender_email(String sender_email) {
		this.sender_email = sender_email;
	}

	public String getReceiver_email() {
		return receiver_email;
	}

	public void setReceiver_email(String receiver_email) {
		this.receiver_email = receiver_email;
	}

	public String getChat() {
		return chat;
	}

	public void setChat(String chat) {
		this.chat = chat;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getReceiver_response() {
		return receiver_response;
	}

	public void setReceiver_response(String receiver_response) {
		this.receiver_response = receiver_response;
	}
}
