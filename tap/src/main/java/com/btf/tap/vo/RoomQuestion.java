package com.btf.tap.vo;

import java.util.List;

import lombok.Data;

@Data
public class RoomQuestion {
	private int roomQna;
	private String memberId;
	private int roomId;
	private String answerCheck;
	private String secretCheck;
	private String content;
	private String createDate;
	private String updateDate;
	private List<RoomQnaAnswer> roomQnaAnswer;
}
