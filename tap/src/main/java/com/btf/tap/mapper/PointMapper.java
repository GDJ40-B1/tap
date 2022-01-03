package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Point;
import com.btf.tap.vo.User;

@Mapper
public interface PointMapper {
	void updatePayment(int reservationId);
	List<Point> selectgPointHistoryList(User user);						// 이용자의 포인트 이용 내역 리스트 조회하기
	Map<String,Integer> selectPointHistoryCategoryCount(User user);		// 이용자의 각 포인트 이용 유형별 횟수 조회하기
	Map<String, Double> selectPointHistoryCategorySummary(User user);	// 이용자의 각 포인트 이용 유형별 금액 조회하기
}
