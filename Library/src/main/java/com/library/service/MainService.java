package com.library.service;

import java.util.Map;

public interface MainService {
	
	//베스트셀러 5개
	Map<String, Object> BestSellerList();
	
	//신작도서 5개
	Map<String, Object> NewBookList();
	
	//유저 맞춤도서 5개
	Map<String, Object> favorbooks(String lm_user);
}
