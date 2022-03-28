package com.spring.dct.notice.service;

import java.util.List;

import com.spring.dct.util.PageVO;
import com.spring.dct.vo.NoticeBoardsVO;

public interface INoticeService {
	
	//글 목록
	List<NoticeBoardsVO> getList(PageVO vo);
	
	//총 게시물 수
	int getTotal(PageVO vo);
	
	//상세보기
	NoticeBoardsVO getContent(int bno);


}
