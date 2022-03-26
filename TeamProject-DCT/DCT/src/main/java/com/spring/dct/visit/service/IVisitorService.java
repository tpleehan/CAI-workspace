package com.spring.dct.visit.service;

public interface IVisitorService {

	// 오늘 방문자 수
	int getTodayCount();
	
	// 총 방문자 수
	int getTotalCount();
	
	// 전체 방문자 추가
	void setVisitTotalCount();
	
}
