package com.spring.dct.vo;

import java.sql.Timestamp;

public class MentoringsVO {

	private int mentoringNo;
	private int userNo;
	private String userName;
	private String mentoringTitle;
	private String mentoringContent;
	private int mentoringPrice;
	private int mentoringDiscountPrice;
	private Timestamp mentoringCreateDate;
	private int categoryNo;
	private int mentoringLike;

	public int getMentoringNo() {
		return mentoringNo;
	}

	public void setMentoringNo(int mentoringNo) {
		this.mentoringNo = mentoringNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMentoringTitle() {
		return mentoringTitle;
	}

	public void setMentoringTitle(String mentoringTitle) {
		this.mentoringTitle = mentoringTitle;
	}

	public String getMentoringContent() {
		return mentoringContent;
	}

	public void setMentoringContent(String mentoringContent) {
		this.mentoringContent = mentoringContent;
	}

	public int getMentoringPrice() {
		return mentoringPrice;
	}

	public void setMentoringPrice(int mentoringPrice) {
		this.mentoringPrice = mentoringPrice;
	}

	public int getMentoringDiscountPrice() {
		return mentoringDiscountPrice;
	}

	public void setMentoringDiscountPrice(int mentoringDiscountPrice) {
		this.mentoringDiscountPrice = mentoringDiscountPrice;
	}

	public Timestamp getMentoringCreateDate() {
		return mentoringCreateDate;
	}

	public void setMentoringCreateDate(Timestamp mentoringCreateDate) {
		this.mentoringCreateDate = mentoringCreateDate;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getMentoringLike() {
		return mentoringLike;
	}

	public void setMentoringLike(int mentoringLike) {
		this.mentoringLike = mentoringLike;
	}

	@Override
	public String toString() {
		return "MentoringsVO [mentoringNo=" + mentoringNo + ", userNo=" + userNo + ", userName=" + userName
				+ ", mentoringTitle=" + mentoringTitle + ", mentoringContent=" + mentoringContent + ", mentoringPrice="
				+ mentoringPrice + ", mentoringDiscountPrice=" + mentoringDiscountPrice + ", mentoringCreateDate="
				+ mentoringCreateDate + ", categoryNo=" + categoryNo + ", mentoringLike=" + mentoringLike + "]";
	}

}
