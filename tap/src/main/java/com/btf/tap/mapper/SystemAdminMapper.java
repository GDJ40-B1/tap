package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.SystemAdmin;

@Mapper
public interface SystemAdminMapper {
	List<SystemAdmin> selectSystemAdminList(); // 시스템관리자 전체 목록 불러오기
	SystemAdmin selectSystemAdminOne(String systemAdminId); // 시스템관리자 한 명의 정보 불러오기
	int insertSystemAdmin(SystemAdmin systemAdmin); // 새로운 시스템관리자 한 명 등록하기
	int selectSystemAdminPw(SystemAdmin systemAdmin); // 시스템관리자 한 명의 pw 확인하기(수정용)
	int updateSystemAdminPw(SystemAdmin systemAdmin); // 시스템관리자 한 명의 pw 수정하기
	int updateSystemAdminInfo(SystemAdmin systemAdmin); // 시스템관리자 한 명의 정보(name,age,phone) 수정하기
	int deleteSystemAdmin(SystemAdmin systemAdmin); // 시스템관리자 한 명의 정보 삭제하기
	List<Map<String, Object>> selectWithdrawalList(); // 전체 탈퇴내역 조회
	int deleteWithdrawalList(String userId); // 특정 탈퇴내역 삭제
	List<Map<String, Object>> selectPointHistoryList(Map<String, Object> paramMap); // 사이트 이용자 기간별 포인트 내역 조회
	List<Map<String, Object>> selectRevenueYearList(int year);	// 연도별 사이트 관리자 월간 수익 조회
	List<Map<String, Object>> selectRevenueYear();	// 연간 사이트 수익 조회
	int selectCountUser();	// 사이트 총합 이용자 수
	int selectRevenue();	// 사이트 총합 수익
}
