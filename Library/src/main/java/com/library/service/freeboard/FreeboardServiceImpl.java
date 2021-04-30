package com.library.service.freeboard;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.library.dto.CommentDto;
import com.library.dto.FreeboardDto;
import com.library.mapper.FreeboardMapper;
import com.library.service.page.PageNumber;

@Service
public class FreeboardServiceImpl implements FreeboardService {

	@Autowired
	FreeboardMapper freeboardMapper;

	@Autowired
	PageNumber pageNumber;

	List<FreeboardDto> list;
	List<CommentDto> comment_list;
	Map<String, Object> map;
	FreeboardDto freeboardDto;
	FreeboardDto preDto;
	FreeboardDto nextDto;
	
	//게시판 리스트 메소드
	@Override
	public Map<String, Object> freeboardListAll(String listPage, String category, String search) {
		System.out.println("서비스임플 카테고리 전 search : "+search);
		Map map = new HashMap<String, Object>();
		list = new ArrayList<FreeboardDto>();
		int page = 1;// 처음 들어왔을때 페이지 초기화
		int limit = 10;// 페이지가 나오는 갯수
		if (listPage != null && listPage != "") {
			page = Integer.parseInt(listPage);
		}
		int startrow = (page - 1) * limit + 1; // 시작 게시글번호 1,11,21...
		int endrow = startrow + limit - 1; // 마지막 게시글번호 10,20,30...

		if (category == null || category.equals("")) {
			list = freeboardMapper.selectFreeboardListAll(startrow, endrow);
		} else if (category.equals("all")) { // opt:title search:제목
			System.out.println("프리보드서비스 임플 전체검색: "+search);
			list = freeboardMapper.selectFreeboardListTitle(startrow, endrow, search);
		} else if (category.equals("title")) { // opt:title search:제목
			System.out.println("프리보드서비스 임플 제목검색: "+search);
			list = freeboardMapper.selectFreeboardListContent(startrow, endrow, search);
		} else if (category.equals("content")) { // opt:title search:제목
			System.out.println("프리보드서비스 임플 내용 검색: "+search);
			list = freeboardMapper.selectFreeboardListSearchAll(startrow, endrow, search);
		}
		map = pageNumber.pageNumber_freeboard(page, limit, category, search);
		System.out.println("freeboardImplpageNumber 내용 : "+pageNumber.pageNumber_freeboard(page, limit, category, search));
		map.put("list", list);
		return map;
	}// freeboardListAll
	
	//게시글 상세페이지
	@Override
	public Map<String, Object> freeboardContent_view(String bid, String page, String category, String search) {
		// content에 관련한 정보를 가져오기
		// 조회수 1증가
		Map map = new HashMap<String, Object>();
		freeboardMapper.selectUpHit(bid);
		// content 1개 가져오기
		freeboardDto = freeboardMapper.selectFreeboardContent_view(bid);

		// 리스트 가져오는 메소드
		if (category == null || category.equals("")) {
			// 이전글 다음글 가지고 옴
			preDto = freeboardMapper.selectFreeboardContent_pre(bid);
			nextDto = freeboardMapper.selectFreeboardContent_next(bid);
		} else if (category.equals("title")) { // opt:title search:제목
			preDto = freeboardMapper.selectFreeboardContent_preTitle(bid,search);
			nextDto = freeboardMapper.selectFreeboardContent_nextTitle(bid,search);
		} else if (category.equals("content")) { // opt:title search:제목
			preDto = freeboardMapper.selectFreeboardContent_preContent(bid,search);
			nextDto = freeboardMapper.selectFreeboardContent_nextContent(bid,search);
		} else if (category.equals("all")) { // opt:title search:제목
			preDto = freeboardMapper.selectFreeboardContent_preAll(bid,search);
			nextDto = freeboardMapper.selectFreeboardContent_nextAll(bid,search);
		}
		System.out.println("서비스임플 : " +preDto);
		System.out.println("서비스임플 : " +nextDto);
		
		comment_list = freeboardMapper.selectFreeboard_commentList(bid);
		
		map.put("comment_list",comment_list);
		map.put("freeboardDto", freeboardDto);
		map.put("preDto", preDto);
		map.put("nextDto", nextDto);
		map.put("category", category);
		map.put("search", search);
		map.put("page", page);
		return map;
	}// content_view
	

