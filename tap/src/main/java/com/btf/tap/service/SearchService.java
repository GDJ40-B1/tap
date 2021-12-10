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
	
	public Map<String, Object> getRoomSearchList(int roomCurrentPage, int rowPerPage, String keyword) {	
		int beginRow = (roomCurrentPage-1) * rowPerPage;
		int roomStartPage = ((roomCurrentPage - 1) / defaultPage) * defaultPage + 1;
		int roomEndPage = roomStartPage + defaultPage - 1;
		int roomLastPage = 0;
		String result = "room";
		
		Map<String, Object> page = new HashMap<>();
		page.put("beginRow", beginRow);
		page.put("rowPerPage", rowPerPage);
		page.put("keyword", keyword);
		
		List<Room> roomList = searchMapper.roomSearchList(page);
		log.debug(Font.JSB + roomList.toString() + Font.RESET);
		
		int totalRowCount = searchMapper.totalRowCount(result);
		
		roomLastPage = totalRowCount / rowPerPage;
		
		if(totalRowCount % rowPerPage != 0) {
			roomLastPage+=1;
		}
		
		if(roomEndPage > roomLastPage) {
			roomEndPage = roomLastPage;
		}
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("roomList", roomList);
		paramMap.put("roomStartPage", roomStartPage);
		paramMap.put("roomEndPage", roomEndPage);
		
		return paramMap;
	}

	public Map<String, Object> getAttractionSearchList(int attractionCurrentPage, int rowPerPage, String keyword) {	
		int beginRow = (attractionCurrentPage-1) * rowPerPage;
		int attractionStartPage = ((attractionCurrentPage - 1) / defaultPage) * defaultPage + 1;
		int attractionEndPage = attractionStartPage + defaultPage - 1;
		int attractionLastPage = 0;
		String result = "attraction";
		
		Map<String, Object> page = new HashMap<>();
		page.put("beginRow", beginRow);
		page.put("rowPerPage", rowPerPage);
		page.put("keyword", keyword);

		List<Attraction> attractionList = searchMapper.attractionSearchList(keyword);
		log.debug(Font.JSB + attractionList.toString() + Font.RESET);
			
		int totalRowCount = searchMapper.totalRowCount(result);
		
		attractionLastPage = totalRowCount / rowPerPage;
		
		if(totalRowCount % rowPerPage != 0) {
			attractionLastPage+=1;
		}
		
		if(attractionEndPage > attractionLastPage) {
			attractionEndPage = attractionLastPage;
		}
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("attractionList", attractionList);
		paramMap.put("attractionStartPage", attractionStartPage);
		paramMap.put("attractionEndPage", attractionEndPage);
		
		return paramMap;
	}	

	public Map<String, Object> getHashtagSearchList(String keyword) {			
		List<Hashtag> hashtagList = searchMapper.hashtagSearch(keyword);
		List<Attraction> hashtagAttractionList = new ArrayList<>();
		List<Room> hashtagRoomList = new ArrayList<>();
		
		for (Hashtag hashtag : hashtagList) {
			int hashtagTarget = hashtag.getHashtagTarget();
			String hashtagTargetCategory = hashtag.getHashtagTargetCategory();
			
			if(hashtagTargetCategory.equals("attraction")) {
				hashtagAttractionList.add(attractionMapper.selectAttractionOne(hashtagTarget));
				log.debug(Font.JSB + hashtagAttractionList.toString() + Font.RESET);
				
			} else if (hashtagTargetCategory.equals("room")) {
				hashtagRoomList.add(roomMapper.selectRoomOne(hashtagTarget));
				log.debug(Font.JSB + hashtagRoomList.toString() + Font.RESET);
			}
		}
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("hashtagAttractionList", hashtagAttractionList);
		paramMap.put("hashtagRoomList", hashtagRoomList);
		
		return paramMap;
	}		
	
	public void addSearchHistory(User user, String keyword) {
		SearchHistory searchHistory = new SearchHistory();
		searchHistory.setSearchWord(keyword);
		searchHistory.setMemberId(user.getUserId());
		
		searchMapper.insertSearchKeyword(searchHistory);
	}
}
