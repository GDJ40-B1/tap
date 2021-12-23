package com.btf.tap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Image;

@Mapper
public interface ImageMapper {
	
	// 특정 타겟의 이미지명 불러오기
	List<Image> selectTargetImage(Image image);
	
	// 이미지 추가
	void insertImage(Image image);
	
	// 이미지 삭제
	void deleteImage(String imageName);
}
