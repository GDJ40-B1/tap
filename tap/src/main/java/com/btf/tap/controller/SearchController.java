package com.btf.tap.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.btf.tap.common.Font;
import com.btf.tap.service.SearchService;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SearchController {
	@Autowired private SearchService searchService;
	private final int rowPerPage = 5;
	
	@RequestMapping("/searchList")
	public String requestSearchList(Model model, HttpServletRequest request, @RequestParam(name="roomCurrentPage", defaultValue="1") int roomCurrentPage, 
																			 @RequestParam(name="attractionCurrentPage", defaultValue="1") int attractionCurrentPage, String keyword) {
		Map<String, Object> roomMap = searchService.getRoomSearchList(roomCurrentPage, rowPerPage, keyword);
		log.debug(Font.JSB + roomMap.toString() + Font.RESET);

		Map<String, Object> attractionMap = searchService.getAttractionSearchList(attractionCurrentPage, rowPerPage, keyword);
		log.debug(Font.JSB + attractionMap.toString() + Font.RESET);
		
		Map<String, Object> hashtagMap = searchService.getHashtagSearchList(keyword);
		log.debug(Font.JSB + hashtagMap.toString() + Font.RESET);
		
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			searchService.addSearchHistory(loginUser, keyword);
		}
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("roomList", roomMap.get("roomList"));
		model.addAttribute("roomCurrentPage", roomCurrentPage);
		model.addAttribute("roomStartPage", roomMap.get("roomStartPage"));
		model.addAttribute("roomEndPage", roomMap.get("roomEndPage"));
		model.addAttribute("attractionList", attractionMap.get("attractionList"));
		model.addAttribute("attractionCurrentPage", attractionCurrentPage);
		model.addAttribute("attractionStartPage", attractionMap.get("attractionStartPage"));
		model.addAttribute("attractionEndPage", attractionMap.get("attractionEndPage"));
		model.addAttribute("hashtagAttractionList", hashtagMap.get("hashtagAttractionList"));
		model.addAttribute("hashtagRoomList", hashtagMap.get("hashtagRoomList"));
		
		return "search/searchList";
	}
}
