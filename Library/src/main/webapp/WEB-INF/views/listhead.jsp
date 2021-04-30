<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <header>
    <c:choose>
			<c:when test="${session_flag == null || session_flag == 'fail'}">
				<ul>
					<li><a href="../member/join" class="topmenu">회원가입</a></li>
					<li><a href="../member/login" class="topmenu">로그인</a></li>
					<li onclick="style:alert('로그인후 이용해주세요.')" style="cursor:pointer;">나의도서대여</li>
					<li>공지사항</li>
				</ul>
			</c:when>
			<c:when test="${session_flag =='success' && session_user != 'admin'}">
				<ul>
					<li><a href="../member/member_mypageView?lm_id=${session_id}" class="topmenu">나의회원정보</a></li>
					<li><a href="../member/logout" class="topmenu">로그아웃</a></li>
					<li><a href="../mypage/my_reservation?lm_id=${session_id}" class="topmenu">나의도서대여</a></li>
					<li><a href="../study/myRoomBookig?page=1&lm_id=${session_id}&category=User&search=" class="topmenu">나의스터디룸</a></li>
					<li>공지사항</li>
				</ul>
			</c:when>
			<c:otherwise>
				<c:if test="${session_flag =='success' && session_user == 'admin'}">
					<ul>
						<li><a href="../member/member_list" class="topmenu">전체회원정보</a></li>
						<li><a href="../member/logout" class="topmenu">로그아웃</a></li>
						<li><a href="../mypage/my_reservation?lm_id=${session_id}" class="topmenu">나의도서대여</a></li>
						<li><a href="../study/allRoomBookig" class="topmenu">스터디룸예약현황</a></li>
						<li>공지사항</li>
					</ul>
				</c:if>
			</c:otherwise>
		</c:choose>
  </header>

  <nav>
  <c:choose>
	<c:when test="${session_flag == null || session_flag == 'fail'}">
		<div class="logo" onclick="location.href='../main?lm_user=${session_user}';" style="cursor:pointer;"></div>
	
	    <div id="search">
	      <div class="search" onclick="style:alert('로그인후 이용해주세요.')" style="cursor:pointer;"></div><br>
	      <span onclick="style:alert('로그인후 이용해주세요.')" style="cursor:pointer;">MY대여목록</span>
	    </div>
	
	    <div id="cart">
	      <div class="cart" onclick="style:alert('로그인후 이용해주세요.')" style="cursor:pointer;"></div><br>
	      <span onclick="style:alert('로그인후 이용해주세요.')" style="cursor:pointer;">MY스터디룸</span>
	    </div>
	
	    <div class="nav-menu">
	      	<ul class="main1">
		        <li><a href="../book/book_list">전체도서</a>
		            <ul class="main2">
		                <li><a href="../book/book_kolist">국내도서</a>
		                    <ul class="main3">
		                        <li><a href="../book/book_kolist?bk_subcate=경제">경제</a></li>
		                        <li><a href="../book/book_kolist?bk_subcate=소설">소설</a></li>
		                        <li><a href="../book/book_kolist?bk_subcate=IT/과학">IT/과학</a></li>
		                        <li><a href="../book/book_kolist?bk_subcate=여행">여행</a></li>
		                        <li><a href="../book/book_kolist?bk_subcate=종교">종교</a></li>
		                        <li><a href="../book/book_kolist?bk_subcate=잡지">잡지</a></li>
		                    </ul>
		                </li>
		                <li><a href="../book/book_englist">해외도서</a>
		                    <ul class="main3">
		                        <li><a href="../book/book_englist?bk_subcate=경제">경제</a></li>
		                        <li><a href="../book/book_englist?bk_subcate=소설">소설</a></li>
		                        <li><a href="../book/book_englist?bk_subcate=IT/과학">IT/과학</a></li>
		                        <li><a href="../book/book_englist?bk_subcate=여행">여행</a></li>
		                        <li><a href="../book/book_englist?bk_subcate=종교">종교</a></li>
		                        <li><a href="../book/book_englist?bk_subcate=잡지">잡지</a></li>
		                    </ul>
		                </li>
		            </ul>
		        </li>
		        <li><a href="../study/studyRoom">스터디룸</a>
		            <ul class="main2">
		                <li><a href="#" onclick="style:alert('로그인후 이용해주세요.')">스터디룸 예약</a></li>
		                <li><a href="#" onclick="style:alert('로그인후 이용해주세요.')">MY 스터디룸</a></li>
		            </ul>
		        </li>
		        <li><a href="../notice/notice_list">공지사항</a></li>
		        <li><a href="../freeboard/freeboard_list">자유게시판</a></li>
		        <li><a href="../event/event">행사안내</a></li>
		        <li><a href="../hopebookboard/hopeboard_list">희망도서신청</a></li>
			</ul> 
	    </div>
	</c:when>
	<c:when test="${session_flag =='success' && session_user != 'admin'}">
		<div class="logo" onclick="location.href='../main?lm_user=${session_user}';" style="cursor:pointer;"></div>
	
	    <div id="search">
	      <div class="search" onclick="location.href='../mypage/my_reservation?lm_id=${session_id}'" style="cursor:pointer;"></div><br>
	      <span><a href="../mypage/my_reservation?lm_id=${session_id}">MY대여목록</a></span>
	    </div>
	
	    <div id="cart" onclick="location.href='../study/myRoomBookig?page=1&lm_id=${session_id}&category=User&search='" style="cursor:pointer;">
	      <div class="cart"></div><br>
	      <span><a href="../study/myRoomBookig?page=1&lm_id=${session_id}&category=User&search=">MY스터디룸</a></span>
	    </div>
	
	    <div class="nav-menu">
	      	<ul class="main1">
		        <li><a href="../book/book_list">전체도서</a>
		            <ul class="main2">
		                <li><a href="../book/book_kolist">국내도서</a>
		                    <ul class="main3">
		                        <li><a href="../book/book_kolist?bk_subcate=경제">경제</a></li>
		                        <li><a href="../book/book_kolist?bk_subcate=소설">소설</a></li>
		                        <li><a href="../book/book_kolist?bk_subcate=IT/과학">IT/과학</a></li>
		                        <li><a href="../book/book_kolist?bk_subcate=여행">여행</a></li>
		                        <li><a href="../book/book_kolist?bk_subcate=종교">종교</a></li>
		                        <li><a href="../book/book_kolist?bk_subcate=잡지">잡지</a></li>
		                    </ul>
		                </li>
		                <li><a href="../book/book_englist">해외도서</a>
		                    <ul class="main3">
		                        <li><a href="../book/book_englist?bk_subcate=경제">경제</a></li>
		                        <li><a href="../book/book_englist?bk_subcate=소설">소설</a></li>
		                        <li><a href="../book/book_englist?bk_subcate=IT/과학">IT/과학</a></li>
		                        <li><a href="../book/book_englist?bk_subcate=여행">여행</a></li>
		                        <li><a href="../book/book_englist?bk_subcate=종교">종교</a></li>
		                        <li><a href="../book/book_englist?bk_subcate=잡지">잡지</a></li>
		                    </ul>
		                </li>
		            </ul>
		        </li>
		        <li><a href="../study/studyRoom">스터디룸</a>
		            <ul class="main2">
		                <li><a href="../study/studyRoom">스터디룸 예약</a></li>
		                <li><a href="../study/myRoomBookig?page=1&lm_id=${session_id}&category=User&search=">MY 스터디룸</a></li>
		            </ul>
		        </li>
		        <li><a href="../notice/notice_list">공지사항</a></li>
		        <li><a href="../freeboard/freeboard_list">자유게시판</a></li>
		        <li><a href="../event/event">행사안내</a></li>
		        <li><a href="../hopebookboard/hopeboard_list">희망도서신청</a></li>
			</ul> 
	    </div>
	</c:when>
	<c:otherwise>
		<c:if test="${session_flag =='success' && session_user == 'admin'}">
		<div class="logo" onclick="location.href='../main?lm_user=${session_user}';" style="cursor:pointer;"></div>
	
	    <div id="search">
	      <div class="search" onclick="location.href='../mypage/my_reservation?lm_id=${session_id}'" style="cursor:pointer;"></div><br>
	      <span><a href="../mypage/my_reservation?lm_id=${session_id}">MY대여목록</a></span>
	    </div>
	
	    <div id="cart" onclick="location.href='../study/myRoomBookig?lm_id=${session_id}'" style="cursor:pointer;">
	      <div class="cart"></div><br>
	      <span><a href="../study/myRoomBookig?page=1&lm_id=${session_id}&category=User&search=">MY스터디룸</a></span>
	    </div>
	
	    <div class="nav-menu">
	      <ul class="main1">
		        <li><a href="../book/book_list">전체도서</a>
		            <ul class="main2">
		                <li><a href="../book/book_kolist">국내도서</a>
		                    <ul class="main3">
		                        <li><a href="../book/book_kolist?bk_subcate=경제">경제</a></li>
		                        <li><a href="../book/book_kolist?bk_subcate=소설">소설</a></li>
		                        <li><a href="../book/book_kolist?bk_subcate=IT/과학">IT/과학</a></li>
		                        <li><a href="../book/book_kolist?bk_subcate=여행">여행</a></li>
		                        <li><a href="../book/book_kolist?bk_subcate=종교">종교</a></li>
		                        <li><a href="../book/book_kolist?bk_subcate=잡지">잡지</a></li>
		                    </ul>
		                </li>
		                <li><a href="../book/book_englist">해외도서</a>
		                    <ul class="main3">
		                        <li><a href="../book/book_englist?bk_subcate=경제">경제</a></li>
		                        <li><a href="../book/book_englist?bk_subcate=소설">소설</a></li>
		                        <li><a href="../book/book_englist?bk_subcate=IT/과학">IT/과학</a></li>
		                        <li><a href="../book/book_englist?bk_subcate=여행">여행</a></li>
		                        <li><a href="../book/book_englist?bk_subcate=종교">종교</a></li>
		                        <li><a href="../book/book_englist?bk_subcate=잡지">잡지</a></li>
		                    </ul>
		                </li>
		            </ul>
		        </li>
		        <li><a href="../admin/admin_reservationlist?subcate=allre">대여도서</a>
		        	<ul class="main2">
		                <li><a href="../admin/admin_reservationlist?subcate=allre">전체대여도서</a></li>
		                <li><a href="../admin/admin_Unpaidreservationlist">미납도서</a></li>
		                <li><a href="../admin/admin_Imminentreservationlist">반납임박도서</a></li>
		            </ul>
		        </li>
		        <li><a href="../study/studyRoom">스터디룸</a>
		            <ul class="main2">
		                <li><a href="../study/studyRoom">스터디룸 예약</a></li>
		                <li><a href="../study/allRoomBookig">전체 예약현황</a></li>
		            </ul>
		        </li>
		        <li><a href="../notice/notice_list">공지사항</a></li>
		        <li><a href="../freeboard/freeboard_list">자유게시판</a></li>
		        <li><a href="../event/event">행사안내</a></li>
		        <li><a href="../hopebookboard/hopeboard_list">희망도서신청</a></li>
			</ul> 
	    </div>
		</c:if>
	</c:otherwise>
  </c:choose>
  
    
  </nav>

</body>
</html>