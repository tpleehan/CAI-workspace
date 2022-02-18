package com.spring.myweb.snsboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.myweb.command.SNSBoardVO;
import com.spring.myweb.snsboard.mapper.ISNSBoardMapper;

@Service
public class SNSBoardService implements ISNSBoardService {

	@Autowired
	private ISNSBoardMapper mapper;
	
	@Override
	public void insert(SNSBoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<SNSBoardVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SNSBoardVO getDetail(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub

	}

}
