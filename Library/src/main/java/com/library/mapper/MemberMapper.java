package com.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.dto.MemberDto;

@Mapper
public interface MemberMapper {

	MemberDto selectLoginCheck(String lm_user, String lm_pw1);

	int insertJoinCheck(MemberDto memberDto);

	int selectUserCheck(String lm_user);

	List<MemberDto> selectBoardListAll(int startrow, int endrow);

	List<MemberDto> selectBoardListTitle(int startrow, int endrow, String search);

	int listCount();

	int listCountTitle(String search);

	int updateModifyCheck(MemberDto memberDto);

	MemberDto selectMypage_view(String lm_id);
}
