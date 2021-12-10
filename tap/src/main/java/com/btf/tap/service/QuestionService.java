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
	
	// 전체 문의 리스트
	public Map<String, Object> getQuestionList(int currentPage, int rowPerPage, String writerCategory) {
		int defaultPage = 10;
		int startPage = ((currentPage - 1) / defaultPage) * defaultPage + 1;
		int endPage = startPage + defaultPage - 1;		
		int beginRow = (currentPage-1) * rowPerPage;
		int lastPage = 0;
		
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
	
	// 문의 글 삽입
	public void addQuestion(Question question) {
		questionMapper.insertQuestion(question);
	}
	
	// 문의 답변 삽입
	public void addQuestionAnswer(QuestionAnswer questionAnswer) {
		questionMapper.insertQuestionAnswer(questionAnswer);
	}	
	
	// 특정 문의 글 조회
	public Question getQuestionOne(int questionId) {
		Question question = null;
		question = questionMapper.selectQuestionOne(questionId);
		
		return question;
	}
	
	// 문의 글 수정
	public void modifyQuestion(Question question) {
		questionMapper.updateQuestion(question);
	}
	
	// 문의 글 삭제
	public void removeQuestion(int questionId) {
		questionMapper.deleteQuestion(questionId);
	}
	
	// 문의 답변 삭제
	public void removeQuestionAnswer(int questionId) {
		questionMapper.deleteQuestionAnswer(questionId);
	}
}
