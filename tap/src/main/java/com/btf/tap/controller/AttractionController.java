package com.btf.tap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.btf.tap.service.AttractionService;
import com.btf.tap.vo.Address;
import com.btf.tap.vo.Attraction;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AttractionController {
	@Autowired AttractionService attractionService;

	@GetMapping("/addAttraction")
	public String getAddAttraction() {
		return "attraction/addAttraction";
	}
	
	@PostMapping("/addAttraction")
	public String postAddAttraction(Attraction attraction, Address address) {
		// 명소 추가
		attractionService.addAttraction(attraction, address);	
		// 추가된 뒤 명소 리스트페이지로 돌아감
		return "redirect:/attractionList";
	}
/*
	
	@GetMapping("/attractionList")
	public String attractionList(Model model) {
		List<Attraction> list = attractionService.getattractionList();
		model.addAttribute("list",list);
		return "attraction/attractionList";
	}
	
	// 다시 하기
	@GetMapping("/attractionOne")
	public String getAttractionOne(Model model, int attractionId, int detailAddressId) {
		Map<String, Object> map = roomService.getAttractionOne(attractionId, detailAddressId);
	return "attraction/attractionOne";
	}
	
	
	
	
	@GetMapping("/removeAttraction")
	public String getRemoveRoom(int attractionId) {
		// 명소 삭제
		AttractionService.removeAttraction(attractionId);
		// 목록으로 되돌아가기
		return "redirect:/attractionList";
	}
	*/
}
