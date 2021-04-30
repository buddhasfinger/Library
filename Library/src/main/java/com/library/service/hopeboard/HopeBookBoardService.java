package com.library.service.hopeboard;

import java.util.List;
import java.util.Map;

import com.library.dto.CommentDto;
import com.library.dto.HopeBookBoardDto;
import com.library.dto.HrwriteDto;

public interface HopeBookBoardService {
	
	
	
	
	Map<String, Object> hboardListAll(String page,String category,String search);

	Map<String, Object> boardContent_view(String hb_Seq, String page, String category, String search);

	int BoardWrite(HopeBookBoardDto boardDto);

	void boardDelete(String hb_seq);

	Map<String, Object> boardModify_view(String hb_Seq, String page, String category, String search);

	void BoardModify(HopeBookBoardDto boardDto);

	HrwriteDto commentWrite_check(HrwriteDto hrwriteDto);

	List<HrwriteDto> hopeboard_CommentList(int hrw_Group);

	int hopeboard_CommentCount(int hrw_Group);





}
