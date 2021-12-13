package com.btf.tap.mapper;

import java.util.List;

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
}
