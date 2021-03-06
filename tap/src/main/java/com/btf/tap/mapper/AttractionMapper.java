package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Attraction;

@Mapper
public interface AttractionMapper {
	
	// 명소 카테고리
	List<String> selectAttractionCategory();
	// 명소 상세 보기
	Attraction selectAttractionOne(int attractionId);
	// 명소 전체 목록
	List<Attraction> selectAttractionList(Map<String, Object> map);
	// 명소 전체 갯수 
	int selectAttractionTotalCount(String approvalStatus);	
	// 명소 등록
	int insertAttraction(Attraction attraction);
	// 선호 지역 인기 명소 리스트
	List<Map<String, Object>> selectPreferLocalAttractionList(Map<String, Object> page);
	// 선호 지역 인기 명소 개수
	int preferLocalAttractionTotalCount(Map<String, Object> page);
	// 특정 숙소 주변 명소 목록 추출
	List<Attraction> selectAttractionArroundRoom(int roomId);
	// 조회수
	public int updateAttractionCnt(int attractionId);
	
	
	// [시스템 관리자]
	// 명소 승인 대기 목록
	List<Attraction> selectApprovalAttractionList(Map<String,Object> map);
	// 미승인된 명소 전체 갯수
	int selectBeforeAttractionTotalCount(String approvalStatus);
	// 명소 삭제
	void deleteAttraction(int attractionId);
	// 명소 수정
	void updateAttraction(Attraction attraction);
	// 미승인된 명소 상세보기
	Attraction selectApprovalAttractionOne(int attractionId);
	// 승인
	void approvalAttraction(int attractionId);
}
