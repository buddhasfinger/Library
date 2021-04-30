package com.library.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.dto.CommentDto;
import com.library.dto.FreeboardDto;

@Mapper
public interface FreeboardMapper {

	//게시판 전체 리스트
	List<FreeboardDto> selectFreeboardListAll(int startrow, int endrow);
	int freeboradListCount();
	
	//게시판 제목 검색 리스트
	List<FreeboardDto> selectFreeboardListTitle(int startrow,int endrow,String search);
	int freeboradListCountTitle(String search);
	
	//게시판 내용 검색 리스트
	List<FreeboardDto> selectFreeboardListContent(int startrow,int endrow,String search);
	int freeboradListCountContent(String search);
	
	//게시판 전체 검색 리스트
	List<FreeboardDto> selectFreeboardListSearchAll(int startrow,int endrow,String search);
	int freeboradListCountSearchAll(String search);
	
	//freeboardhit
	void selectUpHit(String bid);
	
	//freeboardContent_view
	FreeboardDto selectFreeboardContent_view(String bid);
	//전체
	FreeboardDto selectFreeboardContent_pre(String bid);
	FreeboardDto selectFreeboardContent_next(String bid);
	//제목 검색
	FreeboardDto selectFreeboardContent_preTitle(String bid, String search);
	FreeboardDto selectFreeboardContent_nextTitle(String bid, String search);
	//내용 검색
	FreeboardDto selectFreeboardContent_preContent(String bid, String search);
	FreeboardDto selectFreeboardContent_nextContent(String bid, String search);
	//전체 검색
	FreeboardDto selectFreeboardContent_preAll(String bid, String search);
	FreeboardDto selectFreeboardContent_nextAll(String bid, String search);
	
	//write
	void insertFreeboardWrite(FreeboardDto freeboardDto);
	//delete
	void deleteFreeboardDelete(String bid);
	//modify
	void updateFreeboardModify(FreeboardDto freeboardDto);
	//comment
	void insertFreeboardCommentWrite(CommentDto commentDto);
	CommentDto selectFreeboardCommentWrite(int commentNo);
	
	
	
	//comment
	List<CommentDto> selectFreeboard_commentList(String bid);
	//댓글 갯수
	int selectFreeboard_commentCount(int bid);
	//댓글삭제
	int deleteFreeboard_commentDelete(int commentNo);
	//댓글 수정
	int updateCommentUpdate(CommentDto commentDto);
	//댓글 쓰기
	CommentDto selectCommentWrite(int commentNo);


}