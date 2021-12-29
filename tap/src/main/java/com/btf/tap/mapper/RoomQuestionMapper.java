package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.RoomQnaAnswer;
import com.btf.tap.vo.RoomQuestion;

@Mapper
public interface RoomQuestionMapper {
	List<RoomQuestion> selectRoomQnaList(Map<String, Object> page);				// 특정 숙소 문의 전체 리스트
	int totalRowCount(int roomId);												// 문의 페이지 체크
	int insertRoomQna(RoomQuestion roomQuestion);								// 특정 숙소 문의 삽입
	int insertRoomQnaAnswer(RoomQnaAnswer roomQnaAnswer);						// 특정 숙소 문의 답변 삽입
	int deleteRoomQuestion(int roomQna);										// 특정 숙소 문의 삭제
	int deleteRoomQnaAnswer(RoomQnaAnswer roomQnaAnswer);						// 특정 숙소 문의 답변 삭제
	List<Map<String, Object>> unansweredRoomQnaList(Map<String, Object> page);	// 특정 호스트 등록 숙소 문의 미답변 리스트
	int unansweredRoomQnaTotalRowCount(String hostId);							// 미답변 페이지 체크
	int updateAnswerCheck(RoomQnaAnswer roomQnaAnswer);							// 숙소 문의 답변 삽입, 삭제시 답변 여부 변경
}
