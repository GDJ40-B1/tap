package com.btf.tap.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.NoticeMapper;
import com.btf.tap.vo.Member;
import com.btf.tap.vo.Notice;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class NoticeService {
	@Autowired
	NoticeMapper noticeMapper;
	
	public int addNotice(Notice notice) {
		noticeMapper.insertNotice(notice);
		return notice.getNoticeId();
	}
	
	public Notice getNoticeOne(int noticeId) {
		Notice notice = noticeMapper.selectNoticeOne(noticeId);
		return notice;
	}
	
	public void modifyNotice(Notice notice) {
		noticeMapper.updateNotice(notice);
	}
	
	public void deleteNotice(Notice notice) {
		noticeMapper.deleteNotice(notice);
	}
	 
	public Map<String,Object> getNoticeList(int currentPage){
		final int ROW_PER_PAGE = 10;
		
		// 데이터 시작 행
		int beginRow = 0;
		beginRow = (currentPage-1) * ROW_PER_PAGE;
		
		// selectNoticeList() 메소드의 paramMap 매개변수 객체 생성
		Map<String,Object> page = new HashMap<>();
		page.put("beginRow", beginRow);
		page.put("rowPerPage", ROW_PER_PAGE);
		log.debug(Font.HS + "page 객체에 저장된 값 => " + page.toString() + Font.RESET);
		
		List<Notice> list = noticeMapper.selectNoticeList(page);
		log.debug(Font.HS + "공지사항 목록 => " + list.toString() + Font.RESET);
		
		// 전체 공지게시글 수
		int totalNoticeCount = noticeMapper.totalRowCount();
		log.debug(Font.HS + "전체 공지게시글 수 => " + totalNoticeCount + Font.RESET);
		
		// 총 데이터의 마지막 페이지
		int lastPage = 0;
		lastPage = totalNoticeCount / ROW_PER_PAGE;
		if(totalNoticeCount % ROW_PER_PAGE != 0) {
			lastPage += 1;
		}
		
		// 페이징의 시작 페이지
		int startPage = 0;
		startPage = ((currentPage-1) / ROW_PER_PAGE) * ROW_PER_PAGE + 1;
		
		// 페이징의 끝 페이지
		int endPage = 0;
		endPage = startPage + ROW_PER_PAGE - 1;
		
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("list", list);
		paramMap.put("lastPage", lastPage);
		paramMap.put("startPage", startPage);
		paramMap.put("endPage", endPage);
		paramMap.put("totalNoticeCount", totalNoticeCount);
		log.debug(Font.HS + "paramMap 객체에 저장된 값 => " + paramMap.toString() + Font.RESET);
		
		return paramMap;
	}
	
	// 마지막 페이지
		public int lastPage() {
			int lastPage = 0;
			final int ROW_PER_PAGE = 10;
			int totalRowCount = noticeMapper.totalRowCount();
			
			lastPage = totalRowCount / ROW_PER_PAGE;
			if(totalRowCount % ROW_PER_PAGE != 0) {
				lastPage++;
			}
			return lastPage;
		}
}
