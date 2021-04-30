package com.library.service.event;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.library.dto.EvecomDto;
import com.library.dto.EventDto;
import com.library.dto.FreeboardDto;
import com.library.mapper.EventMapper;
import com.library.service.page.PageNumber;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventMapper eventMapper;
	@Autowired
	PageNumber pageNumber;
	
	Map<String, Object> map;
	EventDto eventDto;
	List<EventDto> list;
	EventDto preDto;
	EventDto nextDto;
	
	//리스트
	@Override
	public Map<String, Object> selectEvent(String listPage, String category, String search) {
		list = new ArrayList<EventDto>();
		int page = 1;// 처음 들어왔을때 페이지 초기화
		int limit = 6;// 페이지가 나오는 갯수
		if (listPage != null && listPage != "") {
			page = Integer.parseInt(listPage);
		}
		int startrow = (page - 1) * limit + 1; // 시작 게시글번호 1,11,21...
		int endrow = startrow + limit - 1; // 마지막 게시글번호 10,20,30...

		if (category == null || category.equals("")) {
			list = eventMapper.selectEventListAll(startrow, endrow);
		}
		map = pageNumber.pageNumber_event(page, limit, category, search);
		map.put("list", list);
		return map;
	}

	//글쓰기
	@Override
	public void insertEvent(EventDto eventDto,@RequestPart MultipartFile file) {
		String orgfileName = file.getOriginalFilename();//원본파일이름
		if(file.getSize() != 0) {
			String fileUrl = "C:/work/Library/src/main/resources/static/upload/event/"; //파일 저장 위치
			long time = System.currentTimeMillis();//이름에 시간추가
			String uploadFileName = String.format("%d_%s", time, orgfileName);
			File f = new File(fileUrl+uploadFileName);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}			
			eventDto.setLe_filename(uploadFileName);
		}else {
			eventDto.setLe_filename("");
		}		
		eventMapper.insertEvent(eventDto);
		
	}

	@Override
	public Map<String, Object> eventRead(String le_id, String category) {
		Map map = new HashMap<String, Object>();
		eventDto = eventMapper.selectRead(le_id);
		if(category==null || category.equals("")) {
			//이전글,다음글
			preDto = eventMapper.selecteventBoard_pre(le_id);
			nextDto = eventMapper.selecteventBoard_next(le_id);		
		}
		
		map.put("dto", eventDto);
		map.put("preDto", preDto);
		map.put("nextDto", nextDto);
		
		return map;
	}

	@Override
	public Map<String, Object> eventModify_view(String le_id, String page) {		
		Map map = new HashMap<String, Object>();
		eventDto = eventMapper.selectRead(le_id);
		
		map.put("dto", eventDto);
		map.put("page", page);
		return map;
	}

	@Override
	public void ModifyEvent(EventDto eventDto, MultipartFile file) {
		String orgfileName = file.getOriginalFilename();//원본파일이름
		if(file.getSize() != 0) {
			String fileUrl = "C:/work/Library/src/main/resources/static/upload/event/"; //파일 저장 위치
			long time = System.currentTimeMillis();//이름에 시간추가
			String uploadFileName = String.format("%d_%s", time, orgfileName);
			File f = new File(fileUrl+uploadFileName);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}			
			eventDto.setLe_filename(uploadFileName);
		}else {
			/* bookDto.setLe_filename(""); */
		}		
		eventMapper.updateEvent(eventDto);
		
	}

	@Override
	public void eventDelete(String le_id) {
		eventMapper.deleteEvent(le_id);
		
	}

	//댓글
	@Override
	public EvecomDto commentWrite_check(EvecomDto evecomDto) {
		eventMapper.insertCommentWrite(evecomDto);
		// keyProperty="commentNo" -> commentDto.getCommentNo 로 읽을수 있음
		int evcom_no = evecomDto.getEvcom_no();
		System.out.println("commentDto.getCommentNo() : " + evecomDto.getEvcom_no());
		
		// 저장된 insert -> select 해서 가져옴
		EvecomDto dto = eventMapper.selectCommentWrite(evcom_no);
		System.out.println("dto : " + dto.getEvcom_date());
		return dto;
	}

	@Override
	public List<EvecomDto> eventCommandList(String le_id) {
	    List<EvecomDto>	list = eventMapper.selectEvent_CommentList(le_id);
		return list;
	}

	@Override
	public int eventCommandCount(String le_id) {
		int count = eventMapper.selectEvent_CommentCount(le_id);
		System.out.println("impl : "+count);
		return count;
	}
	
	@Override
	public EvecomDto commentUpdate_check(EvecomDto evecomDto) {
		// 댓글 insert
		eventMapper.updateCommentUpdate(evecomDto);
		int evcom_no = evecomDto.getEvcom_no();
		// 저장된 insert -> select 해서 가져옴
		EvecomDto dto = eventMapper.selectCommentWrite(evcom_no);
		System.out.println("dto : " + dto.getEvcom_date());
		
		return dto;
		
	}

	@Override
	public void commentDelete(int evcom_no) {
		// 댓글 insert
		eventMapper.deleteComment(evcom_no);
		return;
	}

	

}
