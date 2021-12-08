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
	public void addNotice ()	{
		
	}
	private final int ROW_PER_PAGE = 10;
	
	@GetMapping("/noticeList")
	public String noticeList(Model model, int currentPage) {
		Map<String, Object> result = noticeService.getNoticeList(currentPage);
		model.addAttribute("result", result);
		return "noticeList";
	}
	@PostMapping("/addNotice")
	public String addNotice(Notice notice)	{
		noticeService.addNotice(notice);
		log.debug("★★★★★★★★★★★★★★★★★"+notice.toString());
		return "noticeList";
	}
}
