package com.library.service.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.dto.MemberDto;
import com.library.mapper.MemberMapper;
import com.library.service.page.PageNumber;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	PageNumber pageNumber;
	
	Map map = new HashMap<String, Object>();
	List<MemberDto> list= new ArrayList<MemberDto>();
	MemberDto memberDto;
	
	int check=0;
	String rs="";

	//로그인
	@Override
	public Map loginCheck(String lm_user, String lm_pw1) {
		Map map = new HashMap<String, Object>();
		
		System.out.println("임플리먼트 확인 : "+lm_user+lm_pw1);
		MemberDto memberDto = memberMapper.selectLoginCheck(lm_user,lm_pw1);
		String message = "아이디와 비밀번호가 일치하지 않습니다.";
		int loginCheck=-1;
		if(memberDto !=null) {
			loginCheck=1;
			message = "로그인에 성공하셨습니다.";
		}
		map.put("memberDto", memberDto);
		map.put("loginCheck", loginCheck);
		map.put("message", message);
		return map;
	}
	
	//회원가입
	@Override
	public String joinCheck(MemberDto memberDto) {
		check = memberMapper.insertJoinCheck(memberDto);
		if(check ==1) {
			rs = "회원가입에 성공하셨습니다.";
		}
		return rs;
	}

	//아이디 중복체크
	@Override
	public String userCheck(String lm_user) {
		Map map = new HashMap<String, Object>();
		check = memberMapper.selectUserCheck(lm_user);
		System.out.println("check:"+check);
		String message = "사용 가능한 아이디입니다.";
		if(check !=0) {
			message = "이미 사용중인 아이디 입니다.";
		}
		return message;
	}
	
	//관리자 회원전체보기
	@Override
	public Map<String, Object> memberListAll(String listpage, String category, String search) {
		System.out.println("search1 :"+search);
		Map map = new HashMap<String, Object>();
		list = new ArrayList();
		int page = 1; // 첫페이지 초기화
		int limit = 10; // 한 페이지에 표시되는 게시글 개수
		// page 데이터가 있으면 데이터값 적용
		if (listpage != null && listpage != "") {
			page = Integer.parseInt(listpage);
		}

		int startrow = (page - 1) * limit + 1; // 시작 게시글번호 1,11,21...
		int endrow = startrow + limit - 1;// 마지막 게시글 번호 10,20,30...

		// 리스트 가져오는 메소드
		if (category == null || category.equals("")) { // 검색이 없을때
			System.out.println("임플리1");
			list = memberMapper.selectBoardListAll(startrow,endrow);
			System.out.println("임플리2");
		} else if (category.equals("namesearch")) { // option: title search: 제목
			list = memberMapper.selectBoardListTitle(startrow,endrow,search);
		} 
		
		System.out.println("임플리피넘1");
		map = pageNumber.pageNumber_memberlistboard(page, limit, category, search);
		System.out.println("임플리피넘2");
		System.out.println("hopeboardImplpageNumber 내용 : "+pageNumber.pageNumber_hopeboard(page, limit, category, search));

		map.put("list", list);

		return map;
	}

	
	//내정보보기 및 수정View
	@Override
	public Map<String, Object> member_mypageView(String lm_id) {
		memberDto = memberMapper.selectMypage_view(lm_id);
		map.put("memberDto", memberDto);
		
		return map;
	}
	
	//회원정보수정
	@Override
	public String modifyCheck(MemberDto memberDto) {
		check = memberMapper.updateModifyCheck(memberDto);
		System.out.println("check:"+check);
		if(check ==1) {
			rs = "회원정보수정을 완료 하였습니다.";
		}
		return rs;
	}


	
	

	

}
