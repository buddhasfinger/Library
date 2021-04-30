package com.library.service.hopeboard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.dto.HopeBookBoardDto;
import com.library.dto.HrwriteDto;
import com.library.mapper.HopeBookBoard_Mapper;
import com.library.service.page.PageNumber;

@Service
public class HopeBookBoardServiceImpl implements HopeBookBoardService {

	@Autowired
	HopeBookBoard_Mapper board_mapper;
	
	@Autowired
	PageNumber pageNumber;
	
	Map<String, Object> map = new HashMap<String, Object>();
	List<HopeBookBoardDto> list;
	List<HrwriteDto> list2 = new ArrayList<HrwriteDto>();
	HopeBookBoardDto boardDto;
	HopeBookBoardDto preDto;
	HopeBookBoardDto nextDto;
	int limit;
	int count =0;
	
	

	//희망도서신청 게시판 리스트All
	@Override
	public Map<String, Object> hboardListAll(String listpage, String category, String search) {
		System.out.println("search1 :"+search);
		Map map = new HashMap<String, Object>();
		list = new ArrayList();
		int page = 1; // 첫페이지 초기화
		int limit = 10; // 한 페이지에 표시되는 게시글 개수
		// page 데이터가 있으면 데이터값 적용
		if (listpage != null && listpage != "") {
			page = Integer.parseInt(listpage);
		}

		int startrow = (page - 1) * limit + 1; // 시작 게시글번호 1,11,21...
		int endrow = startrow + limit - 1;// 마지막 게시글 번호 10,20,30...

		// 리스트 가져오는 메소드
		if (category == null || category.equals("")) { // 검색이 없을때
			list = board_mapper.selectBoardListAll(startrow,endrow);
		} else if (category.equals("title")) { // option: title search: 제목
			list = board_mapper.selectBoardListTitle(startrow,endrow,search);
		} else if (category.equals("content")) {
			System.out.println("search2 :"+search);
			list = board_mapper.selectBoardListContent(startrow, endrow, search);
		} else if (category.equals("all")) {
			System.out.println("search2 :"+search);
			list = board_mapper.selectBoardListSearchAll(startrow, endrow, search);
		}
		
		map = pageNumber.pageNumber_hopeboard(page, limit, category, search);
		System.out.println("hopeboardImplpageNumber 내용 : "+pageNumber.pageNumber_hopeboard(page, limit, category, search));

		map.put("list", list);

		return map;
	}
	
	//희망도서신청 글내용 보기
	@Override
	public Map<String, Object> boardContent_view(String hb_Seq, String page, String category, String search) {
		// content 1개 가져오기
		boardDto = board_mapper.selectBoardContent_view(hb_Seq);
		// 조회수 1 증가
		board_mapper.selectUpHit(hb_Seq);
		
		// 리스트 가져오는 메소드
		if (category == null || category.equals("")) { // 검색이 없을때
			//이전글 다음글을 가지고 옴
			preDto = board_mapper.selectBoard_pre(hb_Seq);
			nextDto = board_mapper.selectBoard_next(hb_Seq);
		} else if (category.equals("title")) { // option: title search: 제목
			preDto = board_mapper.selectBoard_preTitle(hb_Seq,search);
			nextDto = board_mapper.selectBoard_nextTitle(hb_Seq,search);
		} else if (category.equals("content")) {
			preDto = board_mapper.selectBoard_preContent(hb_Seq,search);
			nextDto = board_mapper.selectBoard_nextContent(hb_Seq,search);
		} else if (category.equals("all")) {
			preDto = board_mapper.selectBoard_preAll(hb_Seq,search);
			nextDto = board_mapper.selectBoard_nextAll(hb_Seq,search);
		}
		map.put("preDto", preDto);
		map.put("nextDto", nextDto);
		map.put("boardDto", boardDto);
		map.put("category", category);
		map.put("search", search);
		map.put("page", page);

		return map;
	}
	
	//희망도서신청 글쓰기
	@Override
	public int BoardWrite(HopeBookBoardDto boardDto) {
		int rs = board_mapper.insertBoardWrite(boardDto);
		return rs;
	}
	

	@Override
	public void boardDelete(String hb_seq) {
		board_mapper.deleteBoardDelete(hb_seq);
		
	}

	@Override
	public Map<String, Object> boardModify_view(String hb_Seq, String page, String category, String search) {
		//content 1개 가져오기
		boardDto = board_mapper.selectBoardContent_view(hb_Seq);
		map.put("boardDto", boardDto);
		map.put("category", category);
		map.put("search", search);
		map.put("page", page);
		
		return map;
	}

	@Override
	public void BoardModify(HopeBookBoardDto boardDto) {
		board_mapper.updateBoardWrite(boardDto);
		
	}
	
	//희망도서신청 댓글달기
	@Override
	public HrwriteDto commentWrite_check(HrwriteDto hrwriteDto) {
		//댓글 insert
		board_mapper.insertHopeboardCommentWrite(hrwriteDto);
		//keyProperty="commentNo" -> commentDto.getCommentNO 로 읽을 수 있음 그니깐 번호를 안에서 셀렉트해서 받은다음 끌어와서 넣는다.
		int commentNo = hrwriteDto.getHrw_Seq();
		
		//저장된 insert-> select 해서 가져온다 
		HrwriteDto dto = board_mapper.selectHopeboardCommentWrite(commentNo);
		return dto;
	}

	@Override
	public List<HrwriteDto> hopeboard_CommentList(int hrw_Group) {
		System.out.println("hrw_Group" +hrw_Group);
		//System.out.println("aaaaaaaaaa"+board_mapper.selectHopeBoard_CommentList(hrw_Group).size());
		//if(board_mapper.selectHopeBoard_CommentList(hrw_Group).size()!=0 ) {
			list2 = board_mapper.selectHopeBoard_CommentList(hrw_Group);
		//}
		return list2;
	}

	@Override
	public int hopeboard_CommentCount(int hrw_Group) {
		//if(board_mapper.selectHopeBoard_CommentCount(hrw_Group) != 0) {
			count = board_mapper.selectHopeBoard_CommentCount(hrw_Group);
			
		//}
		System.out.println("impl : "+count);
		return count;
	}
	
}
