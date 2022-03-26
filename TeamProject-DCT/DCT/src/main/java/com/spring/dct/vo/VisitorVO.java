package com.spring.dct.vo;

import java.util.Date;

public class VisitorVO {
	
	private Date visitor;

	public Date getVisitor() {
		return visitor;
	}

	public void setVisitor(Date visitor) {
		this.visitor = visitor;
	}

	@Override
	public String toString() {
		return "VisitorVO [visitor=" + visitor + "]";
	}
	
}
