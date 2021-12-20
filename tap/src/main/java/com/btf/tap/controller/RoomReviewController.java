package com.btf.tap.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.btf.tap.common.Font;
import com.btf.tap.service.RoomReviewService;
import com.btf.tap.vo.RoomReview;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RoomReviewController {
	@Autowired private RoomReviewService roomReviewService;
	
	private final int ROW_PER_PAGE = 5;
	
	// 해당숙소의 전체 후기 조회하기
	@RequestMapping("/roomReviewList")
	public String requestRoomReviewList(Model model, @RequestParam(name="currentPage", defaultValue="1") int currentPage) {
		Map<String,Object> map = roomReviewService.getRoomReviewList(currentPage, ROW_PER_PAGE);
		log.debug(Font.HS + "map 객체에 저장된 값 => " + map.toString() + Font.RESET);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("startPage", map.get("startPage"));
		model.addAttribute("endPage", map.get("endPage"));
		
		return "roomReview/roomReviewList";
	}
	
	// 숙소후기 작성하기
	@GetMapping("/addRoomReview")
	public String getAddRoomReview() {
		return "roomReview/addRoomReview";
	}
	@PostMapping("/addRoomReview")
	public String postAddRoomReview(RoomReview roomReview) {
		// 입력받은 roomReview 값
		log.debug(Font.HS + "입력받은 roomReview 값 => " + roomReview.toString() + Font.HS);
		
		roomReviewService.addRoomReview(roomReview);
		
		// 입력받고나서 roomReview 값
		log.debug(Font.HS + "입력받고나서 roomReview 값 => " + roomReview.toString() + Font.HS);
				
		return "redirect:/roomReviewList"; 
	}
	
	// 숙소후기 삭제하기
	@PostMapping("/removeRoomReview")
	public String postRemoveRoomReview(RoomReview roomReview) {
		// 입력받은 roomReview 값
		log.debug(Font.HS + "입력받은 roomReview 값 => " + roomReview.toString() + Font.HS);
		
		roomReviewService.removeRoomReview(roomReview);
		
		// 입력받고나서 roomReview 값
		log.debug(Font.HS + "입력받고나서 roomReview 값 => " + roomReview.toString() + Font.HS);
				
		return "redirect:/roomReviewList"; 
	}
}
