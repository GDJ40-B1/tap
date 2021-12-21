package com.btf.tap.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.RoomReviewCommentMapper;
import com.btf.tap.vo.RoomReviewComment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class RoomReviewCommentService {
	@Autowired private RoomReviewCommentMapper roomReviewCommentMapper;
	
	public int insertRoomReviewComment(RoomReviewComment roomReviewComment) {
		// 입력받은 숙소후기 답변 정보
		log.debug(Font.HS + "입력받은 숙소후기 답변 정보 => " + roomReviewComment.toString() + Font.RESET);
		
		int check = roomReviewCommentMapper.insertRoomReviewComment(roomReviewComment);
		
		// 숙소후기 답변글 추가 개수
		log.debug(Font.HS + "숙소후기 답변글 추가 개수 => " + check + Font.RESET);
		
		if(check == 1) {
			log.debug(Font.HS + "정상적으로 추가 성공!" + Font.RESET);
		} else {
			log.debug(Font.HS + "추가 실패!" + Font.RESET);
		}
		
		return check;
	}
	
	public int deleteRoomReviewComment(RoomReviewComment roomReviewComment) {
		// 입력받은 숙소후기 답변 정보
		log.debug(Font.HS + "입력받은 숙소후기 답변 정보 => " + roomReviewComment.toString() + Font.RESET);
		
		int check = roomReviewCommentMapper.deleteRoomReviewComment(roomReviewComment);
		
		// 숙소후기 답변글 삭제 개수
		log.debug(Font.HS + "숙소후기 답변글 삭제 개수 => " + check + Font.RESET);
		
		if(check == 1) {
			log.debug(Font.HS + "정상적으로 삭제 성공!" + Font.RESET);
		} else {
			log.debug(Font.HS + "삭제 실패!" + Font.RESET);
		}
		
		return check;
	}
}
