package com.btf.tap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Host;

@Mapper
public interface HostMapper {
	Host selectHostOne(Host host);			// 호스트 한 명의 정보 불러오기
	int insertHostOne(Host host);			// 새로운 호스트 한 명 등록하기
	int updateHostOne(Host host);			// 호스트 한 명의 정보 수정하기(나이,이름, 전화번호)
	int deleteHostOne(Host host);			// 호스트 한 명의 정보 삭제하기
	List<Host> selectHostList();			// 호스트 전체 목록 불러오기
	int selectHostPw(Host host);			// 호스트 비밀번호 확인하기(수정용)
	int updateHostPoint(Host host);			// 호스트 포인트 수정하기
	int updateHostPw(Host host);			// 호스트 비밀번호 수정하기
}
