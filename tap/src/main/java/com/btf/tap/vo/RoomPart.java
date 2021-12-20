package com.btf.tap.vo;

import lombok.Data;

@Data
public class RoomPart {
	private String partName; // 구성
	private int roomId; // 숙소ID
	private int quantity; // 수량
	private String createDate; // 정보 생성일
	private String updateDate; // 정보 수정일
}
