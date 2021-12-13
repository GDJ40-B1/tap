package com.btf.tap.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.btf.tap.common.Font;
import com.btf.tap.service.SystemAdminService;
import com.btf.tap.vo.SystemAdmin;
import com.btf.tap.vo.User;

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
		
		return "redirect:/login";
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
	
	// 시스템관리자 한 명의 정보(name, age, phone) 수정하기
	@GetMapping("/modifySystemAdminInfo")
	public String getModifySystemAdminInfo(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		log.debug(Font.HS + "getModifyInfoCont : " + session.toString() + Font.RESET);
		
		// 로그인 되어있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 세션에서 loginUser 객체 받기
		User user = (User)session.getAttribute("loginUser");
		log.debug(Font.HS + "getModifyInfoCont : " + user.toString() + Font.RESET);
		
		// 유저 객체속 아이디를 시스템관리자 객체에 넣어 조회하기
		SystemAdmin systemAdmin = new SystemAdmin();
		systemAdmin.setSystemAdminId(user.getUserId());
		systemAdmin = systemAdminService.getSystemAdminOne(systemAdmin.getSystemAdminId());
		log.debug(Font.HS + "getModifyInfoCont : " + systemAdmin.toString() + Font.RESET);
		
		model.addAttribute("systemAdmin", systemAdmin);
		
		return "systemAdmin/modifySystemAdminInfo";
	}
	@PostMapping("/modifySystemAdminInfo")
	public String postModifySystemAdminInfo(HttpServletRequest request, Model model, SystemAdmin systemAdmin) {
		
		HttpSession session = request.getSession();
		log.debug(Font.HS + "postModifyInfoCont : " + session.toString() + Font.RESET);
		
		// 로그인 되어있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 입력한 정보(이름,나이,전화번호)
		log.debug(Font.HS + "postModifyInfoCont : " + systemAdmin.toString() + Font.RESET);
		
		// 시스템관리자 정보 변경
		systemAdmin = systemAdminService.modifySystemAdminInfo(systemAdmin);
		
		// 시스템관리자 정보 주입
		model.addAttribute("systemAdmin", systemAdmin);
		
		return "systemAdmin/systemAdminMyPage";
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
