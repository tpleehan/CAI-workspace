package com.spring.dct.user.service;

import java.util.Date;
import com.spring.dct.vo.UsersVO;

public interface IUserService {

	// 아이디 중복 확인
	int idCheck(String id);
	
	// 회원 가입
	void join(UsersVO vo);
	
	// 로그인
	UsersVO login(String id, String pw);
	
	// 자동 로그인 쿠키값 DB 저장 처리
	void keepLogin(String session, Date limitTime, String id);
	
	// 회원 정보 얻어오기
	UsersVO getInfo(String id);
	
	// 회원이 업로드한 강의 가져오기
	UsersVO getUploadList(String id);
	
	// 회원 정보 수정
	void updateUser(UsersVO vo);
	
	// 회원 정보 삭제
	void deleteUser(UsersVO vo);
}
