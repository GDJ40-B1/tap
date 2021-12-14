package com.btf.tap.controller;

import java.util.List;
import java.util.Map;

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
	public String postAddAttraction(Attraction attraction, Address address, String phone1, String phone2, String phone3) {		
		
		// 명소 추가
		attractionService.addAttraction(attraction, address);	
		// 추가된 뒤 명소 리스트페이지로 돌아감
		return "redirect:/attractionList";
	}

	
	// 상세보기
	@GetMapping("/attractionOne")
	public String getAttractionOne(Model model, int attractionId, int detailAddressId) {
		Map<String, Object> map = attractionService.getAttractionOne(attractionId, detailAddressId);
		model.addAttribute("attraction",map.get("attraction"));
		model.addAttribute("address", map.get("address"));
		return "attraction/attractionOne";
	}	
	
	//페이징 추가하기
	@GetMapping("/attractionList")
	public String attractionList(Model model) {
		List<Attraction> list = attractionService.getAttractionList();
		model.addAttribute("list",list);
		return "attraction/attractionList";
	}	
	
	
	@GetMapping("/removeAttraction")
	public String getRemoveRoom(int attractionId) {
		// 명소 삭제
		attractionService.removeAttraction(attractionId);
		// 목록으로 되돌아가기
		return "redirect:/attractionList";
	}
	
	@GetMapping("/modifyAttraction")
	// 수정
	public String getModifyAttraction(Attraction attraction, Address address, String phone1, String phone2, String phone3) {
		return "attraction/modifyAttraction";
	}
	
	@PostMapping("/modifyAttraction")
	public String postModifyAttraction() {
		
		return "redirect:attractionList";
	}

}
