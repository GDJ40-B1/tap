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
	
	// 특정 숙소 쿠폰 목록 추출
	public List<Coupon> getRoomCouponList(int roomId){
		List<Coupon> couqonList = couponMapper.selectRoomCouponList(roomId);
		return couqonList;
	}
}