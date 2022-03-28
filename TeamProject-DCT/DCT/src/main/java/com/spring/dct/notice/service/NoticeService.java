package com.spring.dct.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dct.notice.mapper.INoticeMapper;
import com.spring.dct.util.PageVO;
import com.spring.dct.vo.NoticeBoardsVO;

@Service
public class NoticeService implements INoticeService {

	@Autowired
	private INoticeMapper mapper;

	@Override
	public List<NoticeBoardsVO> getList(PageVO vo) {
		return mapper.getList(vo);
	}

	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}

	@Override
	public NoticeBoardsVO getContent(int bno) {
		return mapper.getContent(bno);
	}

}
