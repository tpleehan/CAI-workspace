package com.spring.dct.freeboard.mapper;

import java.util.List;

import com.spring.dct.util.PageVO;
import com.spring.dct.vo.CommunitiesVO;

public interface IFreeBoardMapper {
	
	//글 등록
	void regist(CommunitiesVO vo);
	
	//글 목록
	List<CommunitiesVO> getList(PageVO vo);
	
	//총 게시물 수
	int getTotal(PageVO vo);
	
	//상세보기
	CommunitiesVO getContent(int bno);
	
	//수정
	void update(CommunitiesVO vo);
	
	//삭제
	void delete(int communityNo);

}
