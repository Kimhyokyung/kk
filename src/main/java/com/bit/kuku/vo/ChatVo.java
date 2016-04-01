package com.bit.kuku.vo;

import java.text.SimpleDateFormat;

public class ChatVo {

	private String chatroom_num;
	private String sender_email;
	private String receiver_email;
	private String chat;
	private String time;
	private String receiver_response;
	
	public ChatVo() {
		  super();
		  // TODO Auto-generated constructor stub
		 }

		 public ChatVo(String chatroom_num, String sender_email, String receiver_email, String chat,
				 String time, String receiver_response) {
		  super();
		  this.chatroom_num = chatroom_num;
		  this.sender_email = sender_email;
		  this.receiver_email = receiver_email;
		  this.chat = chat;
		  this.time = time;
		  this.receiver_response=receiver_response;
		 }
	
	public String getChatroom_num() {
			return chatroom_num;
		}

		public void setChatroom_num(String chatroom_num) {
			this.chatroom_num = chatroom_num;
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

		@Override
		public String toString() {
			return "ChatVo [chatroom_num=" + chatroom_num + ", sender_email=" + sender_email + ", receiver_email="
					+ receiver_email + ", chat=" + chat + ", time=" + time + ", receiver_response=" + receiver_response
					+ "]";
		}

	
}
