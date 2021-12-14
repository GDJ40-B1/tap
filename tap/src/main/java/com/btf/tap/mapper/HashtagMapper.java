package com.btf.tap.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Hashtag;

@Mapper
public interface HashtagMapper {
	
	// 해시태그 데이터 추가
	void insertHashtag(Hashtag hashtag);
}
