package com.btf.tap.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.NoticeMapper;
import com.btf.tap.vo.Notice;
import com.btf.tap.vo.Room;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class NoticeService {
	@Autowired
	NoticeMapper noticeMapper;
	
	
		public int addNotice(Map<String, Object> map) {
			
			
			
			Notice notice = (Notice)map.get("notice");
			noticeMapper.insertNotice(notice);
			
			return notice.getNoticeId();
		}
		
		
		public List<Notice> getNoticeList() {
			List<Notice> list = noticeMapper.selectNoticeList();
			return list;
		}
		
		
		public void modifyNotice(Map<String, Object> map) {
			
			
			Notice notice = (Notice)map.get("notice");
			noticeMapper.updateNotice(notice);
		}
		
		
		public void removeNotice(int noticeId) {
			
			noticeMapper.deleteNotice(noticeId);
		}
}
