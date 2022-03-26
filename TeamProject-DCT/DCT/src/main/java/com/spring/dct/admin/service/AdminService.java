package com.spring.dct.admin.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dct.admin.mapper.IAdminMapper;
import com.spring.dct.vo.AdminsVO;

@Service
public class AdminService implements IAdminService {
	
	@Autowired
	private IAdminMapper mapper;

	@Override
	public void adminJoin(AdminsVO vo) {
		mapper.adminJoin(vo);
	}
	
	@Override
	public int adminIdCheck(String adminId) {
		return mapper.adminIdCheck(adminId);
	}

	@Override
	public AdminsVO adminLogin(String adminId, String adminPw) {
		return mapper.adminLogin(adminId, adminPw);
	}

	@Override
	public AdminsVO getAdminInfo(String adminId) {
		return mapper.getAdminInfo(adminId);
	}

	@Override
	public void updateAdmin(AdminsVO vo) {
		mapper.updateAdmin(vo);
	}

	@Override
	public void deleteAdmin(String adminId, String adminPw) {
		mapper.deleteAdmin(adminId, adminPw);
	}

	@Override
	public void autoLogin(String session, Date limitTime, String adminId) {
		Map<String, Object> datas = new HashMap<>();
		datas.put("sessionId", session);
		datas.put("limitTime", limitTime);
		datas.put("adminId", adminId);
		
		mapper.autoLogin(datas);
		
	}
	
}
