package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Hashtag;

@Mapper
public interface HashtagMapper {
	
	// 해시태그 삭제
	void deleteHashtag(Map<String, Object> target);
	
	// 특정 target의 해시태그 목록 추출
	List<String> selecthashtagList(Map<String, Object> target);
	
	// 해시태그 데이터 추가
	void insertHashtag(Hashtag hashtag);
}
