package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Attraction;
import com.btf.tap.vo.Room;
import com.btf.tap.vo.SearchHistory;

@Mapper
public interface SearchMapper {
	List<Room> roomSearchList(Map<String, Object> roomPage);											// 숙소 검색 조회
	List<Attraction> attractionSearchList(Map<String, Object> attractionPage);							// 명소 검색 조회
	List<Room> hashtagRoomSearchList(Map<String, Object> hashtagRoomPage);								// 해시태그 숙소 관련 검색 조회
	List<Attraction> hashtagAttractionSearchList(Map<String, Object> hashtagAttractionPage);			// 해시태그 명소 관련 검색 조회
	int roomTotalRowCount(String keyword);																// 숙소 검색 결과 페이지 체크
	int attractionTotalRowCount(String keyword);														// 명소 검색 결과 페이지 체크
	int hashtagRoomTotalRowCount(String keyword);														// 해시태그 숙소 검색 결과 페이지 체크
	int hashtagAttractionTotalRowCount(String keyword);													// 해시태그 명소 검색 결과 페이지 체크
	
	List<Room> roomDistrictSearchList(Map<String, Object> roomPage);									// 지역별 숙소 검색 조회
	List<Attraction> attractionDistrictSearchList(Map<String, Object> attractionPage);					// 지역별 명소 검색 조회
	List<Room> hashtagRoomDistrictSearchList(Map<String, Object> hashtagRoomPage);						// 지역별 해시태그 숙소 관련 검색 조회
	List<Attraction> hashtagAttractionDistrictSearchList(Map<String, Object> hashtagAttractionPage);	// 지역별 해시태그 명소 관련 검색 조회
	int roomDistrictTotalRowCount(Map<String, Object> roomPage);										// 지역별 숙소 검색 결과 페이지 체크
	int attractionDistrictTotalRowCount(Map<String, Object> attractionPage);							// 지역별 명소 검색 결과 페이지 체크
	int hashtagRoomDistrictTotalRowCount(Map<String, Object> hashtagRoomPage);							// 지역별 해시태그 숙소 검색 결과 페이지 체크
	int hashtagAttractionDistrictTotalRowCount(Map<String, Object> hashtagAttractionPage);				// 지역해시태그 명소 검색 결과 페이지 체크
	
	int insertSearchKeyword(SearchHistory searchHistory);												// 회원 검색어 기록 저장
	List<String> sidoList();
}
