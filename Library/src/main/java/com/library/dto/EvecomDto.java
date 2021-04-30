package com.library.dto;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EvecomDto {
	
	private int evcom_no;
	private int le_id;
	private String lm_user;
	private String evcom_pw;
	private String evcom_content;
	private String evcom_date;

}
