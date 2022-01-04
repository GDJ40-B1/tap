package com.btf.tap.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.btf.tap.common.Font;
import com.btf.tap.service.CouponService;
import com.btf.tap.service.ReservationService;
import com.btf.tap.vo.Reservation;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	@Autowired
	CouponService couponService;
	
	//예약 정보 리스트 제작중
	@GetMapping("/host/reservationList")
	public String getReservationList(HttpServletRequest request, Model model, @RequestParam(value="currentPage", defaultValue ="1") int currentPage) {
		
		// 회원정보 세션으로 가져오기
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		
		// 숙소 리스트와 페이징 관련 데이터를 result에 담기
		Map<String, Object> result = reservationService.getReservationList(currentPage);
		
		
		result.put("currentPage", currentPage);
		model.addAttribute("result", result);
		log.debug(Font.KSB +" reservationController단  result 값 "+  result.toString() + Font.RESET);
		
		return "/host/reservation/reservationList";
	}
	
	//예약 정보 리스트 제작중
		@GetMapping("/member/reservationList")
		public String getReservationList2(HttpServletRequest request, Model model, @RequestParam(value="currentPage", defaultValue ="1") int currentPage) {
			
			// 회원정보 세션으로 가져오기
			// 회원정보 세션으로 가져오기
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("loginUser");
			
			// 숙소 리스트와 페이징 관련 데이터를 result에 담기
			Map<String, Object> result = reservationService.getReservationList(currentPage);
			
			
			result.put("currentPage", currentPage);
			model.addAttribute("result", result);
			log.debug(Font.KSB +" reservationController단  result 값 "+  result.toString() + Font.RESET);
			
			return "member/reservation/reservationList";
		}
	
	@GetMapping("/member/addPayment")
	public String getAddPayment(HttpSession session, Model model, Reservation reservation) {
		// 회원정보 세션으로 가져오기
		User user = (User)session.getAttribute("loginUser");
		reservation.setMemberId(user.getUserId()); // 회원ID 예약 객체에 저장
		//서비스 단에 reservation 정보를 보내고 int값으로 다시 저장한다.
		reservation = reservationService.getPaymentPriceOfDate(reservation);
		model.addAttribute("reservation",reservation);
		model.addAttribute("couponList", couponService.getPaymentCoupon(reservation.getRoomId(), reservation.getMemberId()));
		return "/reservation/addPayment";
	}
	
	@PostMapping("/member/addPayment")
	public String postAddPayment(Reservation reservation, int couponId) {
		//서비스 단에 reservation 정보를 보내고 int값으로 다시 저장한다.
		int reservationId = reservationService.addReservation(reservation);
		
		Map<String, Object> useCoupon = new HashMap<>();
		useCoupon.put("couponId", couponId);
		useCoupon.put("memberId", reservation.getMemberId());
		if(couponId!=0) {
			couponService.modifyUseMemberCoupon(useCoupon);
		}
		
		return "redirect:/reservationOne?reservationId="+reservationId; // 일을 다 마치고 예약 추가를 성공했을시 예약정보 상세보기 페이지로 넘어간다. 추가로 아이디값 보내줌
	}
	
	//예약 상세정보 보기
	@GetMapping("/reservationOne")
	public String reservationOne(Model model, int reservationId) {
		
		
		//reservationId 값을 입력받음
		//입력 받은 reservartionId를 getReservationOne을 보내고 다시 reservation에 저장해서 값 확인 
		Reservation reservation = reservationService.getReservationOne(reservationId);
		//reservationId값 getReservationOne에 보내고 reservation에 값 저장 
		log.debug(Font.KSB + "예약 상세정보 컨트롤러 단 reservatidonOne 들어오는 값 정보보기 "+ reservationId + Font.RESET);
		//디버그
		model.addAttribute("reservation", reservation);
		//값 뷰 전송
		return "reservation/reservationOne";
	}
	//예약 정보 수정하기 
	@GetMapping("/modifyReservation")
	public String modifyReservation(Model model, int reservationId) {
		
		
		Reservation reservation = reservationService.getReservationOne(reservationId);
		//서비스에 getReservationOne으로 값 보내고 reservation에 값 저장
		log.debug(Font.KSB + "컨트롤러 단 modifyReservation get방식 작동 "+ reservation + Font.RESET);
		
		model.addAttribute("reservation", reservation);
		return "reservation/modifyReservation";	//값 뷰에 전송
	}
	
	//예약 정보 수정하기 버튼
	@PostMapping("/modifyReservation")
	public String modifyReservation(Reservation reservation) {
		
		
		int reservationId = reservation.getReservationId();
		//리턴값에 아이디값 넘겨주기 위한 설정
		reservationService.modifyReservation(reservation);
		//서비스에 modifyReservation으로 값 보냄
		
		log.debug(Font.KSB + "컨트롤러 단 modifyReservaion post방식 작동 값 점검 "+ reservationId + Font.RESET);
		
		return "redirect:/reservationOne?reservationId="+reservationId;
	}
	//예약 정보 삭제하기 
	@GetMapping("/deleteReservation")
	public String deleteReservation(Model model, int reservationId) {
		Reservation reservation = reservationService.getReservationOne(reservationId);
		//서비스 getReservationOne으로 값 보내고 다시 저장 
		model.addAttribute("reservation", reservation);
		//값 뷰 전송 
		return "reservation/deleteReservation"; //액션 포스트 방식으로 이동 
	}
	//예약 정보 삭제하기 버튼 
	@PostMapping("/deleteReservation")
	public String deleteReservation(Reservation reservation) {
		
		
		int reservationId = reservation.getReservationId();
		//reservationOne에 reservationId값 넣어주기 위해서 
		reservationService.deleteReservation(reservation);
		//서비스에 deleteReservation에 값 보냄
		
		
		return "redirect:/reservationList"; //완료 후 상세정보 페이지로 이동 
	} 
	
	
}
