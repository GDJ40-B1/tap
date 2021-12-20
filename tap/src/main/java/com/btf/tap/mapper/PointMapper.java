package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Point;
import com.btf.tap.vo.User;

@Mapper
public interface PointMapper {
	
	List<Point> selectgPointHistoryList(User user);			// 회원의 포인트 이용 내역 리스트 조회하기
}
