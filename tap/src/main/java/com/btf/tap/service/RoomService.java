package com.btf.tap.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.AddressMapper;
import com.btf.tap.mapper.RoomMapper;
import com.btf.tap.vo.Address;
import com.btf.tap.vo.Room;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class RoomService {
	@Autowired RoomMapper roomMapper;
	@Autowired AddressMapper addressMapper;
	// add, modify, get, remove
	
	// 특정 숙소 정보 추출
	public Map<String, Object> getRoomOne(int roomId, int detailAddressId){
		Map<String, Object> map = new HashMap<>();
		Address address = addressMapper.selectAddressOne(detailAddressId);
		
		// 시도+시군구+도로명+상세주소 합치기 => kakao 지도 API 검색을 위해
		String detailAddress = address.getSido()+" "+address.getSigungu()+" "+address.getRoadName()+" "+address.getDetailAddress();
		address.setDetailAddress(detailAddress);
		
		// 주소 정보
		map.put("address", address);
		// 숙소 정보
		map.put("room", roomMapper.selectRoomOne(roomId));
		return map;
	}
	
	// 숙소 카테고리 리스트 추출
	public List<String> getRoomCategory(){
		List<String> roomCategoryList = roomMapper.selectRoomCategory();
		return roomCategoryList;
	}
	
	// 숙소 등록(숙소 and 상세 주소)
	public int addRoom(Room room, Address address) {
		// 입력받은 도로명 주소를 분할하여 객체에 넣기
		String[] addressList = address.getDetailAddress().split(" ");
		address.setSido(addressList[0]);
		address.setSigungu(addressList[1]);
		address.setRoadName(addressList[2]);
		address.setDetailAddress(addressList[3]);
		
		// address 테이블에서 해당 주소를 검색 후
		// 상세주소 테이블에 데이터를 삽입한다
		address.setAddressId((addressMapper.searchAddressOne(address)).getAddressId());
		addressMapper.insertDetailAddress(address);
		
		// 상세주소 테이블의 데이터 삽입 시 생성된 id값을
		// 숙소 등록시 상세주소 값으로 사용한다
		room.setDetailAddressId(address.getDetailAddressId());
		roomMapper.insertRoom(room);
		
		return room.getRoomId();
	}
	
	// 숙소 전체 목록 출력(최근 생성된 숙소 순으로)
	public List<Room> getRoomList() {
		List<Room> list = roomMapper.selectRoomList();
		return list;
	}
	
	// 숙소 정보 수정(숙소 and 상세 주소)
	public void modifyRoom(Room room, Address address) {
		// address 테이블 단 주소 변경 적용을 위해.
		// addressId를 구하고 변경사항을 저장한다
		address.setAddressId(addressMapper.searchAddressOne(address).getAddressId());
		addressMapper.updateDetailAddress(address);
		
		// 숙소 변경사항 적용
		roomMapper.updateRoom(room);
	}
	
	// 숙소 삭제(숙소 and 상세 주소)
	public void removeRoom(int roomId) {
		
		// 숙소 상세 주소 ID
		int detailAddressId = roomMapper.selectRoomOne(roomId).getDetailAddressId();
		
		// 숙소 정보 삭제
		roomMapper.deleteRoom(roomId);
		
		// 상세 주소 정보 삭제
		addressMapper.deleteDetailAddress(detailAddressId);
	}
	
}
