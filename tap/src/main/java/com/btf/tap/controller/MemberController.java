package com.btf.tap.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.btf.tap.common.Font;
import com.btf.tap.service.MemberService;
import com.btf.tap.service.PointService;
import com.btf.tap.service.RoomReviewService;
import com.btf.tap.service.SearchService;
import com.btf.tap.vo.Member;
import com.btf.tap.vo.RoomReview;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	@Autowired MemberService memberService;
	@Autowired PointService pointService;
	@Autowired private SearchService searchService;
	@Autowired private RoomReviewService roomReviewService;
	
	@PostMapping("/earnPoint")
	public String postEarnPoint(HttpServletRequest request, Member member) {
		
		HttpSession session = request.getSession();
		
		// 세션의 이용자(유저) 객체 가져오기
		User user = (User) session.getAttribute("loginUser");
		
		// 로그인 되있지 않을 경우, 홈페이지로 이동
		if(user == null) {
			return "redirect:/";
		}
		// 포인트 증가 입력 디버깅
		log.debug(Font.HW + "입력받은 포인트 증가 정보 => " + member.toString() + Font.RESET);
		
		// 포인트 증가 로직 실행
		int confirm = memberService.earnMemberPoint(member);
		
		// 포인트 증가가 안 되었을 시, 다시 시도하도록 redirect
		if (confirm==0) {
			log.debug(Font.HW + "포인트 증가 실패 => " +  member.toString() + Font.RESET);
			return "redirect:/pointInfo";
		}
		
		// 포인트 증가된 회원 정보 가져오기
		member = memberService.getMemberOne(member);
		
		// 포인트 증가 로직 처리 결과 디버깅
		log.debug(Font.HW + "포인트 증가된 회원 정보 => " + member.toString() + Font.RESET);
		
		// 세션에 저장된 이용자 객체를 변경된 정보로 최신화
		user.setUserPoint(member.getMemberPoint());
		session.setAttribute("loginUser", user);
		
		// 포인트 정보 페이지로 이동
		return "redirect:/pointInfo";
	}
	
	@PostMapping("/spendPoint")
	public String postSpendPoint(HttpServletRequest request, Member member) {
	
		HttpSession session = request.getSession();
		
		// 세션의 이용자(유저) 객체 가져오기
		User user = (User) session.getAttribute("loginUser");
		
		// 로그인 되있지 않을 경우, 홈페이지로 이동
		if(user == null) {
			return "redirect:/";
		}
		
		// 포인트 증가 입력 디버깅
		log.debug(Font.HW + "입력받은 포인트 감소 정보 => " + member.toString() + Font.RESET);
		
		// 포인트 감소 로직 실행
		int confirm = memberService.spendMemberPoint(member);
		
		// 포인트 감소가 안 되었을 시, 다시 시도하도록 redirect
		if (confirm==0) {
			log.debug(Font.HW + "포인트 감소 실패 => " +  member.toString() + Font.RESET);
			return "redirect:/pointInfo";
		}
		
		// 포인트 감소된 회원 정보 가져오기
		member = memberService.getMemberOne(member);
		
		// 포인트 증가 로직 처리 결과 디버깅
		log.debug(Font.HW + "포인트 감소된 회원 정보 => " + member.toString() + Font.RESET);
		
		// 세션에 저장된 이용자 객체를 변경된 정보로 최신화
		user.setUserPoint(member.getMemberPoint());
		session.setAttribute("loginUser", user);
		
		// 포인트 정보 페이지로 이동
		return "redirect:/pointInfo";
	}
	
	@GetMapping("/pointInfo")
	public String getPointInfo(HttpServletRequest request, Model model) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 세션에서 로그인 유저 객체 받기 
		User user = (User) session.getAttribute("loginUser");
		
		// 유저 객체속 아이디를 회원 객체에 넣어 조회하기
		Member member = new Member();
		member.setMemberId(user.getUserId());
		member = memberService.getMemberOne(member);
		
		// 회원 정보 주입
		model.addAttribute("member", member);
		
		// 포인트 정보 페이지로 이동
		return "member/pointInfo";
	}
	
	
	@GetMapping("/modifyMemberPw")
	public String getModifyMemberPw(HttpServletRequest request, Model model) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 세션에서 로그인 유저 객체 받기 
		User user = (User) session.getAttribute("loginUser");
		
		// 유저 객체속 아이디를 회원 객체에 넣어 조회하기
		Member member = new Member();
		member.setMemberId(user.getUserId());
		member = memberService.getMemberOne(member);
		
		// 회원 정보 주입
		model.addAttribute("member", member);
		
		// 비밀번호 변경 페이지로 이동
		return "member/modifyMemberPw";
	}
	
	
	
	@PostMapping("/modifyMemberPw")
	public String postModifyMemberPw(HttpServletRequest request, Member member, Model model, String memberNewPw) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 비밀번호 입력 디버깅
		log.debug(Font.HW + "입력받은 비밀번호 일치여부 확인 정보 => " + member.toString() + Font.RESET);
		
		int confirm = memberService.checkMemberPw(member);
		
		// 비밀번호 불일치시 다시 입력받도록 리다이렉트
		if (confirm==0) {
			log.debug(Font.HW + "입력받은 비밀번호 불일치 => " +  member.toString() + Font.RESET);
			return "redirect:/modifyMemberPw";
		}
		
		// 새로운 비밀번호 입력 디버깅
		log.debug(Font.HW + "입력받은 새로운 비밀번호 변경 정보 => " + memberNewPw + Font.RESET);
		
		// 새로운 비밀번호 세팅
		member.setMemberPw(memberNewPw);
		
		// 비밀번호 변경
		member = memberService.modifyMemberPw(member);
		
		// 회원 정보 주입
		model.addAttribute("member", member);
		
		// 로그아웃
		return "redirect:/logout";
	}
	
	@GetMapping("/modifyMemberInfo")
	public String getModifyMemberInfo(HttpSession session, Model model) {
			
		// 로그인 되있있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 세션에서 로그인 유저 객체 받기 
		User user = (User) session.getAttribute("loginUser");
		
		// 유저 객체속 아이디를 회원 객체에 넣어 조회하기
		Member member = new Member();
		member.setMemberId(user.getUserId());
		member = memberService.getMemberOne(member);
		
		Map<String, Object> localMap = memberService.getPreferLocal(user);
		log.debug(Font.JSB + "설정된 선호지역 => " + localMap.toString()  + Font.RESET);
		
		List<String> sidoList = searchService.getSidoList();
		
		// 회원 정보 주입
		model.addAttribute("member", member);
		model.addAttribute("localMap", localMap);
		model.addAttribute("sidoList", sidoList);
		
		// 회원정보 변경 페이지로 이동
		return "member/modifyMemberInfo";
	}
	
	
	
	@PostMapping("/modifyMemberInfo")
	public String postModifyMemberInfo(HttpServletRequest request, Member member, String sido, String sigungu, Model model) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 입력 디버깅
		log.debug(Font.HW + "입력받은 회원변경 정보 => ", member.toString() + Font.RESET);
		
		// 회원정보 변경
		member = memberService.modifyMemberInfo(member, sido, sigungu);
		
		// 회원 정보 주입
		model.addAttribute("member", member);
		
		// 마이페이지로 이동
		return "member/myPage";
	}
	
	@GetMapping("/myPage")
	public String getMyPage(HttpServletRequest request, Model model, @RequestParam(value="favCurrentPage", defaultValue ="1") int favCurrentPage,
																	 @RequestParam(name="year", defaultValue = "0") int year) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 세션에서 로그인 유저 객체 받기 
		User user = (User) session.getAttribute("loginUser");
		String memberId = user.getUserId();
		
		// 유저 객체속 아이디를 회원 객체에 넣어 조회하기
		Member member = new Member();
		member.setMemberId(user.getUserId());
		member = memberService.getMemberOne(member);
		
		// 즐겨찾기 리스트 및 페이징
		Map<String, Object> favMap = memberService.getFavoritesList(favCurrentPage, user.getUserId());
		
		if(year == 0) {
			LocalDate now = LocalDate.now();
			year = now.getYear();
		}
		
		// 회원 사이트 연도별 결제 총액, 총 횟수, 숙소별 결제 금액, 보유 쿠폰 수
		List<Map<String, Object>> totalPaymentList = memberService.getTotalPaymentList(memberId, year);
		int totalPaymentCount = memberService.getTotalPaymentCount(memberId);
		List<Map<String, Object>> roomTotalPayment = memberService.getRoomTotalPayment(memberId, year);
		int couponCount = memberService.getCouponCount(memberId);
		
		// 회원 정보 주입
		model.addAttribute("member", member);

		model.addAttribute("favMap", favMap);
		model.addAttribute("year", year);
		model.addAttribute("totalPaymentList", totalPaymentList);
		model.addAttribute("totalPaymentCount", totalPaymentCount);
		model.addAttribute("roomTotalPayment", roomTotalPayment);
		model.addAttribute("couponCount", couponCount);
		
		// 마이페이지로 이동
		return "member/myPage";
	}
	
	@GetMapping("/addMember")
	public String getAddMember(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		// 로그인 되있을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") != null) {
			return "redirect:/";
		}
		
		List<String> sidoList = searchService.getSidoList();
		model.addAttribute("sidoList", sidoList);
		
		// 회원가입 페이지로 이동
		return "member/register";
	}
	
	@GetMapping("/removeMember")
	public String getRemoveMember(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// 로그인 되어있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 회원탈퇴 페이지로 이동
		return "member/withdraw";
		
	}
	
	@PostMapping("/removeMember")
	public String postRemoveMember(Member member) {
		
		// 입력 디버깅
		log.debug(Font.HW + "입력받은 회원탈퇴 정보 => ", member.toString() + Font.RESET);
		
		// 회원탈퇴 처리
		memberService.removeMember(member);
		
		// 로그아웃 시킴
		return "redirect:/logout";
		
	}
	
	
	@PostMapping("/addMember")
	public String postAddMember(Member member, String sido, String sigungu) {
		
		// 입력 디버깅
		log.debug(Font.HW + "입력받은 회원가입 정보 => ", member.toString() + Font.RESET);
		System.out.println(sigungu);
		
		// 회원가입 처리 후, 결과를 저장
		int confirm = memberService.addMember(member, sido, sigungu);
		
		// 회원가입이 안 되어었을 경우 다시 회원가입 실패 알림
		if(confirm == 0) {
			log.debug(Font.HW + "회원가입 실패 " + Font.RESET);
			return "redirect:/addMember";
		}
		
		// 출력 디버깅
		log.debug(Font.HW + "회원가입 성공 " + Font.RESET);
		
		// 홈페이지로 이동
		return "redirect:/";
		
	}
	
	private final int ROW_PER_PAGE = 10;
	
	// 회원 전체 목록 불러오기
	@RequestMapping("/systemAdmin/memberList")
	public String requestMemberList(Model model, @RequestParam(name="currentPage", defaultValue="1") int currentPage) {
		Map<String,Object> map = memberService.getMemberList(currentPage, ROW_PER_PAGE);
		log.debug(Font.HS + "전체 회원 목록 => " + map.toString() + Font.RESET);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("startPage", map.get("startPage"));
		model.addAttribute("endPage", map.get("endPage"));
		
		return "member/memberList";
	}
	
	// 특정 회원 즐겨찾기 등록
	@RequestMapping("/addFavorites")
	@ResponseBody
	public void requestAddFavorites(@RequestParam Map<String, Object> paramMap) {
		log.debug(paramMap.toString());
		
		memberService.addFavorites(paramMap);
	}
	
	// 특정 회원 즐겨찾기 삭제
	@RequestMapping("/removeFavorites")
	@ResponseBody
	public void requestRemoveFavorites(@RequestParam Map<String, Object> paramMap) {
		log.debug(paramMap.toString());
		
		memberService.removeFavorites(paramMap);
	}	
	
	// *** 특정 회원의 숙소 후기 관련 ***
	// 나의 숙소후기 목록보기
	@GetMapping("/member/memberRoomReviewList")
	public String getMemberRoomReviewList(HttpSession session, Model model, @RequestParam(value="currentPage", defaultValue = "1") int currentPage) {
		// 로그인한 정보 loginUser 객체에 담기
		User loginUser = (User)session.getAttribute("loginUser");
		
		String memberId = loginUser.getUserId();
		log.debug(Font.HS + "현재 회원 아이디 => " + memberId + Font.RESET);
		
		Map<String,Object> memberRoomReivew = roomReviewService.getMemberRoomReviewList(currentPage, memberId);
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("list", memberRoomReivew.get("list"));
		model.addAttribute("lastPage", memberRoomReivew.get("lastPage"));
		model.addAttribute("startPage", memberRoomReivew.get("startPage"));
		model.addAttribute("endPage", memberRoomReivew.get("endPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalCount", memberRoomReivew.get("totalCount"));
		
		return "member/myRoomReview";
	}
	
	// 나의 숙소후기에서 후기 삭제하기
	@PostMapping("/member/removeRoomReview")
	public String postRemoveRoomReview(HttpSession session, int roomReviewId) {
		// 로그인한 정보 loginUser 객체에 담기
		User loginUser = (User)session.getAttribute("loginUser");
		
		// 비회원이 숙소후기 글을 삭제시도할 경우
		if(loginUser == null) {
			return "redirect:/login";
		}
		
		roomReviewService.removeRoomReview(roomReviewId);
		
		return "redirect:/member/memberRoomReviewList";
	}
	
	// 특정회원 결제내역 조회
	@GetMapping("/member/getPayList")
	public String getPayList(HttpSession session, Model model, String minDay, String maxDay) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(minDay == null && maxDay == null) {
			minDay = "2000-01-01";
			
			LocalDate now = LocalDate.now();
			DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			maxDay = now.format(dateTimeFormatter);
		}
		
		List<Map<String, Object>> payList = memberService.getMemberPayList(loginUser.getUserId(), minDay, maxDay);
		
		model.addAttribute("minDay", minDay);
		model.addAttribute("maxDay", maxDay);
		model.addAttribute("payList", payList);
		
		return "member/myPayList";
	}
	
	// 특정회원 결제내역에서 숙소후기 작성하기
	@GetMapping("/member/addRoomReview")
	public String getAddRoomReview(HttpSession session, Model model, int paymentId, String roomName, String roomForm) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		log.debug(Font.HS + "paymentId, roomName, roomForm 값 => " + paymentId + "" + roomName + "" + roomForm + Font.RESET);
		
		model.addAttribute("paymentId", paymentId);
		model.addAttribute("roomName", roomName);
		model.addAttribute("roomForm", roomForm);
		
		return "member/addRoomReview";
	}
	@PostMapping("/member/addRoomReview")
	public String postAddRoomReivew(RoomReview roomReview) {
		// roomReview 객체 값
		log.debug(Font.HS + "roomReview 값 => " + roomReview.toString() + Font.RESET);
		
		roomReviewService.addRoomReview(roomReview);
		
		return "redirect:/member/getPayList";
	}
}