package com.btf.tap.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.MemberCouponMapper;
import com.btf.tap.vo.MemberCoupon;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class MemberCouponService {
	@Autowired MemberCouponMapper memberCouponMapper;
	
	// 리스트 목록
	public Map<String, Object> getMemberCouponList(String memberId, int currentPage, int rowPerPage){
		
		Map<String, Object> paramMap = new HashMap<>();
		
		int beginRow = (currentPage-1)*rowPerPage;
		paramMap.put("memberId", memberId);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		List<MemberCoupon> list = memberCouponMapper.selectMemberCouponList(paramMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		int lastPage = 0;
		int totalCount = memberCouponMapper.selectMemberCouponTotalCount(memberId);
		lastPage = totalCount/rowPerPage;
		if(totalCount%rowPerPage!=0) {
			lastPage +=1;
		}
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		return returnMap;		
	}

	
}
