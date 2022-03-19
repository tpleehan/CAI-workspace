package com.spring.dct.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.dct.user.mapper.IUserMapper;
import com.spring.dct.vo.UsersVO;

@Repository
public class UserService implements IUserService {

	@Autowired
	private IUserMapper mapper;
	
	@Override
	public int idCheck(String userId) {
		return mapper.idCheck(userId);
	}

	@Override
	public void register(UsersVO user) {
		
		// 회원 비밀번호를 암호화하여 인코딩
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("암호화 하기 전 비밀번호: " + user.getUserPw());
		
		// 비밀번호를 암호화 해서 user 객체에 다시 저장하기
		String securePw = encoder.encode(user.getUserPw());
		System.out.println("암호화 후 비밀번호: " + securePw);
		
		user.setUserPw(securePw);
		
		mapper.register(user);

	}

	@Override
	public UsersVO selectOne(String userId) {
		return mapper.selectOne(userId);
	}
	
	@Override
	public void updateUser(UsersVO vo) {
		mapper.updateUser(vo);
	}

	@Override
	public void delete(String userId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void keepLogin(String session, Date limitTime, String userId) {
		Map<String, Object> datas = new HashMap<>();
		datas.put("sessionId", session);
		datas.put("limitDate", limitTime);
		datas.put("account", userId);
		
		mapper.keepLogin(datas);

	}

}
