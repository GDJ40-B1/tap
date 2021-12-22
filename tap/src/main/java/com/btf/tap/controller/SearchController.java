package com.btf.tap.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.btf.tap.common.Font;
import com.btf.tap.service.SearchService;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SearchController {
	@Autowired private SearchService searchService;
	private final int rowPerPage = 5;
	
	// 전체 검색 결과
	@RequestMapping("/searchList")
	public String requestSearchList(Model model, HttpSession session, @RequestParam(name="roomCurrentPage", defaultValue="1") int roomCurrentPage, 
																			 @RequestParam(name="attractionCurrentPage", defaultValue="1") int attractionCurrentPage, 
																			 @RequestParam(name="hashtagRoomCurrentPage", defaultValue = "1") int hashtagRoomCurrentPage,
																			 @RequestParam(name="hashtagAttractionCurrentPage", defaultValue = "1") int hashtagAttractionCurrentPage, String keyword){
		
		Map<String, Object> roomMap = searchService.getRoomSearchList(roomCurrentPage, rowPerPage, keyword);
		log.debug(Font.JSB + roomMap.toString() + Font.RESET);

		Map<String, Object> attractionMap = searchService.getAttractionSearchList(attractionCurrentPage, rowPerPage, keyword);
		log.debug(Font.JSB + attractionMap.toString() + Font.RESET);
		
		Map<String, Object> hashtagRoomMap = searchService.getHashtagRoomSearchList(hashtagRoomCurrentPage, rowPerPage, keyword);
		log.debug(Font.JSB + hashtagRoomMap.toString() + Font.RESET);
		
		Map<String, Object> hashtagAttractionMap = searchService.getHashtagAttractionSearchList(hashtagAttractionCurrentPage, rowPerPage, keyword);		
		log.debug(Font.JSB + hashtagAttractionMap.toString() + Font.RESET);
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(loginUser != null && loginUser.getUserLevel().equals("member")) {
			searchService.addSearchHistory(loginUser, keyword);
		}
	
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("roomMap", roomMap);
		model.addAttribute("roomCurrentPage", roomCurrentPage);
		
		model.addAttribute("attractionMap", attractionMap);
		model.addAttribute("attractionCurrentPage", attractionCurrentPage);

		model.addAttribute("hashtagRoomMap", hashtagRoomMap);
		model.addAttribute("hashtagRoomCurrentPage", hashtagRoomCurrentPage);

		model.addAttribute("hashtagAttractionMap", hashtagAttractionMap);
		model.addAttribute("hashtagAttractionCurrentPage", hashtagAttractionCurrentPage);

		
		return "search/searchList";
	}
	
	// 지역별 검색 결과
	@RequestMapping("/searchListByDistrict")
	public String requestSearchListByDistrict(Model model, HttpServletRequest request, @RequestParam(name="roomCurrentPage", defaultValue="1") int roomCurrentPage, 
																					   @RequestParam(name="attractionCurrentPage", defaultValue="1") int attractionCurrentPage, 
																					   @RequestParam(name="hashtagRoomCurrentPage", defaultValue = "1") int hashtagRoomCurrentPage,
																					   @RequestParam(name="hashtagAttractionCurrentPage", defaultValue = "1") int hashtagAttractionCurrentPage,
																					   String sido, String sigungu, String keyword) {
		
		Map<String, Object> roomMap = searchService.getRoomDistrictSearchList(sido, sigungu, roomCurrentPage, rowPerPage, keyword);
		log.debug(Font.JSB + roomMap.toString() + Font.RESET);

		Map<String, Object> attractionMap = searchService.getAttractionDistrictSearchList(sido, sigungu, attractionCurrentPage, rowPerPage, keyword);
		log.debug(Font.JSB + attractionMap.toString() + Font.RESET);
		
		Map<String, Object> hashtagRoomMap = searchService.getHashtagRoomDistrictSearchList(sido, sigungu, hashtagRoomCurrentPage, rowPerPage, keyword);
		log.debug(Font.JSB + hashtagRoomMap.toString() + Font.RESET);
		
		Map<String, Object> hashtagAttractionMap = searchService.getHashtagAttractionDistrictSearchList(sido, sigungu, hashtagAttractionCurrentPage, rowPerPage, keyword);
		log.debug(Font.JSB + hashtagAttractionMap.toString() + Font.RESET);
		
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(loginUser != null && keyword != null) {
			searchService.addSearchHistory(loginUser, keyword);
		}
		
		// 임시 검색 테스트용 삭제 필요
		if(loginUser != null && loginUser.getUserLevel().equals("member")) {
			List<String> searchList = searchService.getSearchHistory(loginUser);
			log.debug(Font.JSB + searchList.toString() + Font.RESET);
			model.addAttribute("searchList", searchList);
		}
		List<String> sidoList = searchService.getSidoList();
		model.addAttribute("sidoList", sidoList);
		
		
		
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("roomMap", roomMap);
		model.addAttribute("roomCurrentPage", roomCurrentPage);

		model.addAttribute("attractionMap", attractionMap);
		model.addAttribute("attractionCurrentPage", attractionCurrentPage);

		model.addAttribute("hashtagRoomMap", hashtagRoomMap);
		model.addAttribute("hashtagRoomCurrentPage", hashtagRoomCurrentPage);

		model.addAttribute("hashtagAttractionMap", hashtagAttractionMap);
		model.addAttribute("hashtagAttractionCurrentPage", hashtagAttractionCurrentPage);
		
		return "search/searchListByDistrict";
	}
	
	// 시도 선택 시 해당 하위 행정구역 시군구 리스트 조회
	@RequestMapping("/sido")
	@ResponseBody
	public void requestSigunguList(HttpServletResponse res, @RequestParam Map<String, Object> paramMap) throws IOException {
		res.setContentType("text/html;charset=UTF-8");
		String sido = (String)paramMap.get("sido");
		
		List<String> sigunguList = searchService.getSigunguList(sido);

		JSONArray jsonArray = new JSONArray();
		
		for(int i = 0; i < sigunguList.size(); i++) {
			jsonArray.put(sigunguList.get(i));
		}
		PrintWriter pw = res.getWriter();
		pw.print(jsonArray.toString());
		pw.flush();
		pw.close();
	}
	
	// 이전 검색어 삭제 - 이동 필요
	@RequestMapping("/removeSearchHistory")
	@ResponseBody
	public void RequestRemoveSearchHistory(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) {
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		paramMap.put("userId", loginUser.getUserId());
		log.debug(paramMap.toString());
		
		searchService.removeSearchHistory(paramMap);
	}
}
