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
	
	public void addNotice(Notice notice)	{
		noticeMapper.insertNotice(notice);
	}
	
	
	// board select
		public Map<String, Object> getNoticeList(int currentPage){
			Map<String, Object> result = new HashMap<>();
			
			final int ROW_PER_PAGE = 10; // 페이지에 보일 책 개수
		    int beginRow = (currentPage-1)*ROW_PER_PAGE; // 리스트 목록 시작 부분
		    Map<String, Object> page = new HashMap<>();
		    page.put("beginRow", beginRow);
		    page.put("rowPerPage", ROW_PER_PAGE);
		      
			List<Notice> list = noticeMapper.selectNoticeList(page);
			log.debug(list+"<- ******BOARD SERVICE - SELECT******");
			result.put("list", list);
			
			int totalData = noticeMapper.selectNoticeCount(); // 전체 책 수
			int lastPage= totalData/ROW_PER_PAGE; // 마지막 페이지 번호
	        if(totalData%ROW_PER_PAGE!=0){
	           lastPage +=1;
	        }
	        int currentnumPage; // 현재 페이지가 몇번째 묶음인지
	        if(currentPage%ROW_PER_PAGE==0){
	    		currentnumPage =(currentPage/ROW_PER_PAGE)-1;
	    	} else{
	    		currentnumPage = currentPage/ROW_PER_PAGE;
	    	}
	        
	        int lastnumPage;
	        if(lastPage%ROW_PER_PAGE==0){ // 마지막 페이지가 몇번째 묶음인지
	    		lastnumPage =(lastPage/ROW_PER_PAGE)-1;
	    	} else{
	    		lastnumPage = lastPage/ROW_PER_PAGE;
	    	}
	        result.put("rowPerPage", ROW_PER_PAGE);
		    result.put("lastPage", lastPage);
		    result.put("lastnumPage", lastnumPage);
		    result.put("currentPage", currentPage);
		    result.put("currentnumPage", currentnumPage);
		      
			return result;
		}


			
}
