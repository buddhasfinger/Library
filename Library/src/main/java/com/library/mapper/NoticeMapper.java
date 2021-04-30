package com.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.library.dto.NoticeDto;

@Mapper
public interface NoticeMapper {
	
// 공지사항 목록
	List<NoticeDto> selectnoticeListAll(int startrow, int endrow);
	List<NoticeDto> selectnoticeListTitle(int startrow, int endrow, String search);
	List<NoticeDto> selectnoticeListContent(int startrow, int endrow, String search);
	List<NoticeDto> selectnoticeListSearchAll(int startrow, int endrow, String search);
	
//공지사항 게시글
	NoticeDto selectNotice_read(String nt_num);
	NoticeDto selectNotice_pre(String nt_num);
	NoticeDto selectNotice_next(String nt_num);
	NoticeDto selectNotice_preTitle(String nt_num, String search);
	NoticeDto selectNotice_preContent(String nt_num, String search);
	NoticeDto selectNotice_nextContent(String nt_num, String search);
	NoticeDto selectNotice_preAll(String nt_num, String search);
	NoticeDto selectNotice_nextAll(String nt_num, String search);
	NoticeDto selectNotice_nextTitle(String nt_num, String search);
	
//공지사항 작성
	void insertnoticeWrite(NoticeDto noticeDto);
	
//공지사항 수정
	void updateNoticeModify(NoticeDto noticeDto);
	
//공지사항 삭제
	void deleteNoticeDelete(String nt_num);
	
//조회수
	void selectUpHit(String nt_hit);
	
//페이지 넘버링 검색
	int listCount();
	int listCountTitle(String search);
	int listCountContent(String search);
	int listCountSearchAll(String search);
}
