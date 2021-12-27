package com.btf.tap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.CategoryMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class CategoryService {
	@Autowired CategoryMapper categoryMapper;
	
	// 숙소 카테고리 목록
	public List<String> getRoomCategoryList(){
		return categoryMapper.selectRoomCategoryList();
	}
	
}
