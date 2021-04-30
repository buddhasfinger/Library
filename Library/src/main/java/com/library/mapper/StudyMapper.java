package com.library.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.dto.RoomBookingDto;
import com.library.dto.StudyRoomDto;
@Mapper
public interface StudyMapper {
//<!-- 4월 8일 -->

//박재영 형님ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//선택한 날짜에 예약된 룸 리스트
	List occupiedRoomList(RoomBookingDto roombookingDto);
	//선택한 날짜에 예약하기
	void roomBooking(RoomBookingDto roombookingDto);
	//오늘 예약된 전체 룸 리스트
	List todayOccupiedRoomList(@Param("trs") int trs ,@Param("today") String today);
	StudyRoomDto studyroomcheck(int trs);
	void roomClose(StudyRoomDto studyRoomDto, String sr_info, int sr_id);
	void roomOpen(StudyRoomDto studyRoomDto, int sr_id);
	
}
