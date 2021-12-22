package com.btf.tap.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.RoomQuestionMapper;
import com.btf.tap.vo.RoomQnaAnswer;
import com.btf.tap.vo.RoomQuestion;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class RoomQuestionService {
	@Autowired RoomQuestionMapper roomQuestionMapper;
	
	// 특정 숙소 문의 리스트
	public Map<String, Object> getRoomQnaList(int roomQnaCurrentPage, int roomId) {
		final int defaultPage = 10;
		final int rowPerPage = 10;
		int roomQnaStartPage = ((roomQnaCurrentPage - 1) / defaultPage) * defaultPage + 1;
		int roomQnaEndPage = roomQnaStartPage + defaultPage - 1;		
		int beginRow = (roomQnaCurrentPage-1) * rowPerPage;
		int roomQnaLastPage = 0;
		
		Map<String, Object> page = new HashMap<>();
		page.put("beginRow", beginRow);
		page.put("rowPerPage", rowPerPage);
		page.put("roomId", roomId);
		
		List<RoomQuestion> list = roomQuestionMapper.selectRoomQnaList(page);
		log.debug(Font.JSB + list.toString() + Font.RESET);
		
		int totalRowCount = roomQuestionMapper.totalRowCount(roomId);
		
		roomQnaLastPage = totalRowCount / rowPerPage;
		
		if(totalRowCount % rowPerPage != 0) {
			roomQnaLastPage+=1;
		}
		
		if(roomQnaEndPage > roomQnaLastPage) {
			roomQnaEndPage = roomQnaLastPage;
		}		
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("list", list);
		paramMap.put("roomQnaStartPage", roomQnaStartPage);
		paramMap.put("roomQnaEndPage", roomQnaEndPage);
		paramMap.put("roomQnaLastPage", roomQnaLastPage);
		paramMap.put("roomQnaCurrentPage", roomQnaCurrentPage);
		
		return paramMap;
	}
	
	// 숙소 문의 글 삽입
	public void addRoomQuestion(RoomQuestion roomQuestion) {
		roomQuestionMapper.insertRoomQna(roomQuestion);
	}	
	
	// 숙소 문의 답변 삽입
	public void addRoomQnaAnswer(RoomQnaAnswer roomQnaAnswer) {
		roomQuestionMapper.insertRoomQnaAnswer(roomQnaAnswer);
	}

	// 숙소 문의 글 삭제
	public void removeRoomQuestion(int roomQna) {
		roomQuestionMapper.deleteRoomQuestion(roomQna);
	}		
	
	// 숙소 문의 답변 삭제
	public void removeRoomQnaAnswer(int roomQnaId) {
		roomQuestionMapper.deleteRoomQnaAnswer(roomQnaId);
	}
}
