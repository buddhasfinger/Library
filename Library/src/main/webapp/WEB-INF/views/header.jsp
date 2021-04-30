<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤드</title>
</head>
<body>
	<div id="nav_up">
		<c:choose>
			<c:when test="${session_flag == null || session_flag == 'fail'}">
				<ul>
					<li><a href="member/join" class="login">회원가입</a></li>
					<li><a href="member/login" class="login">로그인</a></li>
					<li onclick="style:alert('로그인후 이용해주세요.')" style="cursor:pointer;">나의도서대여</li>
					<li onclick="style:alert('로그인후 이용해주세요.')" style="cursor:pointer;">나의스터디룸</li>
					<li><a href="notice/notice_list" class="login">공지사항</a></li>
				</ul>
			</c:when>
			<c:when test="${session_flag =='success' && session_user != 'admin'}">
				<ul>
					<li><a href="member/member_mypageView?lm_id=${session_id}" class="login">나의회원정보</a></li>
					<li><a href="member/logout" class="login">로그아웃</a></li>
					<li><a href="mypage/my_reservation?lm_id=${session_id}" class="login">나의도서대여</a></li>
					<li><a href="study/myRoomBookig?page=1&lm_id=${session_id}&category=User&search=" class="login">나의스터디룸</a></li>
					<li><a href="notice/notice_list" class="login">공지사항</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<c:if test="${session_flag =='success' && session_user == 'admin'}">
					<ul>
						<li><a href="member/member_list" class="login">전체회원정보</a></li>
						<li><a href="member/logout" class="login">로그아웃</a></li>
