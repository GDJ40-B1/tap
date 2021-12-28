package com.btf.tap.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.btf.tap.vo.User;

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
		model.addAttribute("startPage", map.get("startPage"));
		model.addAttribute("endPage", map.get("endPage"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("writerCategory", writerCategory);
		
		return "question/questionList";
	}
	
	// 특정 문의 글
	@GetMapping("/questionOne")
	public String getQuestionOne(Model model, HttpSession session, int questionId, String secretStatus, String writerId) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		// 비회원이 비밀글 접근 시도한 경우
		if(loginUser == null && secretStatus.equals("Y")) {
			return "redirect:/login";
		}
		
		// 작성자가 아닌 가입자가 비밀글 접근 시도한 경우
		if(loginUser != null && secretStatus.equals("Y") && !loginUser.getUserLevel().equals("system_admin") && !writerId.equals(loginUser.getUserId())) {
			return "redirect:/";
		}
		
		Question question = questionService.getQuestionOne(questionId);
		log.debug(Font.JSB + question.toString() + Font.RESET);
		
		model.addAttribute("question", question);
		
		return "question/questionOne";
	}
	
	// 문의 글 작성
	@GetMapping("/nonMember/addQuestion")
	public String getAddQuestion(Model model) {
		
		return "question/addQuestion";
	}
	@PostMapping("addQuestion")
	public String postAddQuestion(Question question) {
		questionService.addQuestion(question);
		
		return "redirect:/questionList";
	}
	
	
	// 문의 답변 작성
	@PostMapping("/questionOne")
	public String getAddQuestionAnswer(QuestionAnswer questionAnswer, String writerId, String secretStatus) {
		int questionId = questionAnswer.getAnswerQuestionId();
		questionService.addQuestionAnswer(questionAnswer);
		
		return "redirect:/questionOne?questionId="+questionId+"&secretStatus="+secretStatus+"&writerId="+writerId;
	}
	
	// 특정 문의 글 수정
	@GetMapping("/nonMember/modifyQuestion")
	public String getUpdateQuestion(HttpSession session, Model model, int questionId, String writerId) {
		User loginUser = (User)session.getAttribute("loginUser");

		// 작성자가 아닌 가입자가 특정 문의글 수정 시도한 경우
		if(loginUser != null && !loginUser.getUserLevel().equals("system_admin") && !writerId.equals(loginUser.getUserId())) {
			return "redirect:/";
		}
		
		Question question = questionService.getQuestionOne(questionId);
		log.debug(Font.JSB + question.toString() + Font.RESET);
		
		model.addAttribute("question", question);
		
		return "question/modifyQuestion";
	}
	@PostMapping("/modifyQuestion")
	public String postModifyQuestion(Question question) {
		int questionId = question.getQuestionId();
		String writerId = question.getWriterId();
		String secretStatus = question.getSecretStatus();

		questionService.modifyQuestion(question);
		log.debug(Font.JSB + question.toString() + Font.RESET);
		
		return "redirect:/questionOne?questionId="+questionId+"&secretStatus="+secretStatus+"&writerId="+writerId;
	}
	
	
	// 특정 문의 글 삭제
	@GetMapping("/nonMember/removeQuestion")
	public String getRemoveQuestion(HttpSession session, int questionId, String writerId) {
		User loginUser = (User)session.getAttribute("loginUser");

		// 작성자가 아닌 가입자가 특정 문의글 삭제 시도한 경우
		if(loginUser != null && !loginUser.getUserLevel().equals("system_admin") && !writerId.equals(loginUser.getUserId())) {
			return "redirect:/";
		}
		
		questionService.removeQuestion(questionId);
		
		return "redirect:/questionList";
	}
	
	// 특정 문의 답변 삭제
	@GetMapping("/nonMember/removeQuestionAnswer")
	public String getRemoveQuestionAnswer(HttpSession session, int answerQuestionId, String writerId, String secretStatus) {
		User loginUser = (User)session.getAttribute("loginUser");

		// 관리자가 아닌 가입자가 특정 문의글 삭제 시도한 경우
		if(loginUser != null && !loginUser.getUserLevel().equals("system_admin")) {
			return "redirect:/";
		}
		
		questionService.removeQuestionAnswer(answerQuestionId);
		
		return "redirect:/questionOne?questionId="+answerQuestionId+"&secretStatus="+secretStatus+"&writerId="+writerId;
	}
	
}
