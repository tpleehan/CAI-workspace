package com.spring.dct.vo;

public class PurchaseDetailsVO {

	private int purchaseNo;
	private int lectureNo;
	private int purchaseAmount;
	private int purchasePrice;

	public int getPurchaseNo() {
		return purchaseNo;
	}

	public void setPurchaseNo(int purchaseNo) {
		this.purchaseNo = purchaseNo;
	}

	public int getLectureNo() {
		return lectureNo;
	}

	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}

	public int getPurchaseAmount() {
		return purchaseAmount;
	}

	public void setPurchaseAmount(int purchaseAmount) {
		this.purchaseAmount = purchaseAmount;
	}

	public int getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(int purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	@Override
	public String toString() {
		return "PurchaseDetailsVO [purchaseNo=" + purchaseNo + ", lectureNo=" + lectureNo + ", purchaseAmount="
				+ purchaseAmount + ", purchasePrice=" + purchasePrice + "]";
	}

}
