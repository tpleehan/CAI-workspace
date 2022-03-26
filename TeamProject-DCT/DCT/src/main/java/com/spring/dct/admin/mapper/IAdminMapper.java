package com.spring.dct.admin.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.dct.vo.AdminsVO;

public interface IAdminMapper {

	// 관리자 회원 가입
	void adminJoin(AdminsVO vo);
	
	// 관리자 아이디 중복 확인
	int adminIdCheck(String adminId);
	
	// 관리자 로그인
	AdminsVO adminLogin(@Param("adminId") String adminId, @Param("adminPw") String adminPw);
	
	// 관리자 정보 얻어오기
	AdminsVO getAdminInfo(String adminId);
	
	// 관리자 정보 수정
	void updateAdmin(AdminsVO vo);
	
	// 관리자 정보 삭제
	void deleteAdmin(@Param("adminId") String adminId, @Param("adminPw") String adminPw);
	
	// 자동 로그인 쿠기값 DB 저장 처리
	void autoLogin(Map<String, Object> datas);
	
	// 세션 아이디를 통한 회원 정보 조회 기능
	AdminsVO getAdminWithSessionId(String seesionId);
	
}
