package com.btf.tap.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ImageMapper {
	
	// 이미지 추가
	void insertImage();
}
