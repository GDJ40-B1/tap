package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.MemberCoupon;

@Mapper
public interface MemberCouponMapper {

	// 보유중인 쿠폰 리스트
	List<MemberCoupon> selectMemberCouponList(Map<String,Object> map);
	// 보유중인 쿠폰 전체 갯수
	int selectMemberCouponTotalCount(String memberId);

}
