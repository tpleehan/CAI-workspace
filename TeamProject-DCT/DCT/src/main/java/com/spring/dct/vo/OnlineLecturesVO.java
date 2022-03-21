package com.spring.dct.vo;

import java.sql.Timestamp;

public class OnlineLecturesVO {

	private int LectureNo;
	private int userNo;
	private int categoryNo;
	private String adminId;
	private String lectureTitle;
	private String lectureContent;
	private int lecturePrice;
	private int lectureDiscountPrice;
	private Timestamp lectureCeateDate;
	private int lectureLike;
	private String lectureVideo;
	private String lectureThumbnail;

	public int getLectureNo() {
		return LectureNo;
	}

	public void setLectureNo(int lectureNo) {
		LectureNo = lectureNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getLectureTitle() {
		return lectureTitle;
	}

	public void setLectureTitle(String lectureTitle) {
		this.lectureTitle = lectureTitle;
	}

	public String getLectureContent() {
		return lectureContent;
	}

	public void setLectureContent(String lectureContent) {
		this.lectureContent = lectureContent;
	}

	public int getLecturePrice() {
		return lecturePrice;
	}

	public void setLecturePrice(int lecturePrice) {
		this.lecturePrice = lecturePrice;
	}

	public int getLectureDiscountPrice() {
		return lectureDiscountPrice;
	}

	public void setLectureDiscountPrice(int lectureDiscountPrice) {
		this.lectureDiscountPrice = lectureDiscountPrice;
	}

	public Timestamp getLectureCeateDate() {
		return lectureCeateDate;
	}

	public void setLectureCeateDate(Timestamp lectureCeateDate) {
		this.lectureCeateDate = lectureCeateDate;
	}

	public int getLectureLike() {
		return lectureLike;
	}

	public void setLectureLike(int lectureLike) {
		this.lectureLike = lectureLike;
	}

	public String getLectureVideo() {
		return lectureVideo;
	}

	public void setLectureVideo(String lectureVideo) {
		this.lectureVideo = lectureVideo;
	}

	public String getLectureThumbnail() {
		return lectureThumbnail;
	}

	public void setLectureThumbnail(String lectureThumbnail) {
		this.lectureThumbnail = lectureThumbnail;
	}

	@Override
	public String toString() {
		return "OnlineLecturesVO [LectureNo=" + LectureNo + ", userNo=" + userNo + ", categoryNo=" + categoryNo
				+ ", adminId=" + adminId + ", lectureTitle=" + lectureTitle + ", lectureContent=" + lectureContent
				+ ", lecturePrice=" + lecturePrice + ", lectureDiscountPrice=" + lectureDiscountPrice
				+ ", lectureCeateDate=" + lectureCeateDate + ", lectureLike=" + lectureLike + ", lectureVideo="
				+ lectureVideo + ", lectureThumbnail=" + lectureThumbnail + "]";
	}

}
