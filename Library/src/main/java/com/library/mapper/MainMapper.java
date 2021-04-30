package com.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.dto.BookDto;

@Mapper
public interface MainMapper {

	List<BookDto> selectBestSeller();

	List<BookDto> selectNewBookList();
	
	String selectFavorBooks(String lm_user);

	List<BookDto> selectMatchingBook(String onebyone);

	List<BookDto> selectShowBook(int id0, int id1, int id2, int id3, int id4);

}
