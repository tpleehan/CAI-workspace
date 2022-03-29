package com.spring.dct.freeReply.service;

import java.util.List;

import com.spring.dct.util.PageVO;
import com.spring.dct.vo.MentoringsVO;
import com.spring.dct.vo.freeReplyVO;

public interface IFreeReplyService {

	// 글 등록
	void regist(freeReplyVO vo);

	// 글 목록
	List<freeReplyVO> getList(PageVO vo, int communityNo);

	// 총 게시물 수
	int getTotal(int communityNo);

	//유저체크
	int userCheck(freeReplyVO vo);
	
	// 수정
	void update(freeReplyVO vo);

	// 삭제
	void delete(int rno);

}
