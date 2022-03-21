package com.spring.dct.vo;

import java.sql.Timestamp;

public class PurchasesVO {

	private int purchaseNo;
	private int userNo;
	private int lectureNo;
	private int mentoringNo;
	private Timestamp purchaseCreateDate;
	private int purchaseTotalPrice;

	public int getPurchaseNo() {
		return purchaseNo;
	}

	public void setPurchaseNo(int purchaseNo) {
		this.purchaseNo = purchaseNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getLectureNo() {
		return lectureNo;
	}

	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}

	public int getMentoringNo() {
		return mentoringNo;
	}

	public void setMentoringNo(int mentoringNo) {
		this.mentoringNo = mentoringNo;
	}

	public Timestamp getPurchaseCreateDate() {
		return purchaseCreateDate;
	}

	public void setPurchaseCreateDate(Timestamp purchaseCreateDate) {
		this.purchaseCreateDate = purchaseCreateDate;
	}

	public int getPurchaseTotalPrice() {
		return purchaseTotalPrice;
	}

	public void setPurchaseTotalPrice(int purchaseTotalPrice) {
		this.purchaseTotalPrice = purchaseTotalPrice;
	}

	@Override
	public String toString() {
		return "PurchasesVO [purchaseNo=" + purchaseNo + ", userNo=" + userNo + ", lectureNo=" + lectureNo
				+ ", mentoringNo=" + mentoringNo + ", purchaseCreateDate=" + purchaseCreateDate
				+ ", purchaseTotalPrice=" + purchaseTotalPrice + "]";
	}

}
