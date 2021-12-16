package com.btf.tap.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.btf.tap.common.Font;
import com.btf.tap.service.QuestionService;
import com.btf.tap.service.SystemAdminService;
import com.btf.tap.vo.SystemAdmin;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SystemAdminController {
	@Autowired SystemAdminService systemAdminService;
	@Autowired private QuestionService questionService;
	private final int rowPerPage = 10;	
	
	// 시스템관리자 세션을 통한 myPage 구현
	@GetMapping("/systemAdminMyPage")
	public String getSystemAdminMyPage(HttpServletRequest request, Model model,
										@RequestParam(name="unansweredCurrentPage", defaultValue = "1") int unansweredCurrentPage,
										@RequestParam(required = false) String writerCategory) {
		HttpSession session = request.getSession();
		log.debug(Font.HS + "getMyPageCont : " + session.toString() + Font.RESET);
		
		// 로그인 되어있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 세션에서 loginUser 객체 받기
		User user = (User)session.getAttribute("loginUser");
		log.debug(Font.HS + "getMyPageCont : " + user.toString() + Font.RESET);
		
		// 유저 객체속 아이디를 시스템관리자 객체에 넣어 조회하기
		SystemAdmin systemAdmin = new SystemAdmin();
		systemAdmin.setSystemAdminId(user.getUserId());
		systemAdmin = systemAdminService.getSystemAdminOne(systemAdmin.getSystemAdminId());
		log.debug(Font.HS + "getMyPageCont : " + systemAdmin.toString() + Font.RESET);
		
		// 문의 미답변
		Map<String, Object> questionMap = questionService.getUnansweredQuestionList(unansweredCurrentPage, rowPerPage, writerCategory);
		questionMap.put("unansweredCurrentPage", unansweredCurrentPage);
		questionMap.put("writerCategory", writerCategory);
		log.debug(Font.JSB + questionMap.toString() + Font.RESET);
		
		// 시스템관리자 정보 주입
		model.addAttribute("systemAdmin", systemAdmin);
		model.addAttribute("questionMap", questionMap);
		
		// 시스템관리자 마이페이지로 이동
		return "systemAdmin/systemAdminMyPage";
	}
	
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
		
		// 시스템관리자 정보 주입
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
	public String getModifySystemAdminPw(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		log.debug(Font.HS + "getModifyPwCont : " + session.toString() + Font.RESET);
		
		// 로그인 되어있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 세션에서 loginUser 객체 받기
		User user = (User)session.getAttribute("loginUser");
		log.debug(Font.HS + "getModifyPwCont : " + user.toString() + Font.RESET);
		
		// 유저 객체속 아이디를 시스템관리자 객체에 넣어 조회하기
		SystemAdmin systemAdmin = new SystemAdmin();
		systemAdmin.setSystemAdminId(user.getUserId());
		systemAdmin = systemAdminService.getSystemAdminOne(systemAdmin.getSystemAdminId());
		log.debug(Font.HS + "getModifyPwCont : " + systemAdmin.toString() + Font.RESET);
		
		// 시스템관리자 정보 주입
		model.addAttribute("systemAdmin", systemAdmin);
		
		return "systemAdmin/modifySystemAdminPw";
	}
	@PostMapping("/modifySystemAdminPw")
	public String postModifySystemAdminPw(HttpServletRequest request, Model model, SystemAdmin systemAdmin, String systemAdminNewPw) {
		
		HttpSession session = request.getSession();
		log.debug(Font.HS + "postModifyPwCont : " + session.toString() + Font.RESET);
		
		// 로그인 되어있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 입력한 비밀번호
		log.debug(Font.HS + "postModifyPwCont : " + systemAdmin.toString() + Font.RESET);
		
		// 입력한 비밀번호와 현재 비밀번호가 일치하는지 확인하기 위한 변수
		int check = systemAdminService.getSystemAdminPw(systemAdmin);
		
		// 비밀번호가 일치하지 않을 시 다시 입력하도록 수정
		if(check!=1) {
			log.debug(Font.HS + "입력한 비밀번호와 기존비밀번호 불일치!" + systemAdmin.toString() + Font.RESET);
			return "redirect:/modifySystemAdminPw";
		}
		
		// 새로운 비밀번호 입력 정보
		log.debug(Font.HS + "postModifyNewPwCont : " + systemAdminNewPw + Font.RESET);
		
		// 새로운 비밀번호 세팅
		systemAdmin.setSystemAdminPw(systemAdminNewPw);
		
		// 새로운 비밀번호로 변경
		systemAdmin = systemAdminService.modifySystemAdminPw(systemAdmin);
		
		// 시스템관리자 정보 주입
		model.addAttribute("systemAdmin", systemAdmin);
		
		return "systemAdmin/systemAdminMyPage";
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
		
		// 시스템관리자 정보 주입
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
