package com.btf.tap.vo;

import lombok.Data;

@Data
public class SelectedAttraction {
	private int selectedAttractionId;
	private int attractionId;
	private int reservationId;
	private String time;
	private String date;
	private String createDate;
	private String updateDate;
}
