package com.btf.tap.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

import com.btf.tap.service.PointService;
import com.btf.tap.vo.Point;
import com.btf.tap.vo.User;

@RestController
public class PointController {
	
	@Autowired PointService pointService;
	
	
	@GetMapping("point/getPointHistoryList")
	public Object getPointHistoryList(User user, @ModelAttribute("Point") Point point) {
				
		// 이용자의 전체 포인트 이용 내역 가져오기
		List<Point> pointList = pointService.getPointHistoryList(user);		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 데이터 테이블에 이용자의 전체 포인트 이용 내역을 보내주도록 data라는 키 값에 list를 저장
		map.put("data", pointList);
		
		// 오브젝트 형식으로 map을 전달
		Object result = map; 
		
		return result;
	}
	
	
}
