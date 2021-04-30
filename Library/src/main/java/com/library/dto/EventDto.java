package com.library.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventDto {

	private int le_id;
	private String le_category;
	private String le_title;
	private String le_content;
	private String le_filename;
	private String le_date;
	private String le_enddate;
}
