package com.library.service.freeboard;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.library.dto.CommentDto;
import com.library.dto.FreeboardDto;

public interface FreeboardService {
	
	//게시판 전체 리스트
	Map<String, Object> freeboardListAll(String page, String category, String search);

	Map<String, Object> freeboardContent_view(String bid, String page, String category, String search);

	void freeboardWrite(FreeboardDto freeboardDto, MultipartFile file);
	
	void freeboardDelete(String bid);

	Map<String, Object> freeboardModify_view(String bid, String page, String category, String search);

	void freeboardModify(FreeboardDto freeboardDto, MultipartFile file);

	CommentDto freeboardCommentWrite_check(CommentDto commentDto);

	int freeboardCommentCount(int contentNo);

	int freeboard_commentDelete(int commentNo);

	CommentDto freeboard_commentUpdate_check(CommentDto commentDto);



}