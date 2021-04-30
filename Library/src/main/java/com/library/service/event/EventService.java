package com.library.service.event;

import java.util.List;
import java.util.Map;

import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.library.dto.EvecomDto;
import com.library.dto.EventDto;

public interface EventService {
	
	//리스트
	Map<String, Object> selectEvent(String page, String category, String search);

	//등록
	void insertEvent(EventDto eventDto,@RequestPart MultipartFile file);

	//읽기
	Map<String, Object> eventRead(@RequestParam @Nullable String le_id, String category);

	//수정
	Map<String, Object> eventModify_view(String le_id, String page);

	void ModifyEvent(EventDto eventDto, MultipartFile file);

	void eventDelete(String le_id);

	//댓글 등록
	EvecomDto commentWrite_check(EvecomDto evecomDto);
	//댓글 리스트
	List<EvecomDto> eventCommandList(String le_id);
	//댓글 갯수
	int eventCommandCount(String le_id);
	//댓글 수정
	EvecomDto commentUpdate_check(EvecomDto evecomDto);
	//댓글 삭제
	void commentDelete(int evcom_no);

}
