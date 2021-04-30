package com.library.service.member;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.library.dto.MemberDto;


public interface MemberService {

	Map loginCheck(String lm_user, String lm_pw1);

	String joinCheck(MemberDto memberDto);
	
	String userCheck(String lm_user);

	Map<String, Object> memberListAll(String page, String category, String search);

	String modifyCheck(MemberDto memberDto);

	Map<String, Object> member_mypageView(String lm_id);
	
	
}
