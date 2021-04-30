package com.library.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.dto.RbookDto;
import com.library.service.book.BookService;
import com.library.service.reservation.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	ReservationService reservationService;
	@Autowired
	BookService bookService;
	
	@Autowired
	Map<String, Object> map;
	
	
	//도서대여
	@RequestMapping("/reservation/reservation_check")
	@ResponseBody
	public String reservation(RbookDto rbookDto,
		@RequestParam @Nullable String bk_id,
		@RequestParam @Nullable String lm_id) {
		reservationService.insertReservation(rbookDto,bk_id);
				
		return "/book/book_list";
	}
	
	//자기자신 대여리스트
	@RequestMapping("/mypage/my_reservation")
	public String my_reservation(Model model,@RequestParam @Nullable String lm_id) {
		System.out.println(lm_id);
		map= reservationService.selectMybook(lm_id);
		model.addAttribute("map",map);
		return "/mypage/my_reservation";
	}
	
	//대여연장
	@RequestMapping("/reservation/my_extendReserv")
	@ResponseBody
	public String my_extendReserv(RbookDto rbookDto) {
		reservationService.extendBookreservation(rbookDto);
		return "/mypage/my_reservation";
	}
	
	//대여삭제
	@RequestMapping("/reservation/reservation_Delete")
	@ResponseBody
	public String admin_bookDelete(@RequestParam @Nullable String br_id,@RequestParam @Nullable String bk_id) {
		System.out.println("br_id : "+br_id);
		System.out.println("bk_id : "+bk_id);
		reservationService.reservationDelete(br_id,bk_id);
		
		return "redirect:/admin/admin_rbooklist";
	}
	 
}
