package com.btf.tap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.btf.tap.service.CouponService;
import com.btf.tap.vo.Coupon;
import com.btf.tap.vo.Room;

@Controller
public class CouponController {
	@Autowired CouponService couponService;
	
	@GetMapping("/host/modifyCoupon")
	public String getModifyCoupon(Model model, Room room, int couponId) {
		Coupon coupon = couponService.getCouponOne(couponId);
		model.addAttribute("coupon",coupon);
		model.addAttribute("room",room);
		return "/host/coupon/modifyCoupon";
	}
	
	@PostMapping("/host/modifyCoupon")
	public String postModifyCoupon(Room room, Coupon coupon) {
		couponService.modifyCoupon(coupon);
		return "redirect:/host/couponOne?"
				+ "roomId="+room.getRoomId()+"&detailAddressId="+room.getDetailAddressId()+"&couponId="+coupon.getCouponId();
	}
	
	@GetMapping("/host/removeCoupon")
	public String removeCoupon(Room room, int couponId) {
		couponService.removeCoupon(couponId);
		return "redirect:/host/couponList?roomId="+room.getRoomId()+"&detailAddressId="+room.getDetailAddressId();
	}
	
	@GetMapping("/host/couponOne")
	public String couponOne(Model model, Room room, int couponId) {
		Coupon coupon = couponService.getCouponOne(couponId);
		model.addAttribute("coupon",coupon);
		model.addAttribute("room",room);
		return "/host/coupon/couponOne";
	}
	
	@GetMapping("/host/couponList")
	public String couponList(Model model, Room room) {
		List<Coupon> couponList = couponService.getRoomCouponList(room.getRoomId());
		model.addAttribute("couponList",couponList);
		model.addAttribute("room",room);
		return "/host/coupon/couponList";
	}
	
	@GetMapping("/host/addCoupon")
	public String getAddCoupon(Model model, Room room) {
		model.addAttribute("room",room);
		return "/host/coupon/addCoupon";
	}
	
	@PostMapping("/host/addCoupon")
	public String postAddCoupon(Room room, Coupon coupon) {
		coupon.setRoomId(room.getRoomId());
		System.out.println(coupon);
		couponService.addCoupon(coupon);
		return "redirect:/host/couponList?roomId="+room.getRoomId()+"&detailAddressId="+room.getDetailAddressId();
	}
}