package com.library.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoomBookingDto {
	//<!-- 4월 8일 -->
	private int rb_id;
	private int sr_id;
	private String rb_date;
	private int rb_time;
	private int rb_minute;
	private int lm_id;
	private String rb_info;
}