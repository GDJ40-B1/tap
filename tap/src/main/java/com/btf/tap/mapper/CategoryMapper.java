 package com.btf.tap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Amenities;
import com.btf.tap.vo.AttractionCategory;
import com.btf.tap.vo.Part;
import com.btf.tap.vo.RoomCategory;

@Mapper
public interface CategoryMapper {
	
	// *** 숙소 카테고리 ***
	// 숙소 카테고리 목록
	List<RoomCategory> selectRoomCategoryList();
	
	// 숙소 카테고리 추가
	int insertRoomCategory(RoomCategory roomCategory);
	
	// 숙소 카테고리 수정
	int updateRoomCategory(String roomCategory, String newRoomCategory);
	
	// 숙소 카테고리 삭제
	int deleteRoomCategory(String roomCategory);
	
	// *** 명소 카테고리 ***
	// 명소 카테고리 목록
	List<AttractionCategory> selectAttractionCategoryList();
	
	// 명소 카테고리 추가
	int insertAttractionCategory(AttractionCategory attractionCategory);
	
	// 명소 카테고리 수정
	int updateAttractionCategory(String attractionCategory, String newAttractionCategory);
	
	// 명소 카테고리 삭제
	int deleteAttractionCategory(String attractionCategory);
	
	// *** 숙소구성 카테고리 ***
	// 구성 카테고리 목록
	List<Part> selectPartList();
	
	// 구성 카테고리 추가
	int insertPart(Part part);
	
	// 구성 카테고리 수정
	int updatePart(String partName, String newPartName);
	
	// 구성 카테고리 삭제
	int deletePart(String partName);
	
	// *** 숙소비품 카테고리 ***
	// 비품 카테고리 목록
	List<Amenities> selectAmenitiesList();
	
	// 비품 카테고리 추가
	int insertAmenities(Amenities amenities);
	
	// 비품 카테고리 수정
	int updateAmenities(String amenitiesName, String newAmenitiesName);
	
	// 비품 카테고리 삭제
	int deleteAmenities(String amenitiesName);
	
}
