package com.btf.tap.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.btf.tap.service.RoomService;
import com.btf.tap.vo.Address;
import com.btf.tap.vo.Room;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RoomController {
	@Autowired RoomService roomService;
	
	/*-----Member측면 및 공통----- */
	
	@GetMapping("/roomList")
	public String roomList(Model model) {
		// 숙소 목록 추출
		model.addAttribute("roomList",roomService.getRoomList());
		
		return "room/roomList";
	}
	
	@GetMapping("/searchResultRoomList")
	public String searchResultRoomList(Model model, String searchText) {
		// 숙소 목록 추출
		model.addAttribute("roomList",roomService.getsearchResultRoomList(searchText));
		return "room/searchRoomList";
	}
	
	@GetMapping("/roomOne")
	public String roomOne(Model model, @RequestParam("roomId") int roomId, @RequestParam("detailAddressId") int detailAddressId) {
		Map<String, Object> map = roomService.getRoomOne(roomId, detailAddressId);
		model.addAttribute("room",map.get("room"));
		model.addAttribute("address",map.get("address"));
		return "room/roomOne";
	}
	
	/*-----HOST측면 및 공통----- */
	
	@GetMapping("/addRoom")
	public String getAddRoom(Model model) {
		// 숙소 카테고리 리스트
		model.addAttribute("roomCategoryList",roomService.getRoomCategory());
		return "room/addRoom";
	}
	
	@PostMapping("/addRoom")
	public String postAddRoom(Room room, Address address) {
		// 숙소 추가
		roomService.addRoom(room, address);
		
		return "redirect:/myRoomList";
	}
	
	@GetMapping("/myRoomList")
	public String myRoomList(Model model) {
		// 숙소 목록 추출
		model.addAttribute("roomList",roomService.getRoomList());
		// 추후에 host의 나의 숙소목록 페이지로 이동할 수 있도록 해야함
		return "room/myRoomList";
	}
	
	@GetMapping("/myRoomOne")
	public String myRoomOne(Model model, @RequestParam("roomId") int roomId, @RequestParam("detailAddressId") int detailAddressId) {
		Map<String, Object> map = roomService.getRoomOne(roomId, detailAddressId);
		model.addAttribute("room",map.get("room"));
		model.addAttribute("address",map.get("address"));
		return "room/myRoomOne";
	}
	
	
	@GetMapping("/removeRoom")
	public String removeRoom(int roomId) {
		roomService.removeRoom(roomId);
		return "redirect:/myRoomList";
	}
	
	@GetMapping("/modifyRoom")
	public String getModifyRoom(Model model, int roomId, int detailAddressId) {
		// 숙소 카테고리 리스트
		model.addAttribute("roomCategoryList",roomService.getRoomCategory());
		
		// 숙소 및 주소 정보
		Map<String, Object> map = roomService.getRoomOne(roomId, detailAddressId);
		model.addAttribute("room",map.get("room"));
		model.addAttribute("address",map.get("address"));
		return "room/modifyRoom";
	}
	
	@PostMapping("/modifyRoom")
	public String postModifyRoom(RedirectAttributes redirect, Room room, Address address) {
		address = roomService.modifyRoom(room, address);
		redirect.addAttribute("roomId",room.getRoomId());
		redirect.addAttribute("detailAddressId",address.getDetailAddressId());
		return "redirect:/myRoomOne";
	}
	
	
	
}
