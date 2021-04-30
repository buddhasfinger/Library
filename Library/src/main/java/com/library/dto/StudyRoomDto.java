package com.library.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudyRoomDto {
	//<!-- 4월 8일 -->
	private int sr_id;
	private String sr_name;
	private String sr_info;
	private int sr_situation;
}