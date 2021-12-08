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
	
	private final int ROW_PER_PAGE = 10;
	
	@GetMapping("/noticeList")
	public String getnoticeList(Model model,
			@RequestParam(defaultValue = "1") int currentPage) {
		
			Map<String, Object> map = noticeService.getNoticeList(currentPage, ROW_PER_PAGE);
			model.addAttribute("noticeList", map.get("noticeList"));
			model.addAttribute("lastPage", map.get("lastPage"));
			model.addAttribute("currentPage", currentPage);
			return "notice/noticeList";
	}
	
}
