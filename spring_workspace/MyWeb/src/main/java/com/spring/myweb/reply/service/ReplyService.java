package com.spring.myweb.reply.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.myweb.command.ReplyVO;
import com.spring.myweb.reply.mapper.IReplyMapper;

@Service
public class ReplyService implements IReplyService {

	@Autowired
	private IReplyMapper mapper;
	
	@Override
	public void replyRegist(ReplyVO vo) {
		mapper.replyRegist(vo);
	}

	@Override
	public List<ReplyVO> getList(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotal(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int pwCheck(ReplyVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void update(ReplyVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int rno) {
		// TODO Auto-generated method stub

	}

}
