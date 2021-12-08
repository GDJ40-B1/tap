package com.btf.tap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String getAddRoom() {
		return "roomList";
	}
	
	@PostMapping("addRoom")
	public String postAddRoom(Room room, Address address) {
		roomService.addRoom(room, address);
		return "roomList";
	}
}
