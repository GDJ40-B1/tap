package com.btf.tap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.btf.tap.common.Font;
import com.btf.tap.service.CategoryService;
import com.btf.tap.vo.Amenities;
import com.btf.tap.vo.AttractionCategory;
import com.btf.tap.vo.Part;
import com.btf.tap.vo.RoomCategory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CategoryController {
	@Autowired CategoryService categoryService;
	
	@GetMapping("/systemAdmin/categoryList")
	public String categoryList() {
		return "/category/categoryList";
	}
	
	// *** 숙소 카테고리 ***
	// 숙소 카테고리 목록
	@GetMapping("/systemAdmin/roomCategoryList")
	public String getRoomCategoryList(Model model) {
		List<RoomCategory> roomCategoryList = categoryService.getRoomCategoryList(); 
		log.debug(Font.HS + "roomCategoryList 객체 값 => " + roomCategoryList.toString() + Font.HS);
		
		model.addAttribute("roomCategoryList", roomCategoryList);
		
		return "/category/roomCategoryList";
	}
	
	// 숙소 카테고리 추가
	@GetMapping("/systemAdmin/addRoomCategory")
	public String getAddRoomCategory() {
		return "category/addCategory";
	}
	@PostMapping("/systemAdmin/addRoomCategory")
	public String postAddRoomCategory(RoomCategory roomCategory) {
		log.debug(Font.HS + "roomCategory 객체 값 => " + roomCategory.toString() + Font.HS);
		
		categoryService.addRoomCategory(roomCategory);
		
		return "redirect:/systemAdmin/roomCategoryList";
	}
	
	// 숙소 카테고리 수정
	@PostMapping("/systemAdmin/modifyRoomCategory")
	public String postModifyRoomCategory(String roomCategory, String newRoomCategory) {
		log.debug(Font.HS + "roomCategory 값 => " + roomCategory.toString() + Font.HS);
		log.debug(Font.HS + "newRoomCategory 값 => " + newRoomCategory.toString() + Font.HS);
		
		categoryService.modifyRoomCategory(roomCategory, newRoomCategory);
		
		return "redirect:/systemAdmin/roomCategoryList";
	}
	
	// 숙소 카테고리 삭제
	@PostMapping("/systemAdmin/removeRoomCategory")
	public String postRemoveRoomCategory(String roomCategory) {
		log.debug(Font.HS + "roomCategory 값 => " + roomCategory.toString() + Font.HS);
		
		categoryService.removeRoomCategory(roomCategory);
		
		return "redirect:/systemAdmin/roomCategoryList";
	}
	
	// *** 명소 카테고리 ***
	// 명소 카테고리 목록
	@GetMapping("/systemAdmin/attractionCategoryList")
	public String getAttractionCategoryList(Model model) {
		List<AttractionCategory> attractionCategoryList = categoryService.getAttractionCategoryList();
		log.debug(Font.HS + "attractionCategoryList 객체 값 => " + attractionCategoryList.toString() + Font.HS);
		
		model.addAttribute("attractionCategoryList", attractionCategoryList);
		
		return "/category/attractionCategoryList";
	}
	
	// 명소 카테고리 추가
	@GetMapping("/systemAdmin/addAttractionCategory")
	public String getAddAttractionCategory() {
		return "category/addCategory";
	}
	@PostMapping("/systemAdmin/addAttractionCategory")
	public String postAddAttractionCategory(AttractionCategory attractionCategory) {
		log.debug(Font.HS + "attractionCategory 객체 값 => " + attractionCategory.toString() + Font.HS);
		
		categoryService.addAttractionCategory(attractionCategory);
		
		return "redirect:/systemAdmin/attractionCategoryList";
	}
	
	// 명소 카테고리 수정
	@PostMapping("/systemAdmin/modifyAttractionCategory")
	public String postModifyAttractionCategory(String attractionCategory, String newAttractionCategory) {
		log.debug(Font.HS + "attractionCategory 값 => " + attractionCategory + Font.HS);
		log.debug(Font.HS + "newAttractionCategory 값 => " + newAttractionCategory + Font.HS);
		
		categoryService.modifyAttractionCategory(attractionCategory, newAttractionCategory);
		
		return "redirect:/systemAdmin/attractionCategoryList";
	}
	
	// 명소 카테고리 삭제
	@PostMapping("/systemAdmin/removeAttractionCategory")
	public String postRemoveAttractionCategory(String attractionCategory) {
		log.debug(Font.HS + "attractionCategory 값 => " + attractionCategory + Font.HS);
		
		categoryService.removeAttractionCategory(attractionCategory);
		
		return "redirect:/systemAdmin/attractionCategoryList";
	}
	
	// *** 숙소구성 카테고리 ***
	// 구성 카테고리 목록
	@GetMapping("/systemAdmin/roomPartList")
	public String getRoomPartList(Model model) {
		List<Part> roomPartList = categoryService.getPartList();
		log.debug(Font.HS + "roomPartList 객체 값 => " + roomPartList.toString() + Font.HS);
		
		model.addAttribute("roomPartList", roomPartList);
		
		return "/category/roomPartList";
	}
	
	// 구성 카테고리 추가
	@GetMapping("/systemAdmin/addRoomPart")
	public String getAddRoomPart() {
		return "category/addCategory";
	}
	@PostMapping("/systemAdmin/addRoomPart")
	public String postAddRoomPart(Part part) {
		log.debug(Font.HS + "part 객체 값 => " + part.toString() + Font.HS);
		
		categoryService.addPart(part);
		
		return "redirect:/systemAdmin/roomPartList";
	}
	
	// 구성 카테고리 수정
	@PostMapping("/systemAdmin/modifyRoomPart")
	public String postModifyRoomPart(String partName, String newPartName) {
		log.debug(Font.HS + "partName 값 => " + partName + Font.HS);
		log.debug(Font.HS + "newPartName 값 => " + newPartName + Font.HS);
		
		categoryService.modifyPart(partName, newPartName);
		
		return "redirect:/systemAdmin/roomPartList";
	}
	
	// 구성 카테고리 삭제
	@PostMapping("/systemAdmin/removeRoomPart")
	public String postRemoveRoomPart(String partName) {
		log.debug(Font.HS + "partName 값 => " + partName + Font.HS);
		
		categoryService.removePart(partName);
		
		return "redirect:/systemAdmin/roomPartList";
	}
	
	// *** 숙소비품 카테고리 ***
	// 비품 카테고리 목록
	@GetMapping("/systemAdmin/roomAmenitiesList")
	public String getRoomAmenitiesList(Model model) {
		List<Amenities> roomAmenitiesList = categoryService.getAmenitiesList();
		log.debug(Font.HS + "roomAmenitiesList 객체 값 => " + roomAmenitiesList.toString() + Font.HS);
		
		model.addAttribute("roomAmenitiesList", roomAmenitiesList);
		
		return "/category/roomAmenitiesList";
	}
	
	// 비품 카테고리 추가
	@GetMapping("/systemAdmin/addRoomAmenities")
	public String getAddRoomAmenities() {
		return "category/addCategory";
	}
	@PostMapping("/systemAdmin/addRoomAmenities")
	public String postAddRoomAmenities(Amenities amenities) {
		log.debug(Font.HS + "amenities 객체 값 => " + amenities.toString() + Font.HS);
		
		categoryService.addAmenities(amenities);
		
		return "redirect:/systemAdmin/roomAmenitiesList";
	}
	
	// 비품 카테고리 수정
	@PostMapping("/systemAdmin/modifyRoomAmenities")
	public String postModifyRoomAmenities(String amenitiesName, String newAmenitiesName) {
		log.debug(Font.HS + "amenitiesName 값 => " + amenitiesName + Font.HS);
		log.debug(Font.HS + "newAmenitiesName 값 => " + newAmenitiesName + Font.HS);
		
		categoryService.modifyAmenities(amenitiesName, newAmenitiesName);
		
		return "redirect:/systemAdmin/roomAmenitiesList";
	}
	
	// 비품 카테고리 삭제
	@PostMapping("/systemAdmin/removeRoomAmenities")
	public String postRemoveRoomAmenities(String amenitiesName) {
		log.debug(Font.HS + "amenitiesName 값 => " + amenitiesName + Font.HS);
		
		categoryService.removeAmenities(amenitiesName);
		
		return "redirect:/systemAdmin/roomAmenitiesList";
	}
}
