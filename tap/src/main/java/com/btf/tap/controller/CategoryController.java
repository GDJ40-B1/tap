package com.btf.tap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.btf.tap.service.CategoryService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CategoryController {
	@Autowired CategoryService categoryService;
	
	@GetMapping("/systemAdmin/categoryList")
	public String categoryList() {
		return "/category/categoryList";
	}
	
	@GetMapping("/systemAdmin/roomCategoryList")
	public String roomCategoryList(Model model) {
		model.addAttribute("roomCategoryList", categoryService.getRoomCategoryList());
		return "/category/roomCategoryList";
	}
}
