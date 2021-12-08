package com.btf.tap.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		return "addNotice";
	}
	
	
	@PostMapping("/addNotice")
	public String addNotice(Notice notice) {
		int noticeId = noticeService.setNotice(notice);
		return "redirect:/noticeOne?noticeId="+noticeId;
	}
	
	@GetMapping("/noticeOne")
	public String noticeOne(Model model, int noticeId) {
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		return "noticeOne";
	}
	
	@GetMapping("/modifyNotice")
	public String modifyNotice(Model model, int noticeId) {
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		return "modifyNotice";
	}
	
	@PostMapping("/modifyNotice")
	public String modifyNotice(Notice notice) {
		noticeService.setNoticeUpdate(notice);
		return "redirect:/noticeOne?noticeId="+notice.getNoticeId();
	}
	
	private final int ROW_PER_PAGE = 10;
	
	@GetMapping("/noticeList")
	// 요청 num -> myNum
	public String noticeList(Model model,
			@RequestParam(defaultValue = "1") int currentPage) {
		
			Map<String, Object> map = noticeService.getNoticeList(currentPage, ROW_PER_PAGE);
			model.addAttribute("noticeList", map.get("noticeList"));
			model.addAttribute("lastPage", map.get("lastPage"));
			model.addAttribute("currentPage", currentPage);
			return "noticeList";
	}
	
}
