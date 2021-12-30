package com.btf.tap.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.FeeMapper;
import com.btf.tap.vo.Fee;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class FeeService {
	@Autowired FeeMapper feeMapper;
	
	// 전환시 발생되는 수수료정보 삽입
	public void addFee(int originalPrice) {
		int feeRate = getFeeRate(); // 수수료%
		int systemAdminFee = (int) (originalPrice*(feeRate*0.01)); // 수수료 값(시스템 관리자 수익)
		Fee fee = new Fee();
		fee.setOriginalPrice(originalPrice);
		fee.setFeeRate(feeRate);
		fee.setFee(systemAdminFee);
		fee.setHostProfit(originalPrice-systemAdminFee);
		
		feeMapper.insertFee(fee);
	}
	
	// 현재 수수료% 추출
	public int getFeeRate() {
		return feeMapper.selectFeeRate();
	}

}
