package com.bit.kuku.vo;

public class ChatroomVo {

	private int idx;
	private String talker_email;
	private String talker_nickname;
	private String listener_email;
	private String listener_nickname;
	private boolean listener_response;	//1이면 채팅방 있음, 0이면 요청리스트에 있어서 아직 채팅방 없음.
	private String last_chat_time;

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

	public String getTalker_nickname() {
		return talker_nickname;
	}

	public void setTalker_nickname(String talker_nickname) {
		this.talker_nickname = talker_nickname;
	}

	public String getListener_email() {
		return listener_email;
	}

	public void setListener_email(String listener_email) {
		this.listener_email = listener_email;
	}

	public String getListener_nickname() {
		return listener_nickname;
	}

	public void setListener_nickname(String listener_nickname) {
		this.listener_nickname = listener_nickname;
	}

	public boolean isListener_response() {
		return listener_response;
	}

	public void setListener_response(boolean listener_response) {
		this.listener_response = listener_response;
	}

	public String getLast_chat_time() {
		if (last_chat_time != null) {
			String[] timeArr = last_chat_time.split(":");
			return timeArr[0] + ":" + timeArr[1];
		} else {
			return last_chat_time;
		}
	}

	public void setLast_chat_time(String last_chat_time) {
		this.last_chat_time = last_chat_time;
	}

	@Override
	public String toString() {
		return "ChatroomVo [idx=" + idx + ", talker_email=" + talker_email + ", talker_nickname=" + talker_nickname
				+ ", listener_email=" + listener_email + ", listener_nickname=" + listener_nickname
				+ ", listener_response=" + listener_response + ", last_chat_time=" + last_chat_time + "]";
	}
}
