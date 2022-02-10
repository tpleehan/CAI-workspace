package com.spring.mvc.user.repository;

import java.util.Map;

import com.spring.mvc.user.model.UserVO;

public interface IUserMapper {

	// 아이디 중복 체크 기능
	int checkId(String account);
	
	// 회원 가입 기능
	void register(UserVO user);
	
	// 회원 정보 조회 기능
	UserVO selectOne(String account);
	
	// 회원 탈퇴 기능
	void delete(String account);
	
	// 자동 로그인 쿠키값 DB 저장 처리
	// SQL -> INSERT(테이블에 존재하지 않는 데이터)가 아닌 UPDATE(기존 회원 컬럼값, 데이터가 있는 값을 수정)
	void keepLogin(Map<String, Object> datas);
	
	// 세션 아이디를 통한 회원 정보 조회 기능
	/*
	 * 자동 로그인 하고 싶은 유저에게 Cookie 생성 (구분을 위해 session_id를 추가)
	 * 해당 유저(자동로그인이 체크된)가 다시 방문했을 경우(쿠키가 유효한 시간 내에)
	 * 서버에 요청을 보내고, 요청과 함께 쿠키도 같이 전달해야 한다.
	 * 쿠키 안에 들어 있는 session_id로 회원 정보를 조회해서 해당 유저가 로그인 중인 것처럼
	 * 세션 데이터를 만든다. (login이라는 세션 데이터 -> 로그인 중이라는 징표)
	 */
	UserVO getUserWithSessionId(String sessionId);
}
