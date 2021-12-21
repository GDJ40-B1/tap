package com.btf.tap.vo;

import lombok.Data;

@Data
public class RoomReviewComment {
	private int roomReviewId;				 // 숙소후기 ID 
	private String roomReviewCommentContent; // 숙소후기 답변 내용
	private String commentCreateDate;		 // 답변 정보 생성일
}
