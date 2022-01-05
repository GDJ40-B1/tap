package com.btf.tap.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.btf.tap.common.Font;
import com.btf.tap.mapper.RoomMapper;
import com.btf.tap.service.HostService;
import com.btf.tap.service.ReservationService;
import com.btf.tap.service.RoomQuestionService;
import com.btf.tap.service.RoomService;
import com.btf.tap.vo.Host;
import com.btf.tap.vo.Room;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HostController {
	
	@Autowired HostService hostService;
	@Autowired ReservationService reservationService;
	@Autowired RoomService roomService;
	@Autowired RoomQuestionService roomQuestionService;
	@Autowired RoomMapper roomMapper;
	
	@PostMapping("/earnHostPoint")
	public String postEarnHostPoint(HttpServletRequest request, Model model, Host host) {
		
		HttpSession session = request.getSession();
		
		// 세션의 이용자(유저) 객체 가져오기
		User user = (User) session.getAttribute("loginUser");
		
		// 로그인 되있지 않을 경우, 홈페이지로 이동
		if(user == null) {
			return "redirect:/";
		}
		
		// 포인트 증가 입력 디버깅
		log.debug(Font.HW + "입력받은 포인트 증가 정보 => " + host.toString() + Font.RESET);
		
		// 포인트 증가 로직 실행
		int confirm = hostService.earnHostPoint(host);
		
		// 포인트 증가가 안 되었을 시, 다시 시도하도록 redirect
		if (confirm==0) {
			log.debug(Font.HW + "포인트 증가 실패 => " +  host.toString() + Font.RESET);
			return "redirect:/hostPointInfo";
		}
		
		// 포인트 증가된 호스트 정보 가져오기
		host = hostService.getHostOne(host);
		
		// 포인트 증가 로직 처리 결과 디버깅
		log.debug(Font.HW + "포인트 증가된 호스트 정보 => " + host.toString() + Font.RESET);
		
		// 세션에 저장된 이용자 객체를 변경된 정보로 최신화
		user.setUserPoint(host.getHostPoint());
		session.setAttribute("loginUser", user);
		
		// 포인트 정보 페이지로 이동
		return "redirect:/hostPointInfo";
	}
	
	@PostMapping("/spendHostPoint")
	public String postSpendHostPoint(HttpServletRequest request, Model model, Host host) {
	
		HttpSession session = request.getSession();
		
		// 세션의 이용자(유저) 객체 가져오기
		User user = (User) session.getAttribute("loginUser");
		
		// 로그인 되있지 않을 경우, 홈페이지로 이동
		if(user == null) {
			return "redirect:/";
		}
		
		// 포인트 증가 입력 디버깅
		log.debug(Font.HW + "입력받은 포인트 감소 정보 => " + host.toString() + Font.RESET);
		
		// 포인트 감소 로직 실행
		int confirm = hostService.spendHostPoint(host);
		
		// 포인트 감소가 안 되었을 시, 다시 시도하도록 redirect
		if (confirm==0) {
			log.debug(Font.HW + "포인트 감소 실패 => " +  host.toString() + Font.RESET);
			return "redirect:/hostPointInfo";
		}
		
		// 포인트 감소된 호스트 정보 가져오기
		host = hostService.getHostOne(host);
		
		// 포인트 증가 로직 처리 결과 디버깅
		log.debug(Font.HW + "포인트 감소된 호스트 정보 => " + host.toString() + Font.RESET);
		
		// 세션에 저장된 이용자 객체를 변경된 정보로 최신화
		user.setUserPoint(host.getHostPoint());
		session.setAttribute("loginUser", user);
		
		// 포인트 정보 페이지로 이동
		return "redirect:/hostPointInfo";
	}
	
	@GetMapping("/hostPointInfo")
	public String getPointHostInfo(HttpServletRequest request, Model model) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 세션에서 로그인 유저 객체 받기 
		User user = (User) session.getAttribute("loginUser");
		
		// 유저 객체속 아이디를 호스트 객체에 넣어 조회하기
		Host host = new Host();
		host.setHostId(user.getUserId());
		host = hostService.getHostOne(host);
		
		// 호스트 정보 주입
		model.addAttribute("host", host);
		
		// 포인트 정보 페이지로 이동
		return "host/hostPointInfo";
	}
	
	@GetMapping("/modifyHostPw")
	public String getModifyHostPw(HttpServletRequest request, Model model) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 세션에서 로그인 유저 객체 받기 
		User user = (User) session.getAttribute("loginUser");
		
		// 유저 객체속 아이디를 호스트 객체에 넣어 조회하기
		Host host = new Host();
		host.setHostId(user.getUserId());
		host = hostService.getHostOne(host);
		
		// 호스트 정보 주입
		model.addAttribute("host", host);
		
		// 호스트 비밀번호 변경 페이지로 이동
		return "host/modifyHostPw";
	}
	
	
	
	@PostMapping("/modifyHostPw")
	public String postModifyHostPw(HttpServletRequest request, Host host, Model model, String hostNewPw) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 비밀번호 입력 디버깅
		log.debug(Font.HW + "입력받은 비밀번호 일치여부 확인 정보 => " + host.toString() + Font.RESET);
		
		int confirm = hostService.checkHostPw(host);
		
		// 비밀번호 불일치시 다시 입력받도록 리다이렉트
		if (confirm==0) {
			log.debug(Font.HW + "입력받은 비밀번호 불일치 => " +  host.toString() + Font.RESET);
			return "redirect:/modifyHostPw";
		}
		
		// 새로운 비밀번호 입력 디버깅
		log.debug(Font.HW + "입력받은 새로운 비밀번호 변경 정보 => " + hostNewPw + Font.RESET);
		
		// 새로운 비밀번호 세팅
		host.setHostPw(hostNewPw);
		
		// 비밀번호 변경
		host = hostService.modifyHostPw(host);
		
		// 호스트 정보 주입
		model.addAttribute("host", host);
		
		// 로그아웃
		return "redirect:/logout";
	}
	
	@GetMapping("/modifyHostInfo")
	public String getModifyHostInfo(HttpServletRequest request, Model model) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 세션에서 로그인 유저 객체 받기 
		User user = (User) session.getAttribute("loginUser");
		
		// 유저 객체속 아이디를 호스트 객체에 넣어 조회하기
		Host host = new Host();
		host.setHostId(user.getUserId());
		host = hostService.getHostOne(host);
		
		// 호스트 정보 주입
		model.addAttribute("host", host);
		
		// 호스트 호스트정보 변경 페이지로 이동
		return "host/modifyHostInfo";
	}
	
	
	
	@PostMapping("/modifyHostInfo")
	public String postModifyHostInfo(HttpServletRequest request, Host host, Model model) {
	
		HttpSession session = request.getSession();
			
		// 로그인 되있있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 입력 디버깅
		log.debug(Font.HW + "입력받은 호스트변경 정보 => ", host.toString() + Font.RESET);
		
		// 호스트정보 변경
		host = hostService.modifyHostInfo(host);
		
		// 호스트 정보 주입
		model.addAttribute("host", host);
		
		// 호스트 마이페이지로 이동
		return "redirect:/hostMyPage";
	}
	
	@GetMapping("/hostMyPage")
	public String getMyPage(HttpSession session, Model model, @RequestParam(name="roomId", defaultValue = "0") int roomId, @RequestParam(name="year", defaultValue = "0") int year, String roomName) {
			
		// 로그인 되있있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		// 세션에서 로그인 유저 객체 받기 
		User user = (User) session.getAttribute("loginUser");
		String hostId = user.getUserId();
		
		// 유저 객체속 아이디를 호스트 객체에 넣어 조회하기
		Host host = new Host();
		host.setHostId(user.getUserId());
		host = hostService.getHostOne(host);
		
		// 페이지 초기 접근 시 현재 연도 값을 가져옴
		if(year == 0) {
			LocalDate now = LocalDate.now();
			year = now.getYear();
		}
		
		List<Map<String, Object>> list = reservationService.getRoomReservationCheck(roomId, year);
		log.debug(Font.JSB + "특정 숙소 연도별 이용객 수 =>" + list.toString() + Font.RESET);
		
		List<Room> roomList = roomService.getPayRoomList(hostId);
		log.debug(Font.JSB + "숙소명 목록 =>" + roomList.toString() + Font.RESET);
		
		List<Map<String, Object>> ageList = roomService.getRoomAgeList(roomId, year);
		log.debug(Font.JSB + "특정 숙소 연도별 이용 연령층 =>" + ageList.toString() + Font.RESET);
		
		String revenueHost = hostService.getRevenueHost(hostId);
		log.debug(Font.JSB + "총합 수익 =>" + revenueHost + Font.RESET);
		
		String yearRevenueHost = hostService.getYearRevenueHost(year, hostId);
		log.debug(Font.JSB + "연도별 수익 =>" + yearRevenueHost + Font.RESET);
		
		List<Map<String, Object>> monthRevenueHost = hostService.getMonthRevenueHost(year, hostId);
		log.debug(Font.JSB + "월별 총 수익 =>" + monthRevenueHost.toString() + Font.RESET);
		
		List<Map<String, Object>> roomMonthRevenue = hostService.getRoomMonthRevenue(year, hostId, roomId);
		log.debug(Font.JSB + "숙소 월별 수익 =>" + roomMonthRevenue.toString() + Font.RESET);
		
		int unansweredRoomQnaCount = roomQuestionService.unansweredRoomQnaCount(hostId);
		log.debug(Font.JSB + "문의 미답변 수 =>" + unansweredRoomQnaCount + Font.RESET);
		
		
		model.addAttribute("host", host);
		model.addAttribute("year", year);
		model.addAttribute("list", list);
		model.addAttribute("roomName", roomName);
		model.addAttribute("roomList", roomList);
		model.addAttribute("ageList", ageList);
		model.addAttribute("revenueHost", revenueHost);
		model.addAttribute("yearRevenueHost", yearRevenueHost);
		model.addAttribute("monthRevenueHost", monthRevenueHost);
		model.addAttribute("roomMonthRevenue", roomMonthRevenue);
		model.addAttribute("unansweredRoomQnaCount", unansweredRoomQnaCount);
		
		// 마이페이지로 이동
		return "host/hostMyPage";
	}
	
	@GetMapping("/addHost")
	public String getAddHost(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// 로그인 되있을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") != null) {
			return "redirect:/";
		}
		
		// 호스트 호스트가입 페이지로 이동
		return "host/hostRegister";
	}
	
	@PostMapping("/addHost")
	public String postAddhost(Host host ) {
		
		// 입력 디버깅
		log.debug(Font.HW + "입력받은 호스트 호스트가입 정보 => ", host.toString() + Font.RESET);
		
		
		// 호스트가입 처리 후, 결과를 저장
		int confirm = hostService.addHost(host);
		
		// 호스트가입이 안 되어었을 경우 다시 호스트가입 실패 알림
		if(confirm == 0) {
			log.debug(Font.HW + "호스트 호스트가입 실패 " + Font.RESET);
			return "redirect:/addHost";
		}
		
		// 출력 디버깅
		log.debug(Font.HW + "호스트 호스트가입 성공 " + Font.RESET);
		
		// 홈페이지로 이동
		return "redirect:/";
		
	}
	
	@GetMapping("/removeHost")
	public String getRemoveHost(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		// 로그인 되어있지 않을 경우, 홈페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/";
		}
		
		model.addAttribute("roomNum",roomMapper.selectHostRoomNum(user.getUserId()));
		
		// 호스트탈퇴 페이지로 이동
		return "host/hostWithdraw";
		
	}
	
	@PostMapping("/removeHost")
	public String postRemoveHost(Host host) {
		
		// 입력 디버깅
		log.debug(Font.HW + "입력받은 호스트탈퇴 정보 => ", host.toString() + Font.RESET);
		
		// 호스트탈퇴 처리 후, 결과를 저장
		int confirm = hostService.removeHost(host);
		
		// 호스트탈퇴가 안 되어었을 경우 다시 호스트가입 실패 알림
		if(confirm == 0) {
			log.debug(Font.HW + "호스트가입 실패 " + Font.RESET);
			return "redirect:/removeHost";
		}
		
		// 출력 디버깅
		log.debug(Font.HW + "호스트가입 성공 " + Font.RESET);
		
		// 로그아웃 시킴
		return "redirect:/logout";	
		
	}
	
	private final int ROW_PER_PAGE = 10;
	
	// 호스트 전체 목록 불러오기
	@RequestMapping("/systemAdmin/hostList")
	public String requestHostList(Model model, @RequestParam(name="currentPage", defaultValue="1") int currentPage) {
		Map<String,Object> map = hostService.getHostList(currentPage, ROW_PER_PAGE);
		log.debug(Font.HS + "전체 호스트 목록 => " + map.toString() + Font.RESET);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("startPage", map.get("startPage"));
		model.addAttribute("endPage", map.get("endPage"));
		
		return "host/hostList";
	}
}