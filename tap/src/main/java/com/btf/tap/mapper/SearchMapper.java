package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Attraction;
import com.btf.tap.vo.Hashtag;
import com.btf.tap.vo.Room;
import com.btf.tap.vo.SearchHistory;

@Mapper
public interface SearchMapper {
	List<Room> roomSearchList(Map<String, Object> page);
	List<Attraction> attractionSearchList(String keyword);
	List<Hashtag> hashtagSearch(String keyword);
	int insertSearchKeyword(SearchHistory searchHistory);
	int totalRowCount(String result);
}
