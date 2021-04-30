package com.library.controller;

import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.bind.ParseConversionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.library.dto.CommentDto;
import com.library.dto.FreeboardDto;
import com.library.service.freeboard.FreeboardService;

@Controller
public class FreeboardController {
	
	@Autowired
	FreeboardService freeboardService;
	
	Map<String, Object> map;
	
	
	//게시판 전체리스트
	@RequestMapping("/freeboard/freeboard_list")
	public String freeboardlist(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,Model model) {
		
		System.out.println("컨트롤러  search : "+search);
		
		
		Map<String, Object> map = freeboardService.freeboardListAll(page,category,search);

		model.addAttribute("map",map);
		return"/freeboard/freeboard_list";
		
		}
	
	
	@RequestMapping("/freeboard/freeboard_content_view")
	public String freeboard_content_view(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,
			@RequestParam @Nullable String bid,
			Model model) {
		
		map = freeboardService.freeboardContent_view(bid,page,category,search);
		int contentNo = Integer.parseInt(bid);
		int count = freeboardService.freeboardCommentCount(contentNo);
		map.put("count",count);
		
		model.addAttribute("map",map);
		return"freeboard/freeboard_content_view";
		
	}
	
	@RequestMapping("/freeboard/freeboard_write_view")
	public String freeboard_write_view() {
		return "freeboard/freeboard_write_view";
	}
	
	@RequestMapping("/freeboard/write")
	@ResponseBody
	public String freeboard_write(FreeboardDto freeboardDto,MultipartFile file) {
		
		freeboardService.freeboardWrite(freeboardDto,file);
		
		return "redirect:/freeboard/freeboard_list";
	}//write
	
	@RequestMapping("/freeboard/delete")
	public String delete(
			@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,
			@RequestParam  String bid) throws Exception {//파일 받을 때는 requestpart로 받아야 한다.
		
		freeboardService.freeboardDelete(bid);
		search = URLEncoder.encode(search,"utf-8");
		return "redirect:/freeboard/freeboard_list?page="+page+"&category="+category+"&search="+search;
	}//write
	
	@RequestMapping("freeboard/freeboard_modify_view")
	public String modify_view(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,
			@RequestParam @Nullable String bid,Model model) {
		map = freeboardService.freeboardModify_view(bid,page,category,search);
		model.addAttribute("map",map);
		return"freeboard/freeboard_modify_view";
	}
	
	@RequestMapping("freeboard/freeboard_modify")
	public String modify(FreeboardDto freeboardDto,@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,@RequestPart MultipartFile file) throws Exception {
		freeboardService.freeboardModify(freeboardDto,file);
		search = URLEncoder.encode(search,"utf-8");
		return "redirect:/freeboard/freeboard_list?page="+page+"&category="+category+"&search="+search;
	}//write
	
	@RequestMapping("/freeboard/freeboard_commentWrite_check")
	//ajax로 보내니까
	@ResponseBody
	public Map<String,Object> commentWrite_check(CommentDto commentDto) {
		Map map = new HashMap<String, Object>();
			//데이트 값은 처리를 어떻게 하는가
		//디비에 저장되는게 있기때문에 나중에는 필요 없다
		CommentDto dto = new CommentDto();
		dto = freeboardService.freeboardCommentWrite_check(commentDto);
		
		
		//DB에서 데이터를 받아올것.
		map.put("commentDto", dto);
		return map;
	}
	//댓글삭제
	@RequestMapping("freeboard/freeboard_commentDelete")
	   @ResponseBody
	   public int freeboard_commentDelete(int commentNo) {
	      
		System.out.println("test:"+commentNo);
	      
	      
	      int chk = freeboardService.freeboard_commentDelete(commentNo);
	      System.out.println("컨트롤러 댓글 삭제:"+chk);
	      return chk;
	   }
	//댓글 수정
	@RequestMapping("/freeboard/freeboard_commentUpdate_check")
	@ResponseBody
	public Map<String,Object> commentUpdate_check(CommentDto commentDto) {
		map = new HashMap<String, Object>();
		System.out.println("컨트롤러 : " +commentDto.getCommentNo());
		System.out.println("컨트롤러 : " +commentDto.getCommentName());
		System.out.println("컨트롤러 : " +commentDto.getCommentContent());
		CommentDto dto = freeboardService.freeboard_commentUpdate_check(commentDto);
		System.out.println("가지고 온 데이터 :"+dto.getCommentNo());
		System.out.println("가지고 온 데이터 :"+dto.getCommentName());
		System.out.println("가지고 온 데이터 :"+dto.getCommentContent());
		System.out.println("가지고 온 데이터 :"+dto.getCommentDate());
		map.put("commentDto", dto);
		return map;
	}
	
	
	

}
