package com.spring.dct.visit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dct.visit.mapper.IVisitorMapper;

@Service
public class VisitorService implements IVisitorService {

	@Autowired
	private IVisitorMapper mapper;

	@Override
	public int getTodayCount() {
		return mapper.getTodayCount();
	}

	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}

	@Override
	public void setVisitTotalCount() {
		mapper.setVisitTotalCount();
	}

}
