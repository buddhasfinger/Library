package com.library.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.library.dto.HopeBookBoardDto;
import com.library.dto.HrwriteDto;
import com.library.service.hopeboard.HopeBookBoardService;

@Controller
public class HopeBookBoardController {

	
	@Autowired
	HopeBookBoardService bs;
	
	Map<String, Object> map = new HashMap<String, Object>();
	List<HrwriteDto> list = new ArrayList<HrwriteDto>();
	int count=0;
	
	
	@RequestMapping("/hopebookboard/hopeboard_commentWrite_check")
	@ResponseBody
	public Map<String,Object> hopeboard_commentWrite_check(HrwriteDto hrwriteDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		HrwriteDto dto = bs.commentWrite_check(hrwriteDto);
		System.out.println("dto :"+dto);
		//DB에서 데이터를 받아올것.
		map.put("hrwriteDto", dto);
		return map;
	}
	
	@RequestMapping("/hopebookboard/hopeboard_list")
	public String hopeboard_list(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search, 
			Model model) {
		Map<String, Object> map = bs.hboardListAll(page,category,search);
		model.addAttribute("map",map);
		
		return "/hopebookboard/hopeboard_list";
	}
	
	@RequestMapping("/hopebookboard/hopeboardContent_view")
	public String hopeboardContent_view(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search, 
			@RequestParam @Nullable String hb_seq, 
			Model model) {
		
		map = bs.boardContent_view(hb_seq, page, category, search);
		
		if(bs.hopeboard_CommentList(Integer.parseInt(hb_seq)) != null) {
			List<HrwriteDto> list = bs.hopeboard_CommentList(Integer.parseInt(hb_seq));
			
			count = bs.hopeboard_CommentCount(Integer.parseInt(hb_seq));
			map.put("list",list);
			map.put("count",count);
			model.addAttribute("map",map);
		}else {
			model.addAttribute("map",map);
		}
		
		
		return "hopebookboard/hopeboardContent_view";
	}
	
	@RequestMapping("/hopebookboard/hopeboardWrite_view")
	public String hopeboardWrite_view(@RequestParam String hb_user,Model model) {
		model.addAttribute("hb_user",hb_user);
		
		return "hopebookboard/hopeboardWrite_view";
	}
	
	
	@RequestMapping("/hopebookboard/hopeboardWrite1")
	@ResponseBody
	public String  hopeboardWrite1(HopeBookBoardDto boardDto,Model model) {
		int rs = bs.BoardWrite(boardDto);
		model.addAttribute("rs",rs);
		return "rs";
	}

	@RequestMapping("/hopebookboard/hopeboardModify_view")
	public String hopeboardModify_view(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search, 
			@RequestParam @Nullable String hb_seq, 
			Model model) {
		map = bs.boardModify_view(hb_seq, page, category, search);
		model.addAttribute("map",map);
		return "hopebookboard/hopeboardModify_view";
	}
	
	
	@RequestMapping("/hopeboardModify")
	public String  hopeboardModify(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search, 
			HopeBookBoardDto boardDto,Model model) throws Exception {
		
		bs.BoardModify(boardDto);
		search= URLEncoder.encode(search,"utf-8");
		
		return "redirect:/hopebookboard/hopeboard_list?page="+page+"&category="+category+"&search="+search;
	}
	
	
	@RequestMapping("/hopebookboard/hopeboardDelete")
	public String  hopeboardDelete(
			@RequestParam @Nullable String page,
			@RequestParam @Nullable String hb_seq,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,Model model ) throws Exception {
		search= URLEncoder.encode(search,"utf-8");
		bs.boardDelete(hb_seq);
		
		model.addAttribute("map",map);
		return "redirect:/hopebookboard/hopeboard_list?page="+page+"&category="+category+"&search="+search;
	}
	
	
}
