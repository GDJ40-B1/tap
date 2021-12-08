package com.btf.tap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Attraction;
import com.btf.tap.vo.Room;

@Mapper
public interface SearchMapper {
	List<Room> roomSearchList(String keyword);
	List<Attraction> attractionSearchList(String keyword);
}
