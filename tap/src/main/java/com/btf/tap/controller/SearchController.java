package com.btf.tap.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.btf.tap.service.SearchService;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SearchController {
	@Autowired private SearchService searchService;
	
	@GetMapping("/searchList")
	public String getSearchList(Model model, HttpServletRequest request, String keyword) {
		Map<String, Object> map = searchService.getSearchList(keyword);
		log.debug(map.toString());

		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			searchService.addSearchHistory(loginUser, keyword);
		}
		
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("roomList", map.get("roomList"));
		model.addAttribute("attractionList", map.get("attractionList"));
		model.addAttribute("resultList", map.get("resultList"));
		
		return "search/searchList";
	}
}
