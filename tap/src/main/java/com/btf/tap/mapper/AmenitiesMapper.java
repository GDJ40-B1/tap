package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AmenitiesMapper {
	
	// 비품 목록 추출
	List<String> selectAmenitiesList();
	
	// 숙소별 비품 추가
	void insertRoomAmenities(Map<String, Object> Amenities);
	
	// 숙소별 비품 삭제
	void deleteRoomAmenities(int roomId);
}
