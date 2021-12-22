package com.btf.tap.vo;

import lombok.Data;

@Data
public class Favorites {
	private String memberId;
	private int roomId;
	private String favoritesUrl;
	private String favoritesTitle;
	private String createDate;
	private String updateDate;
}
