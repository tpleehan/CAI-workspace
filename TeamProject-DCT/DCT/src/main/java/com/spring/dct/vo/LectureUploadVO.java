package com.spring.dct.vo;

import java.sql.Timestamp;

public class LectureUploadVO {

	private int lectureNo;
	private int userNo;
	private String userNick;
	private String thumbnailUploadpath;
	private String thumbnailFileLoca;
	private String thumbnailFilename;
	private String thumbnailFilerealname;
	private String videoUploadpath;
	private String videoFileLoca;
	private String videoFilename;
	private String videoFilerealname;
	private String lectureContent;
	private Timestamp uploadDate;

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

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
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

	public String getLectureContent() {
		return lectureContent;
	}

	public void setLectureContent(String lectureContent) {
		this.lectureContent = lectureContent;
	}

	public Timestamp getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Timestamp uploadDate) {
		this.uploadDate = uploadDate;
	}

	@Override
	public String toString() {
		return "LectureUploadVO [lectureNo=" + lectureNo + ", userNo=" + userNo + ", userNick=" + userNick
				+ ", thumbnailUploadpath=" + thumbnailUploadpath + ", thumbnailFileLoca=" + thumbnailFileLoca
				+ ", thumbnailFilename=" + thumbnailFilename + ", thumbnailFilerealname=" + thumbnailFilerealname
				+ ", videoUploadpath=" + videoUploadpath + ", videoFileLoca=" + videoFileLoca + ", videoFilename="
				+ videoFilename + ", videoFilerealname=" + videoFilerealname + ", lectureContent=" + lectureContent
				+ ", uploadDate=" + uploadDate + "]";
	}

}
