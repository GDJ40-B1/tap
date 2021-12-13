package com.btf.tap.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class SystemAdmin extends User{
	private String systemAdminId; // 시스템관리자 ID
	private String systemAdminPw; // 시스템관리자 PW
	private String systemAdminName; // 시스템관리자 이름
	private int systemAdminAge; // 시스템관리자 나이
	private String systemAdminPhone; // 시스템관리자 전화번호
	private String createDate; // 정보 생성일 
	private String updateDate; // 정보 수정일
}
