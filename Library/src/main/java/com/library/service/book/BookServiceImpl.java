package com.library.service.book;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.library.dto.BookDto;
import com.library.dto.FreeboardDto;
import com.library.dto.RbookDto;
import com.library.mapper.BookMapper;
import com.library.service.page.PageNumber;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	BookMapper bookMapper;
	@Autowired
	PageNumber pageNumber;
	
	List<BookDto> list = new ArrayList<BookDto>();
	Map<String, Object> map = new HashMap<String, Object>();
	BookDto bookDto;
	BookDto preDto;
	BookDto nextDto;
	
	
	
	
	//도서리스트
	@Override
	public Map<String, Object> bookListAll(String listPage, String category, String search) {
		Map map = new HashMap<String,Object>();
		list = new ArrayList<BookDto>();
		int page = 1;// 처음 들어왔을때 페이지 초기화
		int limit = 5;// 페이지가 나오는 갯수
		if (listPage != null && listPage != "") {
			page = Integer.parseInt(listPage);
		}
		int startrow = (page - 1) * limit + 1; // 시작 게시글번호 1,11,21...
		int endrow = startrow + limit - 1; // 마지막 게시글번호 10,20,30...

		if (category == null || category.equals("")) {
			list = bookMapper.selectbookListAll(startrow, endrow);
		} else if (category.equals("title")) { // opt:title search:제목
			list = bookMapper.selectbookListTitle(startrow, endrow, search);
		} else if (category.equals("content")) { // opt:title search:제목
			list = bookMapper.selectbookListContent(startrow, endrow, search);
		} else if (category.equals("all")) { // opt:title search:제목
			list = bookMapper.selectbookSearchAll(startrow, endrow, search);
		}
		map = pageNumber.pageNumber_book(page, limit, category, search);
		map.put("list", list);
		return map;
	}
	
	//국내도서
	@Override
	public Map<String, Object> bookListkoAll(String page, String category, String search,String bk_subcate) {
		Map map = new HashMap<String,Object>();
		if(bk_subcate == null || bk_subcate.equals("")) {
			list = bookMapper.selectbookkoListAll();			
		}else if(bk_subcate.equals("경제")) {
			list = bookMapper.selectbookkoecList(bk_subcate);
		}else if(bk_subcate.equals("소설")) {
			list = bookMapper.selectbookkonoList(bk_subcate);
		}else if(bk_subcate.equals("IT/과학")) {
			list = bookMapper.selectbookkoitList(bk_subcate);
		}else if(bk_subcate.equals("여행")) {
			list = bookMapper.selectbookkotrList(bk_subcate);
		}else if(bk_subcate.equals("종교")) {
			list = bookMapper.selectbookkoreList(bk_subcate);
		}else if(bk_subcate.equals("잡지")) {
			list = bookMapper.selectbookkomaList(bk_subcate);
		}
		
		map.put("list", list);
		return map;
	}
	
	//해외도서
	@Override
	public Map<String, Object> bookListengAll(String page, String category, String search,String bk_subcate) {
		Map map = new HashMap<String,Object>();
		if(bk_subcate == null || bk_subcate.equals("")) {
			list = bookMapper.selectbookengListAll();			
		}else if(bk_subcate.equals("경제")) {
			list = bookMapper.selectbookengecList(bk_subcate);
		}else if(bk_subcate.equals("소설")) {
			list = bookMapper.selectbookengnoList(bk_subcate);
		}else if(bk_subcate.equals("IT/과학")) {
			list = bookMapper.selectbookengitList(bk_subcate);
		}else if(bk_subcate.equals("여행")) {
			list = bookMapper.selectbookengtrList(bk_subcate);
		}else if(bk_subcate.equals("종교")) {
			list = bookMapper.selectbookengreList(bk_subcate);
		}else if(bk_subcate.equals("잡지")) {
			list = bookMapper.selectbookengmaList(bk_subcate);
		}
		
		
		map.put("list", list);
		return map;
	}
	
	
	//도서등록
	@Override
	public void adminBookWrite(BookDto bookDto,@RequestPart MultipartFile file) {
		String orgfileName = file.getOriginalFilename();//원본파일이름
		if(file.getSize() != 0) {
			String fileUrl = "C:\\Users\\User\\Desktop\\백업\\프로그램최종(sql 포함)\\Library\\src\\main\\resources\\static\\upload\\book\\"; //파일 저장 위치
			//String fileUrl = "C:\\Users\\User\\Desktop\\백업\\프로그램최종(sql 포함)\\Library\\src\\main\\resources\\static\\upload\\book"; //파일 저장 위치
			long time = System.currentTimeMillis();//이름에 시간추가
			String uploadFileName = String.format("%d_%s", time, orgfileName);
			File f = new File(fileUrl+uploadFileName);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}			
			bookDto.setBk_filename(uploadFileName);
		}else {
			bookDto.setBk_filename("");
		}		
		bookMapper.insertBook(bookDto);
	}

	//도서수정
	@Override
	public Map<String, Object> adminBookModify_view(String bk_id) {	
		bookDto	= bookMapper.selectModifyBook(bk_id);
		map.put("bookDto", bookDto);
		System.out.println(bookDto);
		return map;
	}

	@Override
	public void adminBookModifyWrite(BookDto bookDto, MultipartFile file) {
		
		String orgfileName = file.getOriginalFilename();//원본파일이름
		if(file.getSize() != 0) {
			String fileUrl = "C:/work/Library/src/main/resources/static/upload/book/"; //파일 저장 위치
			long time = System.currentTimeMillis();//이름에 시간추가
			String uploadFileName = String.format("%d_%s", time, orgfileName);
			File f = new File(fileUrl+uploadFileName);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}			
			bookDto.setBk_filename(uploadFileName);
		}else {
			/* bookDto.setBk_filename(""); */
		}		
		bookMapper.updateBook(bookDto);
	}


	
	//도서삭제
	@Override
	public void bookDelete(String bk_id) {
		bookMapper.deleteBookDelete(bk_id);
		
	}

	//도서상세페이지
	@Override
	public Map<String, Object> bookContent_view(String bk_id, String page, String category, String search) {
		
		Map map = new HashMap<String, Object>();
		// content 1개 가져오기
		bookDto = bookMapper.selectbookContent_view(bk_id);
		
		
		/*
		 * if (category == null || category.equals("")) { // 이전글 다음글 가지고 옴 preDto =
		 * bookMapper.selectBooklistContent_pre(bk_id); nextDto =
		 * bookMapper.selectBooklistContent_next(bk_id); } else if
		 * (category.equals("title")) { // opt:title search:제목 preDto =
		 * bookMapper.selectBooklistContent_preTitle(bk_id); nextDto =
		 * bookMapper.selectBooklistContent_nextTitle(bk_id); } else if
		 * (category.equals("content")) { // opt:title search:제목 preDto =
		 * bookMapper.selectBooklistContent_preContent(bk_id); nextDto =
		 * bookMapper.selectBooklistContent_nextContent(bk_id); } else if
		 * (category.equals("all")) { // opt:title search:제목 preDto =
		 * bookMapper.selectBooklistContent_preAll(bk_id); nextDto =
		 * bookMapper.selectBooklistContent_nextAll(bk_id); }
		 */
		
		map.put("bookDto", bookDto);
		map.put("preDto", preDto);
		map.put("nextDto", nextDto);
		map.put("category", category);
		map.put("search", search);
		map.put("page", page);
		return map;
	}

	@Override
	public Map<String, Object> bookpop_view(String bk_id) {
		Map map = new HashMap<String, Object>();
		bookDto = bookMapper.selectbookpop(bk_id);
		
		map.put("bookDto", bookDto);

		return map;
	}

	


	
	
	
	
}
