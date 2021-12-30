package com.btf.tap.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.HostMapper;
import com.btf.tap.mapper.UserMapper;
import com.btf.tap.vo.Host;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class HostService {
	@Autowired HostMapper hostMapper;
	@Autowired UserMapper userMapper;
	@Autowired FeeService feeService;

	
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
	// 결과: int(호스트가입된 수)
	public int addHost(Host host) {
		int confirm = 0;
		
		String userId = host.getHostId();
		
		log.debug(Font.HW + "입력받은 호스트 호스트가입 정보 => " + host.toString() + Font.RESET);
		
		int checkId = userMapper.selectUserId(userId);
		
		log.debug(Font.HW + "중복 또는 탈퇴 ID 체크 => " + checkId + Font.RESET);
		
		if(checkId == 0) {
			confirm = hostMapper.insertHostOne(host);
			log.debug(Font.HW + "호스트 호스트가입된 수 => " + confirm  + Font.RESET);
		}
		
		return confirm;
	}
	
	// 호스트 한 명의 정보를 삭제하기
	// 입력: Host
	// 결과: int(호스트탈퇴된 수)
	public int removeHost(Host host) {
		
		log.debug(Font.HW + "입력받은 호스트탈퇴 정보 => " + host.toString() + Font.RESET);
		
		int confirm = hostMapper.deleteHostOne(host);
		
		log.debug(Font.HW + "호스트탈퇴된 수 => " + confirm  + Font.RESET);
		
		return confirm;
	}

	// 호스트 한 명의 정보를 수정하기
	// 입력: Host
	// 결과: Host(변경된 호스트의 객체)
	public Host modifyHostInfo(Host host) {
		log.debug(Font.HW + "입력받은 호스트정보 변경 정보 => " + host.toString() + Font.RESET);
		
		int confirm = hostMapper.updateHostOne(host);
		
		log.debug(Font.HW + "호스트정보 변경된 호스트 수 => " + confirm  + Font.RESET);
		
		host = hostMapper.selectHostOne(host);
		
		log.debug(Font.HW + "변경된 호스트 정보 => " + host.toString() + Font.RESET);
		
		return host;
	}
	
	// 호스트 한 명의 비밀번호를 수정하기
	// 입력: Host, String HostNewPw
	// 결과: Host(변경된 호스트의 객체)
	public Host modifyHostPw(Host host) {
		
		log.debug(Font.HW + "입력받은 비밀번호 변경 정보 => " + host.toString() + Font.RESET);
		
		// 호스트 비밀번호 변경
		int confirm = hostMapper.updateHostPw(host);
		
		log.debug(Font.HW + "비밀번호 변경된 호스트 수 => " + confirm  + Font.RESET);
		
		// 변경된 호스트 정보 주입
		host = hostMapper.selectHostOne(host);
		
		log.debug(Font.HW + "변경된 호스트 정보 => " + host.toString() + Font.RESET);
		
		return host;
	}
	
	// 호스트 한 명의 비밀번호를 일치여부 확인하기
	// 입력: Host
	// 결과: int (일치하는 호스트 수)
	public int checkHostPw(Host host) {
		
		log.debug(Font.HW + "입력받은 비밀번호 확인 정보 => " + host.toString() + Font.RESET);
		
		// 입력받은 호스트의 비밀번호가 기존 비밀번호와 일치하는지 확인
		int confirm = hostMapper.selectHostPw(host);
		
		log.debug(Font.HW + "일치하는 호스트 수 => " + confirm  + Font.RESET);
		
		
		return confirm;
	}
	
	// 호스트 한 명의 포인트 증가(충전)
	// 입력: Host
	// 결과: int (포인트 증가한 호스트 수)
	public int earnHostPoint(Host host) {
		
		// 입력받은 충전할 포인트 확인
		log.debug(Font.HW + "입력받은 포인트 증가 정보 => " + host.toString() + Font.RESET);
		
		// 포인트 충전 실행
		int confirm = hostMapper.updateHostPointEarn(host);
		
		// 결과 확인
		log.debug(Font.HW + "포인트 증가된 호스트 수 => " + confirm  + Font.RESET);
		
		return confirm;
	}
	
	// 호스트 한 명의 포인트 감소(사용)
	// 입력: Host
	// 결과: int (포인트 감소한 호스트 수)
	public int spendHostPoint(Host host) {
		
		// 전환할 포인트 확인
		log.debug(Font.HW + "입력받은 포인트 감소 정보 => " + host.toString() + Font.RESET);
		
		// 입력받은 호스트의 기존 포인트 확인하기
		Host oldHost = hostMapper.selectHostOne(host);
		log.debug(Font.HW + "입력받은 호스트의 기존 포인트 정보 => " + oldHost.toString() + Font.RESET);
		
		// 기존 포인트에서 입력받은 포인트를 빼기
		oldHost.setHostPoint(oldHost.getHostPoint() - host.getHostPoint());
		log.debug(Font.HW + "입력받은 호스트의 감소된 포인트 정보 => " + oldHost.toString() + Font.RESET);
		
		// 전환 성공 여부를 저장할 변수
		int confirm = 0;
		
		// 가진 포인트 이상의 금액을 전환하려고 할 경우, 실패를 알리는 0을 반환
		if (oldHost.getHostPoint() < 0) {
			return confirm;
		}
		
		// 포인트 전환 실행
		confirm = hostMapper.updateHostPointSpend(host);
		
		feeService.addFee(host.getHostPoint());
		
		// 결과 확인
		log.debug(Font.HW + "포인트 감소된 호스트 수 => " + confirm  + Font.RESET);
		
		return confirm;
	}
	
	// 호스트 전체 목록 불러오기
	// 입력 : currentPage, rowPerPage
	// 출력 : paramMap(list,lastPage,startPage,endPage) 
	public Map<String,Object> getHostList(int currentPage, int rowPerPage) {
		// 데이터 시작 행
		int beginRow = 0;
		beginRow = (currentPage-1) * rowPerPage;
		
		// selectHostList() 메소드의 page 매개변수 객체 생성
		Map<String,Object> page = new HashMap<>();
		page.put("beginRow", beginRow);
		page.put("rowPerPage", rowPerPage);
		log.debug(Font.HS + "page 객체에 저장된 값 => " + page.toString() + Font.RESET);
		
		List<Host> list = hostMapper.selectHostList(page);
		log.debug(Font.HS + "호스트 전체 목록 => " + list.toString() + Font.RESET);
		
		// 전체 회원 수
		int totalHostCount = hostMapper.totalHostCount();
		log.debug(Font.HS + "전체 호스트 수 => " + totalHostCount + Font.RESET);
		
		// 총 데이터의 마지막 페이지
		int lastPage = 0;
		lastPage = totalHostCount / rowPerPage;
		if(totalHostCount % rowPerPage != 0) {
			lastPage += 1;
		}
		
		// 페이징의 시작 페이지
		int startPage = 0;
		startPage = ((currentPage-1) / rowPerPage) * rowPerPage + 1;
		
		// 페이징의 끝 페이지
		int endPage = 0;
		endPage = startPage + rowPerPage - 1;
		
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("list", list);
		paramMap.put("lastPage", lastPage);
		paramMap.put("startPage", startPage);
		paramMap.put("endPage", endPage);
		log.debug(Font.HS + "paramMap 객체에 저장된 값 => " + paramMap.toString() + Font.RESET);
		
		return paramMap;
	}
}
