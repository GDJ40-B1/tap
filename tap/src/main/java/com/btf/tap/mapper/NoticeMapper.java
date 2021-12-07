package com.btf.tap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Notice;




@Mapper
public interface NoticeMapper {
	List<Notice> selectNoticeList();	//공지사항 리스트 생성순으로
	int insertNotice(Notice notice); //공지사항 입력
	void updateNotice(Notice notice); //공지사항 수정
	void deleteNotice(int noticeId);	//공지사항 삭제
}
