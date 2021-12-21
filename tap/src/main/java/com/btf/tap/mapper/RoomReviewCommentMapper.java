package com.btf.tap.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.RoomReviewComment;

@Mapper
public interface RoomReviewCommentMapper {
	int insertRoomReviewComment(RoomReviewComment roomReviewComment);
	int deleteRoomReviewComment(RoomReviewComment roomReviewComment);
}
