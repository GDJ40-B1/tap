package com.btf.tap.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.AddressMapper;
import com.btf.tap.mapper.HashtagMapper;
import com.btf.tap.mapper.PartMapper;
import com.btf.tap.mapper.RoomMapper;
import com.btf.tap.vo.Address;
import com.btf.tap.vo.Hashtag;
import com.btf.tap.vo.PriceRoom;
import com.btf.tap.vo.Room;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class RoomService {
   @Autowired RoomMapper roomMapper;
   @Autowired AddressMapper addressMapper;
   @Autowired HashtagService hashtagService;
   @Autowired CouponService couponService;
   @Autowired AmenitiesService amenitiesService;
   @Autowired PartService partService;
   @Autowired ImageService imageService;
   
   // 사용자 설정 선호지역 별 인기 숙소 리스트
   public Map<String, Object> getPreferLocalRoomList(int preferRoomCurrent, String sido, String sigungu) {
      final int defaultPage = 10;
      final int rowPerPage = 10;
      int startPage = ((preferRoomCurrent - 1) / defaultPage) * defaultPage + 1;
      int endPage = startPage + defaultPage - 1;      
      int beginRow = (preferRoomCurrent-1) * rowPerPage;
      int lastPage = 0;
      
      Map<String, Object> page = new HashMap<>();
      page.put("beginRow", beginRow);
      page.put("rowPerPage", rowPerPage);
      page.put("sido", sido);
      page.put("sigungu", sigungu);
      
      List<Room> list = roomMapper.selectPreferLocalRoomList(page);
      log.debug(Font.JSB + list.toString() + Font.RESET);
      
      int totalRowCount = roomMapper.preferLocalRoomTotalCount(page);
      
      lastPage = totalRowCount / rowPerPage;
      
      if(totalRowCount % rowPerPage != 0) {
         lastPage+=1;
      }
      
      if(endPage > lastPage) {
         endPage = lastPage;
      }      
      
      Map<String, Object> paramMap = new HashMap<>();
      paramMap.put("list", list);
      paramMap.put("startPage", startPage);
      paramMap.put("endPage", endPage);
      paramMap.put("lastPage", lastPage);
      
      return paramMap;
   }
   
   // 숙소 전체 리스트 출력(최근 생성된 숙소 순으로)
   public Map<String, Object> getRoomList(int currentPage) {
      // 페이징에 필요한 요소들
      final int ROW_PER_PAGE = 10;
      final int PAGE_PER_PAGE = 10;
      int beginRow = (currentPage-1)*ROW_PER_PAGE;
      
      // 검색 결과 리스트 및 개수 추출
      Map<String, Object> selectListElement = new HashMap<>();
      selectListElement.put("beginRow", beginRow);
      selectListElement.put("rowPerPage", ROW_PER_PAGE);
      
      List<Room> roomList = roomMapper.selectRoomList(selectListElement);
      int totalData = roomMapper.selectRoomNum();
      
      // 페이지 연산
      Map<String, Object> pageElement = pageOperation(totalData, ROW_PER_PAGE, currentPage, PAGE_PER_PAGE);
      
      // return으로 넘길 값 map으로 묶어 보내기
      Map<String, Object> result = new HashMap<>();
      result.put("roomList", roomList);
      result.put("rowPerPage", ROW_PER_PAGE);
       result.put("lastPage", pageElement.get("lastPage"));
       result.put("lastnumPage", pageElement.get("lastnumPage"));
       result.put("currentnumPage", pageElement.get("currentnumPage"));
       result.put("pagePerPage", PAGE_PER_PAGE);
       
      return result;
   }
   
   // 검색 결과 숙소 리스트 추출
   public Map<String, Object> getsearchResultRoomList(String searchText, int currentPage){
      // 페이징에 필요한 요소들
      final int ROW_PER_PAGE = 1;
      final int PAGE_PER_PAGE = 10;
      int beginRow = (currentPage-1)*ROW_PER_PAGE;
      
      // 검색 결과 리스트 및 개수 추출
      Map<String, Object> selectListElement = new HashMap<>();
      selectListElement.put("searchText", searchText);
      selectListElement.put("beginRow", beginRow);
      selectListElement.put("rowPerPage", ROW_PER_PAGE);
      
      List<Room> roomList = roomMapper.selectSearchResultRoomList(selectListElement); // 검색결과 숙소정보
      int totalData = roomMapper.selectSearchResultRoomNum(searchText); // 검색결과 숙소개수
      
      // 페이지 연산
      Map<String, Object> pageElement = pageOperation(totalData, ROW_PER_PAGE, currentPage, PAGE_PER_PAGE);
      
      // return으로 넘길 값 map으로 묶어 보내기
      Map<String, Object> result = new HashMap<>();
      result.put("roomList", roomList);
      result.put("rowPerPage", ROW_PER_PAGE);
       result.put("lastPage", pageElement.get("lastPage"));
       result.put("lastnumPage", pageElement.get("lastnumPage"));
       result.put("currentnumPage", pageElement.get("currentnumPage"));
       result.put("pagePerPage", PAGE_PER_PAGE);
      return result;
   }
   
   // 특정 숙소 정보 추출
   public Map<String, Object> getRoomOne(int roomId, int detailAddressId, String memberId){
      Map<String, Object> result = new HashMap<>();
      Address address = addressMapper.selectAddressOne(detailAddressId);
      
      // 시도+시군구+도로명+상세주소 합치기 => kakao 지도 API 검색을 위해
      String detailAddress = address.getSido()+" "+address.getSigungu()+" "+address.getRoadName()+" "+address.getDetailAddress();
      address.setDetailAddress(detailAddress);
      
      // 주소 정보
      result.put("address", address);
      // 숙소 정보
      result.put("room", roomMapper.selectRoomOne(roomId));
      // 해시태그 정보
      result.put("hashtag", hashtagService.getHashtag("room", roomId));
      // 쿠폰 목록 추출
      if(memberId.equals("")) {
         // 로그인 되어있지 않다면, 해당 숙소의 모든 쿠폰 추출
         result.put("couponList", couponService.getRoomCouponList(roomId));
      } else {
         // 로그인 되어있다면 자신의 보유쿠폰을 제외하고 추출
         Map<String, Object> memberCoupon = new HashMap<>();
         memberCoupon.put("memberId", memberId);
         memberCoupon.put("roomId", roomId);
         result.put("couponList", couponService.getNotMemberCoupon(memberCoupon));
      }
      
      // 숙소의 비품 정보
      result.put("amenitiesList", amenitiesService.getRoomAmenitiesList(roomId));
      // 숙소의 구성 정보
      result.put("roomPartList", partService.getRoomPartList(roomId));
      
      return result;
   }
   
   // 숙소 카테고리 리스트 추출
   public List<String> getRoomCategory(){
      List<String> roomCategoryList = roomMapper.selectRoomCategory();
      return roomCategoryList;
   }
   
   
   /* 호스트 관련 메서드 */
   
   // 특정 숙소 정보 추출
   public Map<String, Object> getHostRoomOne(int roomId, int detailAddressId){
      Map<String, Object> result = new HashMap<>();
      Address address = addressMapper.selectAddressOne(detailAddressId);
      
      // 시도+시군구+도로명+상세주소 합치기 => kakao 지도 API 검색을 위해
      String detailAddress = address.getSido()+" "+address.getSigungu()+" "+address.getRoadName()+" "+address.getDetailAddress();
      address.setDetailAddress(detailAddress);
      
      // 주소 정보
      result.put("address", address);
      // 숙소 정보
      result.put("room", roomMapper.selectRoomOne(roomId));
      // 해시태그 정보
      result.put("hashtag", hashtagService.getHashtag("room", roomId));
      // 숙소의 비품 정보
      result.put("amenitiesList", amenitiesService.getRoomAmenitiesList(roomId));
      // 숙소의 구성 정보
      result.put("roomPartList", partService.getRoomPartList(roomId));
      // 이미기 정보
      result.put("imageList", imageService.getTargetImage("room", roomId));
      
      return result;
   }
   
   // 숙소 등록(숙소 and 상세 주소)
   public Room addRoom(Room room, Address address, String hashtag,
		   String amenities, String part, MultipartHttpServletRequest mtRequest) {
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
      
      // 해시태그 추가
      hashtagService.addHashtag(hashtag, "room", room.getRoomId());
      
      // 비품 추가
      amenitiesService.addRoomAmenitiesList(amenities, room.getRoomId());
      
      // 구성 추가
      partService.addRoomPart(part, room.getRoomId());
      
      // 이미지 추가
      imageService.addImage(mtRequest, "room", room.getRoomId());
      
      // 생성된 숙소의 ID값과 상세주소 ID값이 담긴 숙소 객체를 넘긴다.
      Room newRoom = new Room();
      newRoom.setDetailAddressId(address.getDetailAddressId());
      newRoom.setRoomId(room.getRoomId());
      return newRoom;
   }
   
   // 숙소 정보 수정(숙소 and 상세 주소)
   public Address modifyRoom(Room room, Address address, String hashtag,
		   String amenities, String part, MultipartHttpServletRequest mtRequest) {
      // 입력받은 도로명 주소를 분할하여 객체에 넣기
      String[] addressList = address.getDetailAddress().split(" ");
      address.setSido(addressList[0]);
      address.setSigungu(addressList[1]);
      address.setRoadName(addressList[2]);
      address.setDetailAddress(addressList[3]);
      
      // address 테이블 단 주소 변경 적용을 위해.
      // addressId를 구하고 변경사항을 저장한다
      address.setAddressId(addressMapper.searchAddressOne(address).getAddressId());
      addressMapper.updateDetailAddress(address);
      
      // 숙소 변경사항 적용
      roomMapper.updateRoom(room);
      
      // 해시태그 업데이트
      hashtagService.modifyHashtag(hashtag, "room", room.getRoomId());
      
      // 비품 수정
      amenitiesService.modifyRoomAmenities(amenities, room.getRoomId());
      
      // 구성 수정
      partService.modifyRoomPart(part, room.getRoomId());
      
      // 이미지 수정
      imageService.modifyTargetImage(mtRequest, "room", room.getRoomId());
      
      return address;
   }
   
   // 숙소 삭제(숙소 and 상세 주소)
   public void removeRoom(HttpServletRequest request, int roomId) {
      
      // 숙소 상세 주소 ID
      int detailAddressId = roomMapper.selectRoomOne(roomId).getDetailAddressId();
      
      // 숙소 이미지 삭제
      imageService.removeImage(request, "room", roomId);
      
      // 숙소별 가격 삭제
      roomMapper.deletePriceRoom(roomId);
      
      // 해시태그 삭제
      hashtagService.removeHashtag("room", roomId);
      
      // 숙소별 구성 삭제
      partService.removeRoomPart(roomId);
      
      // 숙소별 비품 삭제
      amenitiesService.removeRoomAmenities(roomId);
      
      // 숙소 정보 삭제
      roomMapper.deleteRoom(roomId);
      
      // 상세 주소 정보 삭제
      addressMapper.deleteDetailAddress(detailAddressId);
   }
   
   // 호스트 숙소 전체 리스트 출력(최근 생성된 숙소 순으로)
   public List<Room> getHostRoomList(String hostId) {
      List<Room> roomList = roomMapper.selectHostRoomList(hostId);
      return roomList;
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
   
   /*---숙소별 가격 시작---*/
   
   // 숙소별 가격 목록 추출
   public List<PriceRoom> getPriceRoomList(int roomId) {
	   return roomMapper.selectPriceRoomList(roomId);
   }
   
   // 숙소별 가격 목록의 날짜 리스트 구현
   public List<String> getPriceRoomDateList(int roomId){
	   List<PriceRoom> priceRoom = getPriceRoomList(roomId);
	   
	   List<String> priceRoomDate = new ArrayList<>();
	   
	   for(PriceRoom pr : priceRoom) {
		   String priceStartDate = pr.getStartDate();
	       String priceEndDate = pr.getEndDate();
	       // 시작 날짜를 년,월,일로 분리
	       int startYear = Integer.parseInt(priceStartDate.substring(0,4));
	       int startMonth= Integer.parseInt(priceStartDate.substring(5,7));
	       int startDate = Integer.parseInt(priceStartDate.substring(8,10));
	       
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
	    	   priceRoomDate.add(resultStr);
	           // 현재 날짜가 마지막 날과 같다면 종료
	           if(dateStr.equals(priceEndDate)) {
	        	   break;
	           }
	           
	           // Calendar의 날짜를 하루 증가시킨다.
	           cal.add(Calendar.DATE, 1);
	       }
	   }
	   return priceRoomDate;
   }
   
   // 숙소별 가격 추가
   public void addPriceRoom(int roomId, PriceRoom priceRoom) {
	   Map<String,Object> map = new HashMap<>();
	   map.put("roomId", roomId);
	   map.put("startDate", priceRoom.getStartDate());
	   map.put("endDate", priceRoom.getEndDate());
	   map.put("price", priceRoom.getPrice());
	   
	   roomMapper.insertPriceRoom(map);
   }
   
   // 숙소별 가격 삭제
   public void removePriceRoom(int priceRoomId) {
	   roomMapper.deletePriceRoomOne(priceRoomId);
   }
   
   /*---숙소별 가격 끝---*/
   
   // 마지막 등록한 숙소 ID값 조회
   public int getLastRoom(String hostId) {
	   int roomId = roomMapper.selectLastRoom(hostId);

	   return roomId;
   }
   
   // 숙소 연도별 이용 연령층 조회
   public List<Map<String, Object>> getRoomAgeList(int roomId, int year) {
	   Map<String, Object> paramMap = new HashMap<>();
	   paramMap.put("roomId", roomId);
	   paramMap.put("year", year);
	   
	   List<Map<String, Object>> list = roomMapper.selectRoomAgeList(paramMap);
	   log.debug(Font.JSB + list.toString() + Font.RESET);
	   
	   return list;
   }
   
   // 1회 이상 결제처리 된 숙소 리스트 조회
   public List<Room> getPayRoomList(String hostId) {
	   List<Room> list = new ArrayList<>();
	   list = roomMapper.selectPayRoomList(hostId);
	   log.debug(Font.JSB + list.toString() + Font.RESET);
	   
	   return list;
   }
}