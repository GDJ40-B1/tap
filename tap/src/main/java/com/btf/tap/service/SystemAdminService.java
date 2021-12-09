package com.btf.tap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.btf.tap.mapper.SystemAdminMapper;
import com.btf.tap.vo.SystemAdmin;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class SystemAdminService {
	@Autowired SystemAdminMapper systemAdminMapper;
	
	// 시스템관리자 전체 목록 불러오기
	public List<SystemAdmin> getSystemAdminList() {
		List<SystemAdmin> list = systemAdminMapper.selectSystemAdminList();
		return list;
	}
	
	// 시스템관리자 한 명의 정보 불러오기
	public SystemAdmin getSystemAdminOne(String systemAdminId) {
		SystemAdmin systemAdmin = null;
		systemAdmin = systemAdminMapper.selectSystemAdminOne(systemAdminId);
		return systemAdmin;
	}
	
	// 새로운 시스템관리자 한 명 등록하기
	public void addSystemAdmin(SystemAdmin systemAdmin) {
		systemAdminMapper.insertSystemAdmin(systemAdmin);
	}
	
	// 시스템관리자 한 명의 pw 수정하기
	public void modifySystemAdminPw(SystemAdmin systemAdmin) {
		systemAdminMapper.updateSystemAdminPw(systemAdmin);
	}
	
	// 시스템관리자 한 명의 name 수정하기
	public void modifySystemAdminName(SystemAdmin systemAdmin) {
		systemAdminMapper.updateSystemAdminName(systemAdmin);
	}
	
	// 시스템관리자 한 명의 정보 삭제하기
	public void removeSystemAdmin(SystemAdmin systemAdmin) {
		systemAdminMapper.deleteSystemAdmin(systemAdmin);
	}
}
