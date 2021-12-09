package com.btf.tap.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.btf.tap.common.Font;
import com.btf.tap.service.HostService;
import com.btf.tap.vo.Host;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HostController {
	
	@Autowired HostService hostService;
	
	@GetMapping("/addHost")
	public String getAddHost(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// 로그인 되있을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") != null) {
			return "redirect:/";
		}
		
		return "host/hostRegister";
	}
	
	@PostMapping("/addHost")
	public String postAddhost(Host host ) {
		
		// 입력 디버깅
		log.debug(Font.HW + "입력받은 호스트 회원가입 정보 => ", host.toString() + Font.RESET);
		
		
		// 회원가입 처리 후, 결과를 저장
		int confirm = hostService.addHost(host);
		
		// 회원가입이 안 되어었을 경우 다시 회원가입 실패 알림
		if(confirm == 0) {
			log.debug(Font.HW + "호스트 회원가입 실패 " + Font.RESET);
			return "redirect:/addHost";
		}
		
		// 출력 디버깅
		log.debug(Font.HW + "호스트 회원가입 성공 " + Font.RESET);
		
		// 홈페이지로 이동
		return "redirect:/";
		
	}
}
