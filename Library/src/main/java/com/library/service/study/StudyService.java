package com.library.service.study;

import java.util.ArrayList;
import java.util.Map;

import com.library.dto.RoomBookingDto;
import com.library.dto.StudyRoomDto;

public interface StudyService {
//<!-- 4월 8일 -->
	int[] dateCheck(RoomBookingDto roombookingDto);

	Map<String, Object> roomBooking(RoomBookingDto roombookingDto,String lm_id,String rb_date);

	Map<String, Object> todayCheck(String today);

	void nextroom(RoomBookingDto roombookingDto);

	void roomClose(StudyRoomDto studyRoomDto, String sr_info, int sr_id);

	void roomOpen(StudyRoomDto studyRoomDto, int sr_id);

}
