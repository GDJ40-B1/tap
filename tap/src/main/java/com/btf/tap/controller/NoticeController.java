package com.btf.tap.controller;

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
	
	private final int ROW_PER_PAGE = 10;
	//공지사항 추가
	@GetMapping("/addNotice")
	public String addNotice()	{
		return "addNotice";
	}
	//공지사항 내용
	@GetMapping("/noticeOne")
	public String noticeOne(Model model, int noticeNo)	{
		Notice notice = noticeService.getNoticeOne(noticeNo);
		model.addAttribute("notice", notice);
		return "noticeOne";
	}
	//공지사항 리스트
	@GetMapping("/noticeList")
	public String getNoticeList(Model model, String currentNum)	{
		int currentPage = 1;
		if(currentNum != null)	{
			currentPage = Integer.parseInt(currentNum);
		}
		List<Notice> noticeList = noticeService.getNoticeList(currentPage);
		
	}
	//공지사항 수정
	@GetMapping("modifyNotice")
	public String modifyNotice(Model model, Notice notice)	{
		log.debug("NoticeController : noticeId -> "+notice.getNoticeId());
		model.addAttribute("noticeId", notice.getNoticeId());
		return "modifyNotice";
	}
	
	//공지사항 삭제
	@GetMapping("removeNotice")
	public String removeNotice(int noticeId)	{
		noticeService.removeNotice(noticeId);
		return "redirect:/notice";
	}
	//공지사항 추가
	@PostMapping("/addNotice")
	public String addNotice(Notice notice)	{
		noticeService.addNotice(notice);
		log.debug(notice.toString());
		return "redirect:/noticeList";
	}
	
	@PostMapping("/modifyNotice")
	public String modifyNotice(Notice notice)	{
		log.debug("NoticeController : modifyNotice -> "+notice.getContent().toString());
		noticeService.modifyNotice(notice);
		log.debug("NoticeController : 수정 성공!");
		return "redirect:/notice";
	}
}
