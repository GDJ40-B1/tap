package com.btf.tap.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.NoticeMapper;
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
	 
	public List<Notice> getNoticeList(int currentPage){
		
		final int ROW_PER_PAGE = 10;
		int beginRow = (currentPage-1) * ROW_PER_PAGE;
		
		Map<String, Integer> paramMap = new HashMap<>();
		
		paramMap.put("beginRow", beginRow);
		
		List<Notice> noticeList = noticeMapper.selectNoticeList(paramMap);
		return noticeList;
		
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
