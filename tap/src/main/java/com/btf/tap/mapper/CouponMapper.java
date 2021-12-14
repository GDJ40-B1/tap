package com.btf.tap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Coupon;

@Mapper
public interface CouponMapper {
	// 특정 숙소 쿠폰 목록 추출
	List<Coupon> selectRoomCouponList(int roomId);
}