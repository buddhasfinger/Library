package com.library.service.page;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.library.mapper.BookMapper;
import com.library.mapper.EventMapper;
import com.library.mapper.FreeboardMapper;
import com.library.mapper.HopeBookBoard_Mapper;
import com.library.mapper.MemberMapper;
import com.library.mapper.NoticeMapper;
import com.library.mapper.ReservationMapper;
import com.library.mapper.RoomBookingMapper;

@Component
public class PageNumber {

	@Autowired
	FreeboardMapper freeboardMapper;
	@Autowired
	BookMapper bookMapper;
	@Autowired
	ReservationMapper reservationMapper;
	@Autowired
	EventMapper eventMapper;
	@Autowired
	HopeBookBoard_Mapper hopeboardMapper;
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	NoticeMapper noticeMapper;
	@Autowired
	RoomBookingMapper roomBookingMapper;

	public Map<String, Object> pageNumber_book(int page, int limit, String category, String search) {
		Map map = new HashMap<String, Object>();
		int listCount = 0;
		System.out.println("test category" + category);
		if (category == null || category.equals("")) {
			// 전체리스트 개수메소드
			listCount = bookMapper.bookListCount();
		} else if (category.equals("title")) {
			// title검색 개수메소드
			listCount = bookMapper.bookListCountTitle(search);
		} else if (category.equals("content")) {
			listCount = bookMapper.bookListCountContent(search);
		} else if (category.equals("all")) {
			listCount = bookMapper.bookListCountSearchAll(search);
		}

		// 최대페이지 수
		int maxpage = (int) ((double) listCount / limit + 0.95);
		// 첫 페이지 번호
		int startpage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
		// 마지막 페이지 번호
		int endpage = maxpage;

		// 검색시 아무것도안뜰때 maxPage가0이되고 >> 화살표뜨는거 방지
		if (maxpage == 0)
			maxpage = 1;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		map.put("page", page);
		map.put("listCount", listCount);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("category", category);
		map.put("search", search);

		return map;
	}

	public Map<String, Object> pageNumber_freeboard(int page, int limit, String category, String search) {
		Map map = new HashMap<String, Object>();
		int listCount = 0;

		if (category == null || category.equals("")) {
			// 전체리스트 개수메소드
			listCount = freeboardMapper.freeboradListCount();
		} else if (category.equals("title")) {
			// title검색 개수메소드
			listCount = freeboardMapper.freeboradListCountTitle(search);
		} else if (category.equals("content")) {
			listCount = freeboardMapper.freeboradListCountContent(search);
		} else if (category.equals("all")) {
			listCount = freeboardMapper.freeboradListCountSearchAll(search);
		}

		// 최대페이지 수
		int maxpage = (int) ((double) listCount / limit + 0.95);
		// 첫 페이지 번호
		int startpage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
		// 마지막 페이지 번호
		int endpage = maxpage;

		// 검색시 아무것도안뜰때 maxPage가0이되고 >> 화살표뜨는거 방지
		if (maxpage == 0)
			maxpage = 1;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		map.put("page", page);
		map.put("listCount", listCount);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("category", category);
		map.put("search", search);

		return map;
	}

	public Map<String, Object> pageNumber_event(int page, int limit, String category, String search) {
		Map map = new HashMap<String, Object>();
		int listCount = 0;

		
		 if(category==null || category.equals("")) { 
			 listCount = eventMapper.eventListCount(); 
		 }
		

		// 최대페이지 수
		int maxpage = (int) ((double) listCount / limit + 0.95);
		// 첫 페이지 번호
		int startpage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
		// 마지막 페이지 번호
		int endpage = maxpage;

		// 검색시 아무것도안뜰때 maxPage가0이되고 >> 화살표뜨는거 방지
		if (maxpage == 0)
			maxpage = 1;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		map.put("page", page);
		map.put("listCount", listCount);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("category", category);
		map.put("search", search);

		return map;
	}

