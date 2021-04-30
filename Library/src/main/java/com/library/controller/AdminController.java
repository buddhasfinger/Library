package com.library.controller;

import java.net.URLEncoder;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.library.dto.BookDto;
import com.library.dto.NoticeDto;
import com.library.service.book.BookService;
import com.library.service.notice.NoticeService;
import com.library.service.reservation.ReservationService;
import com.library.service.roomBooking.RoomBookingService;
import com.library.service.study.StudyService;

@Controller
public class AdminController {
	@Autowired
	NoticeService noticeService;
	@Autowired
	StudyService studyService;
	@Autowired
	RoomBookingService roomBookingService;
	@Autowired
	BookService bookService;
	@Autowired
	ReservationService reservationService;

	Map<String, Object> map;
	Map<String, Object> email;

	// 관리자 공지사항 관리페이지
	@RequestMapping("/admin/adminNotice")
	public String adminNotice(@RequestParam @Nullable String page, @RequestParam @Nullable String category,
			@RequestParam @Nullable String search, Model model) {
		map = noticeService.noticeListAll(page, category, search);
		model.addAttribute("map", map);
		return "/admin/adminNotice";
	}

	// 관리자 스터디룸 예약자 정보페이지 - 아직 구현 안됨
	@RequestMapping("/admin/bookingMember")
	public String bookingMember() {
		return "/admin/bookingMember";
	}

	// 관리자 공지사항 작성
	@RequestMapping("/admin/adminNotice_write")
	public String adminNotice_write() {
		return "/admin/adminNotice_write";
	}

	// 관리자 공지사항 등록
	@RequestMapping("/admin/notice_write")
	@ResponseBody
	public String notice_write(NoticeDto noticeDto, @RequestPart MultipartFile file) {
		noticeService.noticeWrite(noticeDto, file);
		return "/admin/adminNotice_write";
	}

	// 관리자 공지사항 수정 페이지
	@RequestMapping("admin/adminNotice_modify")
	public String adminNotice_modify(@RequestParam @Nullable String page, @RequestParam @Nullable String category,
			@RequestParam @Nullable String search, @RequestParam @Nullable String nt_num, Model model) {
		map = noticeService.noticeModifyRead(nt_num, page, category, search);
		model.addAttribute("map", map);
		return "admin/adminNotice_modify";
	}
	
	// 관리자 공지사항 수정->등록
	@RequestMapping("/admin/notice_modify")
	public String notice_modify(NoticeDto noticeDto, @RequestParam @Nullable String page,
			@RequestParam @Nullable String category, @RequestParam @Nullable String search,
			@RequestPart MultipartFile file, Model model) throws Exception {
		noticeService.noticeModify(noticeDto, file);
		search = URLEncoder.encode(search, "utf-8");
		return "redirect:/admin/adminNotice?page=" + page + "&category=" + category + "&search=" + search;
	}

	// 관리자페이지 공지사항 삭제
	@RequestMapping("/adminNoticedelete")
	public String Notice_delete(@RequestParam String nt_num, @RequestParam @Nullable String page,
			@RequestParam @Nullable String category, @RequestParam @Nullable String search, Model model)
			throws Exception {
		noticeService.noticeDelete(nt_num);
		search = URLEncoder.encode(search, "utf-8");
		return "redirect:/admin/adminNotice?page=" + page + "&category=" + category + "&search=" + search;
	}

	
	  // 관리자페이지 전체대여도서리스트
	  
	@RequestMapping("/admin/admin_reservationlist") 
	public String admin_booklist(@RequestParam @Nullable String page,
		@RequestParam @Nullable String category,
		@RequestParam @Nullable String search,
		@RequestParam @Nullable String subcate, Model model) {
		map = reservationService.selectadminReList(page,category,search,subcate);
		System.out.println("conter"+subcate);
		System.out.println("mainca"+category);
		model.addAttribute("map",map);
	return"admin/admin_reserlist";
	 }
	  
	  @RequestMapping("/admin/admin_Unpaidreservationlist") 
	  public String admin_Unpaidreservationlist(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search, Model model) {
		map = reservationService.selectadminUnpList(page,category,search);
		email = reservationService.selecttemail();
		model.addAttribute("map",map);
		model.addAttribute("email",email);
		return"admin/admin_uprelist";
	  }
	  @RequestMapping("/admin/upEmailCheck")
	  @ResponseBody
	  public String upEmailCheck(String email) {
	      reservationService.upemailCheck(email);
	      
	      return"redirect:/admin/admin_Imminentreservationlist";
	   }
	 
	  
	  @RequestMapping("/admin/admin_Imminentreservationlist") 
	  public String admin_Imminentreservationlist(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search, Model model) {
		map = reservationService.selectadminImmList(page,category,search);
		email = reservationService.selecttemail();
		model.addAttribute("map",map);
		model.addAttribute("email",email);
		return"admin/admin_imrelist";
	  }
	  
	  @RequestMapping("/admin/EmailCheck")
	  @ResponseBody
	  public String EmailCheck(String email) {
	      reservationService.emailCheck(email);
	      
	      return"redirect:/admin/admin_Imminentreservationlist";
	   }
	 

	// 관리자페이지 도서등록 완료
	@RequestMapping("/admin/admin_bookwrite")
	public String bookwrite() {
		return "admin/admin_bookwrite";
	}

	@RequestMapping("/admin/book_write")
	@ResponseBody
	public String book_write(BookDto bookDto, @RequestPart MultipartFile file) {
		bookService.adminBookWrite(bookDto, file);
		return "admin/admin_booklist";
	}

	
	// 관리자페이지 도서수정 완료
	@RequestMapping("/admin/admin_bookmodify_view") 
	public String admin_bookmodify_view(@RequestParam String bk_id, Model model) { 
	map = bookService.adminBookModify_view(bk_id); 
	model.addAttribute("map", map); 
	return "admin/admin_bookmodify_view"; 
	}
	@RequestMapping("/admin/book_modify")
	@ResponseBody 
	public String book_modify(BookDto bookDto, @RequestPart MultipartFile file)throws Exception{
    bookService.adminBookModifyWrite(bookDto, file); 
    return "book/book_list"; 
   }
	// 관리자도서삭제 완료
	@RequestMapping("/admin/book_delete")
	@ResponseBody
	public String book_delete(@RequestParam String bk_id) {
		bookService.bookDelete(bk_id);
		return "book/book_list";
	}
	

	@RequestMapping("/testemail")
	@ResponseBody
	public String testEmail(@RequestParam String temail) {
	  reservationService.emailCheck2(temail);
	return"redirect:/admin/testlist";
	}

}
