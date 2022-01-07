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

	// 특정 숙소 미답변 문의 리스트
	public Map<String, Object> getUnansweredRoomQnaList(int unansweredCurrentPage, String hostId) {
		final int defaultPage = 10;
		final int rowPerPage = 10;
		int unansweredStartPage = ((unansweredCurrentPage - 1) / defaultPage) * defaultPage + 1;
		int unansweredEndPage = unansweredStartPage + defaultPage - 1;		
		int beginRow = (unansweredCurrentPage-1) * rowPerPage;
		int unansweredLastPage = 0;
		
		Map<String, Object> page = new HashMap<>();
		page.put("beginRow", beginRow);
		page.put("rowPerPage", rowPerPage);
		page.put("hostId", hostId);
		
		List<Map<String, Object>> list = roomQuestionMapper.unansweredRoomQnaList(page);
		log.debug(Font.JSB + list.toString() + Font.RESET);
		
		int totalRowCount = roomQuestionMapper.unansweredRoomQnaTotalRowCount(hostId);
		
		unansweredLastPage = totalRowCount / rowPerPage;
		
		if(totalRowCount % rowPerPage != 0) {
			unansweredLastPage+=1;
		}
		
		if(unansweredEndPage > unansweredLastPage) {
			unansweredEndPage = unansweredLastPage;
		}		
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("list", list);
		paramMap.put("unansweredStartPage", unansweredStartPage);
		paramMap.put("unansweredEndPage", unansweredEndPage);
		paramMap.put("unansweredLastPage", unansweredLastPage);
		paramMap.put("unansweredCurrentPage", unansweredCurrentPage);
		
		return paramMap;
	}	
	
	// 숙소 문의 글 삽입
	public void addRoomQuestion(RoomQuestion roomQuestion) {
		String content = roomQuestion.getContent();
		roomQuestion.setContent(content.replace("\r\n","<br>"));
		
		roomQuestionMapper.insertRoomQna(roomQuestion);
	}	
	
	// 숙소 문의 답변 삽입
	public void addRoomQnaAnswer(RoomQnaAnswer roomQnaAnswer) {
		String content = roomQnaAnswer.getAnswer();
		roomQnaAnswer.setAnswer(content.replace("\r\n","<br>"));
		
		roomQuestionMapper.insertRoomQnaAnswer(roomQnaAnswer);
		roomQuestionMapper.updateAnswerCheck(roomQnaAnswer);
	}

	// 숙소 문의 글 삭제
	public void removeRoomQuestion(int roomQna) {
		roomQuestionMapper.deleteRoomQuestion(roomQna);
	}		
	
	// 숙소 문의 답변 삭제
	public void removeRoomQnaAnswer(int roomQnaId) {
		RoomQnaAnswer roomQnaAnswer = new RoomQnaAnswer();
		roomQnaAnswer.setRoomQnaId(roomQnaId);
		
		roomQuestionMapper.deleteRoomQnaAnswer(roomQnaAnswer);
		roomQuestionMapper.updateAnswerCheck(roomQnaAnswer);
	}
	
	// 문의 미답변 수 체크
	public int unansweredRoomQnaCount(String hostId) {
		int unansweredRoomQnaCount = roomQuestionMapper.unansweredRoomQnaTotalRowCount(hostId);
		log.debug(Font.JSB + unansweredRoomQnaCount + Font.RESET);
		
		return unansweredRoomQnaCount;
		
	}
}
