package com.bit.kuku.vo;

public class ChatroomVo {
	
	private int idx;
	private String talker_email;
	private String listener_email;
	private boolean listener_response;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTalker_email() {
		return talker_email;
	}
	public void setTalker_email(String talker_email) {
		this.talker_email = talker_email;
	}
	public String getListener_email() {
		return listener_email;
	}
	public void setListener_email(String listener_email) {
		this.listener_email = listener_email;
	}
	public boolean isListener_response() {
		return listener_response;
	}
	public void setListener_response(boolean listener_response) {
		this.listener_response = listener_response;
	}
	@Override
	public String toString() {
		return "ChatroomVo [idx=" + idx + ", talker_email=" + talker_email + ", listener_email=" + listener_email
				+ ", listener_response=" + listener_response + "]";
	}
}
