package com.spring.dct.freeReply.mapper;

import java.util.List;
import java.util.Map;

import com.spring.dct.vo.freeReplyVO;

public interface IFreeReplyMapper {
	
	//글 등록
	void regist(freeReplyVO vo);
	
	//글 목록
	List<freeReplyVO> getList(Map<String, Object> data);
	
	//총 게시물 수
	int getTotal(int communityNo);
	
	//유저체크
	int userCheck(freeReplyVO vo);
	
	//수정
	void update(freeReplyVO vo);
	
	//삭제
	void delete(int rno);

}
