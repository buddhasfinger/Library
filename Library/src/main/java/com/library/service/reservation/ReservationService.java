package com.library.service.reservation;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.library.dto.BookDto;
import com.library.dto.RbookDto;

public interface ReservationService {
	
	//자기 대여리스트
	Map<String, Object> selectMybook(String lm_id);

	//관리자 대여리스트
	Map<String, Object> selectadminReList(String page, String category, String search,String subcate);
	
	//관리자 미납대여리스트
	Map<String, Object> selectadminUnpList(String page, String category, String search);
	//관리자 임박대여리스트
	Map<String, Object> selectadminImmList(String page, String category, String search);

	//대여하기
	void insertReservation(RbookDto rbookDto,String bk_id);

	//연장하기
	void extendBookreservation(RbookDto rbookDto);
	
	//대여삭제
	void reservationDelete(String br_id,String bk_id);
	//임박이메일
	void emailCheck(String email);
	//미납이메일
	void upemailCheck(String email);
	
	Map<String, Object> selecttemail();
	void emailCheck2(String temail);






}
