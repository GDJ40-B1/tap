package com.btf.tap.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Address;
import com.btf.tap.vo.Room;

@Mapper
public interface AddressMapper {
	
	// 특정 주소 정보 추출
	Address selectAddressOne(int detailAddressId);
	
	// 특정 주소 검색
	Address searchAddressOne(Address address);
	
	// 상세 주소 등록
	int insertDetailAddress(Address address);
	
	// 상세 주소 수정
	void updateDetailAddress(Address address);
	
	// 상세 주소 삭제
	void deleteDetailAddress(int detailAddressId);
	
}
