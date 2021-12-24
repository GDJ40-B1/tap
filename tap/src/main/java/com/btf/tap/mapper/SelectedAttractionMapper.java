package com.btf.tap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.SelectedAttraction;

@Mapper
public interface SelectedAttractionMapper {

	// 명소 선택(추가)
	int insertSelectedAttraction(SelectedAttraction selectedAttraction);
	// 선택한 명소 목록 출력
	List<SelectedAttraction> selectSelectedAttractionList();
	// 선택한 명소 수정
	//void updateSelectedAttraction(SelectedAttraction selectedAttraction);
	// 선택한 명소 삭제
	void deleteSelectedAttraction(int selectedAttractionId);
	
}