	public Map<String, Object> pageNumber_adminrlist(int page, int limit, String category, String search, String subcate) {
		Map map = new HashMap<String, Object>();
		int listCount = 0;

		if ((category == null || category.equals(""))&&(subcate.equals("allre"))) {
			// 전체리스트 개수메소드
			listCount = reservationMapper.reservationListCountSub(subcate);
			System.out.println("page1" +subcate);
		}else if ((category == null || category.equals(""))&&(subcate.equals("immre"))) {
			listCount = reservationMapper.reservationListCountimmSub(subcate);
		    System.out.println("immrepage1" +subcate);
		}
		else if ((category == null || category.equals(""))&&(subcate.equals("upre"))) {
			listCount = reservationMapper.reservationListCountupSub(subcate);
		    System.out.println("uprepage1" +subcate);
		}
		else if(category.equals("title")) {
			//title검색 개수메소드
			listCount = reservationMapper.reservationListCountTitle(search);
		}else if(category.equals("name")) {
			listCount = reservationMapper.reservationListCountName(search);
		}else if(category.equals("all")) {
			listCount = reservationMapper.reservationListCountSearchAll(search);
		}

		// 최대페이지 수
		int maxpage = (int) ((double) listCount / limit + 0.95);
		// 첫 페이지 번호
		int startpage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
		// 마지막 페이지 번호
		int endpage = maxpage;

		// 검색시 아무것도안뜰때 maxPage가0이되고 >> 화살표뜨는거 방지
		if (maxpage == 0)
			maxpage = 1;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		map.put("page", page);
		map.put("subcate", subcate);
		map.put("listCount", listCount);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("category", category);
		map.put("search", search);

		return map;
	}

	public Map<String, Object> pageNumber_adminulist(int page, int limit, String category, String search) {
		Map map = new HashMap<String, Object>();
		int listCount = 0;

		if (category == null || category.equals("")) {
			// 전체리스트 개수메소드
			listCount = reservationMapper.ureservationListCount();
		}
		else if(category.equals("title")) {
			//title검색 개수메소드
			listCount = reservationMapper.ureservationListCountTitle(search);
		}else if(category.equals("name")) {
			listCount = reservationMapper.ureservationListCountName(search);
		}else if(category.equals("all")) {
			listCount = reservationMapper.ureservationListCountSearchAll(search);
		}

		// 최대페이지 수
		int maxpage = (int) ((double) listCount / limit + 0.95);
		// 첫 페이지 번호
		int startpage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
		// 마지막 페이지 번호
		int endpage = maxpage;

		// 검색시 아무것도안뜰때 maxPage가0이되고 >> 화살표뜨는거 방지
		if (maxpage == 0)
			maxpage = 1;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		map.put("page", page);
		map.put("listCount", listCount);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("category", category);
		map.put("search", search);

		return map;
	}

	public Map<String, Object> pageNumber_adminilist(int page, int limit, String category, String search) {
		Map map = new HashMap<String, Object>();
		int listCount = 0;

		if (category == null || category.equals("")) {
			// 전체리스트 개수메소드
			listCount = reservationMapper.ireservationListCount();
		}
		else if(category.equals("title")) {
			//title검색 개수메소드
			listCount = reservationMapper.ireservationListCountTitle(search);
		}else if(category.equals("name")) {
			listCount = reservationMapper.ireservationListCountName(search);
		}else if(category.equals("all")) {
			listCount = reservationMapper.ireservationListCountSearchAll(search);
		}

		// 최대페이지 수
		int maxpage = (int) ((double) listCount / limit + 0.95);
		// 첫 페이지 번호
		int startpage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
		// 마지막 페이지 번호
		int endpage = maxpage;

		// 검색시 아무것도안뜰때 maxPage가0이되고 >> 화살표뜨는거 방지
		if (maxpage == 0)
			maxpage = 1;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		map.put("page", page);
		map.put("listCount", listCount);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("category", category);
		map.put("search", search);

		return map;
	}
	
