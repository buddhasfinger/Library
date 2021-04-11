package com.library.service.study;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.dto.RoomBookingDto;
import com.library.mapper.Study_Mapper;

@Service
public class StudyServiceImpl implements StudyService {

	@Autowired
	Study_Mapper studyMapper;
	
	List list = new ArrayList();
	Map map = new HashMap<String, Object>();
	int[] rs ;
	@Override
	public int[] dateCheck(int sr_id,String rb_date) {
		list = studyMapper.occupiedRoomList(sr_id,rb_date);
		List<RoomBookingDto> listMap = list;  
		System.out.println(listMap);
		rs = new int[listMap.size()];
		for(int i=0;i<listMap.size();i++) {
			rs[i] =listMap.get(i).getRb_time();
			System.out.println(rs[i]);
		}
		
		return rs;
	}
	
}
