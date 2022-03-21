package com.spring.dct.vo;

import java.sql.Timestamp;

public class CouponsVO {

	private int couponNo;
	private int userNo;
	private String adminId;
	private String couponName;
	private String couponNumber;
	private int couponPrice;
	private Timestamp couponPaymentDate;
	private Timestamp couponExpirationDate;
	private String couponStatus;

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
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

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public String getCouponNumber() {
		return couponNumber;
	}

	public void setCouponNumber(String couponNumber) {
		this.couponNumber = couponNumber;
	}

	public int getCouponPrice() {
		return couponPrice;
	}

	public void setCouponPrice(int couponPrice) {
		this.couponPrice = couponPrice;
	}

	public Timestamp getCouponPaymentDate() {
		return couponPaymentDate;
	}

	public void setCouponPaymentDate(Timestamp couponPaymentDate) {
		this.couponPaymentDate = couponPaymentDate;
	}

	public Timestamp getCouponExpirationDate() {
		return couponExpirationDate;
	}

	public void setCouponExpirationDate(Timestamp couponExpirationDate) {
		this.couponExpirationDate = couponExpirationDate;
	}

	public String getCouponStatus() {
		return couponStatus;
	}

	public void setCouponStatus(String couponStatus) {
		this.couponStatus = couponStatus;
	}

	@Override
	public String toString() {
		return "CouponsVO [couponNo=" + couponNo + ", userNo=" + userNo + ", adminId=" + adminId + ", couponName="
				+ couponName + ", couponNumber=" + couponNumber + ", couponPrice=" + couponPrice
				+ ", couponPaymentDate=" + couponPaymentDate + ", couponExpirationDate=" + couponExpirationDate
				+ ", couponStatus=" + couponStatus + "]";
	}

}
