package com.btf.tap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	// index 페이지를 홈페이지로 매핑
	@GetMapping("/")
	public String getIndex() {
		return"/index";
	}
	
	// 무시(지우지는 말 것)
	/*
	@GetMapping("/mainHeader")
	public String getMainHeader() {
		return"/partial/mainHeader";
	}
	@GetMapping("/mainFooter")
	public String getMainFooter() {
		return"/partial/mainFooter";
	}
	*/
}
