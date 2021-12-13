package com.btf.tap.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.AddressMapper;
import com.btf.tap.mapper.AttractionMapper;
import com.btf.tap.vo.Address;
import com.btf.tap.vo.Attraction;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class AttractionService {
	@Autowired AttractionMapper attractionMapper;
	@Autowired AddressMapper addressMapper;
	
	// 특정 명소 정보 추출
	public Map<String, Object> getAttractionOne(int attractionId, int detailAddressId){
		Map<String, Object> map = new HashMap<>();
		Address address = addressMapper.selectAddressOne(detailAddressId);
		
		// 시도+시군구+도로명+상세주소 합치기 => kakao 지도 API 검색을 위해
		String detailAddress = address.getSido()+" "+address.getSigungu()+" "+address.getRoadName()+" "+address.getDetailAddress();
		address.setDetailAddress(detailAddress);
		
		// 주소 정보
		map.put("address", address);
		// 명소 정보
		map.put("attraction", attractionMapper.selectAttractionOne(attractionId));
		return map;
	}	
	
	// 명소 카테고리
	public List<String> getAttractionCategory(){
		List<String> attractionCategoryList = attractionMapper.selectAttractionCategory();
		return attractionCategoryList;
	}
	
	// 명소삭제(고쳐야함 오류남..)
	public void removeAttraction(int attractionId) {
		int detailAddressId = attractionMapper.selectAttractionOne(attractionId).getDetailAddressId();
		attractionMapper.deleteAttraction(attractionId);
		addressMapper.deleteDetailAddress(detailAddressId);
	}
	
	// 명소 수정
	public void modifyAttraction(Attraction attraction, Address address) {
		address.setAddressId(addressMapper.searchAddressOne(address).getAddressId());
		addressMapper.updateDetailAddress(address);
		attractionMapper.updateAttraction(attraction);
	}		
	
	// 명소 전체 목록
	public List<Attraction> getAttractionList(){
		List<Attraction> list = attractionMapper.selectAttractionList();
		return list;
	}
	
	// 명소 등록
	public int addAttraction(Attraction attraction, Address address) {
		String[] addressList = address.getDetailAddress().split(" ");
		address.setSido(addressList[0]);
		address.setSigungu(addressList[1]);
		address.setRoadName(addressList[2]);
		address.setDetailAddress(addressList[3]);
		
		// address 테이블에서 해당 주소를 검색 후
		// 상세주소 테이블에 데이터를 삽입한다
		address.setAddressId((addressMapper.searchAddressOne(address)).getAddressId());
		addressMapper.insertDetailAddress(address);
		
		// 상세주소 테이블의 데이터 삽입 시 생성된 id값을
		// 숙소 등록시 상세주소 값으로 사용한다
		attraction.setDetailAddressId(address.getDetailAddressId());
		attractionMapper.insertAttraction(attraction);
		
		return attraction.getAttractionId(); 
		
	}

}
