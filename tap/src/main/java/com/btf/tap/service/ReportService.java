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
	// 입력 : writerCategory(작성자 카테고리),currentPage,rowPerPage
	// 출력 : paramMap(list,lastPage,startPage,endPage)
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
		
		// 페이징의 시작 페이지
		int startPage = 0;
		startPage = ((currentPage-1) / rowPerPage) * rowPerPage + 1;
		
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
		log.debug(Font.HS + "getListServ : " + paramMap.toString() + Font.RESET);
		
		
		return paramMap;
	}
		
	// 신고글 작성하기
	// 입력 : report 
	// 출력 : check(게시글 작성된 수)
	public int addReport(Report report) {
		// 입력받은 신고글 정보
		log.debug(Font.HS + "addReportServ : " + report.toString() + Font.RESET);
		
		int check = reportMapper.insertReport(report);
		if(check == 1) {
			log.debug(Font.HS + "추가 성공!" + Font.RESET);
		} else {
			log.debug(Font.HS + "추가 실패!" + Font.RESET);
		}
		
		// 신고글 작성 수
		log.debug(Font.HS + "addReportServ : " + check + Font.RESET);
		
		return check;
	}
	
	// 신고글 삭제하기
	// 입력 : report(작성자id,신고대상,신고대상카테고리)
	// 출력 : check(삭제된 신고글 수)
	public int removeReport(Report report) {
		// 삭제할 신고글 정보
		log.debug(Font.HS + "removeReportServ : " + report.toString() + Font.RESET);
		
		int check = reportMapper.deleteReport(report);
		if(check == 1) {
			log.debug(Font.HS + "삭제 성공!" + Font.RESET);
		} else {
			log.debug(Font.HS + "삭제 실패!" + Font.RESET);
		}
		
		// 신고글 삭제 수
		log.debug(Font.HS + "removeReportServ : " + check + Font.RESET);
		
		return check;
	}
	
	// 신고글 승인여부 수정하기
	// 입력 : report(작성자id,신고대상,신고대상카테고리)
	// 출력 : check(수정 된 신고글 수)
	public int modifyReport(Report report) {
		// 수정할 정보
		log.debug(Font.HS + "modifyReportServ : " + report.getApprovalStatus() + Font.RESET);
		
		// 정보 수정 성공, 실패
		int check = reportMapper.updateReport(report);
		if(check == 1) {
			log.debug(Font.HS + "정보 수정 성공!" + Font.RESET);
		} else {
			log.debug(Font.HS + "정보 수정 실패!" + Font.RESET);
		}
		
		// 신고글 수정 수
		log.debug(Font.HS + "modifyReportServ : " + check + Font.RESET);
				
		return check;
	}
}
