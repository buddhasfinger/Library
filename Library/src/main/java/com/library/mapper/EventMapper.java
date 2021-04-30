package com.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.dto.EvecomDto;
import com.library.dto.EventDto;

@Mapper
public interface EventMapper {
	//리스트
	List<EventDto> selectEventListAll(int startrow, int endrow);
	int eventListCount();

	//등록
	void insertEvent(EventDto eventDto);

	//읽기
	EventDto selectRead(String le_id);
	
	//수정
	void updateEvent(EventDto eventDto);
	
	//삭제
	void deleteEvent(String le_id);
	
	//이전글,다음글
	EventDto selecteventBoard_pre(String le_id);
	EventDto selecteventBoard_next(String le_id);
	
	//댓글
	int insertCommentWrite(EvecomDto evecomDto);
	EvecomDto selectCommentWrite(int evcom_no);
	List<EvecomDto> selectEvent_CommentList(String le_id);
	int selectEvent_CommentCount(String le_id);
	void updateCommentUpdate(EvecomDto evecomDto);
	void deleteComment(int evcom_no);

	

}
