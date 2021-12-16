package com.btf.tap.controller;

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
import com.btf.tap.service.ReservationService;
import com.btf.tap.vo.Reservation;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	//예약 정보 리스트 제작중
	@GetMapping("/reservationList")
	public String getReservationList(Model model, @RequestParam(value="currentPage", defaultValue ="1") int currentPage) {
		// 숙소 리스트와 페이징 관련 데이터를 result에 담기
		Map<String, Object> result = reservationService.getReservationList(currentPage);
		result.put("currentPage", currentPage);
		
		model.addAttribute("result", result);
		return "reservation/reservationList";
	}
	//예약 추가
	@GetMapping("/addReservation")
	String addReservation(HttpServletRequest request, Model model, int roomId,  int detailAddressId)	{
		
		HttpSession session = request.getSession();
		log.debug(Font.KSB + "getAddCont : " + session.toString() + Font.RESET);
				
		// 세션에서 loginUser 객체 받기
		User loginUser = (User)session.getAttribute("loginUser");
		log.debug(Font.KSB + "getAddCont : " + loginUser.toString() + Font.RESET);
		
		// 로그인 되어있지 않을 경우(적용 안되는 듯..), 시스템관리자, 호스트일 경우 홈페이지로 이동 회원만 페이지 이동 가능
		if(loginUser == null || loginUser.getUserLevel().equals("system_admin") || loginUser.getUserLevel().equals("host") ) {
			log.debug(Font.KSB + "로그인 정보가 없거나, 시스템관리자, 호스트 계정입니다." + Font.RESET);
			return "redirect:/";
		}
		
		
		Map<String, Object> map = reservationService.getAddReservation(roomId, detailAddressId);
		//서비스에 값 보내고 map에 저장
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("room",map.get("room"));
	    model.addAttribute("address",map.get("address"));
	    
	    //저장한 map 모델로 뷰 전송
	    log.debug(Font.KSB +" reservationController map에 id값 담아 서비스 처리 후 뷰로 전송 "+ map.toString() + Font.RESET);
	    //디버그
		return "reservation/addReservation";
	}
	//예약 추가 버튼 작동
	@PostMapping("/addReservation")
	String addReservation(HttpServletRequest request, Model model, Reservation reservation)	{
		
		HttpSession session = request.getSession();
		log.debug(Font.KSB + "postAddReservation : " + session.toString() + Font.RESET);
				
		// 세션에서 loginUser 객체 받기
		User loginUser = (User)session.getAttribute("loginUser");
		log.debug(Font.KSB + "postAddReservation : " + loginUser.toString() + Font.RESET);
		
		// 로그인 되어있지 않을 경우(적용 안되는 듯..), 시스템관리자, 호스트일 경우 홈페이지로 이동 회원만 페이지 이동 가능
		if(loginUser == null || loginUser.getUserLevel().equals("system_admin") || loginUser.getUserLevel().equals("host") ) {
			log.debug(Font.KSB + "로그인 정보가 없거나, 시스템관리자, 호스트 계정입니다." + Font.RESET);
			return "redirect:/";
		}
		
		//서비스 단에 reservation 정보를 보내고 int값으로 다시 저장한다.
		int reservationId = reservationService.postAddReservation(reservation);
		//디버그 id값 점검
		log.debug(Font.KSB + "addReservation post 작동 "+ reservationId + Font.RESET);
		//정보를 다시 예약 상세보기로 보내준다.
		reservationService.getReservationOne(reservationId);
		//세션 값 뷰 전송
		model.addAttribute("loginUser", loginUser);
		
		return "redirect:/reservationOne?reservationId="+reservationId; // 일을 다 마치고 예약 추가를 성공했을시 예약정보 상세보기 페이지로 넘어간다. 추가로 아이디값 보내줌
	}
	
	//예약 상세정보 보기
	@GetMapping("/reservationOne")
	public String reservationOne(HttpServletRequest request, Model model, int reservationId) {
		
		HttpSession session = request.getSession();
		log.debug(Font.KSB + "getAddReservation : " + session.toString() + Font.RESET);
				
		// 세션에서 loginUser 객체 받기
		User loginUser = (User)session.getAttribute("loginUser");
		log.debug(Font.KSB + "getAddReservation : " + loginUser.toString() + Font.RESET);
		
		log.debug(Font.KSB + "누구나 들어갈 수 있습니다." + Font.RESET);
		
		//reservationId 값을 입력받음
		//입력 받은 reservartionId를 getReservationOne을 보내고 다시 reservation에 저장해서 값 확인 
		Reservation reservation = reservationService.getReservationOne(reservationId);
		//reservationId값 getReservationOne에 보내고 reservation에 값 저장 
		log.debug(Font.KSB + "예약 상세정보 컨트롤러 단 reservatidonOne 들어오는 값 정보보기 "+ reservationId + Font.RESET);
		//디버그
		model.addAttribute("reservation", reservation);
		model.addAttribute("loginUser", loginUser);
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
	public String modifyReservation(HttpServletRequest request, Model model, Reservation reservation) {
		
		HttpSession session = request.getSession();
		log.debug(Font.KSB + "postModifyReservation : " + session.toString() + Font.RESET);
				
		// 세션에서 loginUser 객체 받기
		User loginUser = (User)session.getAttribute("loginUser");
		log.debug(Font.KSB + "postModifyReservation : " + loginUser.toString() + Font.RESET);
		
		// 관리자만 페이지 이동 가능
				if(loginUser == null || loginUser.getUserLevel().equals("member") || loginUser.getUserLevel().equals("host") ) {
					log.debug(Font.KSB + "시스템관리자만 입장할 수 있습니다 ." + Font.RESET);
					return "redirect:/";
				}
		
		int reservationId = reservation.getReservationId();
		//리턴값에 아이디값 넘겨주기 위한 설정
		reservationService.modifyReservation(reservation);
		//서비스에 modifyReservation으로 값 보냄
		
		log.debug(Font.KSB + "컨트롤러 단 modifyReservaion post방식 작동 값 점검 "+ reservationId + Font.RESET);
		
		model.addAttribute("loginUser", loginUser);
		
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
	public String deleteReservation(HttpServletRequest request, Model model, Reservation reservation) {
		
		HttpSession session = request.getSession();
		log.debug(Font.KSB + "postDeleteReservation : " + session.toString() + Font.RESET);
				
		// 세션에서 loginUser 객체 받기
		User loginUser = (User)session.getAttribute("loginUser");
		log.debug(Font.KSB + "postDeleteReservation : " + loginUser.toString() + Font.RESET);
		
		// 관리자만 페이지 이동 가능
				if(loginUser == null || loginUser.getUserLevel().equals("member") || loginUser.getUserLevel().equals("host") ) {
					log.debug(Font.KSB + "시스템관리자만 입장할 수 있습니다 ." + Font.RESET);
					return "redirect:/";
				}
		
		int reservationId = reservation.getReservationId();
		//reservationOne에 reservationId값 넣어주기 위해서 
		reservationService.deleteReservation(reservation);
		//서비스에 deleteReservation에 값 보냄
		
		model.addAttribute("loginUser", loginUser);
		
		return "redirect:/reservationOne?reservationId="+reservationId; //완료 후 상세정보 페이지로 이동 
	} 
	
	
}
