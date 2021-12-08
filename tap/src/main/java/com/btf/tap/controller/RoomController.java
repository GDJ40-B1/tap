package com.btf.tap.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.btf.tap.service.RoomService;
import com.btf.tap.vo.Address;
import com.btf.tap.vo.Room;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RoomController {
	@Autowired RoomService roomService;
	
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
	public String getmyRoomList(Model model) {
		// 숙소 목록 추출
		model.addAttribute("roomList",roomService.getRoomList());
		// 추후에 host의 나의 숙소목록 페이지로 이동할 수 있도록 해야함
		return "room/myRoomList";
	}
	
	@GetMapping("/roomOne")
	public String getRoomOne(Model model, int roomId, int detailAddressId) {
		Map<String, Object> map = roomService.getRoomOne(roomId, detailAddressId);
		model.addAttribute("room",map.get("room"));
		model.addAttribute("address",map.get("address"));
		return "room/roomOne";
	}
	
	
	@GetMapping("/removeRoom")
	public String getRemoveRoom(int roomId) {
		roomService.removeRoom(roomId);
		return "redirect:/myRoomList";
	}

	
	
	
}
