package com.library.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HrwriteDto {
	
	private int hrw_Seq,hrw_Group;
	private String hrw_User,hrw_Content,hrw_Date;
			
}
