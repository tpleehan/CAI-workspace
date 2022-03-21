package com.spring.dct.vo;

public class MentoringsVO {

	private int mentoringNo;
	private int userNo;
	private String mentoringTitle;
	private String mentoringContent;
	private int mentoringPrice;
	private int mentoringDiscountPrice;

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

	@Override
	public String toString() {
		return "MentoringsVO [mentoringNo=" + mentoringNo + ", userNo=" + userNo + ", mentoringTitle=" + mentoringTitle
				+ ", mentoringContent=" + mentoringContent + ", mentoringPrice=" + mentoringPrice
				+ ", mentoringDiscountPrice=" + mentoringDiscountPrice + "]";
	}

}
