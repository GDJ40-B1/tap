package com.btf.tap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.RoomPart;

@Mapper
public interface PartMapper {
	
	// 숙소별 구성 삭제
	void deleteRoomPart(int roomId);
	
	// 숙소별 구성 추가
	void insertRoomPart(RoomPart roomPart);
	
	// 구성 목록 추출
	List<String> selectPartList();
}
