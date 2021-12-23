package com.btf.tap.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.btf.tap.common.Font;
import com.btf.tap.service.AttractionService;
import com.btf.tap.service.MemberService;
import com.btf.tap.service.RoomService;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Autowired MemberService memberService;
	@Autowired RoomService roomService;
	@Autowired AttractionService attractionService;
	
	// index 페이지를 홈페이지로 매핑
	@GetMapping("/")
	public String getIndex(Model model, HttpSession session, @RequestParam(name="preferRoomCurrent", defaultValue = "1") int preferRoomCurrent,
															 @RequestParam(name="preferAttractionCurrent", defaultValue = "1") int preferAttractionCurrent) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(loginUser != null && loginUser.getUserLevel().equals("member")) {
			Map<String, Object> localMap = memberService.getPreferLocal(loginUser);
			log.debug(Font.JSB + "설정된 선호지역 => " + localMap.toString()  + Font.RESET);
			String sido = (String)localMap.get("sido");
			String sigungu = (String)localMap.get("sigungu");
			
			// 설정 선호지역 이달의 추천 숙소 리스트
			Map<String, Object> preferRoomMap = roomService.getPreferLocalRoomList(preferRoomCurrent, sido, sigungu);
			preferRoomMap.put("preferRoomCurrent", preferRoomCurrent);
			
			// 설정 선호지역 이달의 추천 명소 리스트
			Map<String, Object> preferAttractionMap = attractionService.getPreferLocalAttractionList(preferAttractionCurrent, sido, sigungu);
			preferAttractionMap.put("preferAttractionCurrent", preferAttractionCurrent);
			
			model.addAttribute("sigungu", sigungu);
			model.addAttribute("preferRoomMap", preferRoomMap);
			model.addAttribute("preferAttractionMap", preferAttractionMap);
		}
		

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
