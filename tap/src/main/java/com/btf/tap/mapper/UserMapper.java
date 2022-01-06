package com.btf.tap.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.User;

@Mapper
public interface UserMapper {
	int selectUserId(String userId);		// 회원가입시 아이디 중복 체크
	User selectUserOne(User user);	// 로그인
	int deleteWithdrawalHistory();	// 30일 경과한 탈퇴내역 삭제
	int deleteMemberCoupon();		//	기간 경과한 보유 쿠폰 삭제 
}
