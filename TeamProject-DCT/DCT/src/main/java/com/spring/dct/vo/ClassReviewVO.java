package com.spring.dct.vo;

import java.sql.Timestamp;

public class ClassReviewVO {

	private int reviewNo;
	private int lectureNo;
	private String reviewTitle;
	private String reviewContent;
	private int reviewStarRating;
	private Timestamp reviewCreateDate;

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getLectureNo() {
		return lectureNo;
	}

	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getReviewStarRating() {
		return reviewStarRating;
	}

	public void setReviewStarRating(int reviewStarRating) {
		this.reviewStarRating = reviewStarRating;
	}

	public Timestamp getReviewCreateDate() {
		return reviewCreateDate;
	}

	public void setReviewCreateDate(Timestamp reviewCreateDate) {
		this.reviewCreateDate = reviewCreateDate;
	}

	@Override
	public String toString() {
		return "ClassReviewVO [reviewNo=" + reviewNo + ", lectureNo=" + lectureNo + ", reviewTitle=" + reviewTitle
				+ ", reviewContent=" + reviewContent + ", reviewStarRating=" + reviewStarRating + ", reviewCreateDate="
				+ reviewCreateDate + "]";
	}

}
