package com.btf.tap.vo;

import lombok.Data;

@Data
public class Hashtag {
	private String hashtagTargetCategory; // 해시태그 타겟 카테고리
	private int hashtagTarget; // 해시태그 타겟
	private String hashtagName; // 해시태그명
}
