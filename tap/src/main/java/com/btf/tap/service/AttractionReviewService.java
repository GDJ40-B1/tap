package com.btf.tap.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.AttractionReviewMapper;
import com.btf.tap.vo.AttractionReview;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class AttractionReviewService {
	@Autowired AttractionReviewMapper attractionReviewMapper;
	
	//public int addAttractionReview(AttractionReview attractionReview, SelectedAttraction selectedAttraction) {
	//	return "";
		
	//}
}
