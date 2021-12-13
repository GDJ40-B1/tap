package com.btf.tap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.common.Font;
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
	// 입력 : systemAdmin(입력받은 회원정보)
	// 출력 : int(회원등록된 수)
	public int addSystemAdmin(SystemAdmin systemAdmin) {
		// 입력받은 시스템관리자 회원 정보
		log.debug(Font.HS + "addNameServ : " + systemAdmin.toString() + Font.RESET);
		
		int check = systemAdminMapper.insertSystemAdmin(systemAdmin);
		// 회원등록된 수
		log.debug(Font.HS + "addNameServ : " + check + Font.RESET);
		
		return check;
	}
	
	// 시스템관리자 한 명의 pw 수정하기
	// 입력 : systemAdmin(수정 전 pw)
	// 출력 : systemAdmin(수정 후 pw)
	public SystemAdmin modifySystemAdminPw(SystemAdmin systemAdmin) {
		// 수정 전 pw
		log.debug(Font.HS + "modifyPwServ : " + systemAdmin.toString() + Font.RESET);
		
		// pw 수정 성공, 실패
		int check = systemAdminMapper.updateSystemAdminPw(systemAdmin);
		if(check == 1) {
			log.debug(Font.HS + "pw 수정 성공!" + Font.RESET);
		} else {
			log.debug(Font.HS + "pw 수정 실패!" + Font.RESET);
		}
		
		// 수정된 pw 저장
		systemAdmin = systemAdminMapper.selectSystemAdminOne(systemAdmin.getSystemAdminId());
		log.debug(Font.HS + "modifyPwServ : " + systemAdmin.toString() + Font.RESET);
		
		return systemAdmin;
	}
	
	// 시스템관리자 한 명의 pw 확인하기(수정용)
	// 입력 : systemAdmin(id, pw)
	// 출력 : int 
	public int getSystemAdminPw(SystemAdmin systemAdmin) {
		// id값과 입력한 pw
		log.debug(Font.HS + "getPwServ : " + systemAdmin.toString() + Font.RESET);
		
		// id값과 입력한 pw가 기존의 pw와 일치하는지 확인 
		int check = systemAdminMapper.selectSystemAdminPw(systemAdmin);
		if(check == 1) {
			log.debug(Font.HS + "pw 일치!" + Font.RESET);
		} else {
			log.debug(Font.HS + "pw 불일치!" + Font.RESET);
		}
		
		return check;
	}
	
	
	// 시스템관리자 한 명의 정보(name, age, phone) 수정하기
	// 입력 : systemAdmin(id, 수정할 정보 : name, age, phone)
	// 출력 : systemAdmin(수정된 정보 : name, age, phone)
	public SystemAdmin modifySystemAdminInfo(SystemAdmin systemAdmin) {
		// 수정할 정보(name, age, phone)
		log.debug(Font.HS + "modifyInfoServ : " + systemAdmin.toString() + Font.RESET);
		
		// 정보 수정 성공,실패
		int check = systemAdminMapper.updateSystemAdminInfo(systemAdmin);
		if(check == 1) {
			log.debug(Font.HS + "정보 수정 성공!" + Font.RESET);
		} else {
			log.debug(Font.HS + "정보 수정 실패!" + Font.RESET);
		}
		
		// 수정된 정보 저장
		systemAdmin = systemAdminMapper.selectSystemAdminOne(systemAdmin.getSystemAdminId());
		log.debug(Font.HS + "modifyInfoServ : " + systemAdmin.toString() + Font.RESET);
		
		return systemAdmin;
	}
	
	// 시스템관리자 한 명의 정보 삭제하기
	public void removeSystemAdmin(SystemAdmin systemAdmin) {
		systemAdminMapper.deleteSystemAdmin(systemAdmin);
	}
}
