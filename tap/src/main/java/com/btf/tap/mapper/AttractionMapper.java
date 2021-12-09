package com.btf.tap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Attraction;

@Mapper
public interface AttractionMapper {
	
	// 명소 카테고리
	List<String> selectAttractionCategory();
	// 명소 상세 보기
	Attraction selectAttractionOne(int attractionId);
	// 명소 삭제
	void deleteAttraction(int attractionId);
	// 명소 수정
	void updateAttraction(Attraction attraction);
	// 명소 전체 목록
	List<Attraction> selectAttractionList();
	// 명소 등록
	int insertAttraction(Attraction attraction);
	
}
