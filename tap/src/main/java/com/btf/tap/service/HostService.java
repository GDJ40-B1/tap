package com.btf.tap.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.HostMapper;
import com.btf.tap.vo.Host;
import com.btf.tap.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class HostService {
	@Autowired HostMapper hostMapper;
	
	// 호스트 한 명의 정보를 불러오기
	// 입력: Host
	// 결과: Host
	public Host getHostOne(Host host) {
		
		log.debug(Font.HW + "입력받은 호스트 정보 => " + host.toString() + Font.RESET);
		
		host = hostMapper.selectHostOne(host);
		
		log.debug(Font.HW + "조회 결과 호스트 정보 => " + host.toString() + Font.RESET);
		
		return host;
	}

	// 호스트 한 명의 정보를 추가하기
	// 입력: Host
	// 결과: int(회원가입된 수)
	public int addHost(Host host) {
		
		log.debug(Font.HW + "입력받은 호스트 회원가입 정보 => " + host.toString() + Font.RESET);
		
		int confirm = hostMapper.insertHostOne(host);
		
		log.debug(Font.HW + "호스트 회원가입된 수 => " + confirm  + Font.RESET);
		
			
		return confirm;
	}
}
