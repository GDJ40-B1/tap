package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import com.btf.tap.vo.Reservation;

@Mapper
public interface ReservationMapper {
	List<Reservation> selectReservationList(Map<String, Object>map); //숙소 별 전체 예약 목록
	int selectReservationNum(); // 예약 갯수
	int insertReservation(int roomId, int detailAddress); //예약하기
	int insertReservation2(Reservation reservation);
	void updateReservation(Reservation reservation); //예약 수정
	void deleteReservation(Reservation reservation); //예약 삭제
	Reservation selectReservationOne(int reservationId); //예약정보 상세내역
}
