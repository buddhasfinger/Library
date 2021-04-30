package com.library.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.NonNullApi;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.library.dto.EvecomDto;
import com.library.dto.EventDto;
import com.library.service.event.EventService;

@Controller
public class EventController {

	//선언
	@Autowired
	EventService eventService;
	
	Map<String, Object> map;
	
	//리스트
	@RequestMapping("/event/event")
	public String freeboardlist(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,Model model) {
		
		map = eventService.selectEvent(page,category,search);
		model.addAttribute("map",map);
		return"event/event_list";
	}
	
	//글쓰기
	@RequestMapping("/event/event_write")
	public String event_write() {
		return "event/event_write";
	}
	
	@RequestMapping("/event/write_Check")
	@ResponseBody
	public String write_Check(EventDto eventDto,@RequestPart MultipartFile file) {
		
		eventService.insertEvent(eventDto,file);
		
		return "redirect:/event/event";
	}
	
	//읽기
	@RequestMapping("/event/event_read")
	public String event_read(@RequestParam @Nullable String le_id,@RequestParam @Nullable String category,
			Model model) {
		map = new HashMap<String, Object>();
		
		map = eventService.eventRead(le_id,category);
		List<EvecomDto> list = eventService.eventCommandList(le_id);
		int count = eventService.eventCommandCount(le_id);
		
		map.put("list", list);
		map.put("count", count);
		model.addAttribute("map", map);
		
		return "event/event_read";
	}
	
	//수정
	@RequestMapping("/event/event_modify_view")
	public String modify_view(@RequestParam @Nullable String page,
			@RequestParam @Nullable String le_id,Model model) {
		map = eventService.eventModify_view(le_id,page);
		model.addAttribute("map",map);
		return"event/event_modify";
	}
	
	@RequestMapping("/event/event_modifyCheck")
	@ResponseBody
	public String Modify_Check(EventDto eventDto,@RequestParam @Nullable String page,
			@RequestPart MultipartFile file)  throws Exception{
		
		eventService.ModifyEvent(eventDto,file);
		
		return "redirect:/event/event?page="+page;
	}
	
	//삭제
	@RequestMapping("/event/event_delete")
	public String event_delete(
			@RequestParam @Nullable String page,
			@RequestParam  String le_id) {//파일 받을 때는 requestpart로 받아야 한다.
		
		eventService.eventDelete(le_id);
		return "redirect:/event/event?page="+page;
	}//write
	
	//댓글등록
	@RequestMapping("/event/commentWrite_check")
	@ResponseBody
	public Map<String,Object> commentWrite_check(EvecomDto evecomDto) {
		map = new HashMap<String, Object>();
		EvecomDto dto = eventService.commentWrite_check(evecomDto);
		map.put("dto", dto);
		return map;
	}
	
	@RequestMapping("/event/commentUpdate_check") //댓글수정
	@ResponseBody
	public Map<String,Object> commentUpdate_check(EvecomDto evecomDto) {
		map = new HashMap<String, Object>();
		System.out.println("controller : "+evecomDto.getEvcom_content());
		EvecomDto dto = eventService.commentUpdate_check(evecomDto);
		map.put("dto", dto);
		return map;
	}
	
	@RequestMapping("/event/commentDelete") //댓글삭제
	@ResponseBody
	public Map<String,Object> commentDelete(@RequestParam int evcom_no) {
		map = new HashMap<String, Object>();
		System.out.println("controller : "+evcom_no);
		eventService.commentDelete(evcom_no);
		map.put("msg", "삭제되었습니다.!");
		return map;
	}
}
