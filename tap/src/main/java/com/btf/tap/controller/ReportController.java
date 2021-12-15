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
import com.btf.tap.service.ReportService;
import com.btf.tap.vo.Report;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReportController {
	@Autowired private ReportService reportService;
	private final int ROW_PER_PAGE = 10;
	
	// 작성자 카테고리별 전체 신고 내역 조회
	@RequestMapping("/reportList")
	public String requestReportList(Model model, HttpServletRequest request, @RequestParam(required = false) String writerCategory,
										@RequestParam(name="currentPage", defaultValue="1") int currentPage) {
			Map<String,Object> map = reportService.getReportList(writerCategory, currentPage, ROW_PER_PAGE);				
			log.debug(Font.HS + "requestListCont : " + map.toString() + Font.RESET);
			
			// 작성자의 정보를 알아오기 위해
			HttpSession session = request.getSession();
			User loginUser = (User)session.getAttribute("loginUser");
			log.debug(Font.HS + "requestListCont : " + loginUser.toString() + Font.RESET);
			
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("list", map.get("list"));
			model.addAttribute("writerCategory", writerCategory);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("lastPage", map.get("lastPage"));
			model.addAttribute("startPage", map.get("startPage"));
			model.addAttribute("endPage", map.get("endPage"));
			
			return "report/reportList";					
	}	
	
	// 신고글 작성하기
	@GetMapping("/addReport")
	public String getAddReport(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		log.debug(Font.HS + "getAddCont : " + session.toString() + Font.RESET);
		
		// 로그인 되어있지 않을 경우, 시스템관리자일 경우 홈페이지로 이동
		if(session.getAttribute("loginUser") == null || session.getAttribute("loginUser").equals("system_admin")) {
			return "redirect:/";
		}
		
		// 세션에서 loginUser 객체 받기
		User loginUser = (User)session.getAttribute("loginUser");
		log.debug(Font.HS + "getAddCont : " + loginUser.toString() + Font.RESET);
		
		model.addAttribute("loginUser", loginUser);
		
		return "report/addReport";
	}
	@PostMapping("/addReport")
	public String postAddRepot(Report report) {
		// 입력한 신고정보
		log.debug(Font.HS + "postAddCont : " + report.toString() + Font.RESET);
		
		reportService.addReport(report);
		// 입력된 신고정보 확인
		log.debug(Font.HS + "postAddCont : " + report.toString() + Font.RESET);
		
		return "redirect:/reportList";
	}	
	
	// 신고글 삭제하기
	@GetMapping("/removeReport")
	public String getRemoveReport(HttpServletRequest request, Report report) {
		
		HttpSession session = request.getSession();
		log.debug(Font.HS + "getRemoveCont : " + session.toString() + Font.RESET);
		
		// 로그인 되어있지 않을 경우, 회원, 숙소관리자일 경우 홈페이지로 이동
		if(session.getAttribute("loginUser") == null || session.getAttribute("loginUser").equals("member") || session.getAttribute("loginUser").equals("host")) {
			log.debug(Font.HS + "시스템관리자 계정으로 로그인 하십시오." + Font.RESET);
			return "redirect:/login";
		}
		
		// 입력받은 신고글 삭제 정보
		log.debug(Font.HS + "getRemoveCont : " + report.toString() + Font.RESET);
		
		// 신고글 삭제 후, 결과 저장
		int check = reportService.removeReport(report);
		
		// 삭제되지 않았을 경우 다시 삭제 실패 알림
		if(check != 1) {
			log.debug(Font.HS + "삭제 실패!" + Font.RESET);
			return "redirect:/reportList";
		}
		
		return "redirect:/reportList";
	}
	
	// 신고글 수정하기(승인여부)
	@PostMapping("/modifyReport")
	public String postModifyReport(HttpServletRequest request, Model model, Report report) {
		
		HttpSession session = request.getSession();
		
		// 로그인 되어있지 않을 경우
		User user = (User)session.getAttribute("loginUser");
		if(user == null) {
			return "redirect:/";
		}
		
		// 수정하기 전 신고글 정보
		log.debug(Font.HS + "수정하기 전 신고글 정보 => " + report.toString() + Font.RESET);
		
		int check = reportService.modifyReport(report);
		// 수정되지 않았을 경우 다시 수정 실패 알림
		if(check != 1) {
			log.debug(Font.HS + "수정 실패!" + Font.RESET);
			return "redirect:/reportList";
		}
		
		return "redirect:/reportList";
	}
}
