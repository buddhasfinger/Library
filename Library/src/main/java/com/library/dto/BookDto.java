package com.library.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookDto {

	private int bk_id;
	private String bk_bookname;
	private String bk_writer;
	private String bk_pub;
	private String bk_isbn;
	private String bk_nara;
	private String bk_star;
	private int bk_amount;
	private String bk_content;
	private String bk_hit;
	private String bk_filename;
	private String bk_subcate;
}
