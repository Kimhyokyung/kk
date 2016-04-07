package com.bit.kuku.vo;

public class RatingVo {

	private int idx;
	private String talker_email;
	private String listener_email;
	private int helpness;
	private int professionalism;
	private int sympathy;
	private int responsibility;
	private float total_avg;
	
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
	public int getHelpness() {
		return helpness;
	}
	public void setHelpness(int helpness) {
		this.helpness = helpness;
	}
	public int getProfessionalism() {
		return professionalism;
	}
	public void setProfessionalism(int professionalism) {
		this.professionalism = professionalism;
	}
	public int getSympathy() {
		return sympathy;
	}
	public void setSympathy(int sympathy) {
		this.sympathy = sympathy;
	}
	public int getResponsibility() {
		return responsibility;
	}
	public void setResponsibility(int responsibility) {
		this.responsibility = responsibility;
	}
	public float getTotal_avg() {
		return total_avg;
	}
	public void setTotal_avg(float total_avg) {
		this.total_avg = total_avg;
	}
	
	@Override
	public String toString() {
		return "RatingVo [idx=" + idx + ", talker_email=" + talker_email + ", listener_email=" + listener_email
				+ ", helpness=" + helpness + ", professionalism=" + professionalism + ", sympathy=" + sympathy
				+ ", responsibility=" + responsibility + ", total_avg=" + total_avg + "]";
	}
}
