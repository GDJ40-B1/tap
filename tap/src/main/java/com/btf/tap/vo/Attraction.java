package com.btf.tap.vo;

import lombok.Data;

@Data
public class Attraction {
	private int attractionId;
	private int detailAddressId;
	private String attractionCategory;
	private String attractionName;
	private String attractionPhoneNumber;
	private String attractionContent;
	private String approvalStatus;
	private String createDate;
	private String updateDate;
	
	private Address address; // 명소의 주소 정보
}