	@Override
	public void freeboardWrite(FreeboardDto freeboardDto, MultipartFile file) {
		// 원본파일이름
		String fileName = file.getOriginalFilename();
		// 확장자명 가져오기
		String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
		if (fileNameExtension != "") {
			String fileUrl = "C:/work/Library/src/main/resources/static/upload/freeboard/";
			
			// 파일 이름 재정의
			String uploadFileName = RandomStringUtils.randomAlphanumeric(20) + "." + fileNameExtension;

			File f = new File(fileUrl + uploadFileName);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 파일이름저장
			freeboardDto.setFileName(uploadFileName);
		} else {
			freeboardDto.setFileName("");
		}

		// mapper전달
		freeboardMapper.insertFreeboardWrite(freeboardDto);

	}

	@Override
	public void freeboardDelete(String bid) {
		freeboardMapper.deleteFreeboardDelete(bid);
		
	}

	@Override
	public Map<String, Object> freeboardModify_view(String bid, String page, String category, String search) {
		/// 콘텐츠 한개 가져오기
		Map map = new HashMap<String, Object>();
		freeboardDto = freeboardMapper.selectFreeboardContent_view(bid);// 모디파이랑 똑같기 떄문에
		map.put("freeboardDto", freeboardDto);
		map.put("category", category);
		map.put("search", search);
		map.put("page", page);
		return map;
	}

	@Override
	public void freeboardModify(FreeboardDto freeboardDto, MultipartFile file) {
		// 원본파일이름
		String org_fileName = file.getOriginalFilename();
		System.out.println("impl : " + org_fileName);
		if (file.getSize() != 0) { // 파일사이즈가 0이 아니면
			// 파일 저장 위치
			String fileUrl = "C:/work/Library/src/main/resources/static/upload/freeboard/";
			long time = System.currentTimeMillis();
			String uploadFileName = String.format("%d_%s", time, org_fileName);
			File f = new File(fileUrl + uploadFileName);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 파일이름저장
			freeboardDto.setFileName(uploadFileName);
		} else {
			// 기존 파일이름을 그대로 저장시키면 됨.
			// boardDto.setFileName("");
		}
		System.out.println("수정아이디 : " + freeboardDto.getBid());
		System.out.println("수정타이틀 : " + freeboardDto.getBtitle());
		System.out.println("수정내용 : " + freeboardDto.getBcontent());
		System.out.println("수정내용 : " + freeboardDto.getFileName());
		// mapper전달
		freeboardMapper.updateFreeboardModify(freeboardDto);
		return;
	}

	@Override
	public CommentDto freeboardCommentWrite_check(CommentDto commentDto) {
		//댓글 insert
		freeboardMapper.insertFreeboardCommentWrite(commentDto);
		//keyProperty="commentNo" -> commentDto.getCommentNO 로 읽을 수 있음 그니깐 번호를 안에서 셀렉트해서 받은다음 끌어와서 넣는다.
		int commentNo = commentDto.getCommentNo();
		System.out.println("임플리먼트-commentNo : "+commentNo);
		
		
		
		//저장된 insert-> select 해서 가져온다 
		CommentDto dto = freeboardMapper.selectFreeboardCommentWrite(commentNo);
		System.out.println("임플리먼트-getBid : "+dto.getBid());
		System.out.println("임플리먼트-date : "+dto.getCommentDate());
		return dto;
	}

	@Override
	public int freeboardCommentCount(int commentNo) {
		int count = freeboardMapper.selectFreeboard_commentCount(commentNo);
		return count;
	}

	@Override
	public int freeboard_commentDelete(int commentNo) {
		System.out.println(commentNo);
		int delete_check = freeboardMapper.deleteFreeboard_commentDelete(commentNo);
	    System.out.println("서비스 임플 댓글 삭제 확인 : ");
		return delete_check;
	}

	@Override
	public CommentDto freeboard_commentUpdate_check(CommentDto commentDto) {
		// 댓글 insert
		freeboardMapper.updateCommentUpdate(commentDto);
		int commentNo = commentDto.getCommentNo();
		// 저장된 insert -> select 해서 가져옴
		CommentDto dto = freeboardMapper.selectFreeboardCommentWrite(commentNo);
		System.out.println("서비스 dto : " + dto);
		
		return dto;
		
	}



}