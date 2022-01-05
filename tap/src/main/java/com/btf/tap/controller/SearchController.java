package com.btf.tap.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

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
	private final int rowPerPage = 4;
	
	// 전체 검색 결과
	@RequestMapping("/searchList")
	public String requestSearchList(Model model, HttpSession session, @RequestParam(name="roomCurrentPage", defaultValue="1") int roomCurrentPage, 
																	  @RequestParam(name="attractionCurrentPage", defaultValue="1") int attractionCurrentPage, 
																	  @RequestParam(name="hashtagRoomCurrentPage", defaultValue = "1") int hashtagRoomCurrentPage,
																	  @RequestParam(name="hashtagAttractionCurrentPage", defaultValue = "1") int hashtagAttractionCurrentPage, String keyword){
		// 숙소 검색 결과
		Map<String, Object> roomMap = searchService.getRoomSearchList(roomCurrentPage, rowPerPage, keyword);
		log.debug(Font.JSB + roomMap.toString() + Font.RESET);

		// 명소 검색 결과
		Map<String, Object> attractionMap = searchService.getAttractionSearchList(attractionCurrentPage, rowPerPage, keyword);
		log.debug(Font.JSB + attractionMap.toString() + Font.RESET);
		
		// 해시태그 숙소 검색 결과
		Map<String, Object> hashtagRoomMap = searchService.getHashtagRoomSearchList(hashtagRoomCurrentPage, rowPerPage, keyword);
		log.debug(Font.JSB + hashtagRoomMap.toString() + Font.RESET);
		
		// 해시태그 명소 검색 결과
		Map<String, Object> hashtagAttractionMap = searchService.getHashtagAttractionSearchList(hashtagAttractionCurrentPage, rowPerPage, keyword);		
		log.debug(Font.JSB + hashtagAttractionMap.toString() + Font.RESET);
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		// 회원의 경우 검색어 기록 저장
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
	public String requestSearchListByDistrict(Model model, HttpSession session, @RequestParam(name="roomCurrentPage", defaultValue="1") int roomCurrentPage, 
																					   @RequestParam(name="attractionCurrentPage", defaultValue="1") int attractionCurrentPage, 
																					   @RequestParam(name="hashtagRoomCurrentPage", defaultValue = "1") int hashtagRoomCurrentPage,
																					   @RequestParam(name="hashtagAttractionCurrentPage", defaultValue = "1") int hashtagAttractionCurrentPage,
																					   String districtSido, String districtSigungu, String districtKeyword) {
		
		// 지역별 숙소 검색 결과
		Map<String, Object> roomMap = searchService.getRoomDistrictSearchList(districtSido, districtSigungu, roomCurrentPage, rowPerPage, districtKeyword);
		log.debug(Font.JSB + roomMap.toString() + Font.RESET);

		// 지역별 명소 검색 결과
		Map<String, Object> attractionMap = searchService.getAttractionDistrictSearchList(districtSido, districtSigungu, attractionCurrentPage, rowPerPage, districtKeyword);
		log.debug(Font.JSB + attractionMap.toString() + Font.RESET);
		
		// 지역별 해시태그 숙소 검색 결과
		Map<String, Object> hashtagRoomMap = searchService.getHashtagRoomDistrictSearchList(districtSido, districtSigungu, hashtagRoomCurrentPage, rowPerPage, districtKeyword);
		log.debug(Font.JSB + hashtagRoomMap.toString() + Font.RESET);
		
		// 지역별 해시태그 명소 검색 결과 
		Map<String, Object> hashtagAttractionMap = searchService.getHashtagAttractionDistrictSearchList(districtSido, districtSigungu, hashtagAttractionCurrentPage, rowPerPage, districtKeyword);
		log.debug(Font.JSB + hashtagAttractionMap.toString() + Font.RESET);
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		// 회원의 경우 검색어 기록 저장
		if(loginUser != null && loginUser.getUserLevel().equals("member")) {
			searchService.addSearchHistory(loginUser, districtKeyword);
		}
		
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
		String sido = (String)paramMap.get("districtSido");
		
		// 넘어온 시도명으로 하위 시군구 조회 후 json 반환
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
	
	// 이전 검색어 삭제
	@RequestMapping("/removeSearchHistory")
	@ResponseBody
	public void RequestRemoveSearchHistory(HttpSession session , @RequestParam Map<String, Object> paramMap) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		paramMap.put("userId", loginUser.getUserId());
		log.debug(paramMap.toString());
		
		searchService.removeSearchHistory(paramMap);
	}
}
