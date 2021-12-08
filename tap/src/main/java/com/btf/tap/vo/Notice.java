package com.btf.tap.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeId;
	private String systemAdminId;
	private String title;
	private String content;
	private String kind;
	private String createDate;
	private String updateDate;
	public int getNoticeOne(int noticeId2) {
		// TODO Auto-generated method stub
		return 0;
	}
}
