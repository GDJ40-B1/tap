package com.btf.tap.vo;

import lombok.Data;

@Data
public class SystemAdmin extends User{
	private String systemAdminId;
	private String systemAdminPw;
	private String systemAdminName;
	private String createDate;
	private String updateDate;
}
