package com.btf.tap.vo;

import lombok.Data;

@Data
public class AttractionReview {
	private int selectedAttractionId;
	private String writer;
	private String reviewContent;
	private String createDate;
	private String updateDate;
}
