package com.spring.dct.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dct.lecture.mapper.ILectureMapper;
import com.spring.dct.util.PageVO;
import com.spring.dct.vo.OnlineLectureUplaodVO;

@Service
public class LectureService implements ILectureService {

	@Autowired
	private ILectureMapper mapper;

	@Override
	public void regist(OnlineLectureUplaodVO vo) {

		mapper.regist(vo);
	}

	@Override
	public List<OnlineLectureUplaodVO> getList(PageVO vo) {

		return mapper.getList(vo);
	}

	@Override
	public int getTotal(PageVO vo) {

		return mapper.getTotal(vo);
	}

	@Override
	public OnlineLectureUplaodVO getContent(int lectureNo) {

		return mapper.getContent(lectureNo);
	}

	@Override
	public void update(OnlineLectureUplaodVO vo) {
		mapper.update(vo);
	}


	@Override
	public void delete(int LectureNo) {
		mapper.delete(LectureNo);

	}

}
