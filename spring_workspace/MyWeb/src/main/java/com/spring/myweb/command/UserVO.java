package com.spring.myweb.command;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {

	private String userId;
	private String userPw;
	private String userName;
	private String userPhone1;
	private String userPhone2;
	private String userEmail1;
	private String userEmail2;
	private String addrBasic;
	private String addrDetail;
	private String addrZipNum;
	private Timestamp regDate;
	
	/*
	 * 한 명의 회원은 글을 여러 개 작성할 수 있다. (1:N)
	 * 
	 * 마이페이지에서는 특정 회원이 작성한 글 목록을 나타내야 한다.
	 * 회원 정보와 글 목록은 서로 다른 테이블로 이루어져 있다.
	 * 
	 * 마이페이지에서는 해당 정보를 한 번의 DB 연동으로 가져올 수 있도록 하기 위해 
	 * JOIN 문법으로 테이블을 합치고 원하는 컬럼을 선택해서 가져 올 예정
	 */
	
	/*
	 * 1(관계)의 값인 UserVO  
	 * N(관계)의 값을 뜻하는 FreeBoardVO
	 * 객체의 모음을 저장할 수 있는 List 선언
	 * 
	 * 1:N 관계의 테이블을 list 형태로 선언
	 */
	private List<FreeBoardVO> userBoardList;
}