	public Map<String, Object> pageNumber_hopeboard(int page,int limit,String category, String search){
		   
		   Map map = new HashMap<String, Object>();
		   int listCount=0;
		   
		   if(category==null || category.equals("")) {
			   //전체리스트 개수메소드
			   System.out.println("전체리스트 도나?1");
			   listCount = hopeboardMapper.listCount();
			   System.out.println("전체리스트 도나?2");
		   }else if(category.equals("title")) {
			   //title검색 개수메소드
			   listCount = hopeboardMapper.listCountTitle(search);
		   }else if(category.equals("content")) {
			   listCount = hopeboardMapper.listCountContent(search);
		   }else if(category.equals("all")) {
			   listCount = hopeboardMapper.listCountSearchAll(search);
		   }
		   
		   //최대페이지 수
		   int maxpage = (int)((double)listCount/limit+0.95);
		   //첫 페이지 번호
		   int startpage = ((int)((double)page/10+0.9)-1)*10+1;
		   //마지막 페이지 번호
		   int endpage = maxpage;
		   
		   //검색시 아무것도안뜰때 maxPage가0이되고 >> 화살표뜨는거 방지
		   if(maxpage==0) maxpage=1;
		   
		   if(endpage>startpage+10-1) endpage = startpage+10-1;
		   
		   map.put("page", page);
		   map.put("listCount", listCount);
		   map.put("maxpage", maxpage);
		   map.put("startpage", startpage);
		   map.put("endpage", endpage);
		   map.put("category", category);
		   map.put("search", search);
		   
		   return map;
	   }

	public Map pageNumber_memberlistboard(int page, int limit, String category, String search) {
		Map map = new HashMap<String, Object>();
		   int listCount=0;
		   
		   if(category==null || category.equals("")) {
			   //전체리스트 개수메소드
			   System.out.println("페이지 도나?1");
			   listCount = memberMapper.listCount();
			   System.out.println("페이지 도나?2");
		   }else if(category.equals("namesearch")) {
			   //이름으로 검색 개수메소드
			   listCount = memberMapper.listCountTitle(search);
		   }
		   
		 //최대페이지 수
		   int maxpage = (int)((double)listCount/limit+0.95);
		   //첫 페이지 번호
		   int startpage = ((int)((double)page/10+0.9)-1)*10+1;
		   //마지막 페이지 번호
		   int endpage = maxpage;
		   
		   //검색시 아무것도안뜰때 maxPage가0이되고 >> 화살표뜨는거 방지
		   if(maxpage==0) maxpage=1;
		   
		   if(endpage>startpage+10-1) endpage = startpage+10-1;
		   
		   map.put("page", page);
		   map.put("listCount", listCount);
		   map.put("maxpage", maxpage);
		   map.put("startpage", startpage);
		   map.put("endpage", endpage);
		   map.put("category", category);
		   map.put("search", search);
		   
		   return map;
	}
	
	public Map<String, Object> pageNumber(int page, int limit,String category,String search) {
		Map map = new HashMap<String, Object>();
		int listCount=0;
		if ( category==null ||category.equals("")) {
			//전체갯수 메소드
			listCount = noticeMapper.listCount();
		}else if(category.equals("title")){
			//Title 갯수 메소드
			listCount = noticeMapper.listCountTitle(search);
		}else if(category.equals("content")){
			listCount = noticeMapper.listCountContent(search);
		}else if(category.equals("all")){
			listCount = noticeMapper.listCountSearchAll(search);
		}

		
		
		int maxpage = (int) ((double) listCount / limit + 0.95);
		
		int startpage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
		
		int endpage = maxpage;
		if (endpage > startpage + 10 - 1)endpage = startpage + 10 - 1;

		map.put("page", page);
		map.put("listCount", listCount);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("category", category);
		map.put("search", search);

		return map;
	}

	//스터디룸 예약 리스트 하단넘버링 메소드
	public Map<String, Object> roompage(int page, int limit, String category, String search) {
		Map map = new HashMap<String, Object>();
		int listCount=0;
		
		if ( category==null ||category.equals("")) {
			listCount = roomBookingMapper.roomCount();
		}else if(category.equals("Date")){
			System.out.println(search);
			listCount = roomBookingMapper.roomCountDate(search);
		}else if(category.equals("User")){
			listCount = roomBookingMapper.roomCountUser(search);
		}
		int maxpage = (int) ((double) listCount / limit + 0.95);
		int startpage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;
		
		int endpage = maxpage;
		if (endpage > startpage + 10 - 1)endpage = startpage + 10 - 1;

		map.put("page", page);
		map.put("listCount", listCount);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("category", category);
		map.put("search", search);
		
		return map;
	}

}
