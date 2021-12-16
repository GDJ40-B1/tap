package com.btf.tap.service;

import java.util.HashMap;
import java.util.Map;

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
	public int addMember(Member member, String sido, String sigungu) {
		
		log.debug(Font.HW + "입력받은 회원가입 정보 => " + member.toString() + Font.RESET);
		
		int confirm = memberMapper.insertMemberOne(member);
		
		log.debug(Font.HW + "회원가입된 수 => " + confirm  + Font.RESET);
		
		Map<String, Object> paramMap = new HashMap<>();
		
		String memberId = member.getMemberId();
		
		paramMap.put("memberId", memberId);
		paramMap.put("sido", sido);
		paramMap.put("sigungu", sigungu);
		
		memberMapper.insertPreferLocal(paramMap);
		
		log.debug(Font.HW + "선호지역 데이터 정보 => " + paramMap.toString() + Font.RESET);
			
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

	// 회원 한 명의 정보를 수정하기
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
	
	// 회원 한 명의 비밀번호를 수정하기
	// 입력: Member, String memberNewPw
	// 결과: Member(변경된 회원의 객체)
	public Member modifyMemberPw(Member member) {
		
		log.debug(Font.HW + "입력받은 비밀번호 변경 정보 => " + member.toString() + Font.RESET);
		
		// 회원 비밀번호 변경
		int confirm = memberMapper.updateMemberPw(member);
		
		log.debug(Font.HW + "비밀번호 변경된 회원 수 => " + confirm  + Font.RESET);
		
		// 변경된 회원 정보 주입
		member = memberMapper.selectMemberOne(member);
		
		log.debug(Font.HW + "변경된 회원 정보 => " + member.toString() + Font.RESET);
		
		return member;
	}
	
	// 회원 한 명의 비밀번호를 일치여부 확인하기
	// 입력: Member
	// 결과: int (일치하는 회원 수)
	public int checkMemberPw(Member member) {
		
		log.debug(Font.HW + "입력받은 비밀번호 확인 정보 => " + member.toString() + Font.RESET);
		
		// 입력받은 회원의 비밀번호가 기존 비밀번호와 일치하는지 확인
		int confirm = memberMapper.selectMemberPw(member);
		
		log.debug(Font.HW + "일치하는 회원 수 => " + confirm  + Font.RESET);
		
		
		return confirm;
	}
	
	// 회원 한 명의 포인트 증가(충전)
	// 입력: Member
	// 결과: int (포인트 증가한 회원 수)
	public int earnMemberPoint(Member member) {
		
		log.debug(Font.HW + "입력받은 포인트 증가 정보 => " + member.toString() + Font.RESET);
		
		// 입력받은 회원의 기존 포인트 확인하기
		Member oldMember = memberMapper.selectMemberOne(member);
		log.debug(Font.HW + "입력받은 회원의 기존 포인트 정보 => " + oldMember.toString() + Font.RESET);
		
		// 기존 포인트에서 입력받은 포인트를 추가
		oldMember.setMemberPoint(oldMember.getMemberPoint() + member.getMemberPoint());
		log.debug(Font.HW + "입력받은 회원의 증가된 포인트 정보 => " + oldMember.toString() + Font.RESET);
		
		// 포인트 충전 실행
		int confirm = memberMapper.updateMemberPoint(oldMember);
		
		log.debug(Font.HW + "포인트 증가된 회원 수 => " + confirm  + Font.RESET);
		
		return confirm;
	}
	
	// 회원 한 명의 포인트 감소(사용)
	// 입력: Member
	// 결과: int (포인트 감소한 회원 수)
	public int spendMemberPoint(Member member) {
		
		log.debug(Font.HW + "입력받은 포인트 감소 정보 => " + member.toString() + Font.RESET);
		
		// 입력받은 회원의 기존 포인트 확인하기
		Member oldMember = memberMapper.selectMemberOne(member);
		log.debug(Font.HW + "입력받은 회원의 기존 포인트 정보 => " + oldMember.toString() + Font.RESET);
		
		// 기존 포인트에서 입력받은 포인트를 추가
		oldMember.setMemberPoint(oldMember.getMemberPoint() - member.getMemberPoint());
		log.debug(Font.HW + "입력받은 회원의 감소된 포인트 정보 => " + oldMember.toString() + Font.RESET);
		
		// 포인트 충전 실행
		int confirm = memberMapper.updateMemberPoint(oldMember);
		
		log.debug(Font.HW + "포인트 감소된 회원 수 => " + confirm  + Font.RESET);
		
		return confirm;
	}
}
