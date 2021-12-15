package com.btf.tap.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.SearchMapper;
import com.btf.tap.vo.Attraction;
import com.btf.tap.vo.Room;
import com.btf.tap.vo.SearchHistory;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class SearchService {
	@Autowired private SearchMapper searchMapper;
	private final int defaultPage = 10;
	
	// 숙소 검색 결과 리스트
	public Map<String, Object> getRoomSearchList(int roomCurrentPage, int rowPerPage, String keyword) {	
		int beginRow = (roomCurrentPage-1) * rowPerPage;
		int roomStartPage = ((roomCurrentPage - 1) / defaultPage) * defaultPage + 1;
		int roomEndPage = roomStartPage + defaultPage - 1;
		int roomLastPage = 0;
		
		Map<String, Object> roomPage = new HashMap<>();
		roomPage.put("beginRow", beginRow);
		roomPage.put("rowPerPage", rowPerPage);
		roomPage.put("keyword", keyword);
		
		List<Room> roomList = searchMapper.roomSearchList(roomPage);
		log.debug(Font.JSB + roomList.toString() + Font.RESET);
		
		int totalRowCount = searchMapper.roomTotalRowCount(keyword);

		roomLastPage = totalRowCount / rowPerPage;

		if(totalRowCount % rowPerPage != 0) {
			roomLastPage+=1;
		}
		
		if(roomEndPage > roomLastPage) {
			roomEndPage = roomLastPage;
		}
		
		// 검색 결과 리스트와 페이징 처리를 위한 값 두개를 맵에 넣어 반환
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("roomList", roomList);
		paramMap.put("roomStartPage", roomStartPage);
		paramMap.put("roomEndPage", roomEndPage);
		paramMap.put("roomLastPage", roomLastPage);
		
		return paramMap;
	}

	// 명소 검색 결과 리스트
	public Map<String, Object> getAttractionSearchList(int attractionCurrentPage, int rowPerPage, String keyword) {	
		int beginRow = (attractionCurrentPage-1) * rowPerPage;
		int attractionStartPage = ((attractionCurrentPage - 1) / defaultPage) * defaultPage + 1;
		int attractionEndPage = attractionStartPage + defaultPage - 1;
		int attractionLastPage = 0;
		
		Map<String, Object> attractionPage = new HashMap<>();
		attractionPage.put("beginRow", beginRow);
		attractionPage.put("rowPerPage", rowPerPage);
		attractionPage.put("keyword", keyword);

		List<Attraction> attractionList = searchMapper.attractionSearchList(attractionPage);
		log.debug(Font.JSB + attractionList.toString() + Font.RESET);
			
		int totalRowCount = searchMapper.attractionTotalRowCount(keyword);
		
		attractionLastPage = totalRowCount / rowPerPage;
		
		if(totalRowCount % rowPerPage != 0) {
			attractionLastPage+=1;
		}
		
		if(attractionEndPage > attractionLastPage) {
			attractionEndPage = attractionLastPage;
		}
		
		// 검색 결과 리스트와 페이징 처리를 위한 값 두개를 맵에 넣어 반환
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("attractionList", attractionList);
		paramMap.put("attractionStartPage", attractionStartPage);
		paramMap.put("attractionEndPage", attractionEndPage);
		paramMap.put("attractionLastPage", attractionLastPage);
		
		return paramMap;
	}		
	
	// 해시태그 숙소 전체 검색 결과 리스트
	public Map<String, Object> getHashtagRoomSearchList(int hashtagRoomCurrentPage, int rowPerPage, String keyword) {			
		int beginRow = (hashtagRoomCurrentPage-1) * rowPerPage;
		int hashtagRoomStartPage = ((hashtagRoomCurrentPage - 1) / defaultPage) * defaultPage + 1;
		int hashtagRoomEndPage = hashtagRoomStartPage + defaultPage - 1;
		int hashtagRoomLastPage = 0;
		
		Map<String, Object> hashtagPage = new HashMap<>();
		hashtagPage.put("beginRow", beginRow);
		hashtagPage.put("rowPerPage", rowPerPage);
		hashtagPage.put("keyword", keyword);

		List<Room> hashtagRoomList = searchMapper.hashtagRoomSearchList(hashtagPage);
		log.debug(Font.JSB + hashtagRoomList.toString() + Font.RESET);
		
		int totalRowCount = searchMapper.hashtagRoomTotalRowCount(keyword);

		hashtagRoomLastPage = totalRowCount / rowPerPage;
		
		if(totalRowCount % rowPerPage != 0) {
			hashtagRoomLastPage+=1;
		}
		
		if(hashtagRoomEndPage > hashtagRoomLastPage) {
			hashtagRoomEndPage = hashtagRoomLastPage;
		}
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("hashtagRoomList", hashtagRoomList);
		paramMap.put("hashtagRoomStartPage", hashtagRoomStartPage);
		paramMap.put("hashtagRoomEndPage", hashtagRoomEndPage);
		paramMap.put("hashtagRoomLastPage", hashtagRoomLastPage);
		
		return paramMap;
	}		

	// 해시태그 명소 전체 검색 결과 리스트
	public Map<String, Object> getHashtagAttractionSearchList(int hashtagAttractionCurrentPage, int rowPerPage, String keyword) {			
		int beginRow = (hashtagAttractionCurrentPage-1) * rowPerPage;
		int hashtagAttractionStartPage = ((hashtagAttractionCurrentPage - 1) / defaultPage) * defaultPage + 1;
		int hashtagAttractionEndPage = hashtagAttractionStartPage + defaultPage - 1;
		int hashtagAttractionLastPage = 0;
		
		Map<String, Object> hashtagPage = new HashMap<>();
		hashtagPage.put("beginRow", beginRow);
		hashtagPage.put("rowPerPage", rowPerPage);
		hashtagPage.put("keyword", keyword);

		List<Attraction> hashtagAttractionList = searchMapper.hashtagAttractionSearchList(hashtagPage);
		log.debug(Font.JSB + hashtagAttractionList.toString() + Font.RESET);
		
		int totalRowCount = searchMapper.hashtagAttractionTotalRowCount(keyword);

		hashtagAttractionLastPage = totalRowCount / rowPerPage;
		
		if(totalRowCount % rowPerPage != 0) {
			hashtagAttractionLastPage+=1;
		}
		
		if(hashtagAttractionEndPage > hashtagAttractionLastPage) {
			hashtagAttractionEndPage = hashtagAttractionLastPage;
		}
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("hashtagAttractionList", hashtagAttractionList);
		paramMap.put("hashtagAttractionStartPage", hashtagAttractionStartPage);
		paramMap.put("hashtagAttractionEndPage", hashtagAttractionEndPage);
		paramMap.put("hashtagAttractionLastPage", hashtagAttractionLastPage);
		
		return paramMap;
	}			

	// 지역별 숙소 검색 결과 리스트
	public Map<String, Object> getRoomDistrictSearchList(String sido, String sigungu, int roomCurrentPage, int rowPerPage, String keyword) {	
		int beginRow = (roomCurrentPage-1) * rowPerPage;
		int roomStartPage = ((roomCurrentPage - 1) / defaultPage) * defaultPage + 1;
		int roomEndPage = roomStartPage + defaultPage - 1;
		int roomLastPage = 0;
		
		Map<String, Object> roomPage = new HashMap<>();
		roomPage.put("beginRow", beginRow);
		roomPage.put("rowPerPage", rowPerPage);
		roomPage.put("keyword", keyword);
		roomPage.put("sido", sido);
		roomPage.put("sigungu", sigungu);
		
		List<Room> roomList = searchMapper.roomDistrictSearchList(roomPage);
		log.debug(Font.JSB + roomList.toString() + Font.RESET);
		
		int totalRowCount = searchMapper.roomDistrictTotalRowCount(roomPage);

		roomLastPage = totalRowCount / rowPerPage;

		if(totalRowCount % rowPerPage != 0) {
			roomLastPage+=1;
		}
		
		if(roomEndPage > roomLastPage) {
			roomEndPage = roomLastPage;
		}
		
		// 검색 결과 리스트와 페이징 처리를 위한 값 두개를 맵에 넣어 반환
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("roomList", roomList);
		paramMap.put("roomStartPage", roomStartPage);
		paramMap.put("roomEndPage", roomEndPage);
		paramMap.put("roomLastPage", roomLastPage);
		
		return paramMap;
	}	

	// 지역별 명소 검색 결과 리스트
	public Map<String, Object> getAttractionDistrictSearchList(String sido, String sigungu, int attractionCurrentPage, int rowPerPage, String keyword) {	
		int beginRow = (attractionCurrentPage-1) * rowPerPage;
		int attractionStartPage = ((attractionCurrentPage - 1) / defaultPage) * defaultPage + 1;
		int attractionEndPage = attractionStartPage + defaultPage - 1;
		int attractionLastPage = 0;
		
		Map<String, Object> attractionPage = new HashMap<>();
		attractionPage.put("beginRow", beginRow);
		attractionPage.put("rowPerPage", rowPerPage);
		attractionPage.put("keyword", keyword);
		attractionPage.put("sido", sido);
		attractionPage.put("sigungu", sigungu);
		
		
		List<Attraction> attractionList = searchMapper.attractionDistrictSearchList(attractionPage);
		log.debug(Font.JSB + attractionList.toString() + Font.RESET);
			
		int totalRowCount = searchMapper.attractionDistrictTotalRowCount(attractionPage);
		
		attractionLastPage = totalRowCount / rowPerPage;
		
		if(totalRowCount % rowPerPage != 0) {
			attractionLastPage+=1;
		}
		
		if(attractionEndPage > attractionLastPage) {
			attractionEndPage = attractionLastPage;
		}
		
		// 검색 결과 리스트와 페이징 처리를 위한 값 두개를 맵에 넣어 반환
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("attractionList", attractionList);
		paramMap.put("attractionStartPage", attractionStartPage);
		paramMap.put("attractionEndPage", attractionEndPage);
		paramMap.put("attractionLastPage", attractionLastPage);
		
		return paramMap;
	}			

	// 지역별 해시태그 숙소 전체 검색 결과 리스트
	public Map<String, Object> getHashtagRoomDistrictSearchList(String sido, String sigungu, int hashtagRoomCurrentPage, int rowPerPage, String keyword) {			
		int beginRow = (hashtagRoomCurrentPage-1) * rowPerPage;
		int hashtagRoomStartPage = ((hashtagRoomCurrentPage - 1) / defaultPage) * defaultPage + 1;
		int hashtagRoomEndPage = hashtagRoomStartPage + defaultPage - 1;
		int hashtagRoomLastPage = 0;
		
		Map<String, Object> hashtagPage = new HashMap<>();
		hashtagPage.put("beginRow", beginRow);
		hashtagPage.put("rowPerPage", rowPerPage);
		hashtagPage.put("keyword", keyword);
		hashtagPage.put("sido", sido);
		hashtagPage.put("sigungu", sigungu);
		
		List<Room> hashtagRoomList = searchMapper.hashtagRoomDistrictSearchList(hashtagPage);
		log.debug(Font.JSB + hashtagRoomList.toString() + Font.RESET);
		
		int totalRowCount = searchMapper.hashtagRoomDistrictTotalRowCount(hashtagPage);

		hashtagRoomLastPage = totalRowCount / rowPerPage;
		
		if(totalRowCount % rowPerPage != 0) {
			hashtagRoomLastPage+=1;
		}
		
		if(hashtagRoomEndPage > hashtagRoomLastPage) {
			hashtagRoomEndPage = hashtagRoomLastPage;
		}
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("hashtagRoomList", hashtagRoomList);
		paramMap.put("hashtagRoomStartPage", hashtagRoomStartPage);
		paramMap.put("hashtagRoomEndPage", hashtagRoomEndPage);
		paramMap.put("hashtagRoomLastPage", hashtagRoomLastPage);
		
		return paramMap;
	}		

	// 지역별 해시태그 명소 전체 검색 결과 리스트
	public Map<String, Object> getHashtagAttractionDistrictSearchList(String sido, String sigungu, int hashtagAttractionCurrentPage, int rowPerPage, String keyword) {			
		int beginRow = (hashtagAttractionCurrentPage-1) * rowPerPage;
		int hashtagAttractionStartPage = ((hashtagAttractionCurrentPage - 1) / defaultPage) * defaultPage + 1;
		int hashtagAttractionEndPage = hashtagAttractionStartPage + defaultPage - 1;
		int hashtagAttractionLastPage = 0;
		
		Map<String, Object> hashtagPage = new HashMap<>();
		hashtagPage.put("beginRow", beginRow);
		hashtagPage.put("rowPerPage", rowPerPage);
		hashtagPage.put("keyword", keyword);
		hashtagPage.put("sido", sido);
		hashtagPage.put("sigungu", sigungu);		

		List<Attraction> hashtagAttractionList = searchMapper.hashtagAttractionDistrictSearchList(hashtagPage);
		log.debug(Font.JSB + hashtagAttractionList.toString() + Font.RESET);
		
		int totalRowCount = searchMapper.hashtagAttractionDistrictTotalRowCount(hashtagPage);

		hashtagAttractionLastPage = totalRowCount / rowPerPage;
		
		if(totalRowCount % rowPerPage != 0) {
			hashtagAttractionLastPage+=1;
		}
		
		if(hashtagAttractionEndPage > hashtagAttractionLastPage) {
			hashtagAttractionEndPage = hashtagAttractionLastPage;
		}
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("hashtagAttractionList", hashtagAttractionList);
		paramMap.put("hashtagAttractionStartPage", hashtagAttractionStartPage);
		paramMap.put("hashtagAttractionEndPage", hashtagAttractionEndPage);
		paramMap.put("hashtagAttractionLastPage", hashtagAttractionLastPage);
		
		return paramMap;
	}		
	
	// 검색을 시도한 사용자의 ID와 검색어를 저장
	public void addSearchHistory(User user, String keyword) {
		SearchHistory searchHistory = new SearchHistory();
		searchHistory.setSearchWord(keyword);
		searchHistory.setMemberId(user.getUserId());
		
		searchMapper.insertSearchKeyword(searchHistory);
	}
	
	// 사용자 이전 검색어 기록 조회
	public List<String> getSearchHistory(User user) {
		List<String> list = new ArrayList<>();
		String memberId = user.getUserId();
		list = searchMapper.selectSearchKeyword(memberId);
		log.debug(Font.JSB + list.toString() + Font.RESET);
		
		return list;
	}
	
	// 사용자 이전 검색어 삭제
	public void removeSearchHistory(Map<String, Object> paramMap) {
		String keyword = (String)paramMap.get("keyword");
		String userId = (String)paramMap.get("userId");
		SearchHistory searchHistory = new SearchHistory();
		searchHistory.setSearchWord(keyword);
		searchHistory.setMemberId(userId);
		
		searchMapper.deleteSearchKeyword(searchHistory);
	}
	
	// DB 시도 리스트 조회
	public List<String> getSidoList() {
		List<String> sidoList = new ArrayList<>();
		sidoList = searchMapper.sidoList();
		
		return sidoList;
	}
	
	// DB 시군구 리스트 조회
	public List<String> getSigunguList(String sido) {
		List<String> sigunguList = new ArrayList<>();
		sigunguList = searchMapper.sigunguList(sido);
		
		return sigunguList;
	}
}
