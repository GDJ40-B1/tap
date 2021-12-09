package com.btf.tap.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class SystemAdmin extends User{
	private String systemAdminId;
	private String systemAdminPw;
	private String systemAdminName;
	private String createDate;
	private String updateDate;
}
