package com.spring.dct.vo;

public class LecturesCategoriesVO {

	private int categoryNo;
	private String categoryName;
	private int subCategoryNo;

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getSubCategoryNo() {
		return subCategoryNo;
	}

	public void setSubCategoryNo(int subCategoryNo) {
		this.subCategoryNo = subCategoryNo;
	}

	@Override
	public String toString() {
		return "LecturesCategoriesVO [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", subCategoryNo="
				+ subCategoryNo + "]";
	}

}
