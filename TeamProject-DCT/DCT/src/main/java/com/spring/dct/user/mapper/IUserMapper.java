package com.spring.dct.user.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.dct.vo.UsersVO;

public interface IUserMapper {

	// 아이디 중복 확인
	int idCheck(String id);
	
	// 회원 가입
	void join(UsersVO vo);
	
	// 로그인
	UsersVO login(@Param("id") String id, @Param("pw") String pw);
	
	// 회원 정보 얻어오기
	UsersVO getInfo(String id);
	
	// 회원 정보 수정
	void updateUser(UsersVO vo);
	
	//로그인 유지
	void keepLogin(Map<String, Object> datas);
	
	// 회원 정보 삭제
	void deleteUser(UsersVO vo);

	// 세션 아이디를 통한 회원 정보 조회 기능
	UsersVO getUserWithSessionId(String seesionId);
	
	//유저가 올린 강의 불러오기
	UsersVO getUploadList(String id);

}
