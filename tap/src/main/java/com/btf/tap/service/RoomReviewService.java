package com.btf.tap.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.RoomReviewMapper;
import com.btf.tap.vo.RoomReview;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class RoomReviewService {
	@Autowired private RoomReviewMapper roomReviewMapper;
	
	// 해당숙소의 전체 후기 조회하기
	// 입력 : currentPage, rowPerPage  
	// 출력 : paramMap(list,lastPage,startPage,endPage) 
	public Map<String,Object> getRoomReviewList(int currentPage, int rowPerPage) {
		// 데이터의 첫 번째 행
		int beginRow = 0;
		beginRow = (currentPage-1)*rowPerPage;
		
		// selectRoomReviewList() 메소드의 파라미터 객체(page) 생성
		Map<String,Object> page = new HashMap<>();
		page.put("beginRow", beginRow);
		page.put("rowPerPage", rowPerPage);
		log.debug(Font.HS + "page 객체에 저장된 값 => " + page.toString() + Font.RESET);
		
		List<RoomReview> list = roomReviewMapper.selectRoomReviewList(page);
		
		// 전체 후기 수
		int totalRoomReviewCount = 0;
		totalRoomReviewCount = roomReviewMapper.totalRoomReivewCount();
		log.debug(Font.HS + "전체 후기 개수 => " + totalRoomReviewCount + Font.RESET);
		
		// 총 데이터의 마지막 페이지
		int lastPage = 0;
		lastPage = totalRoomReviewCount / rowPerPage;
		if(totalRoomReviewCount % rowPerPage != 0) {
			lastPage += 1;
		}
		
		// 페이징의 시작 페이지
		int startPage = 0;
		startPage = ((currentPage-1)/rowPerPage) * rowPerPage + 1;
		
		// 페이징의 끝 페이지
		int endPage = 0;
		endPage = startPage + rowPerPage - 1;
		
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("list", list);
		paramMap.put("lastPage", lastPage);
		paramMap.put("startPage", startPage);
		paramMap.put("endPage", endPage);
		log.debug(Font.HS + "paramMap 객체에 저장된 값 => " + paramMap.toString() + Font.RESET);
		
		return paramMap;
	}
	
	// 숙소후기 작성하기
	// 입력 : roomReview(숙소후기 추가 입력정보)
	// 출력 : check(숙소후기글 추가 개수)
	public int addRoomReview(RoomReview roomReview) {
		// 입력받은 숙소후기 정보
		log.debug(Font.HS + "입력받은 숙소후기 정보 => " + roomReview.toString() + Font.RESET);
		
		int check = roomReviewMapper.insertRoomReview(roomReview);
		
		// 숙소후기글 추가 개수
		log.debug(Font.HS + "숙소후기글 추가 개수 => " + check + Font.RESET);
		
		if(check == 1) {
			log.debug(Font.HS + "정상적으로 추가 성공!" + Font.RESET);
		} else {
			log.debug(Font.HS + "추가 실패!" + Font.RESET);
		}
		
		return check;
	}
	
	// 숙소후기 삭제하기
	// 입력 : roomReview(숙소후기 삭제 입력 정보)
	// 출력 : check(숙소후기글 삭제 개수)
	public int removeRoomReview(RoomReview roomReview) {
		// 입력받은 숙소후기 정보
		log.debug(Font.HS + "입력받은 숙소후기 정보 => " + roomReview.toString() + Font.RESET);
		
		int check = roomReviewMapper.deleteRoomReview(roomReview);
		
		// 숙소후기글 삭제 개수
		log.debug(Font.HS + "숙소후기글 삭제 개수 => " + check + Font.RESET);
		
		if(check == 1) {
			log.debug(Font.HS + "정상적으로 삭제 성공!" + Font.RESET);
		} else {
			log.debug(Font.HS + "삭제 실패!" + Font.RESET);
		}
		
		return check;
	}
}
