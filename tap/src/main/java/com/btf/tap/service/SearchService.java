package com.btf.tap.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.SearchMapper;
import com.btf.tap.vo.Attraction;
import com.btf.tap.vo.Room;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class SearchService {
	@Autowired private SearchMapper searchMapper;
	
	public Map<String, Object> getSearchList(String keyword) {
		List<Room> roomList = searchMapper.roomSearchList(keyword);
		log.debug(roomList.toString());
		
		List<Attraction> attractionList = searchMapper.attractionSearchList(keyword);
		log.debug(attractionList.toString());
		
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("roomList", roomList);
		
		return paramMap;
	}
}
