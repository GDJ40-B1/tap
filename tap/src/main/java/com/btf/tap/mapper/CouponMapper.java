package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Coupon;
import com.btf.tap.vo.MemberCoupon;

@Mapper
public interface CouponMapper {
	
	// 특정 회원이 보유중인 쿠폰 리스트
	List<MemberCoupon> selectMemberOneCouponList(String memberId);
	
	// 쿠폰 사용시 사용여부 변경
	void updateUseMemberCoupon(Map<String, Object> map);
	
	// 특정 숙소의 보유쿠폰(결제시 고를 쿠폰)
	List<Coupon> selectRoomMemberCoupon(Map<String, Object> map);
	
	// 보유쿠폰에서 특정 쿠폰 삭제
	void deleteMemberCoupon(int couponId);
	
	// 특정 숙소에서 특정 회원이 발급받지 않은 쿠폰 목록 추출
	List<Coupon> selectNotMemberCoupon(Map<String, Object> memberCoupon);
	
	// 보유 쿠폰 추가
	void insertMemberCoupon(Map<String, Object> memberCoupon);
	
	// 특정 쿠폰 수량 추출
	int selectCouponQuantity(int couponId);
	
	// 쿠폰 발급시 수량 감소
	void updateCouponQuantity(int couponId);
	
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
	
	// 특정 숙소의 발급 가능 쿠폰 목록 추출
	List<Coupon> selectRoomAbleCouponList(int roomId);
}
