package com.spring.dct.vo;

import java.sql.Timestamp;

public class AdminsVO {

	private String adminId;
	private String adminPw;
	private String adminName;
	
	private String sessionId;
	private Timestamp limitTime;
	
	// 자동 로그인 체크 여부
	private boolean adminAutoLogin;

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

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public Timestamp getLimitTime() {
		return limitTime;
	}

	public void setLimitTime(Timestamp limitTime) {
		this.limitTime = limitTime;
	}

	public boolean isAdminAutoLogin() {
		return adminAutoLogin;
	}

	public void setAdminAutoLogin(boolean adminAutoLogin) {
		this.adminAutoLogin = adminAutoLogin;
	}

	@Override
	public String toString() {
		return "AdminsVO [adminId=" + adminId + ", adminPw=" + adminPw + ", adminName=" + adminName + ", sessionId="
				+ sessionId + ", limitTime=" + limitTime + ", adminAutoLogin=" + adminAutoLogin + "]";
	}

}
