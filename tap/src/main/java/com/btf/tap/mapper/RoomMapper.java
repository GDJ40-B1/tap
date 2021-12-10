package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Room;

@Mapper
public interface RoomMapper {
	
	// 숙소 전체 목록 출력(최근 생성된 숙소 순으로)
	List<Room> selectRoomList(Map selectListElement);
	
	// 검색 결과 숙소 개수
	int selectRoomNum();
	
	// 검색 결과 숙소 리스트 추출
	List<Room> selectSearchResultRoomList(Map selectListElement);
	
	// 검색 결과 숙소 개수
	int selectSearchResultRoomNum(String searchText);
	
	// 숙소 카테고리 리스트 추출
	List<String> selectRoomCategory();
	
	// 특정 숙소 상세 정보 추출
	Room selectRoomOne(int roomId);
	
	// 숙소 등록
	int insertRoom(Room room);
	
	// 숙소 정보 수정
	void updateRoom(Room room);
	
	// 숙소 삭제
	void deleteRoom(int roomId);
	
}
