package com.btf.tap.vo;

import lombok.Data;

@Data
public class Image {
	private String imageName; // 이미지 이름
	private String imageRealName; // 이미지 원래 이름
	private int imageTarget; // 이미지 대상
	private String imageTargetCategory; // 이미지 대상 카테고리
	private String createTime; // 정보 생성시간
}
