package com.library.service.notice;

import java.util.ArrayList;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.library.dto.NoticeDto;

public interface NoticeService{
	
	//공지사항 목록
	Map<String, Object> noticeListAll(String page, String category, String search);
	//공지사항 게시글
	Map<String, Object> notice_read(String nt_num, String page, String category, String search);
	//공지사항 작성
	void noticeWrite(NoticeDto noticeDto, MultipartFile file);
	//공지사항 수정
	void noticeModify(NoticeDto noticeDto, MultipartFile file);
	Map<String, Object> noticeModifyRead(String nt_num, String page, String category, String search);
	//공지사항 삭제
	void noticeDelete(String nt_num);


	

}
