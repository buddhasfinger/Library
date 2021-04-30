package com.library.service.study;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.dto.RoomBookingDto;
import com.library.dto.StudyRoomDto;
import com.library.mapper.RoomBookingMapper;
import com.library.mapper.StudyMapper;

@Service
public class StudyServiceImpl implements StudyService {
	@Autowired
	StudyMapper studyMapper;
	@Autowired
	RoomBookingMapper roomBookingMapper;
	
	List<RoomBookingDto> list = new ArrayList();
	StudyRoomDto roomck;
	

	Map map = new HashMap<String, Object>();
	int trs = 0;
	List<RoomBookingDto> room1 = new ArrayList();
	List<RoomBookingDto> room2 = new ArrayList();
	List<RoomBookingDto> room3 = new ArrayList();
	List<RoomBookingDto> room4 = new ArrayList();
	List<RoomBookingDto> room5 = new ArrayList();
	int[] rs;
	int[] trs1;
	int[] trs2;
	int[] trs3;
	int[] trs4;
	int[] trs5;
	
	

	@Override
	public void roomOpen(StudyRoomDto studyRoomDto, int sr_id) {
		studyMapper.roomOpen(studyRoomDto,sr_id);
		System.out.println("Impl");
		return;
		
	}
	//스터디룸 닫기
	@Override
	public void roomClose(StudyRoomDto studyRoomDto, String sr_info,int sr_id) {
		
		studyMapper.roomClose(studyRoomDto,sr_info,sr_id);
		System.out.println("Impl");
		return;
		
	}

	// 룸 예약하기
	@Override
	public Map<String, Object> roomBooking(RoomBookingDto roombookingDto, String lm_id,String rb_date) {
		Map map = new HashMap<String, Object>();
		
  		Date d= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(d);
		System.out.println(today);
		System.out.println(rb_date);

		int weekCount = 0;
		weekCount = roomBookingMapper.weekcheck(roombookingDto, lm_id);
		System.out.println("주간" + weekCount);
		
		
		int dayCount = 0;
		
		if(rb_date.equals(today)) {
			dayCount = roomBookingMapper.daycheck(roombookingDto, lm_id);
			System.out.println("일간" + dayCount);
		}else {
			dayCount = roomBookingMapper.unad_daycheck(roombookingDto, lm_id,rb_date);
			System.out.println("다른날" + dayCount);
		}
		
		

		if (weekCount >= 5) {
			map.put("rs", "주간 총 5시간을 모두 사용하셨습니다.");
		} else if (dayCount >= 1) {
			map.put("rs", "하루에사용할수있는 예약횟수는 한번입니다. (예약 1회, 연장 1회)");
		} else {
			studyMapper.roomBooking(roombookingDto);
			map.put("rs", "예약이 완료되었습니다.");
		}

		return map;
	}

	// 해당 날짜에 기존 예약자가 있는지 확인
	@Override
	public int[] dateCheck(RoomBookingDto roombookingDto) {
		list = studyMapper.occupiedRoomList(roombookingDto);
		//List<RoomBookingDto> listMap = list;
		System.out.println("list:"+list);
		rs = new int[list.size()];
		for (int i = 0; i < list.size(); i++) {
			rs[i] = list.get(i).getRb_time();
			System.out.println("기존 예약시간: " + rs[i]);
		}
//		List<RoomBookingDto> listMap = list;
//		System.out.println(listMap);
//		rs = new int[listMap.size()];
//		for (int i = 0; i < listMap.size(); i++) {
//			rs[i] = listMap.get(i).getRb_time();
//			System.out.println("기존 예약시간: " + rs[i]);
//		}

		return rs;
	}

	// 오늘 날짜 모든 예약 리스트 불러와서 룸별로 나누기
	@Override
	public Map<String, Object> todayCheck(String today) {
		Map map = new HashMap<String, Object>();

		trs = 1;
		roomck= studyMapper.studyroomcheck(trs);
		map.put("dt1",roomck );
		room1 = studyMapper.todayOccupiedRoomList(trs, today);
		trs1 = new int[room1.size()];
		for (int i = 0; i < room1.size(); i++) {
			trs1[i] = room1.get(i).getRb_time();
			System.out.println("오늘 1번방: " + trs1[i] + "시");
		}
		trs = 2;
		roomck= studyMapper.studyroomcheck(trs);
		map.put("dt2",roomck );
		room2 = studyMapper.todayOccupiedRoomList(trs, today);
		trs2 = new int[room2.size()];
		for (int i = 0; i < room2.size(); i++) {
			trs2[i] = room2.get(i).getRb_time();
			System.out.println("오늘 2번방: " + trs2[i] + "시");
		}
		trs = 3;
		roomck= studyMapper.studyroomcheck(trs);
		map.put("dt3",roomck );
		room3 = studyMapper.todayOccupiedRoomList(trs, today);
		trs3 = new int[room3.size()];
		for (int i = 0; i < room3.size(); i++) {
			trs3[i] = room3.get(i).getRb_time();
			System.out.println("오늘 3번방: " + trs3[i] + "시");
		}
		trs = 4;
		roomck= studyMapper.studyroomcheck(trs);
		map.put("dt4",roomck );
		room4 = studyMapper.todayOccupiedRoomList(trs, today);
		trs4 = new int[room4.size()];
		for (int i = 0; i < room4.size(); i++) {
			trs4[i] = room4.get(i).getRb_time();
			System.out.println("오늘 4번방: " + trs4[i] + "시");
		}
		trs = 5;
		roomck= studyMapper.studyroomcheck(trs);
		map.put("dt5",roomck );
		room5 = studyMapper.todayOccupiedRoomList(trs, today);
		trs5 = new int[room5.size()];
		for (int i = 0; i < room5.size(); i++) {
			trs5[i] = room5.get(i).getRb_time();
			System.out.println("오늘 5번방: " + trs5[i] + "시");
		}
		map.put("trs1", room1);
		map.put("trs2", room2);
		map.put("trs3", room3);
		map.put("trs4", room4);
		map.put("trs5", room5);

		return map;
	}

	@Override
	public void nextroom(RoomBookingDto roombookingDto) {
		// TODO Auto-generated method stub

	}



}
