package com.btf.tap.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.btf.tap.common.Font;
import com.btf.tap.service.AmenitiesService;
import com.btf.tap.service.HostService;
import com.btf.tap.service.MemberService;
import com.btf.tap.service.PartService;
import com.btf.tap.service.ReservationService;
import com.btf.tap.service.RoomQuestionService;
import com.btf.tap.service.RoomReviewService;
import com.btf.tap.service.RoomService;
import com.btf.tap.vo.Address;
import com.btf.tap.vo.PriceRoom;
import com.btf.tap.vo.Reservation;
import com.btf.tap.vo.Room;
import com.btf.tap.vo.RoomQnaAnswer;
import com.btf.tap.vo.RoomQuestion;
import com.btf.tap.vo.RoomReviewComment;
import com.btf.tap.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RoomController {
	@Autowired RoomService roomService;
	@Autowired HostService hostService;
	@Autowired AmenitiesService amenitiesService;
	@Autowired PartService partService;
	@Autowired RoomQuestionService roomQuestionService;
	@Autowired MemberService memberService;
	@Autowired RoomReviewService roomReviewService;
	@Autowired ReservationService reservationService;
	
	@GetMapping("/roomList")
	public String roomList(Model model, @RequestParam(value="currentPage", defaultValue ="1") int currentPage) {
		// ?????? ???????????? ????????? ?????? ???????????? result??? ??????
		Map<String, Object> result = roomService.getRoomList(currentPage);
		result.put("currentPage", currentPage);
		
		model.addAttribute("result", result);
		return "room/roomList";
	}
	
	@GetMapping("/searchRoomList")
	public String searchRoomList(Model model, String searchText,
			@RequestParam(value="currentPage", defaultValue ="1") int currentPage) {
		// ?????? ??? ?????? ???????????? ????????? ?????? ???????????? result??? ??????
		Map<String, Object> result = roomService.getsearchResultRoomList(searchText, currentPage);
		result.put("currentPage", currentPage);
		result.put("searchText", searchText);
		
		model.addAttribute("result", result);
		return "room/searchRoomList";
	}
	
	@GetMapping("/roomOne")
	public String roomOne(HttpServletRequest request, Model model, @RequestParam("roomId") int roomId, @RequestParam("detailAddressId") int detailAddressId,  
			@RequestParam(value="roomQnaCurrentPage", defaultValue ="1") int roomQnaCurrentPage,
			@RequestParam(value="roomReviewCurrentPage", defaultValue="1") int roomReviewCurrentPage,
			@RequestParam(name="year", defaultValue = "0") int year) {
		// ?????? ????????? ????????????
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		// ????????? ???????????? ?????????, userId??? ???????????? ?????????.
		if(user == null) {
			user = new User();
			user.setUserId("");
		}
		
		List<Integer> yearList = roomService.getYearList(roomId);
		

		if(year == 0 && !yearList.isEmpty()) {
			year = yearList.get(0);
		}
		
		
		Map<String, Object> result = roomService.getRoomOne(roomId, detailAddressId, user.getUserId());
		Map<String, Object> roomQna = roomQuestionService.getRoomQnaList(roomQnaCurrentPage, roomId);
		Map<String, Object> roomReview = roomReviewService.getRoomReviewList(roomReviewCurrentPage, roomId);
		int favorite = memberService.getFavorites(user.getUserId(), roomId);
		List<Map<String, Object>> ageList = roomService.getRoomAgeList(roomId, year);
		Map<String, Object> reservation = reservationService.getAddReservation(roomId);
		
		// ?????? ??????
		model.addAttribute("room",result.get("room"));
		model.addAttribute("address",result.get("address"));
		model.addAttribute("hashtag",result.get("hashtag"));
		model.addAttribute("roomAmenitiesList",result.get("amenitiesList"));
		model.addAttribute("roomPartList",result.get("roomPartList"));
		model.addAttribute("imageList",result.get("imageList"));
		// ??????
		model.addAttribute("couponList",result.get("couponList"));
		//??????
		model.addAttribute("ReservationDateList",reservation.get("ReservationDateList"));
	    model.addAttribute("ReservationListOfDate",reservation.get("ReservationListOfDate"));
	    // ?????? ??????
	    model.addAttribute("attractionList",result.get("attractionList"));
	    log.debug(Font.HJ + "?????? ?????? :" + result.get("attractionList") + Font.RESET);
		model.addAttribute("roomQna", roomQna);
		model.addAttribute("roomReview", roomReview);
		model.addAttribute("favorite", favorite);
		model.addAttribute("ageList", ageList);
		model.addAttribute("year", year);
		model.addAttribute("yearList", yearList);
		
		return "room/roomOne";
	}
	
	@PostMapping("/roomOne")
	public String postRoomOne(RoomQnaAnswer roomQnaAnswer, int roomId, int detailAddressId) {
		// ?????? ?????? ?????? ?????? ??????
		roomQuestionService.addRoomQnaAnswer(roomQnaAnswer);
		log.debug(Font.JSB + roomQnaAnswer.toString() + Font.RESET);
		
		return "redirect:/roomOne?roomId="+roomId+"&detailAddressId="+detailAddressId;
	}
	
	/* Question ?????? */
	
	@GetMapping("/nonMember/removeRoomQuestion")
	public String getRemoveRoomQuestion(HttpSession session, int roomQna, String memberId, int roomId, int detailAddressId) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		// ???????????? ?????? ???????????? ?????? ????????? ?????? ????????? ??????
		if(loginUser != null && !loginUser.getUserLevel().equals("system_admin") && !memberId.equals(loginUser.getUserId())) {
			return "redirect:/";
		}
		
		roomQuestionService.removeRoomQuestion(roomQna);
		
		return "redirect:/roomOne?roomId="+roomId+"&detailAddressId="+detailAddressId;
	}
	
	@GetMapping("/nonMember/removeRoomQnaAnswer")
	public String getRemoveRoomQnaAnswer(HttpSession session, int roomQnaId, String hostId, int roomId, int detailAddressId) {
		User loginUser = (User)session.getAttribute("loginUser");

		// ?????? ?????? ???????????? ?????? ????????? ???????????? ?????? ?????? ?????? ????????? ??????
		if(loginUser != null && !hostId.equals(loginUser.getUserId()) && !loginUser.getUserLevel().equals("system_admin")) {
			return "redirect:/";
		}
		
		roomQuestionService.removeRoomQnaAnswer(roomQnaId);
		
		return "redirect:/roomOne?roomId="+roomId+"&detailAddressId="+detailAddressId;
	}
	
	@GetMapping("/nonMember/roomQnaPopup")
	public String getRoomQnaPopup(HttpSession session, Model model, int roomId) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		// ????????? ?????? ?????????, ???????????? ?????? ????????? ????????? ??????
		if(!loginUser.getUserLevel().equals("member")) {
			return "redirect:/";
		}
		
		model.addAttribute("roomId", roomId);
		
		return "room/roomQnaPopup";
	}
	
	@RequestMapping("/roomQnaPopup")
	@ResponseBody
	public void postRoomQnaPopup(RoomQuestion roomQuestion) {
		log.debug(Font.JSB + roomQuestion.toString() + Font.RESET);
		
		roomQuestionService.addRoomQuestion(roomQuestion);
	}
	
	/* ?????? ?????? ?????? */
	// ?????? ?????? ????????????
	@GetMapping("/removeRoomReview")
	public String getRemoveRoomReview(HttpSession session, int roomReviewId, int roomId, int detailAddressId) {
		// ???????????? ?????? loginUser ????????? ??????
		User loginUser = (User)session.getAttribute("loginUser");
		
		// ???????????? ?????? ???????????? ?????? ??????????????? ??????
		if(loginUser == null) {
			return "redirect:/login";
		}
		
		// ???????????? roomReviewId ???
		log.debug(Font.HS + "???????????? roomReviewId ??? => " + roomReviewId + Font.RESET);
		
		roomReviewService.removeRoomReview(roomReviewId);
			
		return "redirect:/roomOne?roomId="+roomId+"&detailAddressId="+detailAddressId; 
	}
	
	// ???????????? ?????? ????????????
	@PostMapping("/addRoomReviewComment")
	public String postAddRommReviewComment(HttpSession session, RoomReviewComment roomReviewComment, int roomId, int detailAddressId, int roomReviewId) {
		// ???????????? ?????? loginUser ????????? ??????
		User loginUser = (User)session.getAttribute("loginUser");
		
		// ?????????, ??????, ????????????????????? ?????? ???????????? ????????? ?????? ??????
		if(loginUser == null || loginUser.getUserLevel().equals("member") || loginUser.getUserLevel().equals("symstem_admin")) {
			return "redirect:/login";
		}
		
		// ???????????? roomReviewComment ??????
		log.debug(Font.HS + "???????????? roomReviewComment ?????? => " + roomReviewComment.toString() + Font.RESET);
		
		roomReviewService.addRoomReviewComment(roomReviewComment);
		
		return "redirect:/roomOne?roomId="+roomId+"&detailAddressId="+detailAddressId; 
	}
	
	// ???????????? ?????? ????????????
	@GetMapping("/removeRoomReviewComment")
	public String getRemoveRoomReviewComment(HttpSession session, int roomId, int detailAddressId, int roomReviewId) {
		// ???????????? ?????? loginUser ????????? ??????
		User loginUser = (User)session.getAttribute("loginUser");
		
		// ?????????, ??????, ????????????????????? ????????? ???????????? ????????? ?????? ??????
		if(loginUser == null || loginUser.getUserLevel().equals("member") || loginUser.getUserLevel().equals("symstem_admin")) {
			return "redirect:/login";
		}
		
		roomReviewService.removeRoomReviewComment(roomReviewId);
		
		return "redirect:/roomOne?roomId="+roomId+"&detailAddressId="+detailAddressId;
	}
		
	/*-----HOST??????----- */
	
	@GetMapping("/host/addRoom")
	public String getAddRoom(HttpServletRequest request, Model model) {
		// ????????? ????????? ????????????
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		
		// ?????? ???????????? ????????? ??? hostId
		model.addAttribute("roomCategoryList",roomService.getRoomCategory());
		model.addAttribute("amenitiesList", amenitiesService.getAmenitiesList());
		model.addAttribute("partList", partService.getPartList());
		model.addAttribute("hostId", user.getUserId());
		return "/host/room/addRoom";
	}
	
	@PostMapping("/host/addRoom")
	public String postAddRoom(RedirectAttributes redirect, Room room, Address address,
			String hashtag, String amenities, String part,
			MultipartHttpServletRequest mtRequest) {
		// ?????? ??????
		Room newRoom = roomService.addRoom(room, address, hashtag, amenities, part, mtRequest);
		redirect.addAttribute("roomId",newRoom.getRoomId());
	    redirect.addAttribute("detailAddressId",newRoom.getDetailAddressId());
	    return "redirect:/host/roomOne";
	}
	
	@GetMapping("/host/roomList")
	public String hostRoomList(HttpServletRequest request, Model model) {
		// ????????? ????????? ????????????
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		
		// ?????? ?????? ??????
		List<Room> roomList = roomService.getHostRoomList(user.getUserId());
		model.addAttribute("roomList", roomList);
		
		return "/host/room/roomList";
	}
	
	@GetMapping("/host/roomOne")
	public String hostRoomOne(Model model,
	         @RequestParam("roomId") int roomId, @RequestParam("detailAddressId") int detailAddressId) {
	      Map<String, Object> result = roomService.getHostRoomOne(roomId, detailAddressId);
	      model.addAttribute("room",result.get("room"));
	      model.addAttribute("address",result.get("address"));
	      model.addAttribute("hashtag",result.get("hashtag"));
	      model.addAttribute("roomAmenitiesList",result.get("amenitiesList"));
	      model.addAttribute("roomPartList",result.get("roomPartList"));
	      model.addAttribute("imageList",result.get("imageList"));
	      // ????????? ????????? ????????? ?????? ???????????? ???
	      model.addAttribute("yetReservationNum",reservationService.getRoomReservationYetCount(roomId));
	      return "/host/room/roomOne";
	   }
	
	
	@GetMapping("/host/removeRoom")
	public String removeRoom(HttpServletRequest request, int roomId) {
		// ?????? ??????
		roomService.removeRoom(request, roomId);
		return "redirect:/host/roomList";
	}
	
	@GetMapping("/host/modifyRoom")
	public String getModifyRoom(Model model, int roomId, int detailAddressId) {
		// ?????? ???????????? ?????????
		model.addAttribute("roomCategoryList",roomService.getRoomCategory());
		
		// ?????? ??? ?????? ??????
		Map<String, Object> result = roomService.getHostRoomOne(roomId, detailAddressId);
		model.addAttribute("room",result.get("room"));
		model.addAttribute("address",result.get("address"));
		model.addAttribute("hashtag",result.get("hashtag"));
		model.addAttribute("amenitiesList",amenitiesService.getAmenitiesList());
		model.addAttribute("roomAmenitiesList",result.get("amenitiesList"));
		model.addAttribute("partList",partService.getPartList());
		model.addAttribute("roomPartList",result.get("roomPartList"));
		
		return "/host/room/modifyRoom";
	}
	
	@PostMapping("/host/modifyRoom")
	public String postModifyRoom(RedirectAttributes redirect, Room room, Address address,
	         String hashtag, String amenities, String part, MultipartHttpServletRequest mtRequest) {
	      address = roomService.modifyRoom(room, address, hashtag, amenities, part, mtRequest);
	      redirect.addAttribute("roomId",room.getRoomId());
	      redirect.addAttribute("detailAddressId",address.getDetailAddressId());
	      return "redirect:/host/roomOne";
	}
	
	@GetMapping("/host/roomReservationList")
	public String getRoomReservation(Model model, Room room) {
		model.addAttribute("room",room);
		model.addAttribute("reservationList",reservationService.getRoomReservationList(room.getRoomId()));
		return "/host/room/roomReservationList";
	}
	
	@GetMapping("/host/removeRoomReservationOne")
	public String removeRoomReservationOne(Model model, Room room, int reservationId) {
		Reservation reservation = new Reservation();
		reservation.setReservationId(reservationId);
		reservationService.deleteReservation(reservation);
		return "redirect:/host/roomReservationList?"
				+ "roomId="+room.getRoomId()+"&detailAddressId="+room.getDetailAddressId();
	}
	
	/*------????????? ??????-------*/
	@GetMapping("/host/priceRoomList")
	public String priceRoomList(Model model, Room room) {
		model.addAttribute("priceRoomList", roomService.getPriceRoomList(room.getRoomId()));
		model.addAttribute("room",room);
		return "/host/room/priceRoomList";
	}
	
	
	@GetMapping("/host/addPriceRoom")
	public String getAddPriceRoom(Model model, Room room) {
		model.addAttribute("priceRoomDate",roomService.getPriceRoomDateList(room.getRoomId()));
		model.addAttribute("priceRoomList", roomService.getPriceRoomList(room.getRoomId()));
		model.addAttribute("room",room);
		return "/host/room/addPriceRoom";
	}
	
	@PostMapping("/host/addPriceRoom")
	public String postAddPriceRoom(Room room, PriceRoom priceRoom) {
		roomService.addPriceRoom(room.getRoomId(), priceRoom);
		return "redirect:/host/priceRoomList?roomId="+room.getRoomId()+"&detailAddressId="+room.getDetailAddressId();
	}
	
	@GetMapping("/host/removePriceRoom")
	public String removePriceRoom(Room room, int priceRoomId){
		roomService.removePriceRoom(priceRoomId);
		return "redirect:/host/priceRoomList?roomId="+room.getRoomId()+"&detailAddressId="+room.getDetailAddressId();
	}
	
	@GetMapping("/host/unansweredRoomQna")
	public String getUnansweredRoomQna(HttpSession session, Model model, @RequestParam(value="unansweredCurrentPage", defaultValue ="1") int unansweredCurrentPage) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		Map<String, Object> roomQna = roomQuestionService.getUnansweredRoomQnaList(unansweredCurrentPage, loginUser.getUserId());
		
		model.addAttribute("roomQna", roomQna);
		
		return "/host/room/unansweredRoomQna";
	}
	
	@PostMapping("/host/unansweredRoomQna")
	public String postUnansweredRoomQna(RoomQnaAnswer roomQnaAnswer) {
		// ?????? ?????? ?????? ?????? ??????
		roomQuestionService.addRoomQnaAnswer(roomQnaAnswer);
		log.debug(Font.JSB + roomQnaAnswer.toString() + Font.RESET);
		
		return "redirect:/host/unansweredRoomQna";
	}
	
	@GetMapping("/host/roomPaymentList")
	public String getRoomPaymentList(HttpSession session, Model model, @RequestParam(name="roomId", defaultValue = "0") int roomId, String roomName, String minDay, String maxDay) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		List<Room> roomList = roomService.getPayRoomList(loginUser.getUserId());
		log.debug(Font.JSB + roomList.toString() + Font.RESET);
		
		if(minDay == null && maxDay == null) {
			minDay = "2000-01-01";
			
			LocalDate now = LocalDate.now();
			DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			maxDay = now.format(dateTimeFormatter);
		}
		
		List<Map<String, Object>> paymentlist = roomService.getPayRoomDateList(roomId, minDay, maxDay);
		
		model.addAttribute("minDay", minDay);
		model.addAttribute("maxDay", maxDay);
		model.addAttribute("roomName", roomName);
		model.addAttribute("roomList", roomList);
		model.addAttribute("paymentlist", paymentlist);
		
		return "/host/room/roomPaymentList";
	}
	
	// ????????? ????????? ???????????? ??????
	@GetMapping("/host/unansweredRoomReview")
	public String getUnansweredRoomReview(HttpSession session, Model model, @RequestParam(value="currentPage", defaultValue ="1") int currentPage) {
		// ???????????? ?????? loginUser ????????? ??????
		User loginUser = (User)session.getAttribute("loginUser");
		
		Map<String,Object> roomReview = roomReviewService.getUnansweredRoomReviewList(currentPage, loginUser.getUserId());
		
		model.addAttribute("roomReview", roomReview);
		
		return "/host/room/unansweredRoomReview";
	}
	
	@PostMapping("/host/unansweredRoomReview")
	public String postUnansweredRoomReview(RoomReviewComment roomReviewComment) {
		// ???????????? ?????? ??????
		roomReviewService.addRoomReviewComment(roomReviewComment);
		log.debug(Font.HS + "roomReviewComment ???????????? ??? => " + roomReviewComment.toString() + Font.RESET);
		
		return "redirect:/host/unansweredRoomReview";
	}
	
	// ?????? ????????? ?????? ????????? ??????
	@RequestMapping("/yearRoomOne")
	@ResponseBody
	public void requestYearRoomOne(HttpServletResponse res, @RequestParam Map<String, String> paramMap) throws IOException {
		res.setContentType("text/html;charset=UTF-8");
		int roomId = Integer.parseInt(paramMap.get("roomId"));
		int year = Integer.parseInt(paramMap.get("year"));
		
		List<Map<String, Object>> ageList = roomService.getRoomAgeList(roomId, year);

		JSONArray jsonArray = new JSONArray();
		
		for(int i = 0; i < ageList.size(); i++) {
			jsonArray.put(ageList.get(i));
		}
		PrintWriter pw = res.getWriter();
		pw.print(jsonArray.toString());
		pw.flush();
		pw.close();
	}
}
