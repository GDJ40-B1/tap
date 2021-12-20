package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.RoomReview;

@Mapper
public interface RoomReviewMapper {
	List<RoomReview> selectRoomReviewList(Map<String,Object> page); // 해당숙소의 전체 후기 조회하기
	int totalRoomReivewCount(); // 전체 후기 수
	int insertRoomReview(RoomReview roomReview); // 숙소후기 작성하기
	int deleteRoomReview(RoomReview roomReview); // 숙소후기 삭제하기
}
