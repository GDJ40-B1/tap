package com.btf.tap.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.User;

@Mapper
public interface UserMapper {
	int selectUserId(String userId);		// 회원가입시 아이디 중복 체크
	User selectUserOne(User user);	// 로그인
}
