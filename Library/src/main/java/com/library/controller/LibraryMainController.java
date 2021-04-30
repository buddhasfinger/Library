package com.library.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.service.MainService;

@Controller
public class LibraryMainController {

	@Autowired
	MainService mainService;
	
	Map<String, Object> map;
	Map<String, Object> newBooklist;
	Map<String, Object> favorbook = new HashMap<String, Object>();
	
	@RequestMapping("/main")
	public String main(@RequestParam @Nullable String lm_user,Model model) {
		map = mainService.BestSellerList();
		newBooklist = mainService.NewBookList();
		//유저 맞춤도서 5개
		String tempStr = (lm_user==null)?"":lm_user;//null처리 매우중요
		
		favorbook = mainService.favorbooks(tempStr);
			System.out.println("favorbook : " +favorbook);
			
		model.addAttribute("map", map);
		model.addAttribute("newBooklist",newBooklist);
		model.addAttribute("favorbook", favorbook);
		return "main";
	}
	
	@RequestMapping("/main2")
	public String main2(Model model) {
		map = mainService.BestSellerList();
		model.addAttribute("map", map);
		return "index";
	}
}
