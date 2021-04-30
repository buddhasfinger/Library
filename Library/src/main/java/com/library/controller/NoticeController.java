package com.library.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.library.dto.NoticeDto;
import com.library.service.notice.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;

	Map<String, Object> map;
	
	// 공지사항 목록
	@RequestMapping("/notice/notice_list")
	public String notice_list(@RequestParam @Nullable String page, @RequestParam @Nullable String category,
			@RequestParam @Nullable String search, Model model) {
		map = noticeService.noticeListAll(page, category, search);
		model.addAttribute("map", map);
		return "/notice/notice_list";
	}
	
	// 공지사항 게시글
	@RequestMapping("/notice/notice_read")
	public String notice_read(@RequestParam @Nullable String page, @RequestParam @Nullable String category,
			@RequestParam @Nullable String search, @RequestParam @Nullable String nt_num, Model model) {
		map = noticeService.notice_read(nt_num, page, category, search);
		model.addAttribute("map", map);
		return "notice/notice_read";
	}
	
	// 공지사항 작성
	@RequestMapping("/notice/notice_write")
	public String notice_write() {
		return "/notice/notice_write";
	}
	// 공지사항 등록
	@RequestMapping("/notice_write")
	@ResponseBody
	public String write(NoticeDto noticeDto, @RequestPart MultipartFile file) {
		noticeService.noticeWrite(noticeDto, file);
		return "/notice/notice_list";
	}
	
	// 공지사항 수정 / 등록
	@RequestMapping("/notice_modify")
	public String modify(NoticeDto noticeDto, @RequestParam @Nullable String page,
			@RequestParam @Nullable String category, @RequestParam @Nullable String search,
			@RequestPart MultipartFile file, Model model) throws Exception {
		noticeService.noticeModify(noticeDto, file);
		search = URLEncoder.encode(search, "utf-8");
		return "redirect:/notice/notice_list?page=" + page + "&category=" + category + "&search=" + search;
	}
	@RequestMapping("notice/notice_modify")
	public String modify_view(@RequestParam @Nullable String page, @RequestParam @Nullable String category,
			@RequestParam @Nullable String search, @RequestParam @Nullable String nt_num, Model model) {
		map = noticeService.noticeModifyRead(nt_num, page, category, search);
		model.addAttribute("map", map);
		return "notice/notice_modify";
	}
	
	//공지사항 삭제
	@RequestMapping("/notice/delete")
	public String noticedelete(@RequestParam String nt_num, @RequestParam @Nullable String page,
			@RequestParam @Nullable String category, @RequestParam @Nullable String search, Model model)
					throws Exception {
		noticeService.noticeDelete(nt_num);
		search = URLEncoder.encode(search, "utf-8");
		return "redirect:/notice/notice_list?page=" + page + "&category=" + category + "&search=" + search;
	}

}
