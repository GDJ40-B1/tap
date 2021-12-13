package com.btf.tap.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.btf.tap.common.Font;
import com.btf.tap.service.HostService;
import com.btf.tap.vo.Host;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HostController {
	
	@Autowired HostService hostService;
	
	@GetMapping("/modifyHostPw")
	public String getModifyHostPw(HttpServletRequest request, Model model) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 세션에서 로그인 유저 객체 받기 
		User user = (User) session.getAttribute("loginUser");
		
		// 유저 객체속 아이디를 호스트 객체에 넣어 조회하기
		Host host = new Host();
		host.setHostId(user.getUserId());
		host = hostService.getHostOne(host);
		
		// 호스트 정보 주입
		model.addAttribute("host", host);
		
		// 호스트 비밀번호 변경 페이지로 이동
		return "host/modifyHostPw";
	}
	
	
	
	@PostMapping("/modifyHostPw")
	public String postModifyHostPw(HttpServletRequest request, Host host, Model model, String hostNewPw) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 비밀번호 입력 디버깅
		log.debug(Font.HW + "입력받은 비밀번호 일치여부 확인 정보 => " + host.toString() + Font.RESET);
		
		int confirm = hostService.selectHostPw(host);
		
		// 비밀번호 불일치시 다시 입력받도록 리다이렉트
		if (confirm==0) {
			log.debug(Font.HW + "입력받은 비밀번호 불일치 => " +  host.toString() + Font.RESET);
			return "redirect:/modifyHostPw";
		}
		
		// 새로운 비밀번호 입력 디버깅
		log.debug(Font.HW + "입력받은 새로운 비밀번호 변경 정보 => " + hostNewPw + Font.RESET);
		
		// 새로운 비밀번호 세팅
		host.setHostPw(hostNewPw);
		
		// 비밀번호 변경
		host = hostService.modifyHostPw(host);
		
		// 호스트 정보 주입
		model.addAttribute("host", host);
		
		// 마이페이지로 이동
		return "host/hostMyPage";
	}
	
	@GetMapping("/modifyHostInfo")
	public String getModifyHostInfo(HttpServletRequest request, Model model) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 세션에서 로그인 유저 객체 받기 
		User user = (User) session.getAttribute("loginUser");
		
		// 유저 객체속 아이디를 호스트 객체에 넣어 조회하기
		Host host = new Host();
		host.setHostId(user.getUserId());
		host = hostService.getHostOne(host);
		
		// 호스트 정보 주입
		model.addAttribute("host", host);
		
		// 호스트 호스트정보 변경 페이지로 이동
		return "host/modifyHostInfo";
	}
	
	
	
	@PostMapping("/modifyHostInfo")
	public String postModifyHostInfo(HttpServletRequest request, Host host, Model model) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 입력 디버깅
		log.debug(Font.HW + "입력받은 호스트변경 정보 => ", host.toString() + Font.RESET);
		
		// 호스트정보 변경
		host = hostService.modifyHostInfo(host);
		
		// 호스트 정보 주입
		model.addAttribute("host", host);
		
		// 호스트 마이페이지로 이동
		return "host/hostMyPage";
	}
	
	@GetMapping("/hostMyPage")
	public String getMyPage(HttpServletRequest request, Model model) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 세션에서 로그인 유저 객체 받기 
		User user = (User) session.getAttribute("loginUser");
		
		// 유저 객체속 아이디를 호스트 객체에 넣어 조회하기
		Host host = new Host();
		host.setHostId(user.getUserId());
		host = hostService.getHostOne(host);
		
		// 호스트 정보 주입
		model.addAttribute("host", host);
		
		// 마이페이지로 이동
		return "host/hostMyPage";
	}
	
	@GetMapping("/addHost")
	public String getAddHost(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// 로그인 되있을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") != null) {
			return "redirect:/";
		}
		
		// 호스트 호스트가입 페이지로 이동
		return "host/hostRegister";
	}
	
	@PostMapping("/addHost")
	public String postAddhost(Host host ) {
		
		// 입력 디버깅
		log.debug(Font.HW + "입력받은 호스트 호스트가입 정보 => ", host.toString() + Font.RESET);
		
		
		// 호스트가입 처리 후, 결과를 저장
		int confirm = hostService.addHost(host);
		
		// 호스트가입이 안 되어었을 경우 다시 호스트가입 실패 알림
		if(confirm == 0) {
			log.debug(Font.HW + "호스트 호스트가입 실패 " + Font.RESET);
			return "redirect:/addHost";
		}
		
		// 출력 디버깅
		log.debug(Font.HW + "호스트 호스트가입 성공 " + Font.RESET);
		
		// 홈페이지로 이동
		return "redirect:/";
		
	}
	
	@GetMapping("/removeHost")
	public String getRemoveHost(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// 로그인 되어있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 호스트탈퇴 페이지로 이동
		return "host/hostWithdraw";
		
	}
	
	@PostMapping("/removeHost")
	public String postRemoveHost(Host host) {
		
		// 입력 디버깅
		log.debug(Font.HW + "입력받은 호스트탈퇴 정보 => ", host.toString() + Font.RESET);
		
		// 호스트탈퇴 처리 후, 결과를 저장
		int confirm = hostService.removeHost(host);
		
		// 호스트탈퇴가 안 되어었을 경우 다시 호스트가입 실패 알림
		if(confirm == 0) {
			log.debug(Font.HW + "호스트가입 실패 " + Font.RESET);
			return "redirect:/removeHost";
		}
		
		// 출력 디버깅
		log.debug(Font.HW + "호스트가입 성공 " + Font.RESET);
		
		// 로그아웃 시킴
		return "redirect:/logout";	
		
	}
}
