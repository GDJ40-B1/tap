package com.btf.tap.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.btf.tap.common.Font;
import com.btf.tap.service.UserService;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserController {
	
	@Autowired UserService userService;
	
	// 로그인 페이지로 이동
	@GetMapping("login")
	public String GetLogin(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// 로그인 되있을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") != null) {
			log.debug(Font.HW + "이미 로그인한 유저 => index 페이지로 이동" + Font.RESET);
			
			return "redirect:/index";
		}
		
		return "user/login";
	}
	
	// 로그아웃 후 index 페이지로 이동
	@GetMapping("logout")
	public String GetLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:";
	}
	
	
	// 로그인 성공 후, index 페이지(홈페이지)로 이동
	@PostMapping("login")
	public String PostLogin(HttpServletRequest request ,User user) {
		
		HttpSession session = request.getSession();
		
		// 입력 디버깅
		log.debug(Font.HW + "입력받은 로그인 정보 => ", user.toString() + Font.RESET);
		
		// 로그인 되있을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") != null) {
			return "redirect:";
		}
		
		// 로그인 로직 처리 후, 결과를 담음
		user = userService.login(user);
		
		// 로그인 실패시 로그인 페이지로 다시 이동
		if(user == null) {
			log.debug(Font.HW + "로그인 실패 " + Font.RESET);	
			return "redirect:login";
		}
		
		// 출력 디버깅
		log.debug(Font.HW + "로그인 유저 => " + user.toString() + Font.RESET);
		
		// 세션에 회원 정보 저장
		session.setAttribute("loginUser", user);
		
		return "redirect:";
	}
}

