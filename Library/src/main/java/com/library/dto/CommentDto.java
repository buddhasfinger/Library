package com.library.dto;


import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentDto {
	
	private int commentNo;
	private int bid;//BoardDto
	private String commentName; //MemberDto
	private String commentContent;
	private Timestamp commentDate;
	
	
}
