package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Report;

@Mapper
public interface ReportMapper {
	List<Report> selectReportList(Map<String, Object> page); // 작성자 카테고리별 전체 신고 내역 조회
	int totalReportRowCount(String writerCategory); // 전체 페이지 수
}
