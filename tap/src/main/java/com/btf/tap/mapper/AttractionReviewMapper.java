package com.btf.tap.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.AttractionReview;

@Mapper
public interface AttractionReviewMapper {
	
	// 명소 후기 추가
	int insertAttractionReview(AttractionReview attractionReview);
	
	// 명소 후기 삭제
	void deleteAttractionReview(int selectedAttractionId);
	
	// 명소 후기 수정
	void updateAttractionReview(AttractionReview attractionReview);
}
