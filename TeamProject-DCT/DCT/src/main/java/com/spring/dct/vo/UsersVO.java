package com.spring.dct.vo;

import java.sql.Timestamp;

public class UsersVO {
	
	private int userNo;
	private String adminId;
	private String userId;
	private String userPw;
	private String userName;
	private String userNick;
	private String userPhone;
	private String userEmail;
	private int userZipcode;
	private String userAddress;
	private String userAddressDetails;
	private Timestamp userCreateDate;
	private String userEmailReceivedStatus;
	
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getUserZipcode() {
		return userZipcode;
	}
	public void setUserZipcode(int userZipcode) {
		this.userZipcode = userZipcode;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserAddressDetails() {
		return userAddressDetails;
	}
	public void setUserAddressDetails(String userAddressDetails) {
		this.userAddressDetails = userAddressDetails;
	}
	public Timestamp getUserCreateDate() {
		return userCreateDate;
	}
	public void setUserCreateDate(Timestamp userCreateDate) {
		this.userCreateDate = userCreateDate;
	}
	public String getUserEmailReceivedStatus() {
		return userEmailReceivedStatus;
	}
	public void setUserEmailReceivedStatus(String userEmailReceivedStatus) {
		this.userEmailReceivedStatus = userEmailReceivedStatus;
	}
	
	@Override
	public String toString() {
		return "UsersVO [userNo=" + userNo + ", adminId=" + adminId + ", userId=" + userId + ", userPw=" + userPw
				+ ", userName=" + userName + ", userNick=" + userNick + ", userPhone=" + userPhone + ", userEmail="
				+ userEmail + ", userZipcode=" + userZipcode + ", userAddress=" + userAddress + ", userAddressDetails="
				+ userAddressDetails + ", userCreateDate=" + userCreateDate + ", userEmailReceivedStatus="
				+ userEmailReceivedStatus + "]";
	}
	
}