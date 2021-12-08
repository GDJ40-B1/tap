package com.btf.tap.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.btf.tap.common.Font;
import com.btf.tap.service.QuestionService;
import com.btf.tap.vo.Question;
import com.btf.tap.vo.QuestionAnswer;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QuestionController {
	@Autowired private QuestionService questionService;
	private final int rowPerPage = 10;
	
	// 전체 문의 글 내역
	@RequestMapping("/questionList")
	public String requestQuestionList(Model model, @RequestParam(name="currentPage", defaultValue = "1") int currentPage,
											@RequestParam(required = false) String writerCategory) {
		Map<String, Object> map = questionService.getQuestionList(currentPage, rowPerPage, writerCategory);
		log.debug(Font.JSB + map.toString() + Font.RESET);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("writerCategory", writerCategory);
		
		return "Question/questionList";
	}
	
	// 특정 문의 글
	@GetMapping("/questionOne")
	public String getQuestionOne(Model model, int questionId) {
		Question question = questionService.getQuestionOne(questionId);
		log.debug(Font.JSB + question.toString() + Font.RESET);
		
		model.addAttribute("question", question);
		
		return "Question/questionOne";
	}
	
	// 문의 글 작성
	@GetMapping("/addQuestion")
	public String getAddQuestion() {
		return "Question/addQuestion";
	}
	@PostMapping("addQuestion")
	public String postAddQuestion(Question question) {
		questionService.addQuestion(question);
		
		return "redirect:/questionList";
	}
	
	
	// 문의 답변 작성
	@GetMapping("addQuestionAnswer")
	public String getAddQuestionAnswer(QuestionAnswer questionAnswer) {
		int questionId = questionAnswer.getQuestionId();
		questionService.addQuestionAnswer(questionAnswer);
		
		return "redirect:/questionOne?questionId="+questionId;
	}
	
	// 특정 문의 글 수정
	@GetMapping("/modifyQuestion")
	public String getUpdateQuestion(Model model, int questionId) {
		Question question = questionService.getQuestionOne(questionId);
		log.debug(Font.JSB + question.toString() + Font.RESET);
		
		model.addAttribute("question", question);
		
		return "Question/modifyQuestion";
	}
	@PostMapping("/modifyQuestion")
	public String postModifyQuestion(Question question) {
		int questionId = question.getQuestionId();
		questionService.modifyQuestion(question);
		
		return "redirect:/questionOne?questionId="+questionId;
	}
	
	
	// 특정 문의 글 삭제
	@GetMapping("/removeQuestion")
	public String getRemoveQuestion(int questionId) {
		questionService.removeQuestion(questionId);
		
		return "redirect:/questionList";
	}
	
	// 특정 문의 답변 삭제
	@GetMapping("/removeQuestionAnswer")
	public String getRemoveQuestionAnswer(int questionId) {
		questionService.removeQuestionAnswer(questionId);
		
		return "redirect:/questionOne?questionId="+questionId;
	}
	
}
