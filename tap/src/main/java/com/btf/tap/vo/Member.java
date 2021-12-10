package com.btf.tap.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=true)
public class Member extends User {
	private String memberId;
	private String memberName;
	private int memberAge;
	private String memberPw;
	private String memberPhone;
	private int memberPoint;
	private String createDate;
	private String updateDate;
}
