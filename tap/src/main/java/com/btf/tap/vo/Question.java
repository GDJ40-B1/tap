package com.btf.tap.vo;

import java.util.List;

import lombok.Data;

@Data
public class Question {
	private int questionId;
	private String writerId;
	private String writerCategory;
	private String questionTitle;
	private String questionContent;
	private String secretStatus;
	private String answerStatus;
	private String createDate;
	private String updateDate;
	private QuestionAnswer questionAnswer;
}
