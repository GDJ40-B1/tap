package com.btf.tap.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.CouponMapper;
import com.btf.tap.vo.Coupon;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class CouponService {
	@Autowired CouponMapper couponMapper;
	// add, modify, get, remove
	
	// 특정 숙소에서 특정 회원이 발급받지 않은 쿠폰 목록 추출
	public List<Coupon> getNotMemberCoupon(Map<String, Object> memberCoupon){
		List<Coupon> couqonList = couponMapper.selectNotMemberCoupon(memberCoupon);
		return couqonList;
	}
	
	// 보유 쿠폰 추가
	public void addMemberCoupon(Map<String, Object> memberCoupon) {
		couponMapper.insertMemberCoupon(memberCoupon);
	}
	
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