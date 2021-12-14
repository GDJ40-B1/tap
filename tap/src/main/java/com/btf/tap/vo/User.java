package com.btf.tap.vo;

import lombok.Data;

@Data
public class User {
	// 회원, 호스트, 시스템 관리자의 로그인에 쓰일 공통적 속성들
	// 회원가입시의 아이디 중복 체크랑, 로그인 후에 세션에 해당 로그인 유저가 어떤 권한의 유저인지 저장하기 위한 용도
	// 후에 각 권한별 다른 기능들을 이용할 때는, 회원 레벨과 아이디를 통해
	// 각 권한의 vo 클래스를 이용
	// 각 권한의 vo 클래스들은 User 클래스를 상속받음
	private String userId;
	private String userPw;
	private String userLevel;
	private String userName;
	private int userPoint;
}
