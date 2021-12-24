package com.btf.tap.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btf.tap.mapper.PointMapper;
import com.btf.tap.vo.Point;
import com.btf.tap.vo.User;

@Service
public class PointService {
	@Autowired PointMapper pointMapper;
	
	// 포인트 이용 내역 리스트 가져오기
	// 입력: User => userId
	// 출력: List<Point> 
	public List<Point> getPointHistoryList(User user) {
		
		List<Point> pointHistory = pointMapper.selectgPointHistoryList(user);
		
		return pointHistory;
	}
	
	// 포인트 이용 유형별 횟숫 가져오기
	// 입력: User => userId
	// 출력: Map<Stirng, Integer> => userId : 이용자 ID ,charge : 충전, trans : 전환, spend : 지출, earn : 수입, refund : 환불
	public Map<String, Integer> getPointHistoryCategoryCount(User user) {
		
		
		
		Map<String, Integer> pointHistoryCategoryList = pointMapper.selectPointHistoryCategoryCount(user);
		
		return pointHistoryCategoryList; 
		
	}
	
}
