package com.btf.tap.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.RoomQuestionMapper;
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
		int startPage = ((roomQnaCurrentPage - 1) / defaultPage) * defaultPage + 1;
		int endPage = startPage + defaultPage - 1;		
		int beginRow = (roomQnaCurrentPage-1) * rowPerPage;
		int lastPage = 0;
		
		Map<String, Object> page = new HashMap<>();
		page.put("beginRow", beginRow);
		page.put("rowPerPage", rowPerPage);
		page.put("roomId", roomId);
		
		List<RoomQuestion> list = roomQuestionMapper.selectRoomQnaList(page);
		log.debug(Font.JSB + list.toString() + Font.RESET);
		
		int totalRowCount = roomQuestionMapper.totalRowCount(roomId);
		
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
}
