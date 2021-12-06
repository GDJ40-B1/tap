package com.btf.tap.vo;

import lombok.Data;

@Data
public class Member {
	private String memberId;
	private String memberName;
	private int memberAge;
	private String memberPw;
	private String memberPhone;
	private int memberPoint;
	private String createDate;
	private String updateDate;
}
