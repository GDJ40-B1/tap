package com.btf.tap.vo;

import lombok.Data;

@Data
public class MemberCoupon {
	private int member_coupon_id;
	private int coupon_id;
	private String member_id;
	private int use_status;	// 사용여부. 사용하면1이 됨
	private String create_date;
}
