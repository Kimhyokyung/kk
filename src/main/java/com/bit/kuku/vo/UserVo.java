package com.bit.kuku.vo;

public class UserVo {

	private String email;
	private String nick;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	@Override
	public String toString() {
		return "UserVo [email=" + email + ", nick=" + nick + "]";
	}
}
