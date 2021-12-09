package com.btf.tap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.btf.tap.common.Font;
import com.btf.tap.service.ReservationService;
import com.btf.tap.vo.Notice;
import com.btf.tap.vo.Reservation;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	
	@GetMapping("/addReservation")
	String addReservation()	{
		return "reservation/addReservation";
	}
	
	@PostMapping("/addReservation")
	String addReservation(Reservation reservation)	{
		int reservationId = reservationService.addReservation(reservation);
		log.debug(Font.KSB + reservation.toString() + Font.RESET);
		return "reservationOne?reservationId="+reservationId;
	}
	
	@GetMapping("/modifyReservation")
	public String modifyReservation(Model model, int reservationId) {
		Reservation reservation = reservationService.getReservationOne(reservationId);
		model.addAttribute("reservation", reservation);
		return "reservation/modifyReservation";
	}
	
	@PostMapping("/modifyReservation")
	public String modifyReservation(Reservation reservation) {
		int reservationId = reservation.getReservationId();
		reservationService.modifyReservation(reservation);
		return "redirect:/reservationOne?reservationId="+reservationId;
	}
	
	@GetMapping("/deleteReservation")
	public String deleteReservation(Model model, int reservationId) {
		Reservation reservation = reservationService.getReservationOne(reservationId);
		model.addAttribute("reservation", reservation);
		return "notice/deleteReservation";
	}
	
	@PostMapping("/deleteReservation")
	public String deleteReservation(Reservation reservation) {
		int reservationId = reservation.getReservationId();
		reservationService.deleteReservation(reservation);
		return "redirect:/reservationList";
	} 
	
	@GetMapping("/reservationOne")
	public String reservationOne(Model model, int reservationId) {
		Reservation reservation = reservationService.getReservationOne(reservationId);
		model.addAttribute("reservation", reservation);
		return "reservation/reservationOne";
	}
}
