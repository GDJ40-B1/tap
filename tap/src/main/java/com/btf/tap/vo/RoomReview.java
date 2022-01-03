package com.btf.tap.vo;

import java.util.List;

import lombok.Data;

@Data
public class RoomReview {
	private int roomReviewId; 		  // 숙소후기 ID
	private int paymentId; 			  // 결제 ID
	private String answerStatus; 	  // 답변여부
	private String roomReviewContent; // 숙소후기 내용
	private int roomReviewScore; 	  // 숙소후기 평점
	private String createDate; 		  // 정보 생성일
	private String updateDate; 		  // 정보 수정일
	
	private List<RoomReviewComment> roomReviewComment; 
	private List<Room> room;
	private List<Reservation> reservation;
}
