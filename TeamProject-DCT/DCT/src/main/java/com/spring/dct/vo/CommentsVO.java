package com.spring.dct.vo;

import java.sql.Timestamp;

public class CommentsVO {

	private int commentNo;
	private int communityNo;
	private int userNo;
	private String commentContents;
	private Timestamp commentCreateDate;

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

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

	public String getCommentContents() {
		return commentContents;
	}

	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}

	public Timestamp getCommentCreateDate() {
		return commentCreateDate;
	}

	public void setCommentCreateDate(Timestamp commentCreateDate) {
		this.commentCreateDate = commentCreateDate;
	}

	@Override
	public String toString() {
		return "CommentsVO [commentNo=" + commentNo + ", communityNo=" + communityNo + ", userNo=" + userNo
				+ ", commentContents=" + commentContents + ", commentCreateDate=" + commentCreateDate + "]";
	}

}
