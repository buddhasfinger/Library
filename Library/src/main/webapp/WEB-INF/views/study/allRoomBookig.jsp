<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/studyroom_list.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
  
  
  function open1(roomnum){
			if(confirm("열으시겠습니까?")){
			 $.ajax({
				url:"/roomOpen",
				type:"post",
				data:{
					"sr_id":$("#roomnum").val(),
				},
				success : function(data) {
						alert("열림");
						location.reload();
				},
				error : function() {
					alert("오픈 실패");
				},
			});
		 }
		else{
			  return false; 
		  }
  }
  function close1(){
			if(confirm("닫으시겠습니까?")){
			 $.ajax({
				url:"/roomClose",
				type:"post",
				traditional:true,
				data:{
					"sr_id":$("#roomnum").val(),
					"sr_info":$("#roominfo").val(),
				},
				success : function(data) {
						alert("닫쳤습니다.");
						location.reload();
				},
				error : function() {
					alert("닫기 실패");
				},
			});
		 }
		else{
			  return false; 
		  }
  }
  
  
  
  function myroompage(lm_id){
	  if(confirm("나의 예약정보를 불러옵니다.")){
		  location.href="/study/myRoomBookig?page=${map.page}&lm_id="+lm_id+"&category=User&search=${map.search}";
	  }else{
		  return false; 
	  }
  }
  function todayroombooking(lm_id){
	  if(confirm("연장하기 페이지로 이동하시겠습니까? ")){
		  location.href="/study/todayRoombooking?page=${map.page}&lm_id="+lm_id+"&category=today&search=${map.search}";
	  }else{
		  return false; 
	  }
  }
  function delete_check(del,dol,lm_id){
	  if(confirm("삭제하시겠습니까?")){
		  location.href="./delete?page="+dol+"&rb_id="+del+"&category=${map.category}&search=${map.search}";
	  }else{
		  return false; 
	  }
  }
  </script>
