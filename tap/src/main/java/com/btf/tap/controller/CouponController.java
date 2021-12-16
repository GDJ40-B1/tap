package com.btf.tap.controller;

import java.util.HashMap;
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

import com.btf.tap.service.CouponService;
import com.btf.tap.vo.Coupon;
import com.btf.tap.vo.Room;
import com.btf.tap.vo.User;

@Controller
public class CouponController {
	@Autowired CouponService couponService;
	
	@GetMapping("/member/addMemberCoupon")
	public String addMemberCoupon(RedirectAttributes redirect, HttpServletRequest request, Model model,
			@RequestParam("roomId") int roomId, @RequestParam("detailAddressId") int detailAddressId, int couponId) {
		// 회원 정보를 가져온다
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		
		Map<String, Object> memberCoupon = new HashMap<>();
		memberCoupon.put("roomId",roomId);
		memberCoupon.put("couponId",couponId);
		memberCoupon.put("memberId",user.getUserId());
		couponService.addMemberCoupon(memberCoupon);
		
		redirect.addAttribute("roomId",roomId);
		redirect.addAttribute("detailAddressId",detailAddressId);
		return "redirect:/roomOne";
	}
	
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