package com.site.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.dto.BoardDto;
import com.site.dto.MemberDto;
import com.site.mapper.Board_Mapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	Board_Mapper board_mapper;
	@Autowired
	PageNumber pageNumber;
	Map<String, Object> map = new HashMap<String, Object>();
	List<BoardDto> list;
	BoardDto boardDto;
	int limit;
	
	
	//희망도서신청 로그인
	@Override
	public MemberDto logincheck(MemberDto dto) {
		MemberDto memberDto =board_mapper.selectloginCheck(dto);
		return memberDto;
	}
	//희망도서신청 게시판 리스트All
	@Override
	public Map<String, Object> hboardListAll(String listpage, String category, String search) {
		Map map = new HashMap<String, Object>();
		list = new ArrayList();
		int page = 1; // 첫페이지 초기화
		int limit = 5; // 한 페이지에 표시되는 게시글 개수
		// page 데이터가 있으면 데이터값 적용
		if (listpage != null && listpage != "") {
			page = Integer.parseInt(listpage);
		}

		int startrow = (page - 1) * limit + 1; // 시작 게시글번호 1,11,21...
		int endrow = startrow + limit - 1;// 마지막 게시글 번호 10,20,30...

		// 리스트 가져오는 메소드
		if (category == null || category.equals("")) { // 검색이 없을때
			list = board_mapper.selectBoardListAll(startrow, endrow);
		} else if (category.equals("title")) { // option: title search: 제목
			list = board_mapper.selectBoardListTitle(startrow, endrow, search);
		} else if (category.equals("content")) {
			list = board_mapper.selectBoardListContent(startrow, endrow, search);
		} else if (category.equals("all")) {
			list = board_mapper.selectBoardListSearchAll(startrow, endrow, search);
		}

		map = pageNumber.PageNumber(page, limit, category, search);
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
				map.put("boardDto", boardDto);
				map.put("category", category);
				map.put("search", search);
				map.put("page", page);

				return map;
	}
	
	//희망도서신청 글쓰기
	@Override
	public void BoardWrite(BoardDto boardDto) {
		board_mapper.insertBoardWrite(boardDto);
		
	}
	
	//희망도서신청 댓글달기
	@Override
	public void ReplyWrite(String hrw_Content, String hrw_User,String hrw_Group) {
		board_mapper.insertReplyWrite(hrw_Content,hrw_User,hrw_Group);
	}

	
	
}
