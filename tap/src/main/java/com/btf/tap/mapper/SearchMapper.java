package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.SearchHistory;

@Mapper
public interface SearchMapper {
	List<Map<String, Object>> roomSearchList(Map<String, Object> roomPage);										// 숙소 검색 조회
	List<Map<String, Object>> attractionSearchList(Map<String, Object> attractionPage);							// 명소 검색 조회
	List<Map<String, Object>> hashtagRoomSearchList(Map<String, Object> hashtagRoomPage);						// 해시태그 숙소 관련 검색 조회
	List<Map<String, Object>> hashtagAttractionSearchList(Map<String, Object> hashtagAttractionPage);			// 해시태그 명소 관련 검색 조회
	int roomTotalRowCount(String keyword);																		// 숙소 검색 결과 페이지 체크
	int attractionTotalRowCount(String keyword);																// 명소 검색 결과 페이지 체크
	int hashtagRoomTotalRowCount(String keyword);																// 해시태그 숙소 검색 결과 페이지 체크
	int hashtagAttractionTotalRowCount(String keyword);															// 해시태그 명소 검색 결과 페이지 체크
	
	List<Map<String, Object>> roomDistrictSearchList(Map<String, Object> roomPage);								// 지역별 숙소 검색 조회
	List<Map<String, Object>> attractionDistrictSearchList(Map<String, Object> attractionPage);					// 지역별 명소 검색 조회
	List<Map<String, Object>> hashtagRoomDistrictSearchList(Map<String, Object> hashtagRoomPage);				// 지역별 해시태그 숙소 관련 검색 조회
	List<Map<String, Object>> hashtagAttractionDistrictSearchList(Map<String, Object> hashtagAttractionPage);	// 지역별 해시태그 명소 관련 검색 조회
	int roomDistrictTotalRowCount(Map<String, Object> roomPage);												// 지역별 숙소 검색 결과 페이지 체크
	int attractionDistrictTotalRowCount(Map<String, Object> attractionPage);									// 지역별 명소 검색 결과 페이지 체크
	int hashtagRoomDistrictTotalRowCount(Map<String, Object> hashtagRoomPage);									// 지역별 해시태그 숙소 검색 결과 페이지 체크
	int hashtagAttractionDistrictTotalRowCount(Map<String, Object> hashtagAttractionPage);						// 지역해시태그 명소 검색 결과 페이지 체크
	
	int insertSearchKeyword(SearchHistory searchHistory);														// 회원 검색어 기록 저장
	List<String> selectSearchKeyword(String userId);															// 회원 최근 검색어 기록 조회
	int deleteSearchKeyword(Map<String, Object> paramMap);														// 회원 최근 검색어 삭제
	List<String> sidoList();																					// 시도 전체 리스트
	List<String> sigunguList(String sido);																		// 시도별 시군구 리스트
}
