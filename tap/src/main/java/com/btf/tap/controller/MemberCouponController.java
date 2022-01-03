package com.btf.tap.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.btf.tap.service.MemberCouponService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberCouponController {
	@Autowired MemberCouponService memberCouponService;
	
	private static final int ROW_PER_PAGE=10;
	
	@GetMapping("/member/memberCouponList")
	public String memberCouponList(Model model,
			@RequestParam(defaultValue="1") int currentPage,
			@RequestParam(required = false) String memberId) {
		Map<String,Object> map = memberCouponService.getMemberCouponList(memberId, currentPage, ROW_PER_PAGE);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		return "member/memberCouponList";
		
	}
	
}
