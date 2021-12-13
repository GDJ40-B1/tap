package com.btf.tap.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.AddressMapper;
import com.btf.tap.mapper.ReservationMapper;
import com.btf.tap.mapper.RoomMapper;
import com.btf.tap.vo.Address;
import com.btf.tap.vo.Notice;
import com.btf.tap.vo.Reservation;
import com.btf.tap.vo.Room;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class ReservationService {
	@Autowired
	ReservationMapper reservationMapper;
	@Autowired 
	AddressMapper addressMapper;
	@Autowired 
	RoomMapper roomMapper;
	
	
	
	//예약 추가하기.
	public Map<String, Object> getAddReservation(int roomId, int detailAddressId)	{
		
		Map<String, Object> map = new HashMap<>();
		
		Room room = roomMapper.selectRoomOne(roomId);
		Address address = addressMapper.selectAddressOne(detailAddressId);
		
		// 시도+시군구+도로명+상세주소 합치기 => kakao 지도 API 검색을 위해
		String detailAddress = address.getSido()+" "+address.getSigungu()+" "+address.getRoadName()+" "+address.getDetailAddress();
				address.setDetailAddress(detailAddress);
	   
		
		// 주소 정보
			map.put("address", address);
		// 숙소 정보	
			map.put("room", room);
	
		
		//디버그
			
			log.debug(Font.KSB + "서비스 단 map값 점검하기 : "+ map.toString() + Font.RESET);
			return map;
			
	}
	//예약 추가하기.
		public int postAddReservation(Reservation reservation)	{

			
				reservationMapper.insertReservation2(reservation);
				log.debug(Font.KSB + "서비스 단 reservation값 점검하기 : "+ reservation.toString() + Font.RESET);
				//디버그
				return reservation.getReservationId();
				
		}
	//예약정보 상세보기.
		public Reservation getReservationOne(int reservationId) {
			Reservation reservation = reservationMapper.selectReservationOne(reservationId);
			return reservation;
		}
	//예약 수정하기.
	public void modifyReservation(Reservation reservation) {
		reservationMapper.updateReservation(reservation);
	}
	//예약 삭제하기.
	public void deleteReservation(Reservation reservation) {
		reservationMapper.deleteReservation(reservation);
	}
	public int addReservation(Reservation reservation2) {
		// TODO Auto-generated method stub
		return 0;
	}
}
