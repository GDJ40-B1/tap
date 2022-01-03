package com.btf.tap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.CategoryMapper;
import com.btf.tap.vo.Amenities;
import com.btf.tap.vo.AttractionCategory;
import com.btf.tap.vo.Part;
import com.btf.tap.vo.RoomCategory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class CategoryService {
	@Autowired CategoryMapper categoryMapper;
	
	// *** 숙소 카테고리 ***
	// 숙소 카테고리 목록
	public List<RoomCategory> getRoomCategoryList(){
		List<RoomCategory> list = categoryMapper.selectRoomCategoryList();
	
		log.debug(Font.HS + "list 객체 값 => " + list.toString() + Font.HS);
		
		return list;
	}
	
	// 숙소 카테고리 추가
	public int addRoomCategory(RoomCategory roomCategory) {
		log.debug(Font.HS + "roomCategory 객체 값 => " + roomCategory.toString() + Font.HS);
		
		int check = categoryMapper.insertRoomCategory(roomCategory);
		
		if(check == 1) {
			log.debug(Font.HS + "추가 성공!" + Font.HS);
		} else {
			log.debug(Font.HS + "추가 실패!" + Font.HS);
		}
		
		return check;
	}
	
	// 숙소 카테고리 수정
	public int modifyRoomCategory(String roomCategory, String newRoomCategory) {
		log.debug(Font.HS + "roomCategory 값 => " + roomCategory.toString() + Font.HS);
		log.debug(Font.HS + "newRoomCategory 값 => " + newRoomCategory.toString() + Font.HS);
		
		int check = categoryMapper.updateRoomCategory(roomCategory, newRoomCategory);
		if(check == 1) {
			log.debug(Font.HS + "수정 성공!" + Font.HS);
		} else {
			log.debug(Font.HS + "수정 실패!" + Font.HS);
		}
		
		return check;
	}
	
	// 숙소 카테고리 삭제
	public int removeRoomCategory(String roomCategory) {
		log.debug(Font.HS + "roomCategory 값 => " + roomCategory + Font.HS);
		
		int check = categoryMapper.deleteRoomCategory(roomCategory);
		if(check == 1) {
			log.debug(Font.HS + "삭제 성공!" + Font.HS);
		} else {
			log.debug(Font.HS + "삭제 실패!" + Font.HS);
		}
		
		return check;
	}
	
	// *** 명소 카테고리 ***
	// 명소 카테고리 목록
	public List<AttractionCategory> getAttractionCategoryList(){
		List<AttractionCategory> list = categoryMapper.selectAttractionCategoryList();
	
		log.debug(Font.HS + "list 객체 값 => " + list.toString() + Font.HS);
		
		return list;
	}
	
	// 명소 카테고리 추가
	public int addAttractionCategory(AttractionCategory attractionCategory) {
		log.debug(Font.HS + "attractionCategory 객체 값 => " + attractionCategory.toString() + Font.HS);
		
		int check = categoryMapper.insertAttractionCategory(attractionCategory);
		
		if(check == 1) {
			log.debug(Font.HS + "추가 성공!" + Font.HS);
		} else {
			log.debug(Font.HS + "추가 실패!" + Font.HS);
		}
		
		return check;
	}
	
	// 명소 카테고리 수정
	public int modifyAttractionCategory(String attractionCategory, String newAttractionCategory) {
		log.debug(Font.HS + "attractionCategory 값 => " + attractionCategory + Font.HS);
		log.debug(Font.HS + "newAttractionCategory 값 => " + newAttractionCategory + Font.HS);
		
		int check = categoryMapper.updateAttractionCategory(attractionCategory, newAttractionCategory);
		if(check == 1) {
			log.debug(Font.HS + "수정 성공!" + Font.HS);
		} else {
			log.debug(Font.HS + "수정 실패!" + Font.HS);
		}
		
		return check;
	}
	
	// 명소 카테고리 삭제
	public int removeAttractionCategory(String attractionCategory) {
		log.debug(Font.HS + "attractionCategory 값 => " + attractionCategory + Font.HS);
		
		int check = categoryMapper.deleteAttractionCategory(attractionCategory);
		if(check == 1) {
			log.debug(Font.HS + "삭제 성공!" + Font.HS);
		} else {
			log.debug(Font.HS + "삭제 실패!" + Font.HS);
		}
		
		return check;
	}
	
	// *** 숙소구성 카테고리 ***
	// 구성 카테고리 목록
	public List<Part> getPartList(){
		List<Part> list = categoryMapper.selectPartList();
	
		log.debug(Font.HS + "list 객체 값 => " + list.toString() + Font.HS);
		
		return list;
	}
	
	// 구성 카테고리 추가
	public int addPart(Part part) {
		log.debug(Font.HS + "part 객체 값 => " + part.toString() + Font.HS);
		
		int check = categoryMapper.insertPart(part);
		
		if(check == 1) {
			log.debug(Font.HS + "추가 성공!" + Font.HS);
		} else {
			log.debug(Font.HS + "추가 실패!" + Font.HS);
		}
		
		return check;
	}
	
	// 구성 카테고리 수정
	public int modifyPart(String partName, String newPartName) {
		log.debug(Font.HS + "partName 값 => " + partName + Font.HS);
		log.debug(Font.HS + "newPartName 값 => " + newPartName + Font.HS);
		
		int check = categoryMapper.updatePart(partName, newPartName);
		if(check == 1) {
			log.debug(Font.HS + "수정 성공!" + Font.HS);
		} else {
			log.debug(Font.HS + "수정 실패!" + Font.HS);
		}
		
		return check;
	}
	
	// 구성 카테고리 삭제
	public int removePart(String partName) {
		log.debug(Font.HS + "partName 값 => " + partName + Font.HS);
		
		int check = categoryMapper.deletePart(partName);
		if(check == 1) {
			log.debug(Font.HS + "삭제 성공!" + Font.HS);
		} else {
			log.debug(Font.HS + "삭제 실패!" + Font.HS);
		}
		
		return check;
	}
		
	// *** 숙소비품 카테고리 ***
	// 비품 카테고리 목록
	public List<Amenities> getAmenitiesList(){
		List<Amenities> list = categoryMapper.selectAmenitiesList();
	
		log.debug(Font.HS + "list 객체 값 => " + list.toString() + Font.HS);
		
		return list;
	}
	
	// 비품 카테고리 추가
	public int addAmenities(Amenities roomCategory) {
		log.debug(Font.HS + "roomCategory 객체 값 => " + roomCategory.toString() + Font.HS);
		
		int check = categoryMapper.insertAmenities(roomCategory);
		
		if(check == 1) {
			log.debug(Font.HS + "추가 성공!" + Font.HS);
		} else {
			log.debug(Font.HS + "추가 실패!" + Font.HS);
		}
		
		return check;
	}
	
	// 비품 카테고리 수정
	public int modifyAmenities(String amenitiesName, String newAmenitiesName) {
		log.debug(Font.HS + "amenitiesName 값 => " + amenitiesName + Font.HS);
		log.debug(Font.HS + "newAmenitiesName 값 => " + newAmenitiesName + Font.HS);
		
		int check = categoryMapper.updateAmenities(amenitiesName, newAmenitiesName);
		if(check == 1) {
			log.debug(Font.HS + "수정 성공!" + Font.HS);
		} else {
			log.debug(Font.HS + "수정 실패!" + Font.HS);
		}
		
		return check;
	}
	
	// 비품 카테고리 삭제
	public int removeAmenities(String amenitiesName) {
		log.debug(Font.HS + "amenitiesName 값 => " + amenitiesName + Font.HS);
		
		int check = categoryMapper.deleteAmenities(amenitiesName);
		if(check == 1) {
			log.debug(Font.HS + "삭제 성공!" + Font.HS);
		} else {
			log.debug(Font.HS + "삭제 실패!" + Font.HS);
		}
		
		return check;
	}	
}
