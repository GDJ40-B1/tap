package com.btf.tap.vo;

import lombok.Data;

@Data
public class PriceRoom {
	private int priceRoomId; // 숙소별 가격ID
	private String startDate; // 시작날짜
	private String endDate; // 끝날짜
	private int roomId; // 숙소ID
	private int price; // 가격
	private String createDate; // 정보 생성일
	private String updateDate; // 정보 수정일
}
