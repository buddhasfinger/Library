package com.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.dto.HopeBookBoardDto;
import com.library.dto.HrwriteDto;
import com.library.dto.MemberDto;

@Mapper
public interface HopeBookBoard_Mapper {
	
		//리스트 가져오기
		List<HopeBookBoardDto> selectBoardListAll(@Param("startrow") int startrow,@Param("endrow") int endrow);
		List<HopeBookBoardDto> selectBoardListTitle(@Param("startrow") int startrow,@Param("endrow")  int endrow,@Param("search") String search);
		List<HopeBookBoardDto> selectBoardListContent(@Param("startrow") int startrow,@Param("endrow")  int endrow,@Param("search") String search);
		List<HopeBookBoardDto> selectBoardListSearchAll(@Param("startrow") int startrow,@Param("endrow")  int endrow,@Param("search") String search);
		
		//list 개수 가져오기
		int listCount();
		int listCountTitle(@Param("search") String search);
		int listCountContent(@Param("search") String search);
		int listCountSearchAll(@Param("search") String search);
		
		//조회수 증가
		void selectUpHit(@Param("hb_seq") String hb_seq);
		
		//content_view
		HopeBookBoardDto selectBoardContent_view(@Param("hb_seq") String hb_seq);
		HopeBookBoardDto selectBoard_pre(@Param("hb_seq") String hb_seq);
		HopeBookBoardDto selectBoard_next(@Param("hb_seq") String hb_seq);
		HopeBookBoardDto selectBoard_preTitle(@Param("hb_seq") String hb_seq,@Param("search") String search);
		HopeBookBoardDto selectBoard_nextTitle(@Param("hb_seq") String hb_seq,@Param("search") String search);
		HopeBookBoardDto selectBoard_preContent(@Param("hb_seq") String hb_seq,@Param("search") String search);
		HopeBookBoardDto selectBoard_nextContent(@Param("hb_seq") String hb_seq,@Param("search") String search);
		HopeBookBoardDto selectBoard_preAll(@Param("hb_seq") String hb_seq,@Param("search") String search);
		HopeBookBoardDto selectBoard_nextAll(@Param("hb_seq") String hb_seq,@Param("search") String search);
		
		//write
		int insertBoardWrite(HopeBookBoardDto boardDto);
		//삭제
		void deleteBoardDelete(@Param("hb_seq") String hb_seq);
		//수정
		void updateBoardWrite(HopeBookBoardDto boardDto);
		
		//댓글쓰기,읽기
		void insertHopeboardCommentWrite(HrwriteDto hrwriteDto);
		HrwriteDto selectHopeboardCommentWrite(int commentNo);
		List<HrwriteDto> selectHopeBoard_CommentList(int hrw_Group);
		int selectHopeBoard_CommentCount(int hrw_Group);
}
