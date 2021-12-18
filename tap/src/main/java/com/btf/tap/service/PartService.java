package com.btf.tap.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.PartMapper;
import com.btf.tap.vo.RoomPart;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class PartService {
	@Autowired PartMapper partMapper;
	
	// 숙소별 구성 삭제
	public void removeRoomPart(int roomId) {
		partMapper.deleteRoomPart(roomId);
	}
	
	// 숙소별 구성 추가
	public void addRoomPart(String part, int roomId) {
		// 각 구성별로(|) 분리
		String[] partList = part.split("/");
		RoomPart roomPart = null;
		for(String p : partList) {
			// 구성 이름과 수량으로 분리
			String[] partOne = p.split("&");
			// 수량이 0이 아닌 경우만 추가
			if(!partOne[1].equals("0")) {
				roomPart = new RoomPart();
				roomPart.setPartName(partOne[0]);
				roomPart.setQuantity(Integer.parseInt(partOne[1]));
				roomPart.setRoomId(roomId);
				partMapper.insertRoomPart(roomPart);
			}
		}
	}
	
	// 구성 목록 추출
	public List<String> getPartList(){
		return partMapper.selectPartList();
	}
}
