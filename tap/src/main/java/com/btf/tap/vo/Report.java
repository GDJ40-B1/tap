package com.btf.tap.vo;

import lombok.Data;

@Data
public class Report {
	private String writerId; // 작성자 ID(이메일)
	private int reportTarget; // 신고대상(게시글id)
	private String reportTargetCategory; // 신고대상 카테고리
	private String reportContent; // 신고내용
	private String approvalStatus; // 승인여부
	private String writerCategory; // 작성자 카테고리
	private String createDate; // 정보 생성일
	private String updateDate; // 정보 수정일
	
	private SystemAdmin systemAdmin; 
}
