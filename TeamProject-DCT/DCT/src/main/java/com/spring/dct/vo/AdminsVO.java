package com.spring.dct.vo;

public class AdminsVO {

	private String adminId;
	private String adminPw;
	private String adminName;
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	
	@Override
	public String toString() {
		return "AdminsVO [adminId=" + adminId + ", adminPw=" + adminPw + ", adminName=" + adminName + "]";
	}
	
	
}
