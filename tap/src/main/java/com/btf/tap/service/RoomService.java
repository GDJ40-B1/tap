package com.btf.tap.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.RoomMapper;
import com.btf.tap.vo.Room;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class RoomService {
	@Autowired RoomMapper roomMapper;
	// add, modify, get, remove
	
	// 숙소 등록(숙소 and 상세 주소)
	public int addRoom(Map<String, Object> map) {
		
		// detailAddress = 상세정보 추가한 후에 그 id값을
		// room의 detail_address_id에 넣고 생성.
		
		Room room = (Room)map.get("room");
		roomMapper.insertRoom(room);
		
		return room.getRoomId();
	}
	
	// 숙소 전체 목록 출력(최근 생성된 숙소 순으로)
	public List<Room> getRoomList() {
		List<Room> list = roomMapper.selectRoomList();
		return list;
	}
	
	// 숙소 정보 수정(숙소 and 상세 주소)
	public void modifyRoom(Map<String, Object> map) {
		// addRoom처럼 상세 주소 신경써서!
		// addRoom만들면 쉽게 완성.
		
		Room room = (Room)map.get("room");
		roomMapper.updateRoom(room);
	}
	
	// 숙소 삭제(숙소 and 상세 주소)
	public void removeRoom(int roomId) {
		// 상세 주소도 함께 삭제....
		roomMapper.deleteRoom(roomId);
	}
	
}
