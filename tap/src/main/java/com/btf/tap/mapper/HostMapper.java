package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Host;

@Mapper
public interface HostMapper {
	Host selectHostOne(Host host);													// 호스트 한 명의 정보 불러오기
	int insertHostOne(Host host);													// 새로운 호스트 한 명 등록하기
	int updateHostOne(Host host);													// 호스트 한 명의 정보 수정하기(나이,이름, 전화번호)
	int deleteHostOne(Host host);													// 호스트 한 명의 정보 삭제하기
	List<Host> selectHostList(Map<String,Object> page);								// 호스트 전체 목록 불러오기
	int totalHostCount();                                  							// 전체 호스트 수
	int selectHostPw(Host host);													// 호스트 비밀번호 확인하기(수정용)
	int updateHostPointEarn(Host host);												// 호스트 포인트 충전하기
	int updateHostPointSpend(Host host);											// 호스트 포인트 전환하기
	int updateHostPw(Host host);													// 호스트 비밀번호 수정하기
	Integer selectRevenueHost(String hostId);										// 총 수익 포인트 합 조회
	Map<String, Object> selectYearRevenueHost(Map<String, Object> paramMap);		// 연도별 수익 포인트 합 조회
	List<Map<String, Object>> selectMonthRevenueHost(Map<String, Object> paramMap);	// 연도별 월간 수익 포인트 조회
	List<Map<String, Object>> selectRoomMonthRevenue(Map<String, Object> paramMap);	// 연도별 숙소 월간 수익 포인트 조회
	List<Integer> selectYearList(Map<String, Object> paramMap);						// 조회 가능 연도 체크
}
