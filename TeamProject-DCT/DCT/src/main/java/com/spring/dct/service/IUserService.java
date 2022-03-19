package com.spring.dct.service;

import java.util.Date;

import org.springframework.stereotype.Service;

import com.spring.dct.vo.UsersVO;

@Service
public interface IUserService {

	// 아이디 중복 체크 기능
	int idCheck(String userId);
	
	// 회원 가입 기능
	void register(UsersVO user);
	
	// 회원 정보 조회 기능
	UsersVO selectOne(String userId);
	
	// 회원 정보 수정
	void updateUser(UsersVO vo);
	
	// 회원 탈퇴 기능
	void delete(String userId);
	
	// 자동 로그인 쿠기값 DB 저장 처리
	void keepLogin(String session, Date limitTime, String account);
}
