package com.btf.tap.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.btf.tap.common.Font;
import com.btf.tap.service.NoticeService;
import com.btf.tap.service.QuestionService;
import com.btf.tap.service.SystemAdminService;
import com.btf.tap.vo.Notice;
import com.btf.tap.vo.QuestionAnswer;
import com.btf.tap.vo.SystemAdmin;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SystemAdminController {
	@Autowired SystemAdminService systemAdminService;
	@Autowired private QuestionService questionService;
	@Autowired private NoticeService noticeService;
	
	// 시스템관리자 세션을 통한 myPage 구현
	@GetMapping("/systemAdminMyPage")
	public String getSystemAdminMyPage(HttpServletRequest request, Model model, @RequestParam(name="year", defaultValue = "0") int year) {
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
		
		List<Integer> yearList = systemAdminService.getYearList();
		
		if(year == 0 && !yearList.isEmpty()) {
			year = yearList.get(0);
		}
		
		// 연도별 월간 / 연간 사이트 매출 차트 데이터 리스트
		// 총합 이용자 수 및 수익, 미답변 문의 수
		// 사이트 현재 수수료 조회
		List<Map<String, Object>> revenueList = systemAdminService.getRevenueYearList(year);
		List<Map<String, Object>> revenueYearList = systemAdminService.getRevenueYear();
		Map<String, Object> revenueAndUser = systemAdminService.getRevenueAndUser();
		int unansweredQuestionCount = questionService.getUnansweredQnaCount();
		int feeRate = systemAdminService.getFeeRate();
		
		model.addAttribute("year", year);
		model.addAttribute("yearList", yearList);
		model.addAttribute("systemAdmin", systemAdmin);
		model.addAttribute("revenueList", revenueList);
		model.addAttribute("revenueYearList", revenueYearList);
		model.addAttribute("revenueAndUser", revenueAndUser);
		model.addAttribute("unansweredQuestionCount", unansweredQuestionCount);
		model.addAttribute("feeRate", feeRate);
		
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
		
		String systemAdminId = user.getUserId();
		log.debug(Font.HS + "시스템관리자 ID값 => " + systemAdminId + Font.RESET);
		
		// 시스템관리자 정보 주입
		model.addAttribute("systemAdminId", systemAdminId);
		
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
		
		return "redirect:/logout";
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
	
	// 시스템 관리자 탈퇴내역 조회
	@GetMapping("/systemAdmin/withdrawalList")
	public String getWithdrawalList(Model model) {
		List<Map<String, Object>> list = systemAdminService.getWithdrawalList();
		log.debug(Font.HS + "탈퇴내역 조회" + list.toString() + Font.RESET);
		
		model.addAttribute("list", list);
		
		return "systemAdmin/withdrawalList";
	}
	
	// 특정 탈퇴내역 제거
	@GetMapping("/systemAdmin/removeWithdrawal")
	public String getRemoveWithdrawal(String userId) {
		systemAdminService.removeWithdrawalList(userId);
		
		return "redirect:/systemAdmin/withdrawalList";
	}
	
	// 사이트 이용자 기간별 포인트 내역 조회
	@GetMapping("/systemAdmin/pointHistoryList")
	public String getPointHistoryList(Model model, String minDay, String maxDay) {
		
		if(minDay == null && maxDay == null) {
			minDay = "2000-01-01";
			
			LocalDate now = LocalDate.now();
			DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			maxDay = now.format(dateTimeFormatter);
		}
		
		List<Map<String, Object>> historyList = systemAdminService.getPointHistoryList(minDay, maxDay);
		log.debug(Font.HS + historyList.toString() + Font.RESET);
		
		model.addAttribute("minDay", minDay);
		model.addAttribute("maxDay", maxDay);
		model.addAttribute("historyList", historyList);
		return "systemAdmin/pointHistoryList";
	}
	
	// 문의 미답변 리스트
	@GetMapping("/systemAdmin/unansweredQuestionList")
	public String getUnansweredQuestionList(Model model, @RequestParam(name="currentPage", defaultValue = "1") int currentPage, 
														 @RequestParam(required = false) String writerCategory) {
		// 문의 미답변
		Map<String, Object> questionList = questionService.getUnansweredQuestionList(currentPage, writerCategory);
		log.debug(Font.JSB + questionList.toString() + Font.RESET);
		
		model.addAttribute("questionList", questionList);
		
		return "/systemAdmin/unansweredQuestionList";
	}
	
	// 문의 답변 작성
	@PostMapping("/unansweredQuestionList")
	public String getAddQuestionAnswer(QuestionAnswer questionAnswer) {
		questionService.addQuestionAnswer(questionAnswer);
		
		return "redirect:/systemAdmin/unansweredQuestionList";
	}
	
	// 사이트 수수료 변경
	@GetMapping("/systemAdmin/modifyFeeRate")
	public String getModifyFeeRate(@RequestParam(name="feeRate", defaultValue = "0") int feeRate) {
		systemAdminService.modifyFeeRate(feeRate);
		
		return "redirect:/systemAdminMyPage";
	}
	
	// *** 공지사항 관련 ***
	// 공지사항 게시글 조회
	@GetMapping("/systemAdmin/noticeList")
	public String getNoticeList(HttpSession session, Model model, @RequestParam(value="currentPage", defaultValue= "1") int currentPage) {
		// 로그인한 정보 loginUser 객체에 담기
		User loginUser = (User)session.getAttribute("loginUser");
		
		Map<String,Object> noticeList = noticeService.getNoticeList(currentPage);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("lastPage", noticeList.get("lastPage"));
		model.addAttribute("startPage", noticeList.get("startPage"));
		model.addAttribute("endPage", noticeList.get("endPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalNoticeCount", noticeList.get("totalNoticeCount"));
		
		return "systemAdmin/noticeList";
	}
	
	// 공지사항 게시글 추가하기
	@GetMapping("/systemAdmin/addNotice")
	public String getAddNotice(HttpSession session, Model model) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		model.addAttribute("systemAdminId", loginUser.getUserId());
		
		return "systemAdmin/addNotice";
	}
	@PostMapping("/systemAdmin/addNotice")
	public String postAddNotice(Notice notice) {
		log.debug(Font.HS + "notice 객체 입력받은 값 => " + notice.toString() + Font.RESET);
			
		noticeService.addNotice(notice);
		
		return "redirect:/systemAdmin/noticeList";
	}
	
	// 공지사항 게시글 수정하기
	@PostMapping("/systemAdmin/modifyNotice")
	public String postModifyNotice(Notice notice) {
		log.debug(Font.HS + "notice 객체 입력받은 값 => " + notice.toString() + Font.RESET);
		
		noticeService.modifyNotice(notice);
		
		return "redirect:/systemAdmin/noticeList";
	}
	
	// 공지사항 게시글 삭제하기
	@GetMapping("/systemAdmin/removeNotice")
	public String getRemoveNotice(Model model, int noticeId) {
		log.debug(Font.HS + "noticeId 입력받은 값 => " + noticeId + Font.RESET);
		
		// deleteNotice()메소드의 notice 객체 생성
		Notice notice = new Notice();
		notice.setNoticeId(noticeId);
		
		noticeService.deleteNotice(notice);
		
		return "redirect:/systemAdmin/noticeList";	
	}
	
	// 연도 선택시 사이트 월별 매출 통계값 조회
	@RequestMapping("/adminRevenueList")
	@ResponseBody
	public void requestAdminRevenueList(HttpServletResponse res, @RequestParam Map<String, String> paramMap) throws IOException {
		res.setContentType("text/html;charset=UTF-8");
		int year = Integer.parseInt(paramMap.get("year"));
		
		List<Map<String, Object>> revenueList = systemAdminService.getRevenueYearList(year);

		JSONArray jsonArray = new JSONArray();
		
		for(int i = 0; i < revenueList.size(); i++) {
			jsonArray.put(revenueList.get(i));
		}
		PrintWriter pw = res.getWriter();
		pw.print(jsonArray.toString());
		pw.flush();
		pw.close();
	}
}
