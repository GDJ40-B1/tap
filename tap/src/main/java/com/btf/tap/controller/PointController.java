package com.btf.tap.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.btf.tap.service.PointService;
import com.btf.tap.vo.User;

@RestController
public class PointController {
	
	@Autowired PointService pointService;
	
	
	@GetMapping("point/getPointHistoryList")
	public List<Map> getPointHistoryList(User user) {
				
		// 이용자의 전체 포인트 이용 내역 가져오기
		List<Map> pointHistory = pointService.getPointHistoryList(user);		
		
		return pointHistory;
	}
	
	
}
