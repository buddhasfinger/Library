package com.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.dto.BookDto;
import com.library.dto.RbookDto;

@Mapper
public interface BookMapper {
	
	//도서 전체리스트
	List<BookDto> selectbookListAll(int startrow, int endrow);
	int bookListCount();

	//도서 제목리스트
	List<BookDto> selectbookListTitle(int startrow, int endrow, String search);
	int bookListCountTitle(String search);
	
	
	//도서 내용리스트
	List<BookDto> selectbookListContent(int startrow, int endrow, String search);
	int bookListCountContent(String search);
	
	
	//도서 전체검색리스트
	List<BookDto> selectbookSearchAll(int startrow, int endrow, String search);
	int bookListCountSearchAll(String search);

	//국내도서 전체리스트
	List<BookDto> selectbookkoListAll();
	List<BookDto> selectbookkoecList(String bk_subcate);
	List<BookDto> selectbookkonoList(String bk_subcate);
	List<BookDto> selectbookkoitList(String bk_subcate);
	List<BookDto> selectbookkotrList(String bk_subcate);
	List<BookDto> selectbookkoreList(String bk_subcate);
	List<BookDto> selectbookkomaList(String bk_subcate);
	
	//해외도서 전체리스트
	List<BookDto> selectbookengListAll();
	List<BookDto> selectbookengecList(String bk_subcate);
	List<BookDto> selectbookengnoList(String bk_subcate);
	List<BookDto> selectbookengitList(String bk_subcate);
	List<BookDto> selectbookengtrList(String bk_subcate);
	List<BookDto> selectbookengreList(String bk_subcate);
	List<BookDto> selectbookengmaList(String bk_subcate);

	//도서등록
	void insertBook(BookDto bookDto);

	//도서수정
	BookDto selectModifyBook(String bk_id);
	void updateBook(BookDto bookDto);

	
	//도서삭제
	void deleteBookDelete(String bk_id);
	
	//대여수량 체크
	void updateBookAmount(String bk_id);
	void updateBookPlusAmount(String bk_id);
	
	//도서 컨텐츠 뷰
	BookDto selectbookContent_view(String bk_id);
	
	//대여 팝업
	BookDto selectbookpop(String bk_id);
	
	
	
	
	



}
