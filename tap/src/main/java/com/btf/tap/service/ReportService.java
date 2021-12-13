package com.btf.tap.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.ReportMapper;
import com.btf.tap.vo.Report;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ReportService {
	@Autowired private ReportMapper reportMapper;
	
	// 작성자 카테고리별 전체 신고 내역 조회
	public Map<String,Object> getReportList(String writerCategory, int currentPage, int rowPerPage) {
		// 데이터 시작 행
		int beginRow = (currentPage-1)*rowPerPage;
		
		// selectReportList() 메소드의 page 매개변수 객체 생성
		Map<String,Object> page = new HashMap<>();
		page.put("writerCategory", writerCategory);
		page.put("beginRow", beginRow);
		page.put("rowPerPage", rowPerPage);
		log.debug(Font.HS + "getListServ : " + page.toString() + Font.RESET);
		
		List<Report> list = reportMapper.selectReportList(page);
		log.debug(Font.HS + "getListServ : " + list.toString() + Font.RESET);
		
		// 신고 내역 총 개수
		int totalReportRowCount = reportMapper.totalReportRowCount(writerCategory);
		log.debug(Font.HS + "getListServ : " + totalReportRowCount + Font.RESET);
		
		int lastPage = 0;
		
		// 총 데이터 중 마지막 페이지
		lastPage = totalReportRowCount / rowPerPage;
		if(totalReportRowCount % rowPerPage != 0) {
			lastPage += 1;
		}
		log.debug(Font.HS + "getListServ : " + lastPage + Font.RESET);
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("list", list);
		paramMap.put("lastPage", lastPage);
		log.debug(Font.HS + "getListServ : " + paramMap.toString() + Font.RESET);
		
		return paramMap;
	}
}
