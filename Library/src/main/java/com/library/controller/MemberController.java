package com.library.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.dto.MemberDto;
import com.library.service.member.MemberService;




@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;

	Map<String,Object> map;
	int check=0;
	String rs="";
	
	@RequestMapping("/member/login")
	public String login() {
		return "/member/login";
	}
	@RequestMapping("/member/logout")
	public String logout() {
		return "/member/logout";
	}
	@RequestMapping("/loginCheck")
	@ResponseBody
	public Map loginCheck(HttpServletRequest request, MemberDto memberDto) {
		System.out.println("id : "+memberDto.getLm_user()+"pw : "+memberDto.getLm_pw1());
		Map map = memberService.loginCheck(memberDto.getLm_user(),memberDto.getLm_pw1());
		
		if((int)map.get("loginCheck")==1) {
			HttpSession session = request.getSession();
			session.setAttribute("session_flag", "success");
			session.setAttribute("session_Name", ((MemberDto) map.get("memberDto")).getLm_name());
			session.setAttribute("session_id", ((MemberDto) map.get("memberDto")).getLm_id());
			session.setAttribute("session_user", ((MemberDto) map.get("memberDto")).getLm_user());
			session.setAttribute("session_email1", ((MemberDto) map.get("memberDto")).getLm_email1());
			session.setAttribute("session_email2", ((MemberDto) map.get("memberDto")).getLm_email2());
		}
		
		map.put("loginCheck", (int)map.get("loginCheck"));
		return map;
	}
	@RequestMapping("/member/join")
	public String join() {
		return "/member/join";
	}
	
	@RequestMapping("/joinCheck")
	@ResponseBody
	public Map joinCheck(HttpServletRequest request, MemberDto memberDto) {
		Map map = new HashMap<String, Object>();
		//int check = memberService.joinCheck(memberDto);
		System.out.println("컨트롤러 값 전송 확인 : "+memberDto);
		
		rs = memberService.joinCheck(memberDto);
		System.out.println("rs : " +rs);
		map.put("rs", rs);
		return map;
	}
	

	@RequestMapping("/userCheck")
	@ResponseBody
	public Map userCheck(HttpServletRequest request,@RequestParam("lm_user") String lm_user) {
		Map map = new HashMap<String, Object>();
		rs = memberService.userCheck(lm_user);
		System.out.println("콘트롤러rs:" +rs);
		map.put("rs", rs);
		return map;
	}
	
	
	@RequestMapping("/member/member_list")
	public String member_list(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search, 
			Model model) {
		Map map = new HashMap<String, Object>();
		System.out.println("page:"+page +"category:"+category+"search:"+search);
		map = memberService.memberListAll(page,category,search);
		System.out.println("불러온것 :"+ map);
		model.addAttribute("map",map);
		
		return "/member/member_list";
	}
	
	@RequestMapping("/member/member_mypageView")
	public String member_mypageView(
			@RequestParam @Nullable String lm_id, 
			Model model) {
		//lm_id="2";
		map = memberService.member_mypageView(lm_id);
		model.addAttribute("map",map);
		return "/member/member_mypageView";
	}

	
	@RequestMapping("/member/member_modifyView")
	public String member_modifyView(String lm_id,Model model) {
		System.out.println("넘어온 아이디"+lm_id);
		map = memberService.member_mypageView(lm_id);
		model.addAttribute("map",map);
		return "/member/member_modifyView";
	}
	
	@RequestMapping("/modifyCheck")
	@ResponseBody
	public Map modifyCheck(HttpServletRequest request, MemberDto memberDto) {
		Map map = new HashMap<String, Object>();
		System.out.println("컨트롤러 값 전송 확인 : "+memberDto);
		rs = memberService.modifyCheck(memberDto);
		
		System.out.println("rs : " +rs);
		map.put("rs", rs);
		return map;
	}
	

}
