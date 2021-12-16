package com.btf.tap.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.btf.tap.service.HostService;
import com.btf.tap.service.RoomService;
import com.btf.tap.vo.Address;
import com.btf.tap.vo.Host;
import com.btf.tap.vo.Room;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RoomController {
	@Autowired RoomService roomService;
	@Autowired HostService hostService;
	
	@GetMapping("/roomList")
	public String roomList(Model model, @RequestParam(value="currentPage", defaultValue ="1") int currentPage) {
		// 숙소 리스트와 페이징 관련 데이터를 result에 담기
		Map<String, Object> result = roomService.getRoomList(currentPage);
		result.put("currentPage", currentPage);
		
		model.addAttribute("result", result);
		return "room/roomList";
	}
	
	@GetMapping("/searchRoomList")
	public String searchRoomList(Model model, String searchText,
			@RequestParam(value="currentPage", defaultValue ="1") int currentPage) {
		// 검색 후 숙소 리스트와 페이징 관련 데이터를 result에 담기
		Map<String, Object> result = roomService.getsearchResultRoomList(searchText, currentPage);
		result.put("currentPage", currentPage);
		result.put("searchText", searchText);
		
		model.addAttribute("result", result);
		return "room/searchRoomList";
	}
	
	@GetMapping("/roomOne")
	public String roomOne(Model model, @RequestParam("roomId") int roomId, @RequestParam("detailAddressId") int detailAddressId) {
		Map<String, Object> result = roomService.getRoomOne(roomId, detailAddressId);
		model.addAttribute("room",result.get("room"));
		model.addAttribute("address",result.get("address"));
		model.addAttribute("hashtag",result.get("hashtag"));
		return "room/roomOne";
	}
	
	/*-----HOST측면 및 공통----- */
	
	@GetMapping("/host/addRoom")
	public String getAddRoom(HttpServletRequest request, Model model) {
		// 호스트 정보를 가져온다
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		
		// 숙소 카테고리 리스트 및 hostId
		model.addAttribute("roomCategoryList",roomService.getRoomCategory());
		model.addAttribute("hostId", user.getUserId());
		return "/host/room/addRoom";
	}
	
	@PostMapping("/host/addRoom")
	public String postAddRoom(Room room, Address address, String hashtag) {
		// 숙소 추가
		roomService.addRoom(room, address, hashtag);
		return "redirect:/host/roomList";
	}
	
	// 페이징 삭제
	@GetMapping("/host/roomList")
	public String hostRoomList(HttpServletRequest request, Model model) {
		// 호스트 정보를 가져온다
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		
		// 숙소 목록 추출
		List<Room> roomList = roomService.getHostRoomList(user.getUserId());
		model.addAttribute("roomList", roomList);
		
		return "/host/room/roomList";
	}
	
	@GetMapping("/host/roomOne")
	public String hostRoomOne(Model model,
			@RequestParam("roomId") int roomId, @RequestParam("detailAddressId") int detailAddressId) {
		Map<String, Object> result = roomService.getRoomOne(roomId, detailAddressId);
		model.addAttribute("room",result.get("room"));
		model.addAttribute("address",result.get("address"));
		model.addAttribute("hashtag",result.get("hashtag"));
		return "/host/room/roomOne";
	}
	
	
	@GetMapping("/host/removeRoom")
	public String removeRoom(int roomId) {
		// 숙소 삭제
		roomService.removeRoom(roomId);
		return "redirect:/host/roomList";
	}
	
	@GetMapping("/host/modifyRoom")
	public String getModifyRoom(Model model, int roomId, int detailAddressId) {
		// 숙소 카테고리 리스트
		model.addAttribute("roomCategoryList",roomService.getRoomCategory());
		
		// 숙소 및 주소 정보
		Map<String, Object> result = roomService.getRoomOne(roomId, detailAddressId);
		model.addAttribute("room",result.get("room"));
		model.addAttribute("address",result.get("address"));
		model.addAttribute("hashtag",(result.get("hashtag")));
		return "/host/room/modifyRoom";
	}
	
	@PostMapping("/host/modifyRoom")
	public String postModifyRoom(RedirectAttributes redirect, Room room, Address address, String hashtag) {
		address = roomService.modifyRoom(room, address, hashtag);
		redirect.addAttribute("roomId",room.getRoomId());
		redirect.addAttribute("detailAddressId",address.getDetailAddressId());
		return "redirect:/host/roomOne";
	}
	
}
