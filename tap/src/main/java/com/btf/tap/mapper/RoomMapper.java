package com.btf.tap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Room;

@Mapper
public interface RoomMapper {
	
	// 숙소 전체 목록 출력(최근 생성된 숙소 순으로)
	List<Room> selectRoomList();
	
	// 숙소 등록
	int insertRoom(Room room);
	
	// 숙소 정보 수정
	void updateRoom(Room room);
	
	// 숙소 삭제
	void deleteRoom(int roomId);
	
}