package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import com.btf.tap.vo.Reservation;

@Mapper
public interface ReservationMapper {
	List<Reservation> selectRoomReservation(int roomId); // 특정 숙소의 예약 목록 추출
	List<Reservation> selectRoomReservationDateList(int roomId); // 특정 숙소의 예약 날짜 목록 추출
	List<Reservation> selectReservationList(Map selectReservationList); //숙소 별 전체 예약 목록
	int selectReservationNum(); // 예약 갯수
	int insertReservation(Reservation reservation); //예약하기
	void updateReservation(Reservation reservation); //예약 수정
	void deleteReservation(Reservation reservation); //예약 삭제
	Reservation selectReservationOne(int reservationId); //예약정보 상세내역
	List<Map<String, Object>> selectRoomReservationCheck(Map<String, Object> paramMap); // 특정 숙소 월별 예약 인원수 조회
}
