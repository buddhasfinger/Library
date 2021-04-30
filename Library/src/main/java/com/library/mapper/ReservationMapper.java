package com.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.dto.RbookDto;

@Mapper
public interface ReservationMapper {

	//대여
	int insertReservation(RbookDto rbookDto);

	//연장하기
	List<RbookDto> selectMybookListAll(String lm_id);
	void updateBookReservation(RbookDto rbookDto);

	//대여반납
	void deletereservationDelete(String br_id);

	//관리자 대여 전체리스트
	List<RbookDto> selectreserListAll(int startrow, int endrow);
	int reservationListCount();
	List<RbookDto> selecereserListAllsub(int startrow, int endrow, String subcate);
	List<RbookDto> selecereserListimmsub(int startrow, int endrow, String subcate);
	List<RbookDto> selecereserListupsub(int startrow, int endrow, String subcate);
	int reservationListCountSub(String subcate);
	int reservationListCountimmSub(String subcate);
	int reservationListCountupSub(String subcate);
	List<RbookDto> selectreserListTitle(int startrow, int endrow, String search);
	int reservationListCountTitle(String search);
	List<RbookDto> selectreserListName(int startrow, int endrow, String search);
	int reservationListCountName(String search);
	List<RbookDto> selectreserSearchAll(int startrow, int endrow, String search);
	int reservationListCountSearchAll(String search);
	
	//관리자 미납 전체리스트
	List<RbookDto> selectUnpListAll(int startrow, int endrow);
	int ureservationListCount();
	List<RbookDto> selectUnpListTitle(int startrow, int endrow, String search);
	int ureservationListCountTitle(String search);
	List<RbookDto> selectUnpListName(int startrow, int endrow, String search);
	int ureservationListCountName(String search);	
	List<RbookDto> selectUnpSearchAll(int startrow, int endrow, String search);
	int ureservationListCountSearchAll(String search);

	//관리자 임박 전체리스트
	List<RbookDto> selectImmListAll(int startrow, int endrow);
	int ireservationListCount();
	List<RbookDto> selectImmListTitle(int startrow, int endrow, String search);
	int ireservationListCountTitle(String search);
	List<RbookDto> selectImmListName(int startrow, int endrow, String search);
	int ireservationListCountName(String search);
	List<RbookDto> selectImmSearchAll(int startrow, int endrow, String search);
	int ireservationListCountSearchAll(String search);

	List<RbookDto> selecttmail();


}
