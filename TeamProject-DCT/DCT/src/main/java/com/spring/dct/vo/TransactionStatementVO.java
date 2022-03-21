package com.spring.dct.vo;

import java.sql.Timestamp;

public class TransactionStatementVO {

	private int TransactionStatementOrderNO;
	private Timestamp TransactionStatementDate;

	public int getTransactionStatementOrderNO() {
		return TransactionStatementOrderNO;
	}

	public void setTransactionStatementOrderNO(int transactionStatementOrderNO) {
		TransactionStatementOrderNO = transactionStatementOrderNO;
	}

	public Timestamp getTransactionStatementDate() {
		return TransactionStatementDate;
	}

	public void setTransactionStatementDate(Timestamp transactionStatementDate) {
		TransactionStatementDate = transactionStatementDate;
	}

	@Override
	public String toString() {
		return "TransactionStatementVO [TransactionStatementOrderNO=" + TransactionStatementOrderNO
				+ ", TransactionStatementDate=" + TransactionStatementDate + "]";
	}

}
