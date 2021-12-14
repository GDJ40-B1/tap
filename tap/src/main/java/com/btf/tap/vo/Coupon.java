package com.btf.tap.vo;

import lombok.Data;

@Data
public class Coupon {
	private int couponId; // 쿠폰 ID
	private int roomId; // 숙소 ID
	private String couponName; // 쿠폰 이름
	private String couponEffectiveDate; // 쿠폰 사용 시작일
	private String couponExpirationDate; // 쿠폰 사용 종료일
	private int discount; // 할인율
	private String couponType; // 종류(할인형태)
	private int couponQuantity; // 발급 수량
	private String createDate; // 정보 생성일
	private String updateDate; // 정보 수정일
}