<style type="text/css">
.datebutton {
	cursor: pointer;
	color: white;
	width: 90px;
	height: 30px;
	border-radius: 5px;
	font-weight: normal;
	border: solid 1px #0066cc;
	background: #0080ff;
	background: -webkit-gradient(linear, left top, left bottom, from(#287CC2),
		to(#000026));
	background: -moz-linear-gradient(top, #287CC2, #000026);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#287CC2',
		endColorstr='#000026');
}

.datebutton:hover {
	width: 90px;
	height: 30px;
	border-radius: 5px;
	background: #f47c20;
	background: -webkit-gradient(linear, left top, left bottom, from(#007BFF),
		to(#284054));
	background: -moz-linear-gradient(top, #007BFF, #284054);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#007BFF',
		endColorstr='#284054');
}

.datebutton:active {
	width: 90px;
	height: 30px;
	border-radius: 5px;
	color: #fcd3a5;
	background: -webkit-gradient(linear, left top, left bottom, from(#f47a20),
		to(#faa51a));
	background: -moz-linear-gradient(top, #f47a20, #faa51a);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f47a20',
		endColorstr='#faa51a');
}

.dabuton {
	cursor: pointer;
	color: white;
	width: 90px;
	height: 30px;
	border-radius: 5px;
	font-weight: normal;
	border: solid 1px #0066cc;
	background: #0080ff;
	background: -webkit-gradient(linear, left top, left bottom, from(#287CC2),
		to(#000026));
	background: -moz-linear-gradient(top, #287CC2, #000026);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#287CC2',
		endColorstr='#000026');
}

#leftmin {
	margin-right: 10%;
}

.st {
	
}

yes {
	
}

no {
	font-size: large;
	font-weight: bold;
	color: red;
}

input {
	cursor: pointer;
	cursor: pointer;
}

#sideM {
	font-size: 10px;
}


#mause {
	cursor: pointer;
	color: black;
}

#orange {
	color: orange;
	font-weight: 2000;
	letter-spacing: -2px;
}

#leftmanu {
	position: absolute;
	left: 0px;
	top: 90px;
	position: relative;
	float: left;
	width: 190px;
	height: 1300px;
	text-align: left;
	border-right: solid 4px orange;
}

table {
	width: 990px;
}

/* .wrappe {
	position: relative;
	top: 100px;
	width: 500px;
	
} */

.openClose {
	height: 20px;
}
</style>

</head>
<body>
	<%@ include file="../listhead.jsp"%>



	<section>
		<h1>전체 스터디룸 예약 현황</h1>

		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->


		<div class="wrapper" id="leftmin">
			<form action="/study/allRoomBookig" name="search" method="post">
				<input type="hidden" name="category" value="Date"> <input
					type="Date" name="search">
				<button class="dabuton" type="submit">날짜검색</button>
			</form>
			</form>
		</div>
		<div
			style="position: relative; top: -80px; left: 50px; z-index: 1; height: 1px;">
			<table style="width: 350px; height: 30px;">
				<tr>
					<th colspan="3">스터디룸 예약 비활성화</th>
				</tr>
				<tr style="line-height: 23px;">
					<th>방번호/상태</th>
					<th>비활성</th>
					<th>활성</th>
				</tr>
				<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				<tr style="line-height: 35px;">
					<td><select name="roomnum" id="roomnum">
								<option value="">선택</option>
								<option value="1">1번 스터디룸</option>
								<option value="2">2번 스터디룸</option>
								<option value="3">3번 스터디룸</option>
								<option value="4">4번 스터디룸</option>
								<option value="5">5번 스터디룸</option>
							</select>
								<select name="roominfo" id="roominfo">
								<option value="">선택</option>
								<option value="수리중">수리중</option>
								<option value="공사중">공사중</option>
							</select>
							</td>
					<td>
					
					
					
						<form action="/roomClose" method="post" enctype="multipart"
							id="testForm" name="testForm">

							<a href="" onclick="close1()">방 닫음</a>
						</form>

					</td>
					<td><a href="" onclick="open1(1)">열음</a></td>
				</tr>
				<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				
				<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				
				<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

				<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				
				<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->






			</table>
		</div>


		<table align="center" style="line-height: 130%">
			<colgroup>
				<col width="5%">
				<col width="5%">
				<col width="20%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<tr>
				<th>예약번호</th>
				<th>스터디룸</th>
				<th>시간</th>
				<th>예약자정보</th>
				<th>예약취소</th>
			</tr>
			<!-- 게시판 목록 출력 ---------------------------------------------------------------------------------->
			<c:forEach var="dto" items="${map.list }">
				<tr>
					<td><a class="table-notice">${dto.rb_id }</a></td>
					<td>${dto.sr_id }</td>
					<td>${dto.rb_date }＿＿＿＿＿＿＿<br>￣￣￣￣￣￣ 시작시간 ${dto.rb_time }
						: 00
					</td>

					<td><a
						href="./Ro_Bo_User_info?category=${map.category }&search=${map.search }&page=${map.page}&lm_id=${dto.lm_id }">${dto.lm_id }</a>
						</form></td>

					<td><input type="button"
						onclick="delete_check(${dto.rb_id},${map.page})"
						class="datebutton" value="예약취소"></a></td>

				</tr>
			</c:forEach>
			<!-- ----------------------------------------------------------------------------------------------->
		</table>
		<div>


			<br>
			<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			<ul id="test02" class="page-num">
				<a
					href="./allRoomBookig?category=${map.category }&search=${map.search }&page=1"><li
					class="first"></li></a>
				<c:choose>
					<c:when test="${map.page <= 1 }">
						<li class="prev"></li>
					</c:when>
					<c:otherwise>
						<a
							href="./allRoomBookig?category=${map.category }&search=${map.search }&page=${map.page-1}"><li
							class="prev"></li></a>
					</c:otherwise>
				</c:choose>
				<!-- 번호반복 -->
				<c:forEach var="nowpage" begin="${map.startpage }"
					end="${map.endpage }">
					<c:choose>
						<c:when test="${map.page==nowpage}">
							<li class="num">${nowpage}</li>
						</c:when>
						<c:otherwise>
							<a
								href="./allRoomBookig?category=${map.category }&search=${map.search }&page=${nowpage}"><li
								class="num">${nowpage}</li></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${map.page >= map.maxpage }">
						<li class="next"></li>
					</c:when>
					<c:otherwise>
						<a
							href="./allRoomBookig?category=${map.category }&search=${map.search }&page=${map.page+1}"><li
							class="next"></li></a>
					</c:otherwise>
				</c:choose>
				<a
					href="./allRoomBookig?category=${map.category }&search=${map.search }&page=${map.maxpage }"><li
					class="last"></li></a>
			</ul>


		</div>
	</section>

	<footer>
		<%@ include file="../listfoot.jsp"%>
	</footer>
</body>
</html>