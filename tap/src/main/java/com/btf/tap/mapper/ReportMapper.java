package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Report;

@Mapper
public interface ReportMapper {
	List<Report> selectReportList(Map<String, Object> page); // 작성자 카테고리별 전체 신고 내역 조회
	int totalReportRowCount(String writerCategory); // 전체 페이지 수
	int insertReport(Report report); // 신고글 작성하기
	int deleteReport(Report report); // 신고글 삭제하기
	int updateReport(Report report); // 신고글 수정하기(승인여부)
}
