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
	 
	public Map<String, Object> getNoticeList(int currentPage, int rowPerPage){
		// 1) 매개변수 가공
		Map<String, Object> paramMap = new HashMap<>();
		int beginRow = (currentPage-1)*rowPerPage;
		paramMap.put("beginRow", 0); // currentPage가공
		paramMap.put("rowPerPage", rowPerPage);
		List<Notice> noticeList = noticeMapper.selectNoticeList(paramMap);
		
		// 2) 리턴값 가공
		Map<String, Object> returnMap = new HashMap<>();
		int lastPage = 0;
		int totalCount = noticeMapper.selectNoticeTotalCount();
		lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage != 0) {
			lastPage +=1;
		}
		returnMap.put("noticeList", noticeList);
		returnMap.put("lastPage", lastPage);
		return returnMap;
	}


			
}
