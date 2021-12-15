package com.btf.tap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btf.tap.mapper.CouponMapper;
import com.btf.tap.vo.Coupon;

@Service
public class CouponService {
	@Autowired CouponMapper couponMapper;
	// add, modify, get, remove
	
	// 쿠폰 수정
	public void modifyCoupon(Coupon coupon) {
		couponMapper.updateCoupon(coupon);
	}
	
	// 쿠폰 삭제
	public void removeCoupon(int couponId) {
		couponMapper.deleteCoupon(couponId);
	}
	
	// 특정 쿠폰 정보 추출
	public Coupon getCouponOne(int couponId) {
		return couponMapper.selectCouponOne(couponId);
	}
	
	// 쿠폰 생성
	public void addCoupon(Coupon coupon){
		couponMapper.insertCoupon(coupon);
	}
	
	// 특정 숙소 쿠폰 목록 추출
	public List<Coupon> getRoomCouponList(int roomId){
		List<Coupon> couqonList = couponMapper.selectRoomCouponList(roomId);
		return couqonList;
	}
}