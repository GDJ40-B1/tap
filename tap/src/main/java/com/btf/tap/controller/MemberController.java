package com.btf.tap.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.btf.tap.common.Font;
import com.btf.tap.service.MemberService;
import com.btf.tap.vo.Member;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	@Autowired MemberService memberService;
	
	@GetMapping("/modifyMemberInfo")
	public String getModifyMemberInfo(HttpServletRequest request, Model model) {
	
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
		
		// 마이페이지로 이동
		return "member/modifyMemberInfo";
	}
	
	
	
	@PostMapping("/modifyMemberInfo")
	public String postModifyMemberInfo(HttpServletRequest request, Member member, Model model) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 입력 디버깅
		log.debug(Font.HW + "입력받은 회원변경 정보 => ", member.toString() + Font.RESET);
		
		// 회원정보 변경
		member = memberService.modifyMemberInfo(member);
		
		// 회원 정보 주입
		model.addAttribute("member", member);
		
		// 마이페이지로 이동
		return "member/myPage";
	}
	
	@GetMapping("/myPage")
	public String getMyPage(HttpServletRequest request, Model model) {
	
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
		
		// 마이페이지로 이동
		return "member/myPage";
	}
	
	@GetMapping("/addMember")
	public String getAddMember(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// 로그인 되있을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") != null) {
			return "redirect:/";
		}
		
		return "member/register";
	}
	
	@GetMapping("/removeMember")
	public String getRemoveMember(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// 로그인 되어있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		return "member/withdraw";
		
	}
	
	@PostMapping("/removeMember")
	public String postRemoveMember(Member member) {
		
		// 입력 디버깅
		log.debug(Font.HW + "입력받은 회원탈퇴 정보 => ", member.toString() + Font.RESET);
		
		// 회원탈퇴 처리 후, 결과를 저장
		int confirm = memberService.removeMember(member);
		
		// 회원탈퇴가 안 되어었을 경우 다시 회원가입 실패 알림
		if(confirm == 0) {
			log.debug(Font.HW + "회원가입 실패 " + Font.RESET);
			return "redirect:/removeMember";
		}
		
		// 출력 디버깅
		log.debug(Font.HW + "회원가입 성공 " + Font.RESET);
		
		// 로그아웃 시킴
		return "redirect:/logout";	
		
	}
	
	
	@PostMapping("/addMember")
	public String postAddMember(Member member ) {
		
		// 입력 디버깅
		log.debug(Font.HW + "입력받은 회원가입 정보 => ", member.toString() + Font.RESET);
		
		
		// 회원가입 처리 후, 결과를 저장
		int confirm = memberService.addMember(member);
		
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
}
