package com.btf.tap.vo;

import lombok.Data;

@Data
public class Point {
	private String pointCategory;
	private int changedPoint;
	private String userId;
	private int point;
	private int paymentId;
	private String createDate;
}
