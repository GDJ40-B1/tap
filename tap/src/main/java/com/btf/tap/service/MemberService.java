package com.btf.tap.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.MemberMapper;
import com.btf.tap.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberService {
	
	@Autowired MemberMapper memberMapper;
	
	// 회원 한 명의 정보를 불러오기
	// 입력: Member
	// 결과: Member
	public Member getMemberOne(Member member) {
		
		log.debug(Font.HW + "입력받은 회원 정보 => " + member.toString() + Font.RESET);
		
		member = memberMapper.selectMemberOne(member);
		
		log.debug(Font.HW + "조회 결과 회원 정보 => " + member.toString() + Font.RESET);
		
		return member;
	}
}
