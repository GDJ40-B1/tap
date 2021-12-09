package com.btf.tap.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.common.Font;
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
	
	public Map<String, Object> getSearchList(String keyword) {	
		List<Room> roomList = searchMapper.roomSearchList(keyword);
		log.debug(roomList.toString());
		
		List<Attraction> attractionList = searchMapper.attractionSearchList(keyword);
		log.debug(attractionList.toString());
		
		List<Hashtag> hashtagList = searchMapper.hashtagSearch(keyword);
		List<Object> resultList = new ArrayList<>();
		
		for (Hashtag hashtag : hashtagList) {
			int hashtagTarget = hashtag.getHashtagTarget();
			String hashtagTargetCategory = hashtag.getHashtagTargetCategory();
				
			if(hashtagTargetCategory == "attraction") {
				
			} else if (hashtagTargetCategory == "room") {
				resultList.add(roomMapper.selectRoomOne(hashtagTarget));
				log.debug(Font.JSB + resultList.toString() + Font.RESET);
			}
		}
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("roomList", roomList);
		paramMap.put("attractionList", attractionList);
		paramMap.put("resultList", resultList);
		
		return paramMap;
	}
	
	public void addSearchHistory(User user, String keyword) {
		SearchHistory searchHistory = new SearchHistory();
		searchHistory.setSearchWord(keyword);
		searchHistory.setMemberId(user.getUserId());
		
		searchMapper.insertSearchKeyword(searchHistory);
	}
}
