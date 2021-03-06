package com.btf.tap.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.QuestionMapper;
import com.btf.tap.vo.Question;
import com.btf.tap.vo.QuestionAnswer;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class QuestionService {
	@Autowired private QuestionMapper questionMapper;
	private final int rowPerPage = 10;
	
	// 전체 문의 리스트
	public Map<String, Object> getQuestionList(int currentPage, String writerCategory) {
		int defaultPage = 10;
		int startPage = ((currentPage - 1) / defaultPage) * defaultPage + 1;
		int endPage = startPage + defaultPage - 1;		
		int beginRow = (currentPage-1) * rowPerPage;
		int lastPage = 0;
		
		// 회원, 호스트 카테고리를 선택하지 않은 전체 리스트 출력 시 카테고리 변수 값이 null이 되도록 수정
		if(writerCategory == "") {
			writerCategory = null;
		}
		
		Map<String, Object> page = new HashMap<>();
		page.put("beginRow", beginRow);
		page.put("rowPerPage", rowPerPage);
		page.put("writerCategory", writerCategory);
		
		List<Question> list = questionMapper.selectQuestionList(page);
		log.debug(Font.JSB + list.toString() + Font.RESET);
		
		int totalRowCount = questionMapper.totalRowCount(writerCategory);
		
		lastPage = totalRowCount / rowPerPage;
		
		if(totalRowCount % rowPerPage != 0) {
			lastPage+=1;
		}
		
		if(endPage > lastPage) {
			endPage = lastPage;
		}		
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("list", list);
		paramMap.put("startPage", startPage);
		paramMap.put("endPage", endPage);
		paramMap.put("lastPage", lastPage);
		
		return paramMap;
	}

	// 미답변 문의 리스트
	public Map<String, Object> getUnansweredQuestionList(int currentPage, String writerCategory) {		
		int defaultPage = 10;
		int startPage = ((currentPage - 1) / defaultPage) * defaultPage + 1;
		int endPage = startPage + defaultPage - 1;		
		int beginRow = (currentPage-1) * rowPerPage;
		int lastPage = 0;
		
		// 회원, 호스트 카테고리를 선택하지 않은 전체 리스트 출력 시 카테고리 변수 값이 null이 되도록 수정
		if(writerCategory == "") {
			writerCategory = null;
		}
		
		Map<String, Object> page = new HashMap<>();
		page.put("beginRow", beginRow);
		page.put("rowPerPage", rowPerPage);
		page.put("writerCategory", writerCategory);
		
		List<Question> list = questionMapper.unansweredQuestionList(page);
		log.debug(Font.JSB + list.toString() + Font.RESET);
		
		int totalRowCount = questionMapper.unansweredRowCount(writerCategory);
		
		lastPage = totalRowCount / rowPerPage;
		
		if(totalRowCount % rowPerPage != 0) {
			lastPage+=1;
		}
		
		if(endPage > lastPage) {
			endPage = lastPage;
		}		
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("list", list);
		paramMap.put("currentPage", currentPage);
		paramMap.put("startPage", startPage);
		paramMap.put("endPage", endPage);
		paramMap.put("lastPage", lastPage);
		
		return paramMap;
	}
	
	// 미답변 문의 수 체크
	public int getUnansweredQnaCount() {
		int unansweredQuestionCount = questionMapper.unansweredQuestionCount();
		
		return unansweredQuestionCount;
	}
	
	// 문의 글 삽입
	public void addQuestion(Question question) {
		String content = question.getQuestionContent();
		question.setQuestionContent(content.replace("\r\n","<br>"));
		
		questionMapper.insertQuestion(question);
	}
	
	// 문의 답변 삽입
	public void addQuestionAnswer(QuestionAnswer questionAnswer) {
		String content = questionAnswer.getQuestionAnswerContent();
		questionAnswer.setQuestionAnswerContent(content.replace("\r\n","<br>"));
		
		questionMapper.insertQuestionAnswer(questionAnswer);
		questionMapper.updateAnswerCheck(questionAnswer);
	}	
	
	// 특정 문의 글 조회
	public Question getQuestionOne(int questionId) {
		Question question = new Question();
		question = questionMapper.selectQuestionOne(questionId);
		
		return question;
	}

	// 특정 문의 글 수정 시 이전 데이터 조회
	public Question getModifyQuestionOne(int questionId) {
		Question question = new Question();
		question = questionMapper.selectQuestionOne(questionId);
		
		String content = question.getQuestionContent();
		question.setQuestionContent(content.replace("<br>", "\r\n"));
		
		return question;
	}	
	
	// 문의 글 수정
	public void modifyQuestion(Question question) {
		String content = question.getQuestionContent();
		question.setQuestionContent(content.replace("\r\n","<br>"));

		questionMapper.updateQuestion(question);
	}
	
	// 문의 글 삭제
	public void removeQuestion(int questionId) {
		questionMapper.deleteQuestion(questionId);
	}
	
	// 문의 답변 삭제
	public void removeQuestionAnswer(int answerQuestionId) {
		QuestionAnswer questionAnswer = new QuestionAnswer();
		questionAnswer.setAnswerQuestionId(answerQuestionId);
		
		questionMapper.deleteQuestionAnswer(questionAnswer);
		questionMapper.updateAnswerCheck(questionAnswer);
	}
}
