package com.library.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto {
	
	private int lm_id;
	private String lm_user;
	private String lm_pw1;
	private String lm_pw2;
	private String lm_name;
	private String lm_email1;
	private String lm_email2;
	private String lm_tel1;
	private String lm_tel2;
	private String lm_tel3;
	private String lm_address1;
	private String lm_address2;
	private String lm_birth_year;
	private String lm_birth_month;
	private String lm_birth_day;
	private String lm_gender;
	private String lm_job;
	private String lm_date;
	private String lm_favor;

}
