package com.library.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MypageController {
	@Autowired
	Map<String, Object> map;
	
	//마이페이지 이동
	@RequestMapping("/mypage/mypage")
	public String mypage() {
		return "/mypage/mypage";
	}	

	//마이페이지 스터디룸 예약페이지 목록 -- 미구현
	@RequestMapping("/mypage/myRoomBookig")
	public String myRoomBookig() {
		return "/mypage/myRoomBookig";
	}
	
}
