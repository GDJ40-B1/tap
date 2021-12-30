package com.btf.tap.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class Host extends User {
	private String hostId;
	private String hostName;
	private int hostAge;
	private String hostPw;
	private String hostPhone;
	private String businessNumber;
	private int hostPoint;
	private String createDate;
	private String updateDate;
	
}
