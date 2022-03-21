package com.spring.dct.vo;

import java.sql.Timestamp;

public class PointsVO {

	private int pointNo;
	private int userNo;
	private String adminId;
	private Timestamp pointExpirationDate;
	private Timestamp pointPaymentDate;
	private String pointStatus;

	public int getPointNo() {
		return pointNo;
	}

	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
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

	public Timestamp getPointExpirationDate() {
		return pointExpirationDate;
	}

	public void setPointExpirationDate(Timestamp pointExpirationDate) {
		this.pointExpirationDate = pointExpirationDate;
	}

	public Timestamp getPointPaymentDate() {
		return pointPaymentDate;
	}

	public void setPointPaymentDate(Timestamp pointPaymentDate) {
		this.pointPaymentDate = pointPaymentDate;
	}

	public String getPointStatus() {
		return pointStatus;
	}

	public void setPointStatus(String pointStatus) {
		this.pointStatus = pointStatus;
	}

	@Override
	public String toString() {
		return "PointsVO [pointNo=" + pointNo + ", userNo=" + userNo + ", adminId=" + adminId + ", pointExpirationDate="
				+ pointExpirationDate + ", pointPaymentDate=" + pointPaymentDate + ", pointStatus=" + pointStatus + "]";
	}

}
