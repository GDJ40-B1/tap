package com.btf.tap.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.btf.tap.service.AttractionService;
import com.btf.tap.vo.Address;
import com.btf.tap.vo.Attraction;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AttractionController {
	@Autowired AttractionService attractionService;

	@GetMapping("/addAttraction")
	public String getAddAttraction(Model model) {
		model.addAttribute("attractionCategoryList", attractionService.getAttractionCategory());
		return "attraction/addAttraction";
	}
	
	@PostMapping("/addAttraction")
	public String postAddAttraction(Attraction attraction, Address address) {		
		
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
	public String getModifyAttraction(Model model, int attractionId, int detailAddressId) {
		model.addAttribute("attractionCategoryList", attractionService.getAttractionCategory());
		Map<String, Object> map = attractionService.getAttractionOne(attractionId, detailAddressId);
		model.addAttribute("attraction", map.get("attraction"));
		model.addAttribute("address", map.get("address"));
		System.out.println("!!!!!!!"+map.get("address"));
		return "attraction/modifyAttraction";
	}
	
	@PostMapping("/modifyAttraction")
	public String postModifyAttraction(RedirectAttributes redirect, Attraction attraction, Address address) {
		address = attractionService.modifyAttraction(attraction, address);
		redirect.addAttribute("attractionId",attraction.getAttractionId());
		redirect.addAttribute("detailAddressId", address.getDetailAddressId());
		
		return "redirect:/attractionOne";
	}

}
