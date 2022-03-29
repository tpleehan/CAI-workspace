package com.spring.dct.freeReply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dct.freeReply.mapper.IFreeReplyMapper;
import com.spring.dct.util.PageVO;
import com.spring.dct.vo.freeReplyVO;

@Service
public class FreeReplyService implements IFreeReplyService {

	@Autowired
	private IFreeReplyMapper mapper;
	
	@Override
	public void regist(freeReplyVO vo) {
		mapper.regist(vo);
	}


	@Override
	public List<freeReplyVO> getList(PageVO vo, int communityNo) {
		
		Map<String, Object> data = new HashMap<>();
		data.put("paging", vo);
		data.put("communityNo", communityNo);
		
		return mapper.getList(data);
	}

	@Override
	public int getTotal(int communityNo) {
		
		return mapper.getTotal(communityNo);
	}
	
	@Override
	public int userCheck(freeReplyVO vo) {
		
		return mapper.userCheck(vo);
	}
	

	@Override
	public void update(freeReplyVO vo) {
		mapper.update(vo);

	}

	@Override
	public void delete(int rno) {
		mapper.delete(rno);

	}



}
