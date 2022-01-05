package com.btf.tap.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.CouponMapper;
import com.btf.tap.vo.Coupon;
import com.btf.tap.vo.MemberCoupon;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class CouponService {
	@Autowired CouponMapper couponMapper;
	// add, modify, get, remove
	
	// 특정 회원의 보유 쿠폰 추출
	public List<MemberCoupon> getMemberCouponList(String memberId){
		return couponMapper.selectMemberOneCouponList(memberId);	
	}
	
	// 쿠폰 사용시 사용 여부 변경
	public void modifyUseMemberCoupon(Map<String, Object> map) {
		couponMapper.updateUseMemberCoupon(map);
	}
	
	// 결제시 쿠폰 목록
	public List<Coupon> getPaymentCoupon(int roomId, String memberId){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("roomId", roomId);
		map.put("memberId", memberId);
		List<Coupon> couponList = couponMapper.selectRoomMemberCoupon(map);
		List<Coupon> resultList = new ArrayList<>();
		
		for(Coupon c : couponList) {
			SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
            Date effectiveDate=null;
            Date expirationDate=null;
            Date today = new Date();
            String todayStr = null;
			try {
				effectiveDate = sdformat.parse(c.getCouponEffectiveDate());
				expirationDate = sdformat.parse(c.getCouponExpirationDate());
				todayStr = sdformat.format(today);
				today = sdformat.parse(todayStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			System.out.println(effectiveDate);
			System.out.println(expirationDate);
			System.out.println(today);
			// 유효기간에 맞는 쿠폰일 경우에만 추출
            if ((today.after(effectiveDate) || effectiveDate.equals(today)) && (expirationDate.after(today) || expirationDate.equals(today))) {
                resultList.add(c);
            }
		}
		
		return resultList;
	}
	
	// 특정 숙소에서 특정 회원이 발급받지 않은 쿠폰 목록 추출
	public List<Coupon> getNotMemberCoupon(Map<String, Object> memberCoupon){
		List<Coupon> couqonList = couponMapper.selectNotMemberCoupon(memberCoupon);
		return couqonList;
	}
	
	// 보유 쿠폰 추가
	public void addMemberCoupon(Map<String, Object> memberCoupon) {
		// 쿠폰의 수량이 하나 이상이라면, 쿠폰을 추가한다.
		if(!(couponMapper.selectCouponQuantity((int)memberCoupon.get("couponId"))<1)) {
			couponMapper.updateCouponQuantity((int)memberCoupon.get("couponId"));
			couponMapper.insertMemberCoupon(memberCoupon);
		}
	}
	
	// 쿠폰 수정
	public void modifyCoupon(Coupon coupon) {
		couponMapper.updateCoupon(coupon);
	}
	
	// 쿠폰 삭제
	public void removeCoupon(int couponId) {
		// 보유 쿠폰에서 특정 쿠폰 전부 삭제(쿠폰 삭제시)
		couponMapper.deleteMemberCoupon(couponId);
		// 쿠폰 삭제
		couponMapper.deleteCoupon(couponId);
	}
	
	// 특정 쿠폰 정보 추출
	public Coupon getCouponOne(int couponId) {
		return couponMapper.selectCouponOne(couponId);
	}
	
	// 쿠폰 생성
	public void addCoupon(Coupon coupon){
		couponMapper.insertCoupon(coupon);
	}
	
	// 특정 숙소의 발급 가능 쿠폰 목록 추출
	public List<Coupon> getRoomAbleCouponList(int roomId){
		List<Coupon> couqonList = couponMapper.selectRoomAbleCouponList(roomId);
		return couqonList;
	}
	
	// 특정 숙소 쿠폰 목록 추출
	public List<Coupon> getRoomCouponList(int roomId){
		List<Coupon> couqonList = couponMapper.selectRoomCouponList(roomId);
		return couqonList;
	}
}