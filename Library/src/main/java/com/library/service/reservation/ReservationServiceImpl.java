package com.library.service.reservation;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.library.dto.RbookDto;
import com.library.mapper.BookMapper;
import com.library.mapper.ReservationMapper;
import com.library.service.page.PageNumber;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	ReservationMapper reservationMapper;
	@Autowired
	BookMapper bookMapper;
	@Autowired
	PageNumber pageNumber;
	
	@Autowired
    private JavaMailSender send;
	
	@Autowired
	Map<String, Object> map;
	List<RbookDto> list;
	List<RbookDto> list2;

	//대여
	@Override
	public void insertReservation(RbookDto rbookDto,String bk_id) {
		bookMapper.updateBookAmount(bk_id);
		reservationMapper.insertReservation(rbookDto);
	}

	//관리자 전체대여리스트
	@Override
	public Map<String, Object> selectadminReList(String listPage, String category, String search,String subcate) {
		Map map = new HashMap<String, Object>();
		list = new ArrayList<RbookDto>();
		int page = 1;// 처음 들어왔을때 페이지 초기화
		int limit = 8;// 페이지가 나오는 갯수
		if (listPage != null && listPage != "") {
			page = Integer.parseInt(listPage);
		}
		int startrow = (page - 1) * limit + 1; // 시작 게시글번호 1,11,21...
		int endrow = startrow + limit - 1; // 마지막 게시글번호 10,20,30...
		System.out.println("impl1"+subcate);
		
		if((category == null || category.equals(""))&&subcate.equals("allre")) {
			System.out.println("all3"+subcate);
			list = reservationMapper.selecereserListAllsub(startrow, endrow, subcate);
			System.out.println("all2"+subcate);
		}else if ((category == null || category.equals(""))&&(subcate.equals("immre"))) {
			System.out.println("impl3"+subcate);
			list = reservationMapper.selecereserListimmsub(startrow, endrow, subcate);
			System.out.println("impl2"+subcate);
		}
		else if ((category == null || category.equals(""))&&(subcate.equals("upre"))) {
			System.out.println("uper2"+subcate);
			list = reservationMapper.selecereserListupsub(startrow, endrow, subcate);
			System.out.println("uper1"+subcate);
		}
		else if (category.equals("title")) { // opt:title search:제목
			list = reservationMapper.selectreserListTitle(startrow, endrow, search);
		} else if (category.equals("name")) { // opt:title search:제목
			list = reservationMapper.selectreserListName(startrow, endrow, search);
		} else if (category.equals("all")) { // opt:title search:제목
			list = reservationMapper.selectreserSearchAll(startrow, endrow, search);
		}
		map = pageNumber.pageNumber_adminrlist(page, limit, category, search, subcate);
		map.put("list", list);
		map.put("subcate", subcate);
		return map;
	}
	
	//관리자 미납대여리스트
	@Override
	public Map<String, Object> selectadminUnpList(String listPage, String category, String search) {
		Map map = new HashMap<String, Object>();
		list = new ArrayList<RbookDto>();
		int page = 1;// 처음 들어왔을때 페이지 초기화
		int limit = 8;// 페이지가 나오는 갯수
		if (listPage != null && listPage != "") {
			page = Integer.parseInt(listPage);
		}
		int startrow = (page - 1) * limit + 1; // 시작 게시글번호 1,11,21...
		int endrow = startrow + limit - 1; // 마지막 게시글번호 10,20,30...

		if (category == null || category.equals("")) {
			list = reservationMapper.selectUnpListAll(startrow, endrow);
		} 
		else if (category.equals("title")) { // opt:title search:제목
			list = reservationMapper.selectUnpListTitle(startrow, endrow, search);
		} else if (category.equals("name")) { // opt:title search:제목
			list = reservationMapper.selectUnpListName(startrow, endrow, search);
		} else if (category.equals("all")) { // opt:title search:제목
			list = reservationMapper.selectUnpSearchAll(startrow, endrow, search);
		}
		map = pageNumber.pageNumber_adminulist(page, limit, category, search);
		map.put("list", list);
		return map;
	}
	@Override
	public void upemailCheck(String email) {
		try {
	          MimeMessage msg = send.createMimeMessage();
	          MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
	          helper.setTo(email);
	          helper.setSubject("도서반납 안내입니다.");
	          helper.setText("빌려가신 도서가 미납되었습니다. 빠른 시일내에 반납해주세요.",true);
	          msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email));
	          send.send(msg);
	       }catch(Exception e) {
	       }	
	}
	
	//관리자 임박대여리스트
	@Override
	public Map<String, Object> selectadminImmList(String listPage, String category, String search) {
		Map map = new HashMap<String, Object>();
		list = new ArrayList<RbookDto>();
		int page = 1;// 처음 들어왔을때 페이지 초기화
		int limit = 8;// 페이지가 나오는 갯수
		if (listPage != null && listPage != "") {
			page = Integer.parseInt(listPage);
		}
		int startrow = (page - 1) * limit + 1; // 시작 게시글번호 1,11,21...
		int endrow = startrow + limit - 1; // 마지막 게시글번호 10,20,30...

		if (category == null || category.equals("")) {
			list = reservationMapper.selectImmListAll(startrow, endrow);
		} 
		else if (category.equals("title")) { // opt:title search:제목
			list = reservationMapper.selectImmListTitle(startrow, endrow, search);
		} else if (category.equals("name")) { // opt:title search:제목
			list = reservationMapper.selectImmListName(startrow, endrow, search);
		} else if (category.equals("all")) { // opt:title search:제목
			list = reservationMapper.selectImmSearchAll(startrow, endrow, search);
		}
		map = pageNumber.pageNumber_adminilist(page, limit, category, search);
		map.put("list", list);
		return map;
	}
	@Override
	public void emailCheck(String email) {
	       try {
	          MimeMessage msg = send.createMimeMessage();
	          MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
	          helper.setTo(email);
	          helper.setSubject("도서반납 안내입니다.");
	          helper.setText("빌려가신 도서의 반납일이 얼마 남지않았습니다. 반납기일을 지켜주세요.",true);
	          msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email));
	          send.send(msg);
	       }catch(Exception e) {
	       }
     }
	
		
	//나의 대여리스트
	@Override
	public Map<String, Object> selectMybook(String lm_id) {
		list = new ArrayList<RbookDto>();
		list = reservationMapper.selectMybookListAll(lm_id);
		map.put("list", list);
		return map;
	}

	//대여삭제
	@Override
	public void reservationDelete(String br_id,String bk_id) {
		bookMapper.updateBookPlusAmount(bk_id);
		reservationMapper.deletereservationDelete(br_id);
	}
	
	//대여 연장
	@Override
	public void extendBookreservation(RbookDto rbookDto) {
		reservationMapper.updateBookReservation(rbookDto);
		
	}

	@Override
	public Map<String, Object> selecttemail() {
		Map map = new HashMap<String, Object>();
		list2 = new ArrayList<RbookDto>();
		list2 = reservationMapper.selecttmail();
		
		map.put("list2", list2);
		
		return map;
	}

	@Override
	public void emailCheck2(String temail) {
		String[] email = temail.split(",");
		  for(int i=0;i<email.length;i++) {
			  System.out.println(email[i]);
	 try {
	          MimeMessage msg = send.createMimeMessage();
	          MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
	          helper.setTo(email);
	          helper.setSubject("도서반납 안내입니다.");
	          helper.setText("빌려가신 도서가 미납되었습니다. 반납해주세요.",true);
	          msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email[i]));
	          send.send(msg);
	       }catch(Exception e) {
	       }
		  }	
		
	}

	





	
}
