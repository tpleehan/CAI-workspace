package com.spring.dct.vo;

import java.sql.Timestamp;

public class ReceipeVO {

	private int receipeNo;
	private Timestamp receipeStatementDate;

	public int getReceipeNo() {
		return receipeNo;
	}

	public void setReceipeNo(int receipeNo) {
		this.receipeNo = receipeNo;
	}

	public Timestamp getReceipeStatementDate() {
		return receipeStatementDate;
	}

	public void setReceipeStatementDate(Timestamp receipeStatementDate) {
		this.receipeStatementDate = receipeStatementDate;
	}

	@Override
	public String toString() {
		return "ReceipeVO [receipeNo=" + receipeNo + ", receipeStatementDate=" + receipeStatementDate + "]";
	}

}
