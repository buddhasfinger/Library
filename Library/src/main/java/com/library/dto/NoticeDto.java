package com.library.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDto {

	private int nt_num;
	private String nt_title;
	private String nt_content;
	private String nt_date;
	private int nt_hit;
	private String fileName;

}
