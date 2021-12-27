package com.btf.tap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {
	
	// 숙소 카테고리 목록
	List<String> selectRoomCategoryList();
}
