package com.spring.dct.freeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dct.freeboard.mapper.IFreeBoardMapper;
import com.spring.dct.util.PageVO;
import com.spring.dct.vo.CommunitiesVO;

@Service
public class FreeBoardService implements IFreeBoardService {

	@Autowired
	private IFreeBoardMapper mapper;

	@Override
	public void regist(CommunitiesVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<CommunitiesVO> getList(PageVO vo) {
		System.out.println("게시글목록" + mapper.getList(vo));
		return mapper.getList(vo);
	}

	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}

	@Override
	public CommunitiesVO getContent(int bno) {
		return mapper.getContent(bno);
	}

	@Override
	public void update(CommunitiesVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int communityNo) {
		mapper.delete(communityNo);
	}

}
