package com.spring.dct.mentoring.service;

import java.util.List;

import com.spring.dct.util.PageVO;
import com.spring.dct.vo.MentoringsVO;

public interface IMentoringService {

	// 글 등록
	void regist(MentoringsVO vo);

	// 글 목록
	List<MentoringsVO> getList(PageVO vo);

	// 총 게시물 수
	int getTotal(PageVO vo);

	// 상세보기
	MentoringsVO getContent(int mentoringNo);

	// 수정
	void update(MentoringsVO vo);

	// 삭제
	void delete(int MentoringNo);

}
