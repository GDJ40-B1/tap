package com.btf.tap.vo;

import lombok.Data;

@Data
// 주소 vo
public class Address {
	private int addressId; // 주소 ID
	private String postalCode; // 우편번호
	private String sido; // 시도
	private String sigungu; // 시군구
	private String roadName; // 도로명
	
	private int detailAddressId; // 상세주소 ID
	private String detailAddress; // 상세주소
	private String detailAddress2; // 호수 or 층
}
