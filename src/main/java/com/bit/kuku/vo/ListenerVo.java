package com.bit.kuku.vo;

public class ListenerVo {
	private int idx;
	private String email;
	private String password;
	private String nickname;
	private int jumsu;
	private String consulting_topic;
				
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getJumsu() {
		return jumsu;
	}
	public void setJumsu(int jumsu) {
		this.jumsu = jumsu;
	}
	public String getConsulting_topic() {
		return consulting_topic;
	}
	public void setConsulting_topic(String consulting_topic) {
		this.consulting_topic = consulting_topic;
	}
	@Override
	public String toString() {
		return "ListenerVo [idx=" + idx + ", email=" + email + ", password=" + password+ "," 
				+ ", nickname =" + nickname+ ", consulting_topic="+ consulting_topic +"]";
	}
}
