package com.spring.dct.vo;

import java.sql.Timestamp;

public class QnaBoardsVO {

	private int qnaNo;
	private int userNo;
	private String adminId;
	private String qnaTitle;
	private String qnaContent;
	private Timestamp qnaDate;

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Timestamp getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Timestamp qnaDate) {
		this.qnaDate = qnaDate;
	}

	@Override
	public String toString() {
		return "QnaBoardsVO [qnaNo=" + qnaNo + ", userNo=" + userNo + ", adminId=" + adminId + ", qnaTitle=" + qnaTitle
				+ ", qnaContent=" + qnaContent + ", qnaDate=" + qnaDate + "]";
	}

}
