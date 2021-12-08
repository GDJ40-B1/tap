package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Notice;




@Mapper
public interface NoticeMapper {
	// List 뽑아오기
	List<Notice> selectNoticeList(Map<String, Object> map);
	int selectNoticeTotalCount();
	
	Notice selectNoticeOne(int noticeId); //공지사항 세부내역	
	int insertNotice(Notice notice); //공지사항 입력
	
	void updateNotice(Notice notice); //공지사항 수정
	void deleteNotice(Notice notice);	//공지사항 삭제
}
