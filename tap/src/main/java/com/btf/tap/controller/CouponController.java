package com.btf.tap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.btf.tap.service.CouponService;
import com.btf.tap.vo.Coupon;
import com.btf.tap.vo.Room;

@Controller
public class CouponController {
	@Autowired CouponService couponService;
	
	@GetMapping("/host/couponList")
	public String couponList(Model model, Room room) {
		List<Coupon> couponList = couponService.getRoomCouponList(room.getRoomId());
		model.addAttribute("couponList",couponList);
		model.addAttribute("room",room);
		return "/host/coupon/couponList";
	}
}
