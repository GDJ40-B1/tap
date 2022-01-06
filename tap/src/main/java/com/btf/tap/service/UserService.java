package com.btf.tap.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.UserMapper;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserService {
	
	@Autowired UserMapper userMapper;
	
	// 회원 가입 시, 아이디 중복 체크 로직(미완성)
	/*public void userIdCheck(User user) {
		
		log.debug(Font.HW + "입력받은 아이디 => " + user.getUserId() + Font.RESET);
		
		int confirm = userMapper.selectUserId(user);
		
		log.debug(Font.HW + "중복 아이디 수 => " + confirm + Font.RESET);
		
	}*/
	
	// 로그인 기능
	public User login(User user) {
		
		log.debug(Font.HW + "입력받은 유저 정보 => " + user.toString() + Font.RESET);
		
		user = userMapper.selectUserOne(user);
		
		
		return user;
	}
	
	
	// 기간만료 된 탈퇴내역 삭제
	public int removeWithdrawalHistory() {
		return userMapper.deleteWithdrawalHistory();
	}
	
	// 기간만료 된 보유쿠폰 삭제
	public int removeMemberCoupon() {
		return userMapper.deleteMemberCoupon();
	}
}
