package com.btf.tap.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.SystemAdminMapper;
import com.btf.tap.mapper.UserMapper;
import com.btf.tap.vo.SystemAdmin;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class SystemAdminService {
	@Autowired SystemAdminMapper systemAdminMapper;
	@Autowired UserMapper userMapper;
	
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
		int confirm = 0;
		
		String userId = systemAdmin.getSystemAdminId();		
		
		// 입력받은 시스템관리자 회원 정보
		log.debug(Font.HS + "addNameServ : " + systemAdmin.toString() + Font.RESET);
		
		int checkId = userMapper.selectUserId(userId);
		
		log.debug(Font.JSB + "중복 또는 탈퇴 ID 체크 => " + checkId + Font.RESET);
		
		if(checkId == 0) {
			confirm = systemAdminMapper.insertSystemAdmin(systemAdmin);
			// 회원등록된 수
			log.debug(Font.HS + "addNameServ : " + confirm + Font.RESET);			
		}
		
		return confirm;
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
	
	// 전체 탈퇴내역 조회
	public List<Map<String, Object>> getWithdrawalList() {
		List<Map<String, Object>> list = new ArrayList<>();
		list = systemAdminMapper.selectWithdrawalList();
		log.debug(Font.JSB + "탈퇴내역 조회" + list.toString() + Font.RESET);
		
		return list;
	}
	
	// 특정 탈퇴내역 삭제
	public void removeWithdrawalList(String userId) {
		systemAdminMapper.deleteWithdrawalList(userId);
	}
	
	// 사이트 이용자 기간별 포인트 내역 조회
	public List<Map<String, Object>> getPointHistoryList(String minDay, String maxDay){
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("minDay", minDay);
		paramMap.put("maxDay", maxDay);
		
		List<Map<String, Object>> historyList = new ArrayList<>();
		
		historyList = systemAdminMapper.selectPointHistoryList(paramMap);
		log.debug(Font.JSB + "전체 포인트 내역 조회" + historyList.toString() + Font.RESET);
		
		return historyList;
	}
	
	// 연도별 사이트 관리자 월간 수익 조회
	public List<Map<String, Object>> getRevenueYearList(int year){
		List<Map<String, Object>> revenueList = new ArrayList<>();
		
		revenueList = systemAdminMapper.selectRevenueYearList(year);
		log.debug(Font.JSB + "연도별 사이트 수익 조회" + revenueList.toString() + Font.RESET);
		
		return revenueList;
	}
	
	// 연간 사이트 수익 조회
	public List<Map<String, Object>> getRevenueYear() {
		List<Map<String, Object>> revenueYearList = new ArrayList<>();
		
		revenueYearList = systemAdminMapper.selectRevenueYear();
		log.debug(Font.JSB + "연간 사이트 수익" + revenueYearList.toString() + Font.RESET);
		
		return revenueYearList;
	}
	
	// 사이트 총합 이용자 수 및 수익
	public Map<String, Object> getRevenueAndUser(){
		int userCount = systemAdminMapper.selectCountUser();
		int resultRevenue = systemAdminMapper.selectRevenue();
		
		DecimalFormat decFormat = new DecimalFormat("###,###");
		
		String revenue = decFormat.format(resultRevenue);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userCount", userCount);
		paramMap.put("revenue", revenue); 
		
		log.debug(Font.JSB + "사이트 총합 이용자 수 및 수익 =>" + paramMap.toString() + Font.RESET);
		
		return paramMap;
	}

	// 사이트 수수료 조회
	public int getFeeRate() {
		int feeRate = 0;
		feeRate = systemAdminMapper.selectFeeRate();
		
		log.debug(Font.JSB + "현재 사이트 설정 수수료 => " + feeRate + Font.RESET);
		
		return feeRate;
	}
	
	// 사이트 수수료 변경
	public void modifyFeeRate(int feeRate) {
		systemAdminMapper.updateFeeRate(feeRate);
	}
	
	// 조회 가능 연도 체크
	public List<Integer> getYearList() {
		List<Integer> yearList = new ArrayList<>();
		
		yearList = systemAdminMapper.selectYearList();
		log.debug(Font.JSB + "조회 가능 연도 =>" + yearList.toString() + Font.RESET);
		
		return yearList;
	}
}
