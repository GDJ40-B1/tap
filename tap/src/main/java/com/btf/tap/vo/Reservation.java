package com.btf.tap.vo;

import lombok.Data;

@Data
public class Reservation {
	private int reservationId; // 예약 아이디 (숫자)
	private String memberId; // 회원 아이디(이메일)
	private int roomId; // 숙소 아이디 (숫자)
	private String checkInDate; // 체크인 날짜
	private String checkOutDate; // 체크아웃 날짜
	private int peopleNum; // 인원수 
	private String createDate; // 만든 날짜
	private String updateDate;// 수정 날짜 
	
	private Room room;
}
