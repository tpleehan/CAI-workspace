package com.spring.dct.vo;

import java.sql.Timestamp;

public class NoticeBoardsVO {

	private int noticeNo;
	private String adminId;
	private String noticeTitle;
	private String noticeContent;
	private Timestamp noticeCeateDate;

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Timestamp getNoticeCeateDate() {
		return noticeCeateDate;
	}

	public void setNoticeCeateDate(Timestamp noticeCeateDate) {
		this.noticeCeateDate = noticeCeateDate;
	}

	@Override
	public String toString() {
		return "NoticeBoardsVO [noticeNo=" + noticeNo + ", adminId=" + adminId + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeCeateDate=" + noticeCeateDate + "]";
	}

}
