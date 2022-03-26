package com.spring.dct.vo;

import java.sql.Timestamp;

public class CommunitiesVO {

	private int communityNo;
	private int userNo;
	private String communityTitle;
	private String communityContent;
	private int communityViewCount;
	private Timestamp communityCreateDate;

	public int getCommunityNo() {
		return communityNo;
	}

	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getCommunityTitle() {
		return communityTitle;
	}

	public void setCommunityTitle(String communityTitle) {
		this.communityTitle = communityTitle;
	}

	public String getCommunityContent() {
		return communityContent;
	}

	public void setCommunityContent(String communityContent) {
		this.communityContent = communityContent;
	}

	public int getCommunityViewCount() {
		return communityViewCount;
	}

	public void setCommunityViewCount(int communityViewCount) {
		this.communityViewCount = communityViewCount;
	}

	public Timestamp getCommunityCreateDate() {
		return communityCreateDate;
	}

	public void setCommunityCreateDate(Timestamp communityCreateDate) {
		this.communityCreateDate = communityCreateDate;
	}

	@Override
	public String toString() {
		return "CommunitiesVO [communityNo=" + communityNo + ", userNo=" + userNo + ", communityTitle=" + communityTitle
				+ ", communityContent=" + communityContent + ", communityViewCount=" + communityViewCount
				+ ", communityCreateDate=" + communityCreateDate + "]";
	}

}
