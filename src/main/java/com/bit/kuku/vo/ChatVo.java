package com.bit.kuku.vo;

import java.text.SimpleDateFormat;

public class ChatVo {

	private int idx;
	private String Sender_email;
	private String receiver_email;
	private String chat;
	private SimpleDateFormat time;
	private boolean receiver_response;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSender_email() {
		return Sender_email;
	}
	public void setSender_email(String sender_email) {
		Sender_email = sender_email;
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
	public SimpleDateFormat getTime() {
		return time;
	}
	public void setTime(SimpleDateFormat time) {
		this.time = time;
	}
	public boolean isReceiver_response() {
		return receiver_response;
	}
	public void setReceiver_response(boolean receiver_response) {
		this.receiver_response = receiver_response;
	}
	
	@Override
	public String toString() {
		return "ChatVo [idx=" + idx + ", Sender_email=" + Sender_email + ", receiver_email=" + receiver_email
				+ ", chat=" + chat + ", time=" + time + ", receiver_response=" + receiver_response + "]";
	}
}
