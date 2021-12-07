package com.btf.tap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.btf.tap.vo.Address;
import com.btf.tap.vo.Room;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RoomController {

	@GetMapping("/addRoom")
	public String getAddRoom() {
		return "addRoom";
	}
	
	@PostMapping("addRoom")
	public String postAddRoom(Room room, Address address) {
		return "roomList";
	}
}
