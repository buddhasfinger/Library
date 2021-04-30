package com.library.service.roomBooking;

import java.util.ArrayList;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.library.dto.RoomBookingDto;

public interface RoomBookingService {

	//스터디룸 예약 총 목록 (당일전체/개인/연장)
	Map<String, Object> RbookingAll(String page, String category, String search, String lm_id);

	
	
	
	//스터디룸 예약 취소
	void RoomBooking_Delete(String rb_id);
	//스터디룸 연장 >>>
	Map<String, Object> nextroombooking(RoomBookingDto roombookingDto, String lm_id , String sr_id,String rb_date,String rb_time);

	
}
