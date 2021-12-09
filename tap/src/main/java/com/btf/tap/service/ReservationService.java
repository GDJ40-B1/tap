package com.btf.tap.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.ReservationMapper;
import com.btf.tap.vo.Reservation;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class ReservationService {
	@Autowired
	ReservationMapper reservationMapper;
	
	//예약 추가하기.
	public int addReservation(Reservation reservation)	{
		reservationMapper.insertReservation(reservation);
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
}
