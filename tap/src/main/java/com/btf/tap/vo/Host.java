package com.btf.tap.vo;

import lombok.Data;

@Data
public class Host extends User {
	private String hostId;
	private String hostName;
	private int hostAge;
	private String hostPw;
	private String hostPhone;
	private String businessNumber;
	private int hostPoint;
	private String approvalStatus;
	private String createDate;
	private String updateDate;
	
}
