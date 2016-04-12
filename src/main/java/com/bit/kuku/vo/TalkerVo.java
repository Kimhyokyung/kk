package com.bit.kuku.vo;

public class TalkerVo {
	
	private String email;
	private String password;
	private String nickname;
	private String stress_degree;
	private String consulting_topic;
	
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
	public String getStress_degree() {
		return stress_degree;
	}
	public void setStress_degree(String stress_degree) {
		this.stress_degree = stress_degree;
	}
	public String getConsulting_topic() {
		return consulting_topic;
	}
	public void setConsulting_topic(String consulting_topic) {
		this.consulting_topic = consulting_topic;
	}
	
	@Override
	public String toString() {
		return "TalkerVo [email=" + email + ", password=" + password + ", nickname=" + nickname + ", stress_degree="
				+ stress_degree + ", consulting_topic=" + consulting_topic + "]";
	}
}