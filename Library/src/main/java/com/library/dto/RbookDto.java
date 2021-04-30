package com.library.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RbookDto {

	private int br_id;
	private int bk_id;
	private int lm_id;
	private String bk_filename;
	private String bk_bookname;
	private String bk_writer;
	private String lm_name;
	private String br_sdate;
	private String br_edate;
	private String lm_email1;
	private String lm_email2;
	private String temail;
	private int bk_amount;
	
}
