package com.spring.dct.vo;

import java.sql.Timestamp;

public class freeReplyVO {

	private int rno;
	private int userNo;
	private int communityNo;
	private String replyWriter;
	private String replyText;
	
	private Timestamp replyDate;
	private Timestamp updateDate;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getCommunityNo() {
		return communityNo;
	}
	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}
	public Timestamp getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Timestamp replyDate) {
		this.replyDate = replyDate;
	}
	public Timestamp getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}
	
	@Override
	public String toString() {
		return "freeReplyVO [rno=" + rno + ", userNo=" + userNo + ", communityNo=" + communityNo + ", replyWriter="
				+ replyWriter + ", replyText=" + replyText + ", replyDate=" + replyDate + ", updateDate=" + updateDate
				+ "]";
	}
	
	
	
	
	

}
