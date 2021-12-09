package com.btf.tap.vo;

import lombok.Data;

@Data
public class Reservation {
	private int reservationId;
	private String memberId;
	private int roomId;
	private String checkInDate;
	private int numberOfPeople;
	private String checkOutDate;
	private String createDate;
	private String updateDate;
}
