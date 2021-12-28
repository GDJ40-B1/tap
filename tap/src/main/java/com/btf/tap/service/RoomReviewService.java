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
import com.btf.tap.vo.RoomReviewComment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class RoomReviewService {
	@Autowired private RoomReviewMapper roomReviewMapper;
	
	// 해당숙소의 전체 후기 조회하기
	// 입력 : currentPage, rowPerPage  
	// 출력 : paramMap(list,lastPage,startPage,endPage) 
	public Map<String,Object> getRoomReviewList(int roomReviewCurrentPage, int roomId) {
		final int ROW_PER_PAGE = 5;
		
		log.debug(Font.HS + "입력된 파라미터 값 => " + roomReviewCurrentPage + "," + roomId + Font.RESET);
		
		// 데이터의 첫 번째 행
		int beginRow = 0;
		beginRow = (roomReviewCurrentPage-1)*ROW_PER_PAGE;
		
		// selectRoomReviewList() 메소드의 파라미터 객체(page) 생성
		Map<String,Object> page = new HashMap<>();
		page.put("beginRow", beginRow);
		page.put("rowPerPage", ROW_PER_PAGE);
		page.put("roomId", roomId);
		log.debug(Font.HS + "page 객체에 저장된 값 => " + page.toString() + Font.RESET);
		
		List<RoomReview> list = roomReviewMapper.selectRoomReviewList(page);
		
		
		// 전체 후기 수
		int totalRoomReviewCount = 0;
		totalRoomReviewCount = roomReviewMapper.totalRoomReivewCount(roomId);
		log.debug(Font.HS + "전체 후기 개수 => " + totalRoomReviewCount + Font.RESET);
		
		// 총 데이터의 마지막 페이지
		int lastPage = 0;
		lastPage = totalRoomReviewCount / ROW_PER_PAGE;
		if(totalRoomReviewCount % ROW_PER_PAGE != 0) {
			lastPage += 1;
		}
		
		// 페이징의 시작 페이지
		int startPage = 0;
		startPage = ((roomReviewCurrentPage-1)/ROW_PER_PAGE) * ROW_PER_PAGE + 1;
		
		// 페이징의 끝 페이지
		int endPage = 0;
		endPage = startPage + ROW_PER_PAGE - 1;
		
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("list", list);
		paramMap.put("lastPage", lastPage);
		paramMap.put("startPage", startPage);
		paramMap.put("endPage", endPage);
		paramMap.put("roomReviewCurrentPage", roomReviewCurrentPage);
	
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
	// 입력 : roomReviewId
	// 출력 : check(숙소후기글 삭제 개수)
	public int removeRoomReview(int roomReviewId) {
		// 입력받은 roomReviewId
		log.debug(Font.HS + "입력받은 roomReviewId 값 => " + roomReviewId + Font.RESET);
		
		int check = roomReviewMapper.deleteRoomReview(roomReviewId);
		
		// 숙소후기글 삭제 개수
		log.debug(Font.HS + "숙소후기글 삭제 개수 => " + check + Font.RESET);
		
		if(check == 1) {
			log.debug(Font.HS + "정상적으로 삭제 성공!" + Font.RESET);
		} else {
			log.debug(Font.HS + "삭제 실패!" + Font.RESET);
		}
		
		return check;
	}
	
	// ***** 숙소후기 답변 *****
	// 숙소후기 답변 작성하기
	public int addRoomReviewComment(RoomReviewComment roomReviewComment) {
		// 입력받은 roomReviewComment 객체 값
		log.debug(Font.HS + "입력받은 roomReviewComment 객체 값 => " + roomReviewComment.toString() + Font.RESET);
		
		int check = roomReviewMapper.insertRoomReviewComment(roomReviewComment);
		
		// 숙소후기 답변 추가 개수
		log.debug(Font.HS + "숙소후기 답변글 추가 개수 => " + check + Font.RESET);
		
		if(check == 1) {
			log.debug(Font.HS + "정상적으로 추가 성공!" + Font.RESET);
		} else {
			log.debug(Font.HS + "추가 실패!" + Font.RESET);
		}
		
		return check;
	}
	
	// 숙소후기 답변 삭제하기
	public int removeRoomReviewComment(int roomReviewId) {
		// 입력받은 roomReviewId
		log.debug(Font.HS + "입력받은 roomReviewId => " + roomReviewId + Font.RESET);
		
		int check = roomReviewMapper.deleteRoomReviewComment(roomReviewId);
		
		// 숙소후기 답변글 삭제 개수
		log.debug(Font.HS + "숙소후기 답변글 삭제 개수 => " + check + Font.RESET);
		
		if(check == 1) {
			log.debug(Font.HS + "정상적으로 삭제 성공!" + Font.RESET);
		} else {
			log.debug(Font.HS + "삭제 실패!" + Font.RESET);
		}
		
		return check;
	}
	
	// ******** 특정 회원의 숙소후기 ********
	// 전체 숙소후기 목록 조회하기
	public Map<String,Object> getMemberRoomReviewList(int currentPage, String memberId) {
		final int ROW_PER_PAGE = 5;
		
		// 데이터의 첫 번째 행
		int beginRow = 0;
		beginRow = (currentPage-1)*ROW_PER_PAGE;
		
		// selectMemberRoomReviewList() 메소드의 파라미터 객체(page) 생성
		Map<String,Object> page = new HashMap<>();
		page.put("beginRow", beginRow);
		page.put("rowPerPage", ROW_PER_PAGE);
		page.put("memberId", memberId);
		log.debug(Font.HS + "page 객체에 저장된 값 => " + page.toString() + Font.RESET);
		
		List<RoomReview> list = roomReviewMapper.selectMemberRoomReviewList(page);
		
		// 회원이 작성한 전체 후기 수
		int totalCount = roomReviewMapper.memberTotalRoomReviewCount(memberId);
		log.debug(Font.HS + "회원이 작성한 전체 후기 개수 => " + totalCount + Font.RESET);
		 
		// 총 데이터의 마지막 페이지
		int lastPage = 0;
		lastPage = totalCount / ROW_PER_PAGE;
		if(totalCount % ROW_PER_PAGE != 0) {
			lastPage += 1;
		}
		
		// 페이징의 시작 페이지
		int startPage = 0;
		startPage = ((currentPage-1)/ROW_PER_PAGE) * ROW_PER_PAGE + 1;
		
		// 페이징의 끝 페이지
		int endPage = 0;
		endPage = startPage + ROW_PER_PAGE - 1;
		
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("list", list);
		paramMap.put("lastPage", lastPage);
		paramMap.put("startPage", startPage);
		paramMap.put("endPage", endPage);
		paramMap.put("totalCount", totalCount);
		
		log.debug(Font.HS + "paramMap 객체에 저장된 값 => " + paramMap.toString() + Font.RESET);
		
		return paramMap;
	}
}
