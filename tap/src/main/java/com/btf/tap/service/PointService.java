package com.btf.tap.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btf.tap.mapper.PointMapper;
import com.btf.tap.vo.User;

@Service
public class PointService {
	@Autowired PointMapper pointMapper;
	
	public List<Map> getPointHistoryList(User user) {
		
		user = new User();
		user.setUserId("akma517@naver.com");
		List<Map> pointHistory = pointMapper.selectgPointHistoryList(user);
		
		return pointHistory;
	}
}
