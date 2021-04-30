package com.library.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.library.dto.BookDto;
import com.library.dto.RbookDto;
import com.library.service.book.BookService;
import com.library.service.reservation.ReservationService;

@Controller
public class BookController {
	
	@Autowired
	ReservationService reservationService;
	@Autowired
	BookService bookService;
	
	@Autowired
	Map<String, Object> map;
	
	//사용자 관리자 공용 도서리스트
	@RequestMapping("/book/book_list")	
	public String admin_booklist(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search, Model model) {
		map = bookService.bookListAll(page,category,search);
		model.addAttribute("map",map);
		return"book/book_list";
	}
	
	@RequestMapping("/book/book_kolist")	
	public String book_kolist(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,
			@RequestParam @Nullable String bk_subcate,Model model) {
		map = bookService.bookListkoAll(page,category,search,bk_subcate);
		model.addAttribute("map",map);
		return"book/book_list";
	}
	
	@RequestMapping("/book/book_englist")	
	public String book_englist(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,
			@RequestParam @Nullable String bk_subcate,
			Model model) {
		map = bookService.bookListengAll(page,category,search,bk_subcate);
		model.addAttribute("map",map);
		return"book/book_list";
	}
	
	@RequestMapping("/book/book_content_view")
	public String bookContent_view(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,
			@RequestParam @Nullable String bk_id,Model model) {
		map = bookService.bookContent_view(bk_id,page,category,search);
		model.addAttribute("map",map);
		return"book/book_content_view";
	}
	
	@RequestMapping("/book/bookpop")
	public String bookPop(@RequestParam @Nullable String bk_id,Model model) {
		System.out.println(bk_id);
		map = bookService.bookpop_view(bk_id);
		model.addAttribute("map", map);	
		return "book/bookpop";
	}
	
}
