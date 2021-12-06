package com.btf.tap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Member;

@Mapper
public interface MemberMapper {
	int selectMemberId(Member memberId);		// 회원가입 시 아이디 중복 체크
	Member selectMemberOne(Member member);		// 회원 한 명의 정보 불러오기
	Member insertMemberOne(Member member);		// 새로운 회원 한 명 등록하기
	int updateMemberOne(Member member);			// 회원 한 명의 정보 수정하기
	int deleteMemberOne(Member member);			// 회원 한 명의 정보 삭제하기
	List<Member> selectMemberList();			// 회원 전체 목록 불러오기
	int updateMemberPoint(Member member);		// 회원 포인트 수정하기
	int updateMemberPw(Member memeber);			// 회원 비밀번호 수정하기
	
	
}
