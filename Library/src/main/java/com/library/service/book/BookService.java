package com.library.service.book;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.library.dto.BookDto;

public interface BookService {

	//도서 전체 리스트
	Map<String, Object> bookListAll(String page, String category, String search);
	
	//도서 국내 리스트
	Map<String, Object> bookListkoAll(String page, String category, String search,String bk_subcate);

	//도서 해외 리스트
	Map<String, Object> bookListengAll(String page, String category, String search,String bk_subcate);

	//도서쓰기
	void adminBookWrite(BookDto bookDto,@RequestPart MultipartFile file);

	//도서수정
	Map<String, Object> adminBookModify_view(String bk_id);
	void adminBookModifyWrite(BookDto bookDto, MultipartFile file);

	//도서삭제
	void bookDelete(String bk_id);
	
	//도서상세페이지
	Map<String, Object> bookContent_view(String bk_id, String page, String category, String search);

	//도서대여 팝업창
	Map<String, Object> bookpop_view(String bk_id);



}
