package com.btf.tap.vo;

import lombok.Data;

@Data
// 숙소 vo
public class Room {
	private int roomId; // 숙소 ID
	private int detailAddressId; // 상세 주소 ID
	private String hostId; // 호스트 아이디(이메일)
	private String roomCategory; // 숙소 카테고리
	private String roomForm; // 숙소 형태
	private String roomName; // 숙소 이름
	private String roomIntro; // 숙소 소개
	private int minDay; // 최소 숙박일
	private String checkInTime; // 체크인 시간
	private String checkOutTime; // 체크아웃 시간
	private int peopleNum; // 인원수
	private int roomPrice; // 숙박 기본 가격
	private String createDate; // 숙소 생성일
	private String updateDate; // 숙소 정보 수정일
	
	private Address address; // 숙소의 주소 정보
}
