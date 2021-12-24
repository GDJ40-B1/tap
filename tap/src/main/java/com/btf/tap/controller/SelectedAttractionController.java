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
import com.btf.tap.service.SelectedAttractionService;
import com.btf.tap.vo.Attraction;
import com.btf.tap.vo.SelectedAttraction;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SelectedAttractionController {
	@Autowired SelectedAttractionService selectedAttractionService;
	@Autowired AttractionService attractionService;
	
	
	// 추가부분 수정해야함
	@GetMapping("/addSelectedAttraction")
	public String getAddSelectedAttraction() {
	return "/selectedAttraction/addSelectedAttraction";
	}
	@PostMapping("/addSelectedAttraction")
	public String postAddSelectedAttraction(SelectedAttraction selectedAttraction) {
		selectedAttractionService.addSelectedAttraction(selectedAttraction);
		return "redirect:/selectedAttractionList";
	}
	
	
	//목록 보기
	@GetMapping("/selectedAttractionList")
	public String selectedAttractionList(Model model) {
		List<SelectedAttraction> list = selectedAttractionService.getSelectedAttractionList();
		model.addAttribute("list", list);
		return "/selectedAttraction/selectedAttractionList";
	}
	
	// 명소 추기하기 리스트	
	@GetMapping("/addSelectedAttractionList")
	public String attractionList(Model model) {
		List<Attraction> list = attractionService.getAttractionList();
		model.addAttribute("list",list);
		return "selectedAttraction/addSelectedAttractionList";
	}
	
	// 명소 상세보기
	@GetMapping("/addSelectedAttractionOne")
	public String getAttractionOne(Model model, int attractionId, int detailAddressId) {
		Map<String, Object> map = attractionService.getAttractionOne(attractionId, detailAddressId);
		model.addAttribute("attraction",map.get("attraction"));
		model.addAttribute("address", map.get("address"));
		model.addAttribute("hashtag",map.get("hashtag"));
		return "selectedAttraction/addSelectedAttractionOne";
	}		
	
	// 수정하기(수정도 해야함)
	@GetMapping("/modifySelectedAttraction")
	public String getModifySelectedAttraction() {
		return "/selectedAttraction/modifyAttraction";
	}
	
	@PostMapping("/modifySelectedAttraction")
	public String postModifyAttraction(RedirectAttributes redirect, SelectedAttraction selectedAttraction) {
		return "redirect:/selectedAttractionList";
	}
	
	
	// 삭제
	@GetMapping("/removeSelectedAttraction")
	public String getRemoveSelectedAttraction(int selectedAttractionId) {
		selectedAttractionService.removeSelectedAttraction(selectedAttractionId);
		return "redirect:/selectedAttractionList";
	}	
	
}
