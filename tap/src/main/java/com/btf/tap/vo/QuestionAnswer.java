package com.btf.tap.vo;

import lombok.Data;

@Data
public class QuestionAnswer {
	private int questionId;
	private String systemAdminId;
	private String questionAnswerContent;
	private String createDate;
}
