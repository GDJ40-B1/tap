package com.btf.tap.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.btf.tap.common.Font;
import com.btf.tap.service.NoticeService;
import com.btf.tap.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
	@Autowired
	NoticeService noticeService;
	
	@GetMapping("/addNotice")
	public String addNotice() {
		return "notice/addNotice";
	}
	
	
	@PostMapping("/addNotice")
	public String addNotice(Notice notice) {
		int noticeId = noticeService.addNotice(notice);
		log.debug(Font.KSB + notice.toString() + Font.RESET);
		return "redirect:/noticeOne?noticeId="+noticeId;
	}
	
	@GetMapping("/noticeOne")
	public String noticeOne(Model model, int noticeId) {
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		return "notice/noticeOne";
	}
	
	@GetMapping("/modifyNotice")
	public String modifyNotice(Model model, int noticeId) {
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		return "notice/modifyNotice";
	}
	
	@PostMapping("/modifyNotice")
	public String modifyNotice(Notice notice) {
		int noticeId = notice.getNoticeId();
		noticeService.modifyNotice(notice);
		return "redirect:/noticeOne?noticeId="+noticeId;
	}
	
	@GetMapping("/deleteNotice")
	public String deleteNotice(Model model, int noticeId) {
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		return "notice/deleteNotice";
	}
	
	@PostMapping("/deleteNotice")
	public String deleteNotice(Notice notice) {
		int noticeId = notice.getNoticeId();
		noticeService.deleteNotice(notice);
		return "redirect:/noticeList";
	} 
	
	
	@GetMapping("/noticeList")
	public String noticeList(Model model, String currentNum, String kind) {
			
		int currentPage = 1;
		if(currentNum!=null) {
			currentPage = Integer.parseInt(currentNum);
		}
		
		if(kind==null || kind=="") {
			List<Notice> noticeList = noticeService.getNoticeList(currentPage);
			
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("currentPage",currentPage);
			model.addAttribute("kind", kind);
		} else if(kind != "") {
			List<Notice> noticeList = noticeService.getNoticeListByKind(currentPage , kind);
			
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("kind", kind);
		}
		
		int lastPage;
		if(kind==null || kind=="") { // 선택된 카테고리가 없을때
			lastPage = noticeService.lastPage();
		} else { 
			lastPage = noticeService.lastPageByKind(kind);
		}
		
		// 화면에 보여질 페이지 번호의 갯수
		int displayPage = 10;
		
		// 화면에 보여질 시작 페이지 번호
		int startPage = ((currentPage - 1) / displayPage) * displayPage + 1;

		// 화면에 보여질 마지막 페이지 번호
		int endPage = 0;
		if(lastPage<displayPage){
			endPage = lastPage;
		} else if (lastPage>=displayPage){
			endPage = startPage + displayPage - 1;
		}
		
		
		log.debug("startPage(화면에 보여질 시작 페이지 번호) : "+startPage+", endPage(화면에 보여질 마지막 페이지 번호) : "+endPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("displayPage",displayPage);
		model.addAttribute("lastPage",lastPage);
		
		return "notice/noticeList";
	}
	
	@PostMapping("/noticeList")
	public String noticeListByKind(int currentPage, String kind) {
			
			
			return "redirect:/noticeList?kind"+kind+"&currentPage="+currentPage;
	}
	
}
