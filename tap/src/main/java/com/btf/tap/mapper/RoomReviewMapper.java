package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.RoomReview;
import com.btf.tap.vo.RoomReviewComment;

@Mapper
public interface RoomReviewMapper {
	List<RoomReview> selectRoomReviewList(Map<String,Object> page); // 해당숙소의 전체 후기 조회하기
	int totalRoomReivewCount(int roomId); // 전체 후기 수
	int insertRoomReview(RoomReview roomReview); // 숙소후기 작성하기
	int deleteRoomReview(int roomReviewId); // 숙소후기 삭제하기
	int insertRoomReviewComment(RoomReviewComment roomReviewComment); // 숙소후기 답변 작성하기
	int deleteRoomReviewComment(int roomReviewId); // 숙소후기 답변 삭제하기
}
