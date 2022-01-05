package com.btf.tap.vo;

import lombok.Data;

@Data
public class MemberCoupon {
	private int memberCouponId; // 보유쿠폰 ID
	private int couponId; // 쿠폰 ID
	private String memberId; // 보유자
	private int useStatus;	// 사용여부. 사용하면1이 됨
	private String createDate; // 정보 생성일
	
	Coupon coupon; // 쿠폰 정보
	Room room; // 쿠폰이 포함된 숙소
}
