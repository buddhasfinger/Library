package com.library.controller;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.library.dto.NoticeDto;
import com.library.dto.RoomBookingDto;
import com.library.dto.StudyRoomDto;
import com.library.service.roomBooking.RoomBookingService;
import com.library.service.study.StudyService;

@Controller
public class StudyController {
	
	@Autowired
	StudyService studyService;
	@Autowired
	RoomBookingService rbookingService;
	
	Map<String,Object> map;
	List list = new ArrayList();
	int rs=0 ;
	
	

	//방 열기
	 @RequestMapping("/roomOpen")
	 @ResponseBody 
	 public String roomOpen(StudyRoomDto studyRoomDto ,@RequestParam @Nullable int sr_id) {
		 studyService.roomOpen(studyRoomDto, sr_id); 
		 
		 return "/study/allRoomBookig"; }
	 
	
	//방 닫기
	@RequestMapping("/roomClose")
	@ResponseBody
	public String roomClose(StudyRoomDto studyRoomDto, @RequestParam @Nullable String sr_info,@RequestParam @Nullable int sr_id) {
		studyService.roomClose(studyRoomDto,sr_info,sr_id);
		System.out.println(sr_info+sr_id);
		System.out.println("닫기");
		return "/study/allRoomBookig";
	}
	
	//예약 등록
	@RequestMapping("/study/roomBookingCheck")
	@ResponseBody
	public Map roomBookingCheck(RoomBookingDto roombookingDto ,@RequestParam @Nullable String lm_id,
			@RequestParam @Nullable String rb_date) {
		Map map = new HashMap<String, Object>();
		System.out.println("예약");
		map = studyService.roomBooking(roombookingDto,lm_id,rb_date);
		return map;
	}
	
	//스터디룸 연장하기
	@RequestMapping("/nextroombooking")
	@ResponseBody
	public Map nextroombooking(RoomBookingDto roombookingDto,@RequestParam @Nullable String lm_id,@RequestParam @Nullable String sr_id
			,@RequestParam @Nullable String rb_date,@RequestParam @Nullable String rb_time) {
		Map map = new HashMap<String, Object>();
		
		System.out.println("연장");
		
		map = rbookingService.nextroombooking(roombookingDto,lm_id,sr_id,rb_date,rb_time);
		return map;
	}

	//스터디룸 연장 페이지 
	@RequestMapping("/study/todayRoombooking")
	public String todayRoombooking(@RequestParam @Nullable String page, @RequestParam @Nullable String category,
			@RequestParam @Nullable String search,@RequestParam @Nullable String lm_id, Model model) {
		Date d= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(d);
		map = studyService.todayCheck(today);
		model.addAttribute("today",today);
		map = rbookingService.RbookingAll(page, category, search, lm_id);
		model.addAttribute("map", map);
		return "/study/todayRoombooking";
	}

	
	
	
	
	//스터디룸 전체 예약목록 (관리자)
	@RequestMapping("/study/allRoomBookig")
	public String allRoomBookig(@RequestParam @Nullable String page, @RequestParam @Nullable String category,
			@RequestParam @Nullable String search,@RequestParam @Nullable String lm_id, Model model) {
	map = rbookingService.RbookingAll(page, category, search,lm_id);
	model.addAttribute("map", map);
		return "/study/allRoomBookig";
	}
	
	//스터디룸 예약페이지 목록 (개인이 본인것만)
	@RequestMapping("/study/myRoomBookig")
	public String myRoomBookig(@RequestParam @Nullable String page, @RequestParam @Nullable String category,
			@RequestParam @Nullable String search,@RequestParam @Nullable String lm_id, Model model) {
		map = rbookingService.RbookingAll(page, category, search,lm_id);
		model.addAttribute("map", map);
		return "/study/myRoomBookig";
	}
	
	//스터디룸 삭제 (개인)
	@RequestMapping("/mypage/delete")
	public String adminroomdelete(@RequestParam String rb_id, @RequestParam @Nullable String lm_id)throws Exception {
		rbookingService.RoomBooking_Delete(rb_id);
		return "redirect:/study/myRoomBookig?lm_id="+lm_id+"";
	}
	//스터디룸 삭제 (관리자)
	@RequestMapping("/study/delete")
	public String myroomdelete(@RequestParam String rb_id) throws Exception { 
		rbookingService.RoomBooking_Delete(rb_id);
		return "redirect:/study/allRoomBookig";
	}
	
	
	
	
	
	@RequestMapping("/study/Ro_Bo_User_info")
	public String Ro_Bo_User_info() {
		return "/study/Ro_Bo_User_info";
	}
	
	
	//--------------------------------------------------------------------------------------------------
	@RequestMapping("/study/studyRoom")
	public String studyRoom(Model model) {
		Map map = new HashMap<String, Object>();
		Date d= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(d);
		map = studyService.todayCheck(today);
		
		model.addAttribute("map",map);
		model.addAttribute("today",today);
		
		return "/study/studyRoom";
	}
	
	
	@RequestMapping("/study/dateCheck")
	@ResponseBody
	public Map dateCheck(RoomBookingDto roombookingDto) {
		Map map = new HashMap<String, Object>();
		map.put("rs",studyService.dateCheck(roombookingDto));
		return map;
	}
	

	
}
