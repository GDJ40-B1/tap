package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.PriceRoom;
import com.btf.tap.vo.Room;

@Mapper
public interface RoomMapper {
	
	// 특정 숙소별 가격 삭제
	void deletePriceRoomOne(int priceRoomId);
	
	// 특정 숙소의 숙소별 가격 전부 삭제
	void deletePriceRoom(int roomId);
	
	// 숙소별 가격 추가
	void insertPriceRoom(Map<String, Object> priceRoom);
	
	// 숙소별 가격 리스트 추출
	List<PriceRoom> selectPriceRoomList(int roomId);
	
	// host의 숙소 전체 목록 출력
	List<Room> selectHostRoomList(String hostId);
	
	// 검색 결과 숙소 개수
	int selectHostRoomNum(String hostId);
	
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
	
	// 사용자 설정 선호지역 별 인기 숙소 리스트
	List<Map<String, Object>> selectPreferLocalRoomList(Map<String, Object> paramMap);
	
	// 사용자 설정 선호지역 별 인기 숙소 개수
	int preferLocalRoomTotalCount(Map<String, Object> paramMap);

	// 숙소 연도별 이용 연령층 조회
	List<Map<String, Object>> selectRoomAgeList(Map<String, Object> paramMap);
	
	// 1회 이상 결제처리 된 숙소 리스트 조회
	List<Room> selectPayRoomList(String hostId);
	
	// 특정 숙소 기간별 결제 내역 조회
	List<Map<String, Object>> selectPayRoomDateList(Map<String, Object> paramMap);
	
	// 조회 가능 연도 체크
	List<Integer> selectYearList(int roomId);
}
