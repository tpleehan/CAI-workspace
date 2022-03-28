package com.spring.dct.vo;

import java.sql.Timestamp;

public class OnlineLectureUplaodVO {

	private int lectureNo;
	private int userNo;
	private int categoryNo;
	private String adminId;
	private String lectureWriter;
	private String lectureTitle;
	private String lectureContent;
	private int lecturePrice;
	private int lectureDiscountPrice;
	private int lectureLike;
	private String thumbnailUploadpath;
	private String thumbnailFileLoca;
	private String thumbnailFilename;
	private String thumbnailFilerealname;
	private String videoUploadpath;
	private String videoFileLoca;
	private String videoFilename;
	private String videoFilerealname;
	private Timestamp lectureCreateDate;

	public int getLectureNo() {
		return lectureNo;
	}

	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
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

	public String getLectureWriter() {
		return lectureWriter;
	}

	public void setLectureWriter(String lectureWriter) {
		this.lectureWriter = lectureWriter;
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

	public int getLectureLike() {
		return lectureLike;
	}

	public void setLectureLike(int lectureLike) {
		this.lectureLike = lectureLike;
	}

	public String getThumbnailUploadpath() {
		return thumbnailUploadpath;
	}

	public void setThumbnailUploadpath(String thumbnailUploadpath) {
		this.thumbnailUploadpath = thumbnailUploadpath;
	}

	public String getThumbnailFileLoca() {
		return thumbnailFileLoca;
	}

	public void setThumbnailFileLoca(String thumbnailFileLoca) {
		this.thumbnailFileLoca = thumbnailFileLoca;
	}

	public String getThumbnailFilename() {
		return thumbnailFilename;
	}

	public void setThumbnailFilename(String thumbnailFilename) {
		this.thumbnailFilename = thumbnailFilename;
	}

	public String getThumbnailFilerealname() {
		return thumbnailFilerealname;
	}

	public void setThumbnailFilerealname(String thumbnailFilerealname) {
		this.thumbnailFilerealname = thumbnailFilerealname;
	}

	public String getVideoUploadpath() {
		return videoUploadpath;
	}

	public void setVideoUploadpath(String videoUploadpath) {
		this.videoUploadpath = videoUploadpath;
	}

	public String getVideoFileLoca() {
		return videoFileLoca;
	}

	public void setVideoFileLoca(String videoFileLoca) {
		this.videoFileLoca = videoFileLoca;
	}

	public String getVideoFilename() {
		return videoFilename;
	}

	public void setVideoFilename(String videoFilename) {
		this.videoFilename = videoFilename;
	}

	public String getVideoFilerealname() {
		return videoFilerealname;
	}

	public void setVideoFilerealname(String videoFilerealname) {
		this.videoFilerealname = videoFilerealname;
	}

	public Timestamp getLectureCreateDate() {
		return lectureCreateDate;
	}

	public void setLectureCreateDate(Timestamp lectureCreateDate) {
		this.lectureCreateDate = lectureCreateDate;
	}

	@Override
	public String toString() {
		return "OnlineLectureUplaodVO [lectureNo=" + lectureNo + ", userNo=" + userNo + ", categoryNo=" + categoryNo
				+ ", adminId=" + adminId + ", lectureWriter=" + lectureWriter + ", lectureTitle=" + lectureTitle
				+ ", lectureContent=" + lectureContent + ", lecturePrice=" + lecturePrice + ", lectureDiscountPrice="
				+ lectureDiscountPrice + ", lectureLike=" + lectureLike + ", thumbnailUploadpath=" + thumbnailUploadpath
				+ ", thumbnailFileLoca=" + thumbnailFileLoca + ", thumbnailFilename=" + thumbnailFilename
				+ ", thumbnailFilerealname=" + thumbnailFilerealname + ", videoUploadpath=" + videoUploadpath
				+ ", videoFileLoca=" + videoFileLoca + ", videoFilename=" + videoFilename + ", videoFilerealname="
				+ videoFilerealname + ", lectureCreateDate=" + lectureCreateDate + "]";
	}

	public OnlineLectureUplaodVO() {
		super();
	}

	public OnlineLectureUplaodVO(int lectureNo, int userNo, int categoryNo, String adminId, String lectureWriter,
			String lectureTitle, String lectureContent, int lecturePrice, int lectureDiscountPrice, int lectureLike,
			String thumbnailUploadpath, String thumbnailFileLoca, String thumbnailFilename,
			String thumbnailFilerealname, String videoUploadpath, String videoFileLoca, String videoFilename,
			String videoFilerealname, Timestamp lectureCreateDate) {
		super();
		this.lectureNo = lectureNo;
		this.userNo = userNo;
		this.categoryNo = categoryNo;
		this.adminId = adminId;
		this.lectureWriter = lectureWriter;
		this.lectureTitle = lectureTitle;
		this.lectureContent = lectureContent;
		this.lecturePrice = lecturePrice;
		this.lectureDiscountPrice = lectureDiscountPrice;
		this.lectureLike = lectureLike;
		this.thumbnailUploadpath = thumbnailUploadpath;
		this.thumbnailFileLoca = thumbnailFileLoca;
		this.thumbnailFilename = thumbnailFilename;
		this.thumbnailFilerealname = thumbnailFilerealname;
		this.videoUploadpath = videoUploadpath;
		this.videoFileLoca = videoFileLoca;
		this.videoFilename = videoFilename;
		this.videoFilerealname = videoFilerealname;
		this.lectureCreateDate = lectureCreateDate;
	}

}
