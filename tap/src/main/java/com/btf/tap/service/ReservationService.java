package com.btf.tap.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.AddressMapper;
import com.btf.tap.mapper.ReservationMapper;
import com.btf.tap.mapper.RoomMapper;
import com.btf.tap.vo.Address;
import com.btf.tap.vo.Notice;
import com.btf.tap.vo.PriceRoom;
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
	@Autowired
	PointService pointService;
	
	
	
	// 예약일 정보 추출하기
	public Map<String, Object> getAddReservation(int roomId)	{
		Map<String, Object> map = new HashMap<>();
		// 해당 숙소 예약일 목록
		map.put("ReservationDateList", getRoomReservationDateList(roomId));
		// 해당 숙소 예약일 날짜별로 분리
		map.put("ReservationListOfDate", getRoomReservationListOfDate(roomId));
		//디버그
		log.debug(Font.KSB + "서비스 단 map값 점검하기 : "+ map.toString() + Font.RESET);
		
		return map;
	}
	
	// 예약 기간을 통한 결제금액 계산
	public Reservation getPaymentPriceOfDate(Reservation reservation) {
		// 체크인, 체크아웃 Date 객체 선언
		Date checkInDate = null;
		Date checkOutDate = null;
		// Date 타입으로 날짜 받기
		try {
			checkInDate = new SimpleDateFormat("yyyy-MM-dd").parse(reservation.getCheckInDate());
			checkOutDate = new SimpleDateFormat("yyyy-MM-dd").parse(reservation.getCheckOutDate());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// 날짜 수 차이 계산
		long diffSec = (checkOutDate.getTime() - checkInDate.getTime()) / 1000;
		int diffDays = (int)(diffSec / (24*60*60))+1; // 일자 수 차이
		int finalPaymentPrice = reservation.getRoom().getRoomPrice()*diffDays; // 최종 가격
		reservation.setFinalPaymentPrice(finalPaymentPrice);
		
		return reservation;
	}
	
	// 예약 추가하기
	public int addReservation(Reservation reservation)	{
		int reservationId =reservationMapper.insertReservation(reservation);
		//디버그
		log.debug(Font.KSB + " addReservation 서비스 단 값 점검하기 : "+ reservation + Font.RESET);
		
		return reservation.getReservationId();
	}
	
	//예약정보 상세보기.
	public Reservation getReservationOne(int reservationId) {
		
		//reservationId값 받아옴 
		//받아온 reservationId 값을 다시 맵퍼로 모내고 그 값을 reservation에 저장해서 값 확인 
		Reservation reservation = reservationMapper.selectReservationOne(reservationId);
		log.debug(Font.KSB + "예약 상세정보 서비스 단 reservation값 점검하기 : "+ reservationId + Font.RESET);
		
		return reservation;
	}
		
	// 전체 예약 정보 리스트
	public Map<String, Object> getReservationList(int currentPage) {
		// 페이징에 필요한 요소들
		final int ROW_PER_PAGE = 10;
		final int PAGE_PER_PAGE = 10;
		int beginRow = (currentPage-1)*ROW_PER_PAGE;
		
		// 검색 결과 리스트 및 개수 추출
		Map<String, Object> selectReservationList = new HashMap<>();
		selectReservationList.put("beginRow", beginRow);
		selectReservationList.put("rowPerPage", ROW_PER_PAGE);
		
		List<Reservation> reservationList = reservationMapper.selectReservationList(selectReservationList);
		log.debug(Font.KSB +" reservationService단  reservationList 값 "+  reservationList.toString() + Font.RESET);
		log.debug(Font.KSB +" reservationService단 selectReservationList 값 "+  selectReservationList.toString() + Font.RESET);
		
		int totalData = reservationMapper.selectReservationNum();
		log.debug(Font.KSB +" reservationService단 totalData 들어오는 값 "+  totalData + Font.RESET);
		// 페이지 연산
		Map<String, Object> page = pageOperation(totalData, ROW_PER_PAGE, currentPage, PAGE_PER_PAGE);
		log.debug(Font.KSB +" reservationService단 page 들어오는 값 "+  page.toString() + Font.RESET);
		
		// return으로 넘길 값 map으로 묶어 보내기
		Map<String, Object> result = new HashMap<>();
		log.debug(Font.KSB +" reservationService단  result 값 "+  result.toString() + Font.RESET);
		
		result.put("reservationList", reservationList);
		result.put("rowPerPage", ROW_PER_PAGE);
	    result.put("lastPage", page.get("lastPage"));
	    result.put("lastnumPage", page.get("lastnumPage"));
	    result.put("currentnumPage", page.get("currentnumPage"));
	    result.put("pagePerPage", PAGE_PER_PAGE);
	    
		return result;
	}
	
	// 호스트 숙소 전체 리스트 출력(최근 생성된 숙소 순으로)
	   public List<Reservation> getHostReservationList(String hostId) {
	      List<Reservation> reservationList = reservationMapper.selectHostReservationList(hostId);
	      return reservationList;
	   }
	
	// 특정 숙소의 예약 목록 추출
	public List<Reservation> getRoomReservationList(int roomId) {
		return reservationMapper.selectRoomReservation(roomId);
	}
	
	// 특정 숙소의 유효한 예약 개수 추출
	public int getRoomReservationYetCount(int roomId) {
		return reservationMapper.selectRoomReservationYetCount(roomId);
	}
	
	// 페이징 알고리즘
	   public Map<String, Object> pageOperation(int totalData, int ROW_PER_PAGE, int currentPage, int PAGE_PER_PAGE){
	      Map<String, Object> pageElement = new HashMap<>();
	      
	      /*---페이지 연산 시작---*/
	      // 마지막 페이지 구하는 연산
	      int lastPage= totalData/ROW_PER_PAGE;
	        if(totalData%ROW_PER_PAGE!=0){
	           lastPage +=1;
	        }
	        
	        // 현재 페이지가 PAGE_PER_PAGE 기준 몇번째 묶음인지
	        int currentnumPage;
	        if(currentPage%PAGE_PER_PAGE==0){
	          currentnumPage =(currentPage/PAGE_PER_PAGE)-1;
	       } else{
	          currentnumPage = currentPage/PAGE_PER_PAGE;
	       }
	        
	        // 마지막 페이지가 PAGE_PER_PAGE 기준 몇번째 묶음인지
	        int lastnumPage;
	        if(lastPage%PAGE_PER_PAGE==0){
	          lastnumPage =(lastPage/PAGE_PER_PAGE)-1;
	       } else{
	          lastnumPage = lastPage/PAGE_PER_PAGE;
	       }
	        /*---페이지 연산 끝---*/
	        
	        pageElement.put("lastPage", lastPage);
	        pageElement.put("currentnumPage", currentnumPage);
	        pageElement.put("lastnumPage", lastnumPage);
	        
	        return pageElement;
	   }
	//예약 수정하기.
	public void modifyReservation(Reservation reservation) {
		reservationMapper.updateReservation(reservation);
	}
	//예약 삭제하기.
	public void deleteReservation(Reservation reservation) {
		// 환불시 결제테이블에서 환불여부 수정
		pointService.refundPayment(reservation.getReservationId());
		reservationMapper.deleteReservation(reservation);
	}
	
	// 특정 숙소 예약일 목록 추출
   public List<Reservation> getRoomReservationDateList(int roomId) {
	   return reservationMapper.selectRoomReservationDateList(roomId);
   }
   
   // 특정 숙소 예약일 목록의 날짜 리스트 구현
   public List<String> getRoomReservationListOfDate(int roomId){
	   List<Reservation> reservationList = getRoomReservationDateList(roomId);
	   
	   List<String> reservationDate = new ArrayList<>();
	   
	   for(Reservation r : reservationList) {
		   String checkInDate = r.getCheckInDate();
	       String checkOutDate = r.getCheckOutDate();
	       // 시작 날짜를 년,월,일로 분리
	       int startYear = Integer.parseInt(checkInDate.substring(0,4));
	       int startMonth= Integer.parseInt(checkInDate.substring(5,7));
	       int startDate = Integer.parseInt(checkInDate.substring(8,10));
	       
	       // 캘린더 객체 생성
	       Calendar cal = Calendar.getInstance();
	        
	       // Calendar의 Month는 0부터 시작하므로, 값을 맞추기 위해 실제 월 값에 -1을 해준다.
	       // Calendar의 기본 날짜를 startDt로 셋팅해준다.
	       cal.set(startYear, startMonth -1, startDate);
	        
	       while(true) {
	           // 날짜를 yyyy-MM-dd 형식으로 포맷
	    	   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    	   // 포맷한 날짜를 String으로 변환 후, return될 리스트에 추가
	    	   String dateStr = dateFormat.format(cal.getTime());
	    	   String resultStr = dateStr;
	    	   // Datepicker의 사용을 위해 월 또는 일이 한 자리수라면, 앞의 0을 빼야함.<8,5>
	    	   if(resultStr.substring(8,9).equals("0")) {
	    		   resultStr = resultStr.substring(0,8)+resultStr.substring(9,10);
	    	   }
	    	   if(resultStr.substring(5,6).equals("0")) {
	    		   resultStr = resultStr.substring(0,5)+resultStr.substring(6);
	    	   }
	    	   reservationDate.add(resultStr);
	           // 현재 날짜가 마지막 날과 같다면 종료
	           if(dateStr.equals(checkOutDate)) {
	        	   break;
	           }
	           
	           // Calendar의 날짜를 하루 증가시킨다.
	           cal.add(Calendar.DATE, 1);
	       }
	   }
	   return reservationDate;
   }
   
   	// 특정 숙소 월별 예약 인원수 조회
	public List<Map<String, Object>> getRoomReservationCheck(int roomId, int year) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("roomId", roomId);
		paramMap.put("year", year);
		
		List<Map<String, Object>> list = reservationMapper.selectRoomReservationCheck(paramMap);
		log.debug(Font.JSB + list.toString() + Font.RESET);
		
		return list;		
	}
}
