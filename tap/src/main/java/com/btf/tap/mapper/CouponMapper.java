package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Coupon;

@Mapper
public interface CouponMapper {
	
	// 특정 숙소에서 특정 회원이 발급받지 않은 쿠폰 목록 추출
	List<Coupon> selectNotMemberCoupon(Map<String, Object> memberCoupon);
	
	// 보유 쿠폰 추가
	void insertMemberCoupon(Map<String, Object> memberCoupon);
	
	// 쿠폰 정보 수정
	void updateCoupon(Coupon coupon);
	
	// 쿠폰 삭제
	void deleteCoupon(int couponId);
	
	// 특정 쿠폰 정보 추출
	Coupon selectCouponOne(int couponId);
	
	// 쿠폰 생성
	void insertCoupon(Coupon coupon);
	
	// 특정 숙소 쿠폰 목록 추출
	List<Coupon> selectRoomCouponList(int roomId);
}
