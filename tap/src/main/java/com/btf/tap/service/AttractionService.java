package com.btf.tap.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.btf.tap.common.Font;
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
	@Autowired HashtagService hashtagService;
	@Autowired ImageService imageService;
	
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
		// 해시태그 정보
		map.put("hashtag", hashtagService.getHashtag("attraction", attractionId));
		// 사진 정보
		map.put("imageList", imageService.getTargetImage("attraction", attractionId));
		
		return map;
	}	
	
	// (미승인된)특정 명소 정보 추출
	public Map<String, Object> getApprovalAttractionOne(int attractionId, int detailAddressId){
		Map<String, Object> map = new HashMap<>();
		Address address = addressMapper.selectAddressOne(detailAddressId);
		
		// 시도+시군구+도로명+상세주소 합치기 => kakao 지도 API 검색을 위해
		String detailAddress = address.getSido()+" "+address.getSigungu()+" "+address.getRoadName()+" "+address.getDetailAddress();
		address.setDetailAddress(detailAddress);
		
		// 주소 정보
		map.put("address", address);
		// 명소 정보
		map.put("attraction", attractionMapper.selectAttractionOne(attractionId));
		// 해시태그 정보
		map.put("hashtag", hashtagService.getHashtag("attraction", attractionId));
		// 사진 정보
		map.put("imageList", imageService.getTargetImage("attraction", attractionId));
		return map;
	}		
	
	// 명소 카테고리
	public List<String> getAttractionCategory(){
		List<String> attractionCategoryList = attractionMapper.selectAttractionCategory();
		return attractionCategoryList;
	}
	
	// 명소삭제
	public void removeAttraction(HttpServletRequest request,int attractionId) {
		int detailAddressId = attractionMapper.selectAttractionOne(attractionId).getDetailAddressId();
		hashtagService.removeHashtag("attraction", attractionId);
		imageService.removeImage(request, "attraction", attractionId);
		attractionMapper.deleteAttraction(attractionId);
		addressMapper.deleteDetailAddress(detailAddressId);
	}
	
	// 승인
	public void approvalAttraction(int attractionId) {
		attractionMapper.approvalAttraction(attractionId);
	}
	
	
	// 명소 수정
	public Address modifyAttraction(Attraction attraction, Address address, String hashtag, MultipartHttpServletRequest mtRequest) {
		String[] addressList = address.getDetailAddress().split(" ");
		address.setSido(addressList[0]);
		address.setSigungu(addressList[1]);
		address.setRoadName(addressList[2]);
		address.setDetailAddress(addressList[3]);				
		
		address.setAddressId(addressMapper.searchAddressOne(address).getAddressId());
		addressMapper.updateDetailAddress(address);
		attractionMapper.updateAttraction(attraction);
		hashtagService.modifyHashtag(hashtag, "attraction", attraction.getAttractionId());
		imageService.modifyTargetImage(mtRequest, "attraction", attraction.getAttractionId());
		return address;
	}		
	
	// 명소 전체 목록(승인된것만) 
	public Map<String, Object> getAttractionList(String approvalStatus, int currentPage, int rowPerPage){
		
		Map<String, Object> paramMap = new HashMap<>();
		
		int beginRow = (currentPage-1)*rowPerPage;
		paramMap.put("approvalStatus", approvalStatus);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		List<Attraction> list = attractionMapper.selectAttractionList(paramMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		int lastPage = 0;
		int totalCount = attractionMapper.selectAttractionTotalCount(approvalStatus);
		lastPage = totalCount/rowPerPage;
		if(totalCount%rowPerPage!=0) {
			lastPage +=1;
		}
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		return returnMap;
		
	
		
	}
	
	// 명소 등록
	public int addAttraction(Attraction attraction, Address address, String hashtag, MultipartHttpServletRequest mtRequest) {
		
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
		
		// 해시태그 추가
		hashtagService.addHashtag(hashtag, "attraction", attraction.getAttractionId());
		
		// 이미지 추가
		imageService.addImage(mtRequest, "attraction", attraction.getAttractionId());;
		return attraction.getAttractionId(); 
		
	}
	
	// 승인 대기중인 명소리스트
	public Map<String,Object> getApprovalAttractionList(String approvalStatus, int currentPage, int rowPerPage){
		
		Map<String, Object> paramMap = new HashMap<>();
		
		int beginRow = (currentPage-1)*rowPerPage;
		paramMap.put("approvalStatus", approvalStatus);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		List<Attraction> list = attractionMapper.selectApprovalAttractionList(paramMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		int lastPage = 0;
		int totalCount = attractionMapper.selectBeforeAttractionTotalCount(approvalStatus);
		lastPage = totalCount/rowPerPage;
		if(totalCount%rowPerPage!=0) {
			lastPage +=1;
		}
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		return returnMap;
	}	
	
	
	// 사용자 설정 선호지역 별 인기 명소 리스트
	public Map<String, Object> getPreferLocalAttractionList(int preferAttractionCurrent, String sido, String sigungu) {
		int defaultPage = 10;
		final int rowPerPage = 8;
		int startPage = ((preferAttractionCurrent - 1) / defaultPage) * defaultPage + 1;
		int endPage = startPage + defaultPage - 1;		
		int beginRow = (preferAttractionCurrent-1) * rowPerPage;
		int lastPage = 0;
		
		Map<String, Object> page = new HashMap<>();
		page.put("beginRow", beginRow);
		page.put("rowPerPage", rowPerPage);
		page.put("sido", sido);
		page.put("sigungu", sigungu);
		
		List<Map<String, Object>> list = attractionMapper.selectPreferLocalAttractionList(page);
		log.debug(Font.JSB + list.toString() + Font.RESET);
		
		int totalRowCount = attractionMapper.preferLocalAttractionTotalCount(page);
		
		lastPage = totalRowCount / rowPerPage;
		
		if(totalRowCount % rowPerPage != 0) {
			lastPage+=1;
		}
		
		if(endPage > lastPage) {
			endPage = lastPage;
		}		
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("list", list);
		paramMap.put("startPage", startPage);
		paramMap.put("endPage", endPage);
		paramMap.put("lastPage", lastPage);
		
		return paramMap;
	}
	
	// 특정 숙소 주변 명소 목록 추출
	public List<Attraction> getAttractionArroundRoom(int roomId){
		return attractionMapper.selectAttractionArroundRoom(roomId);
	}
	
	// 명소 조회수
	public int updateAttractionCnt(int attractionId) {
		return attractionMapper.updateAttractionCnt(attractionId);
	}
	
}
