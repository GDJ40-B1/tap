package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Attraction;
import com.btf.tap.vo.Hashtag;
import com.btf.tap.vo.Room;
import com.btf.tap.vo.SearchHistory;

@Mapper
public interface SearchMapper {
	List<Room> roomSearchList(Map<String, Object> roomPage);				// 숙소 검색 조회
	List<Attraction> attractionSearchList(Map<String, Object> attractionPage);	// 명소 검색 조회
	List<Hashtag> hashtagSearchList(Map<String, Object> hashtagPage);	// 해시태그 검색 조회
	int insertSearchKeyword(SearchHistory searchHistory);				// 회원 검색어 기록 저장
	int roomTotalRowCount(String keyword);								// 숙소 검색 결과 페이지 체크
	int attractionTotalRowCount(String keyword);						// 명소 검색 결과 페이지 체크
	int hashtagTotalRowCount(Map<String, Object> hashtagPage);			// 해시태그 전체 검색 결과 페이지 체크
}
