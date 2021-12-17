package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Member;

@Mapper
public interface MemberMapper {
	Member selectMemberOne(Member member);					// 회원 한 명의 정보 불러오기
	int insertMemberOne(Member member);						// 새로운 회원 한 명 등록하기
	int insertPreferLocal(Map<String, Object> paramMap); 	// 회원 등록 후 선호지역 저장
	Map<String, Object> selectPreferLocal(String memberId);	// 특정 회원 선호지역 불러오기
	int updateMemberOne(Member member);						// 회원 한 명의 정보 수정하기(나이,이름, 전화번호)
	int deleteMemberOne(Member member);						// 회원 한 명의 정보 삭제하기
	List<Member> selectMemberList();						// 회원 전체 목록 불러오기
	int selectMemberPw(Member member);						// 회원 비밀번호 확인하기(수정용)
	int updateMemberPoint(Member member);					// 회원 포인트 수정하기
	int updateMemberPw(Member member);						// 회원 비밀번호 수정하기
	
	
}
