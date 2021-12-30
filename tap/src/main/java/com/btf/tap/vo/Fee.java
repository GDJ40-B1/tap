package com.btf.tap.vo;

import lombok.Data;

@Data
public class Fee {
	private int feeId; // 수수료 ID
	private int originalPrice; // 원금
	private int feeRate; // 수수료 %
	private int fee; // 수수료(순이익)
	private int hostProfit; // 호스트의 순이익
	private String createDate; // 전환일
}