<%-- 						<li><a href="mypage/my_reservation?lm_id=${session_id}" class="login">전체도서대여</a></li> --%>
						<li><a href="admin/admin_reservationlist?subcate=allre" class="login">전체도서대여</a></li>
						<li><a href="study/allRoomBookig" class="login">스터디룸예약현황</a></li>
						<li><a href="notice/notice_list" class="login">공지사항</a></li>
					</ul>
				</c:if>
			</c:otherwise>
		</c:choose>
	</div>
	<nav>
	<c:choose>
			<c:when test="${session_flag == null || session_flag == 'fail'}">
			<h1></h1>
				<ul class="main1">
			        <li><a href="book/book_list">전체도서</a>
			            <ul class="main2">
			                <li><a href="book/book_kolist">국내도서</a>
			                    <ul class="main3">
			                        <li><a href="book/book_kolist?bk_subcate=경제">경제</a></li>
			                        <li><a href="book/book_kolist?bk_subcate=소설">소설</a></li>
			                        <li><a href="book/book_kolist?bk_subcate=IT/과학">IT/과학</a></li>
			                        <li><a href="book/book_kolist?bk_subcate=여행">여행</a></li>
			                        <li><a href="book/book_kolist?bk_subcate=종교">종교</a></li>
			                        <li><a href="book/book_kolist?bk_subcate=잡지">잡지</a></li>
			                    </ul>
			                </li>
			                <li><a href="book/book_englist">해외도서</a>
			                    <ul class="main3">
			                        <li><a href="book/book_englist?bk_subcate=경제">경제</a></li>
			                        <li><a href="book/book_englist?bk_subcate=소설">소설</a></li>
			                        <li><a href="book/book_englist?bk_subcate=IT/과학">IT/과학</a></li>
			                        <li><a href="book/book_englist?bk_subcate=여행">여행</a></li>
			                        <li><a href="book/book_englist?bk_subcate=종교">종교</a></li>
			                        <li><a href="book/book_englist?bk_subcate=잡지">잡지</a></li>
			                    </ul>
			                </li>
			            </ul>
			        </li>
			        <li><a href="study/studyRoom">스터디룸</a>
			            <ul class="main2">
			                <li><a href="#" onclick="style:alert('로그인후 이용해주세요.')">스터디룸 예약</a></li>
			                <li><a href="#" onclick="style:alert('로그인후 이용해주세요.')">MY 스터디룸</a></li>
			            </ul>
			        </li>
			        <li><a href="notice/notice_list">공지사항</a></li>
			        <li><a href="freeboard/freeboard_list">자유게시판</a></li>
			        <li><a href="event/event">행사안내</a></li>
			        <li><a href="hopebookboard/hopeboard_list">희망도서신청</a></li>
				</ul>
				<ul>
					<li><a href="main"><span onclick="style:alert('로그인후 이용해주세요.')">MY대여목록</span></a></li>
					<li><a href="#"><span onclick="style:alert('로그인후 이용해주세요.')">MY스터디룸</span></a></li>
				</ul>
			</c:when>
			<c:when test="${session_flag =='success' && session_user != 'admin'}">
			<h1></h1>
				<ul class="main1">
				        <li><a href="book/book_list">전체도서</a>
				            <ul class="main2">
				                <li><a href="book/book_kolist">국내도서</a>
				                    <ul class="main3">
				                        <li><a href="book/book_kolist?bk_subcate=경제">경제</a></li>
				                        <li><a href="book/book_kolist?bk_subcate=소설">소설</a></li>
				                        <li><a href="book/book_kolist?bk_subcate=IT/과학">IT/과학</a></li>
				                        <li><a href="book/book_kolist?bk_subcate=여행">여행</a></li>
				                        <li><a href="book/book_kolist?bk_subcate=종교">종교</a></li>
				                        <li><a href="/book/book_kolist?bk_subcate=잡지">잡지</a></li>
				                    </ul>
				                </li>
				                <li><a href="book/book_englist">해외도서</a>
				                    <ul class="main3">
				                        <li><a href="book/book_englist?bk_subcate=경제">경제</a></li>
				                        <li><a href="book/book_englist?bk_subcate=소설">소설</a></li>
				                        <li><a href="book/book_englist?bk_subcate=IT/과학">IT/과학</a></li>
				                        <li><a href="book/book_englist?bk_subcate=여행">여행</a></li>
				                        <li><a href="book/book_englist?bk_subcate=종교">종교</a></li>
				                        <li><a href="book/book_englist?bk_subcate=잡지">잡지</a></li>
				                    </ul>
				                </li>
				            </ul>
				        </li>
				        <li><a href="study/studyRoom">스터디룸</a>
				            <ul class="main2">
				                <li><a href="study/studyRoom">스터디룸 예약</a></li>
				                <li><a href="../study/myRoomBookig?page=1&lm_id=${session_id}&category=User&search=">MY 스터디룸</a></li>
				            </ul>
				        </li>
				        <li><a href="notice/notice_list">공지사항</a></li>
				        <li><a href="freeboard/freeboard_list">자유게시판</a></li>
				        <li><a href="event/event">행사안내</a></li>
				        <li><a href="hopebookboard/hopeboard_list">희망도서신청</a></li>
					</ul>
					<ul>
					<li><a href="mypage/my_reservation?lm_id=${session_id}"><span>MY대여목록</span></a></li>
					<li><a href="../study/myRoomBookig?page=1&lm_id=${session_id}&category=User&search="><span>MY스터디룸</span></a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<c:if test="${session_flag =='success' && session_user == 'admin'}">
					<h1></h1>
					<ul class="main1">
				        <li><a href="book/book_list">전체도서</a>
				            <ul class="main2">
				                <li><a href="book/book_kolist">국내도서</a>
				                    <ul class="main3">
				                        <li><a href="book/book_kolist?bk_subcate=경제">경제</a></li>
				                        <li><a href="book/book_kolist?bk_subcate=소설">소설</a></li>
				                        <li><a href="book/book_kolist?bk_subcate=IT/과학">IT/과학</a></li>
				                        <li><a href="book/book_kolist?bk_subcate=여행">여행</a></li>
				                        <li><a href="book/book_kolist?bk_subcate=종교">종교</a></li>
				                        <li><a href="book/book_kolist?bk_subcate=잡지">잡지</a></li>
				                    </ul>
				                </li>
				                <li><a href="book/book_englist">해외도서</a>
				                    <ul class="main3">
				                        <li><a href="book/book_englist?bk_subcate=경제">경제</a></li>
				                        <li><a href="book/book_englist?bk_subcate=소설">소설</a></li>
				                        <li><a href="book/book_englist?bk_subcate=IT/과학">IT/과학</a></li>
				                        <li><a href="book/book_englist?bk_subcate=여행">여행</a></li>
				                        <li><a href="book/book_englist?bk_subcate=종교">종교</a></li>
				                        <li><a href="book/book_englist?bk_subcate=잡지">잡지</a></li>
				                    </ul>
				                </li>
				            </ul>
				        </li>
				        <li><a href="admin/admin_reservationlist?subcate=allre">대여도서</a>
				        	<ul class="main2">
				                <li><a href="admin/admin_reservationlist?subcate=allre">전체대여도서</a></li>
				                <li><a href="admin/admin_Unpaidreservationlist">미납도서</a></li>
				                <li><a href="admin/admin_Imminentreservationlist">반납임박도서</a></li>
				            </ul>
				        </li>
				        <li><a href="study/studyRoom">스터디룸</a>
				            <ul class="main2">
				                <li><a href="study/studyRoom">스터디룸 예약</a></li>
				                <li><a href="study/allRoomBookig">예약현황 보기</a></li>
				            </ul>
				        </li>
				        <li><a href="notice/notice_list">공지사항</a></li>
				        <li><a href="freeboard/freeboard_list">자유게시판</a></li>
				        <li><a href="event/event">행사안내</a></li>
				        <li><a href="hopebookboard/hopeboard_list">희망도서신청</a></li>
					</ul>
				<ul>
					<li><a href="mypage/my_reservation?lm_id=${session_id}"><span>MY대여목록</span></a></li>
					<li><a href="../study/myRoomBookig?page=1&lm_id=${session_id}&category=User&search="><span>MY스터디룸</span></a></li>
				</ul>
				</c:if>
			</c:otherwise>
		</c:choose>
	</nav>

</body>
</html>