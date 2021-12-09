package com.btf.tap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.btf.tap.common.Font;
import com.btf.tap.service.SystemAdminService;
import com.btf.tap.vo.SystemAdmin;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SystemAdminController {
	@Autowired SystemAdminService systemAdminService;
	
	// 시스템관리자 전체 목록 불러오기
	@GetMapping("/systemAdminList")
	public String getSystemAdminList(Model model) {
		// 시스템관리자 목록 추출
		model.addAttribute("systemAdminList", systemAdminService.getSystemAdminList());
		
		return "systemAdmin/systemAdminList";
	}
	
	// 시스템관리자 한 명의 정보 불러오기
	@GetMapping("/systemAdminOne")
	public String getSystemAdminOne(Model model, String systemAdminId) {
		SystemAdmin systemAdmin = systemAdminService.getSystemAdminOne(systemAdminId);
		log.debug(Font.HS + "getGetCont : " + systemAdmin.toString() + Font.RESET);
		
		model.addAttribute("systemAdminOne", systemAdmin);
		
		return "systemAdmin/systemAdminOne";
	}
	
	// 새로운 시스템관리자 한 명 등록하기
	@GetMapping("/addSystemAdmin")
	public String getAddSystemAdmin() {
		return "systemAdmin/addSystemAdmin";
	}
	@PostMapping("/addSystemAdmin")
	public String postAddSystemAdmin(SystemAdmin systemAdmin) {
		systemAdminService.addSystemAdmin(systemAdmin);
		log.debug(Font.HS + "postAddCont : " + systemAdmin.toString() + Font.RESET);
		
		return "redirect:/systemAdminList";
	}
	
	// 시스템관리자 한 명의 pw 수정하기
	@GetMapping("/modifySystemAdminPw")
	public String getModifySystemAdminPw(Model model, String systemAdminId) {
		SystemAdmin systemAdmin = systemAdminService.getSystemAdminOne(systemAdminId);
		log.debug(Font.HS + "getModifyCont : " + systemAdmin.toString() + Font.RESET);
		
		model.addAttribute("systemAdmin", systemAdmin);
		
		return "systemAdmin/modifySystemAdminPw";
	}
	@PostMapping("/modifySystemAdminPw")
	public String postModifySystemAdminPw(SystemAdmin systemAdmin) {
		String systemAdminId = systemAdmin.getSystemAdminId();
		log.debug(Font.HS + "postModifyCont : " + systemAdminId + Font.RESET);
		
		systemAdminService.modifySystemAdminPw(systemAdmin);
		
		return "redirect:/systemAdminOne?systemAdminId="+systemAdminId;
	}
	
	// 시스템관리자 한 명의 name 수정하기
	@GetMapping("/modifySystemAdminName")
	public String getModifySystemAdminName(Model model, String systemAdminId) {
		SystemAdmin systemAdmin = systemAdminService.getSystemAdminOne(systemAdminId);
		log.debug(Font.HS + "getModifyCont : " + systemAdmin.toString() + Font.RESET);
		
		model.addAttribute("systemAdmin", systemAdmin);
		
		return "systemAdmin/modifySystemAdminName";
	}
	@PostMapping("/modifySystemAdminName")
	public String postModifySystemAdminName(SystemAdmin systemAdmin) {
		String systemAdminId = systemAdmin.getSystemAdminId();
		log.debug(Font.HS + "postModifyCont : " + systemAdminId + Font.RESET);
		
		systemAdminService.modifySystemAdminName(systemAdmin);
		
		return "redirect:/systemAdminOne?systemAdminId="+systemAdminId;
	}

	// 시스템관리자 한 명의 정보 삭제하기
	@GetMapping("/removeSystemAdmin")
	public String getRemoveSystemAdmin(Model model, String systemAdminId) {
		SystemAdmin systemAdmin = systemAdminService.getSystemAdminOne(systemAdminId);
		log.debug(Font.HS + "getRemoveCont : " + systemAdmin.toString() + Font.RESET);
		
		model.addAttribute("systemAdmin", systemAdmin);
		
		return "systemAdmin/removeSystemAdmin";
	}
	@PostMapping("/removeSystemAdmin")
	public String postRemoveSystemAdmin(SystemAdmin systemAdmin) {
		log.debug(Font.HS + "postRemoveCont : " + systemAdmin.toString() + Font.RESET);
		systemAdminService.removeSystemAdmin(systemAdmin);
		
		return "redirect:/systemAdminList";
	}
}
