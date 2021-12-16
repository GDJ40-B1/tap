package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Question;
import com.btf.tap.vo.QuestionAnswer;

@Mapper
public interface QuestionMapper {
	List<Question> selectQuestionList(Map<String, Object> page);		// 전체 문의 글 조회
	int totalRowCount(String writerCategory);							// 페이지 수 체크
	List<Question> unansweredQuestionList(Map<String, Object> page);	// 미답변 문의 글 조회
	int unansweredQuestionTotalRowCount(String writerCategory);			// 미답변 페이지 수 체크	
	int insertQuestion(Question question);								// 작성 문의 글 삽입
	int insertQuestionAnswer(QuestionAnswer questionAnswer);			// 작성 문의 답변 삽입
	Question selectQuestionOne(int questionId);							// 특정 문의 글 상세 조회
	int updateQuestion(Question question);								// 특정 문의 글 수정
	int deleteQuestion(int questionId);									// 특정 문의 글 삭제
	int deleteQuestionAnswer(int questionId);							// 특정 문의 답변 삭제
	
}
