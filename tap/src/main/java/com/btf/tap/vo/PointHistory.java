package com.btf.tap.vo;

import lombok.Data;

@Data
public class PointHistory {
	private String pointHistoryCategory;
	private int changedPoint;
	private String userId;
	private int point;
	private String createDate;
}
