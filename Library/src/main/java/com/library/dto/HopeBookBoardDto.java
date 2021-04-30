package com.library.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HopeBookBoardDto {

	private int hb_seq,hb_hit;
	private String hb_user,hb_title,hb_content,hb_date;
	
}
