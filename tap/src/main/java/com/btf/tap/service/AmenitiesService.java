package com.btf.tap.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.AmenitiesMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class AmenitiesService {
	@Autowired AmenitiesMapper amenitiesMapper;
	
	// 비품 목록 추출
	public List<String> getAmenitiesList(){
		return amenitiesMapper.selectAmenitiesList();
	}
	
	// 숙소별 비품 추가
	public void addMemberCoupon(String amenities, int roomId) {
		// 비품 문자열 분리
		String[] amenitiesList = amenities.split("&");
		Map<String, Object> amenitiesMap = new HashMap<>();
		amenitiesMap.put("roomId", roomId);
		for(String a : amenitiesList) {
			amenitiesMap.put("amenitiesName", a);
			amenitiesMapper.insertRoomAmenities(amenitiesMap);
		}
	}
	
	public void removeRoomAmenities(int roomId) {
		amenitiesMapper.deleteRoomAmenities(roomId);
	}
}
