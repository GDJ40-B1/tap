package com.btf.tap.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.AttractionMapper;
import com.btf.tap.mapper.RoomMapper;
import com.btf.tap.mapper.SearchMapper;
import com.btf.tap.vo.Attraction;
import com.btf.tap.vo.Hashtag;
import com.btf.tap.vo.Room;
import com.btf.tap.vo.SearchHistory;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class SearchService {
	@Autowired private SearchMapper searchMapper;
	@Autowired private RoomMapper roomMapper;
	@Autowired private AttractionMapper attractionMapper;
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
		String hashtagTargetCategory = "room";
		
		Map<String, Object> hashtagPage = new HashMap<>();
		hashtagPage.put("beginRow", beginRow);
		hashtagPage.put("rowPerPage", rowPerPage);
		hashtagPage.put("hashtagTargetCategory", hashtagTargetCategory);
		hashtagPage.put("keyword", keyword);

		List<Hashtag> hashtagList = searchMapper.hashtagSearchList(hashtagPage);
		log.debug(Font.JSB + hashtagList.toString() + Font.RESET);
		List<Room> hashtagRoomList = new ArrayList<>();
		
		for (Hashtag hashtag : hashtagList) {
			int hashtagTarget = hashtag.getHashtagTarget();
			hashtagRoomList.add(roomMapper.selectRoomOne(hashtagTarget));
		}
		
		int roomTotalRowCount = searchMapper.hashtagTotalRowCount(hashtagPage);

		hashtagRoomLastPage = roomTotalRowCount / rowPerPage;
		
		if(roomTotalRowCount % rowPerPage != 0) {
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
		String hashtagTargetCategory = "Attraction";
		
		Map<String, Object> hashtagPage = new HashMap<>();
		hashtagPage.put("beginRow", beginRow);
		hashtagPage.put("rowPerPage", rowPerPage);
		hashtagPage.put("hashtagTargetCategory", hashtagTargetCategory);
		hashtagPage.put("keyword", keyword);

		List<Hashtag> hashtagList = searchMapper.hashtagSearchList(hashtagPage);
		log.debug(Font.JSB + hashtagList.toString() + Font.RESET);
		List<Attraction> hashtagAttractionList = new ArrayList<>();
		
		for (Hashtag hashtag : hashtagList) {
			int hashtagTarget = hashtag.getHashtagTarget();
			hashtagAttractionList.add(attractionMapper.selectAttractionOne(hashtagTarget));
		}
		
		int attractionTotalRowCount = searchMapper.hashtagTotalRowCount(hashtagPage);

		hashtagAttractionLastPage = attractionTotalRowCount / rowPerPage;
		
		if(attractionTotalRowCount % rowPerPage != 0) {
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
}
