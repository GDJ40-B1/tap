package com.btf.tap.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.btf.tap.service.AttractionService;
import com.btf.tap.vo.Address;
import com.btf.tap.vo.Attraction;
import com.btf.tap.vo.SystemAdmin;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AttractionController {
	@Autowired AttractionService attractionService;

	@GetMapping("/member/addAttraction")
	public String getAddAttraction(Model model) {
		model.addAttribute("attractionCategoryList", attractionService.getAttractionCategory());		
		return "/member/attraction/addAttraction";
	}
	
	@PostMapping("/member/addAttraction")
	public String postAddAttraction(Attraction attraction, Address address, String hashtag, MultipartHttpServletRequest mtRequest) {		
		// 명소 추가
		attractionService.addAttraction(attraction, address, hashtag, mtRequest);
		// 추가된 뒤 명소 리스트페이지로 돌아감
		return "redirect:/attractionList";
	}

	
	// [일반]상세보기
	@GetMapping("/attractionOne")
	public String getAttractionOne(Model model, int attractionId, int detailAddressId) {
		Map<String, Object> map = attractionService.getAttractionOne(attractionId, detailAddressId);
		model.addAttribute("attraction",map.get("attraction"));
		model.addAttribute("address", map.get("address"));
		model.addAttribute("hashtag",map.get("hashtag"));
		model.addAttribute("imageList",map.get("imageList"));
		attractionService.updateAttractionCnt(attractionId);
		return "attraction/attractionOne";
	}	
	

	private static final int ROW_PER_PAGE = 10;	
	@GetMapping("/attractionList")
	public String attractionList(Model model, 
			@RequestParam(defaultValue="1") int currentPage,
			@RequestParam(required = false) String approvalStatus) {
		
		Map<String, Object> map = attractionService.getAttractionList(approvalStatus, currentPage, ROW_PER_PAGE);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		return "attraction/attractionList";
	}
	
	//리스트 출력
	@GetMapping("/systemAdmin/attractionList")
	public String systemAdminAttractionList(Model model,
			@RequestParam(defaultValue="1") int currentPage,
			@RequestParam(required = false) String approvalStatus){
		
		Map<String, Object> map = attractionService.getAttractionList(approvalStatus, currentPage, ROW_PER_PAGE);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		return "systemAdmin/attraction/attractionList";
	}
	
	// 승인 대기 리스트 출력
	@GetMapping("/systemAdmin/approvalAttractionList")
	public String approvalAttractionList(Model model,
			@RequestParam(defaultValue="1") int currentPage,
			@RequestParam(required = false) String approvalStatus) {
		Map<String, Object> map = attractionService.getApprovalAttractionList(approvalStatus, currentPage, ROW_PER_PAGE);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		return "systemAdmin/attraction/approvalAttractionList";
	}
	
	// [시스템 관리자]상세보기
	@GetMapping("/systemAdmin/attractionOne")
	public String systemAdminGetAttractionOne(Model model, int attractionId, int detailAddressId) {
		Map<String, Object> map = attractionService.getAttractionOne(attractionId, detailAddressId);
		model.addAttribute("attraction",map.get("attraction"));
		model.addAttribute("address", map.get("address"));
		model.addAttribute("hashtag",map.get("hashtag"));
		model.addAttribute("imageList",map.get("imageList"));
		return "/systemAdmin/attraction/attractionOne";
	}	
	
	// [시스템 관리자] 미승인 상태 상세보기
	@GetMapping("/systemAdmin/approvalAttractionOne")
	public String systemAdminGetApprovalAttractionOne(Model model, int attractionId, int detailAddressId) {
		Map<String, Object> map = attractionService.getApprovalAttractionOne(attractionId, detailAddressId);
		model.addAttribute("attraction",map.get("attraction"));
		model.addAttribute("address", map.get("address"));
		model.addAttribute("hashtag",map.get("hashtag"));
		model.addAttribute("imageList",map.get("imageList"));
		return "/systemAdmin/attraction/approvalAttractionOne";
	}		
	
	@GetMapping("systemAdmin/approvalAttraction")
	public String getApprovalAttraction(int attractionId) {
		attractionService.approvalAttraction(attractionId);
		return "redirect:/systemAdmin/approvalAttractionList";
	}
	
	
	@GetMapping("/systemAdmin/removeAttraction")
	public String getRemoveAttraction(HttpServletRequest request,int attractionId) {
		// 명소 삭제
		attractionService.removeAttraction(request,attractionId);
		// 목록으로 되돌아가기
		return "redirect:/systemAdmin/attractionList";
	}
	
	@GetMapping("/systemAdmin/modifyAttraction")
	// 수정
	public String getModifyAttraction(Model model, int attractionId, int detailAddressId) {
		model.addAttribute("attractionCategoryList", attractionService.getAttractionCategory());
		Map<String, Object> map = attractionService.getAttractionOne(attractionId, detailAddressId);
		model.addAttribute("attraction", map.get("attraction"));
		model.addAttribute("address", map.get("address"));
		model.addAttribute("hashtag", map.get("hashtag"));
		return "/systemAdmin/attraction/modifyAttraction";
	}

	@PostMapping("/systemAdmin/modifyAttraction")
	public String postModifyAttraction(RedirectAttributes redirect, Attraction attraction, Address address, String hashtag, MultipartHttpServletRequest mtRequest) {
		address = attractionService.modifyAttraction(attraction, address, hashtag, mtRequest);
		redirect.addAttribute("attractionId",attraction.getAttractionId());
		redirect.addAttribute("detailAddressId", address.getDetailAddressId());

		return "redirect:/systemAdmin/attractionOne";
	}
	@GetMapping("/systemAdmin/addAttraction")
	public String getSystemAdminAddAttraction(Model model) {
		model.addAttribute("attractionCategoryList", attractionService.getAttractionCategory());
		return "/systemAdmin/attraction/addAttraction";
	}
	
	@PostMapping("/systemAdmin/addAttraction")
	public String postSystemAdminAddAttraction(Attraction attraction, Address address, String hashtag, MultipartHttpServletRequest mtRequest) {		
		// 명소 추가
		attractionService.addAttraction(attraction, address, hashtag, mtRequest);
		// 추가된 뒤 명소 리스트페이지로 돌아감
		return "redirect:/systemAdmin/attractionList";
	}
}
