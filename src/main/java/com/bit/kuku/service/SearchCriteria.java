package com.bit.kuku.service;

public class SearchCriteria extends Criteria {
	
	private String searchType;
	private String searchType_score;
	private String onlineType;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchType_score() {
		return searchType_score;
	}
	public void setSearchType_score(String searchType_score) {
		this.searchType_score = searchType_score;
	}
	public String getOnlineType() {
		return onlineType;
	}
	public void setOnlineType(String onlineType) {
		this.onlineType = onlineType;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", searchType_score=" + searchType_score + ", onlineType="
				+ onlineType + "]";
	}
}
