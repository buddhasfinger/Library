package com.library.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.dto.RoomBookingDto;

@Mapper
public interface RoomBookingMapper {

	//스터디룸 전체 목록
	List<RoomBookingDto> RBookingAll(int startrow, int endrow);
	List<RoomBookingDto> RbookingDate(int startrow, int endrow, String search);
	List<RoomBookingDto> RbookingUser(int startrow, int endrow, String lm_id);
	
	//개인 당일 목록 (연장페이지)
	List<RoomBookingDto> Rbookingtoday(int startrow, int endrow, String lm_id);

	//스터디룸 삭제
	void RoomBooking_Delete(String rb_id); 
	
	//예약된 스터디룸 페이지 넘버링
	int roomCount();
	int roomCountDate(String search);
	int roomCountUser(String search);
	
	//연장전 앞시간 예약확인
	int nextroomcheck(RoomBookingDto roombookingDto);
	//확인후 연장 승인
	//void nextroomBooking(RoomBookingDto roombookingDto , String lm_id);
	void nextroomBooking(RoomBookingDto roombookingDto , String lm_id, String sr_id,String rb_date,String rb_time);
	//void nextroomBooking(@Param("roombookingDto")RoomBookingDto roombookingDto,@Param("lm_id") String lm_id);
	
	Map nextroombooking(RoomBookingDto roombookingDto);
	int daycheck(RoomBookingDto roombookingDto,String lm_id);
	int weekcheck(RoomBookingDto roombookingDto,String lm_id);
	int unad_daycheck(RoomBookingDto roombookingDto, String lm_id, String rb_date);
}
