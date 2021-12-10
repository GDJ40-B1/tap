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

	// 회원 한 명의 정보를 추가하기
	// 입력: Member
	// 결과: int(회원가입된 수)
	public int addMember(Member member) {
		
		log.debug(Font.HW + "입력받은 회원가입 정보 => " + member.toString() + Font.RESET);
		
		int confirm = memberMapper.insertMemberOne(member);
		
		log.debug(Font.HW + "회원가입된 수 => " + confirm  + Font.RESET);
		
			
		return confirm;
	}
	
	// 회원 한 명의 정보를 삭제하기
	// 입력: Member
	// 결과: int(회원탈퇴된 수)
	public int removeMember(Member member) {
		
		log.debug(Font.HW + "입력받은 회원탈퇴 정보 => " + member.toString() + Font.RESET);
		
		int confirm = memberMapper.deleteMemberOne(member);
		
		log.debug(Font.HW + "회원탈퇴된 수 => " + confirm  + Font.RESET);
		
		return confirm;
	}

	// 멤버 한 명의 정보 수정
	// 입력: Member
	// 결과: Member(변경된 회원의 객체)
	public Member modifyMemberInfo(Member member) {
		log.debug(Font.HW + "입력받은 회원정보 변경 정보 => " + member.toString() + Font.RESET);
		
		int confirm = memberMapper.updateMemberOne(member);
		
		log.debug(Font.HW + "회원정보 변경된 회원 수 => " + confirm  + Font.RESET);
		
		member = memberMapper.selectMemberOne(member);
		
		log.debug(Font.HW + "변경된 회원 정보 => " + member.toString() + Font.RESET);
		
		return member;
	}
}
