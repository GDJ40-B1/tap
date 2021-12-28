package com.btf.tap.vo;

import lombok.Data;

@Data
public class QuestionAnswer {
	private int answerQuestionId;
	private String systemAdminId;
	private String questionAnswerContent;
	private String answerCreateDate;
}
