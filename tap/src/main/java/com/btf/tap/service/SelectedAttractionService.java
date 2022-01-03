package com.btf.tap.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.AttractionMapper;
import com.btf.tap.mapper.SelectedAttractionMapper;
import com.btf.tap.vo.Address;
import com.btf.tap.vo.Attraction;
import com.btf.tap.vo.SelectedAttraction;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class SelectedAttractionService {
	@Autowired SelectedAttractionMapper selectedAttractionMapper;
	//@Autowired AttractionMapper attractionMapper;
	//@Autowired HashtagService hashtagService;
		
	// 명소 선택하기
	public int addSelectedAttraction(SelectedAttraction selectedAttraction) {
		return selectedAttraction.getSelectedAttractionId();
	}
	
	// 선택한 명소 보여주기(리스트)
	public List<SelectedAttraction> getSelectedAttractionList(){
		List<SelectedAttraction> list = selectedAttractionMapper.selectSelectedAttractionList();
		return list;
	}
	
	//선택한 명소 수정하기(날짜나 시간)
	public void modifySelectedAttraction(SelectedAttraction selectedAttraction) {
		selectedAttractionMapper.updateSelectedAttraction(selectedAttraction);
	}
	
	
	// 선택한 명소 삭제하기
	public void removeSelectedAttraction(int selectedAttractionId) {
		selectedAttractionMapper.deleteSelectedAttraction(selectedAttractionId);
	}
	
	
}
