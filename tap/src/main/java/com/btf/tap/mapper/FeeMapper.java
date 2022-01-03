package com.btf.tap.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Fee;

@Mapper
public interface FeeMapper {
	
	// 전환시 발생되는 수수료정보 삽입
	void insertFee(Fee fee);
	
	// 현재 수수료% 추출
	int selectFeeRate();
}
