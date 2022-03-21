package com.spring.dct.user.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dct.user.mapper.IUserMapper;
import com.spring.dct.vo.UsersVO;

@Service
public class UserService implements IUserService {

	@Autowired
	private IUserMapper mapper;

	@Override
	public int idCheck(String id) {

		return mapper.idCheck(id);
	}

	@Override
	public void join(UsersVO vo) {

		mapper.join(vo);
	}

	@Override
	public UsersVO login(String id, String pw) {

		return mapper.login(id, pw);
	}

	@Override
	public void keepLogin(String session, Date limitTime, String id) {
		Map<String, Object> datas = new HashMap<>();

		datas.put("sessionId", session);
		datas.put("limitDate", limitTime);
		datas.put("userId", id);

		mapper.keepLogin(datas);

	}

	@Override
	public UsersVO getInfo(String id) {

		return mapper.getInfo(id);
	}

	@Override
	public void updateUser(UsersVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteUser(String id, String pw) {
		// TODO Auto-generated method stub

	}

}
