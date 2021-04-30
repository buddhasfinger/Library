<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 4월 8일 -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>


<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/studyroom_list.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.datebutton {
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

yes {
	
}

no {
	font-size: medium;
	font-weight: bold;
	color: red;
}

table {
	width: 990px;
}

#mause {
	cursor: pointer;
	color: black;
}

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

/* .datebutton {
	width: 89px;
	height: 28px;
	background-image: url("../images/roombutton.png");
} */
.bookingok {
	width: 89px;
	height: 28px;
	background-image: url("../images/bookingok.png");
}

.timebutton {
	width: 89px;
	height: 28px;
	background-image: url("../images/roombooking.png");
}
</style>
<script>
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

/*당일 빈시간 바로예약*/
function todayBooking(date,time,roomNum) {
	
	var sessionUId = "<%=session.getAttribute("session_flag")%>"

	if(sessionUId ==null || sessionUId != "success" ){
		alert('로그인 후 이용 가능합니다. 로그인 해주세요.');
	}else {
		
	
	if(confirm("예약하시겠습니까?")){
		
		$.ajax({
			url:"/study/roomBookingCheck",
			type:"post",
			traditional:true,
			data:{
				"rb_time":time,
				"sr_id":roomNum,
				"rb_date":date,
				"lm_id": <%=session.getAttribute("session_id")%>
			},
			success : function(data) {
					alert(data.rs);
					location.reload();
			},
			error : function() {
				alert("예약이 실패 하였습니다. 다른 스터디룸/예약시간/날짜로 다시 시도해 주세요. 오류가 지속되면 관리자에게 문의 부탁드립니다.");
			},
		});
	  }
	else{
		  return false; 
	  }
	}
}//todayBooking


	/*예약 db에 저장하기*/
function roomBookingCheck(roomNum,date) {
	 if(confirm("예약 하시겠습니까?")){
		$.ajax({
			url:"/study/roomBookingCheck",
			type:"post",
			traditional:true,
			data:{
				"sr_id":roomNum,
				"rb_time":$("#timeChoice").val(),
				"rb_date":date,
				"lm_id": <%=session.getAttribute("session_id")%>
			},
			success : function(data) {
					alert(data.rs);
					location.reload();
			},
			error : function() {
				alert("예약이 실패 하였습니다. 다른 스터디룸/예약시간/날짜로 다시 시도해 주세요. 오류가 지속되면 관리자에게 문의 부탁드립니다.");
			},
		});
	 }else{
		  return false; 
	  }
 }//roomBookingCheck


	/*시간비교 후 비어있는 시간 예약하기*/
function dateCheck(roomNum,date) {
	if (date == null || date ==''){
		alert("날짜를 선택해 주세요.");
		return false;
	}else{
		
	
	
	//alert('룸 번호: '+$("#roomNum").val());
	var sessionUId = "<%=session.getAttribute("session_flag")%>"

	if(sessionUId ==null || sessionUId != "success" ){
		alert('로그인 후 이용 가능합니다. 로그인 해주세요.');
	}else {
	
		$.ajax({
			url:"/study/dateCheck",
			type:"post",
			traditional:true,
			data:{
				//"rb_date":$("#date").val(),"sr_id":roomNum
				"rb_date":date,"sr_id":roomNum
				
			},
			success : function(data) {
				console.log(data.rs[0]);
				
	 				var dis_check="";
					var dis_msg="";
					var innerStr = "";
					innerStr = '<select name="timeChoice" id="timeChoice">';
		  				for(var i= 9;i<= 18;i++){ 
		  					innerStr += '<option value='+i+''; 
		 					for(var j=0;j<data.rs.length;j++){
		 						//alert(data.rs[j]+":::"+i);
		 						 if(i==data.rs[j]){
		  						dis_check =' disabled '; 
		  						dis_msg='  [예약 중] ';
								break;
								 }
		 					} 
		 					innerStr += dis_check; 
		 					innerStr += '> ' + i + '시' + dis_msg + '</option>';
		 					dis_check=""; 
		 					dis_msg="";
						}
	  				innerStr += '</select>';
	  				innerStr += '<a href="#" class="timebutton" ';
	  				innerStr += 'onclick="roomBookingCheck('+roomNum+',\''+date+'\')">';
	  				innerStr += '<br>_________</a>';
	  				
	  				if(roomNum==1){
						$('#timeSelect1').html(innerStr);
	  				}else if(roomNum==2){
						$('#timeSelect2').html(innerStr);
	  				}else if(roomNum==3){
						$('#timeSelect3').html(innerStr);
	  				}else if(roomNum==4){
						$('#timeSelect4').html(innerStr);
	  				}else if(roomNum==5){
						$('#timeSelect5').html(innerStr);
	  				}
			},
			error : function() {
				alert("예약실패");
			},
			async:false
		});
  }//session확인	
 }//날짜입력확인if문
}//dateCheck
</script>

</head>
<body>
	<%@ include file="../listhead.jsp"%>

	<section>
		<h1>스터디룸 예약</h1>

		* 스터디룸 예약은 주 최대 5시간 / 일 최대 2시간(연장포함) 가능하며 당일 예약취소는 불가능합니다.



		<div class="wrapper"></div>

		<form action="./study/studyRoom" method="post">
			<table>
				<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="20px">
				</colgroup>
				<tr>

					<th>위치</th>
					<th>룸 이름</th>
					<th colspan="2">당일 예약 현황</th>
					<th>다른 날 예약하기</th>
				</tr>
				<tr>
					<td><span class="table-notice">2층</span></td>
					<td><img alt="" src="../images/best01.jpg"></td>
					<!-- ------------------------------------------------------------------------------------- -->
					<c:choose>
						<c:when test="${map.dt1.sr_situation eq '0'}">
							<td><c:forEach var="i" begin="9" end="13">
									<ul>
										<li>${i}:00-${i+1}:00 <c:forEach var="dto"
												items="${map.trs1}" varStatus="status">
												<c:if test="${i eq dto.rb_time}">
													<c:set var="ck" value="1" scope="session" />
												</c:if>
											</c:forEach> <c:choose>
												<c:when test="${ck==1}">
													<no>ㅡ 예약 중 ㅡ</no>
												</c:when>
												<c:otherwise>
													<input type="button" class="datebutton"
														onclick="todayBooking('${today}',${i},1)" value="예약가능">
												</c:otherwise>
											</c:choose>
										</li>
									</ul>
									<c:set var="ck" value="0" scope="session" />
								</c:forEach></td>
							<td><c:forEach var="i" begin="14" end="18">
									<ul>
										<li>${i}:00-${i+1}:00 <c:forEach var="dto"
												items="${map.trs1}" varStatus="status">
												<c:if test="${i eq dto.rb_time}">
													<c:set var="ck" value="1" scope="session" />
												</c:if>
											</c:forEach> <c:choose>
												<c:when test="${ck==1}">
													<no>ㅡ 예약 중 ㅡ</no>
												</c:when>
												<c:otherwise>
													<input type="button" class="datebutton"
														onclick="todayBooking('${today}',${i},1)" value="예약가능">
												</c:otherwise>
											</c:choose>
										</li>
									</ul>
									<c:set var="ck" value="0" scope="session" />
								</c:forEach></td>
						</c:when>
						<c:otherwise>
							<td colspan="2">
								<h1 style="color: red;">예약불가</h1>
							</td>
						</c:otherwise>
					</c:choose>
					<td>
					
					<c:choose>
						<c:when test="${map.dt1.sr_situation eq '0'}">
						
			
							
							
								<input type="date" id="date1" name="date"><br>
								<input type="hidden" id="roomNum">
								<input type="button" onclick="dateCheck(1,date1.value)" class="datebutton" value="날짜 선택">
								<div id="timeSelect1"></div>
								
								

						</c:when>
						<c:otherwise>
						
								<h1 style="color: red;">${map.dt1.sr_info}</h1>
						
						</c:otherwise>
					</c:choose>
					</td>
					<!-- ------------------------------------------------------------------------------------- -->
				</tr>
				<tr height="30">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><span class="table-notice">2층</span></td>
					<td><img alt="" src="../images/best02.jpg"></td>
					<!-- ------------------------------------------------------------------------------------- -->
					<c:choose>
						<c:when test="${map.dt2.sr_situation eq '0'}">
							<td><c:forEach var="i" begin="9" end="13">
									<ul>
										<li>${i}:00-${i+1}:00 <c:forEach var="dto"
												items="${map.trs2}" varStatus="status">
												<c:if test="${i eq dto.rb_time}">
													<c:set var="ck" value="1" scope="session" />
												</c:if>
											</c:forEach> <c:choose>
												<c:when test="${ck==1}">
													<no>ㅡ 예약 중 ㅡ</no>
												</c:when>
												<c:otherwise>
													<input type="button" class="datebutton"
														onclick="todayBooking('${today}',${i},2)" value="예약가능">
												</c:otherwise>
											</c:choose>
										</li>
									</ul>
									<c:set var="ck" value="0" scope="session" />
								</c:forEach></td>
							<td><c:forEach var="i" begin="14" end="18">
									<ul>
										<li>${i}:00-${i+1}:00 <c:forEach var="dto"
												items="${map.trs2}" varStatus="status">
												<c:if test="${i eq dto.rb_time}">
													<c:set var="ck" value="1" scope="session" />
												</c:if>
											</c:forEach> <c:choose>
												<c:when test="${ck==1}">
													<no>ㅡ 예약 중 ㅡ</no>
												</c:when>
												<c:otherwise>
													<input type="button" class="datebutton"
														onclick="todayBooking('${today}',${i},2)" value="예약가능">
												</c:otherwise>
											</c:choose>
										</li>
									</ul>
									<c:set var="ck" value="0" scope="session" />
								</c:forEach></td>
						</c:when>
						<c:otherwise>
							<td colspan="2">
								<h1 style="color: red;">예약불가</h1>
							</td>
						</c:otherwise>
					</c:choose>
					<td>
					
					<c:choose>
						<c:when test="${map.dt2.sr_situation eq '0'}">
						
			
							
							
								<input type="date" id="date2" name="date"><br>
								<input type="hidden" id="roomNum">
								<input type="button" onclick="dateCheck(2,date2.value)" class="datebutton" value="날짜 선택">
								<div id="timeSelect2"></div>
								
								

						</c:when>
						<c:otherwise>
						
								<h1 style="color: red;">${map.dt2.sr_info}</h1>
						
						</c:otherwise>
					</c:choose>
					</td>
						<!-- ------------------------------------------------------------------------------------- -->
				</tr>
				
				<tr height="30">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><span class="table-notice">2층</span></td>
					<td><img alt="" src="../images/best03.jpg"></td>
					<!-- 3------------------------------------------------------------------------------------- -->
					<c:choose>
						<c:when test="${map.dt3.sr_situation eq '0'}">
							<td><c:forEach var="i" begin="9" end="13">
									<ul>
										<li>${i}:00-${i+1}:00 <c:forEach var="dto"
												items="${map.trs3}" varStatus="status">
												<c:if test="${i eq dto.rb_time}">
													<c:set var="ck" value="1" scope="session" />
												</c:if>
											</c:forEach> <c:choose>
												<c:when test="${ck==1}">
													<no>ㅡ 예약 중 ㅡ</no>
												</c:when>
												<c:otherwise>
													<input type="button" class="datebutton"
														onclick="todayBooking('${today}',${i},3)" value="예약가능">
												</c:otherwise>
											</c:choose>
										</li>
									</ul>
									<c:set var="ck" value="0" scope="session" />
								</c:forEach></td>
							<td><c:forEach var="i" begin="14" end="18">
									<ul>
										<li>${i}:00-${i+1}:00 <c:forEach var="dto"
												items="${map.trs3}" varStatus="status">
												<c:if test="${i eq dto.rb_time}">
													<c:set var="ck" value="1" scope="session" />
												</c:if>
											</c:forEach> <c:choose>
												<c:when test="${ck==1}">
													<no>ㅡ 예약 중 ㅡ</no>
												</c:when>
												<c:otherwise>
													<input type="button" class="datebutton"
														onclick="todayBooking('${today}',${i},3)" value="예약가능">
												</c:otherwise>
											</c:choose>
										</li>
									</ul>
									<c:set var="ck" value="0" scope="session" />
								</c:forEach></td>
						</c:when>
						<c:otherwise>
							<td colspan="2">
								<h1 style="color: red;">예약불가</h1>
							</td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${map.dt3.sr_situation eq '0'}">
							<td><input type="date" id="date3" name="date"><br>
								<input type="hidden" id="roomNum"> <input type="button"
								onclick="dateCheck(3,date3.value)" class="datebutton"
								value="날짜 선택">
								<div id="timeSelect3"></div></td>

						</c:when>
						<c:otherwise>
							<td colspan="2">
								<h1 style="color: red;">${map.dt3.sr_info}</h1>
							</td>
						</c:otherwise>
					</c:choose>
						<!-- 3------------------------------------------------------------------------------------- -->
				</tr>
				<tr height="30">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><span class="table-notice">3층</span></td>
					<td><img alt="" src="../images/best04.jpg"></td>
					<!-- 4------------------------------------------------------------------------------------- -->
					<c:choose>
						<c:when test="${map.dt4.sr_situation eq '0'}">
							<td><c:forEach var="i" begin="9" end="13">
									<ul>
										<li>${i}:00-${i+1}:00 <c:forEach var="dto"
												items="${map.trs1}" varStatus="status">
												<c:if test="${i eq dto.rb_time}">
													<c:set var="ck" value="1" scope="session" />
												</c:if>
											</c:forEach> <c:choose>
												<c:when test="${ck==1}">
													<no>ㅡ 예약 중 ㅡ</no>
												</c:when>
												<c:otherwise>
													<input type="button" class="datebutton"
														onclick="todayBooking('${today}',${i},1)" value="예약가능">
												</c:otherwise>
											</c:choose>
										</li>
									</ul>
									<c:set var="ck" value="0" scope="session" />
								</c:forEach></td>
							<td><c:forEach var="i" begin="14" end="18">
									<ul>
										<li>${i}:00-${i+1}:00 <c:forEach var="dto"
												items="${map.trs1}" varStatus="status">
												<c:if test="${i eq dto.rb_time}">
													<c:set var="ck" value="1" scope="session" />
												</c:if>
											</c:forEach> <c:choose>
												<c:when test="${ck==1}">
													<no>ㅡ 예약 중 ㅡ</no>
												</c:when>
												<c:otherwise>
													<input type="button" class="datebutton"
														onclick="todayBooking('${today}',${i},1)" value="예약가능">
												</c:otherwise>
											</c:choose>
										</li>
									</ul>
									<c:set var="ck" value="0" scope="session" />
								</c:forEach></td>
						</c:when>
						<c:otherwise>
							<td colspan="2">
								<h1 style="color: red;">예약불가</h1>
							</td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${map.dt4.sr_situation eq '0'}">
							<td><input type="date" id="date4" name="date"><br>
								<input type="hidden" id="roomNum"> <input type="button"
								onclick="dateCheck(4,date4.value)" class="datebutton"
								value="날짜 선택">
								<div id="timeSelect4"></div></td>

						</c:when>
						<c:otherwise>
							<td colspan="2">
								<h1 style="color: red;">${map.dt4.sr_info}</h1>
							</td>
						</c:otherwise>
					</c:choose>
						<!-- 4------------------------------------------------------------------------------------- -->
				</tr>
				<tr height="30">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><span class="table-notice">3층</span></td>
					<td><img alt="" src="../images/best05.jpg"></td>
					<!-- 5------------------------------------------------------------------------------------- -->
					<c:choose>
						<c:when test="${map.dt5.sr_situation eq '0'}">
							<td><c:forEach var="i" begin="9" end="13">
									<ul>
										<li>${i}:00-${i+1}:00 <c:forEach var="dto"
												items="${map.trs5}" varStatus="status">
												<c:if test="${i eq dto.rb_time}">
													<c:set var="ck" value="1" scope="session" />
												</c:if>
											</c:forEach> <c:choose>
												<c:when test="${ck==1}">
													<no>ㅡ 예약 중 ㅡ</no>
												</c:when>
												<c:otherwise>
													<input type="button" class="datebutton"
														onclick="todayBooking('${today}',${i},5)" value="예약가능">
												</c:otherwise>
											</c:choose>
										</li>
									</ul>
									<c:set var="ck" value="0" scope="session" />
								</c:forEach></td>
							<td><c:forEach var="i" begin="14" end="18">
									<ul>
										<li>${i}:00-${i+1}:00 <c:forEach var="dto"
												items="${map.trs1}" varStatus="status">
												<c:if test="${i eq dto.rb_time}">
													<c:set var="ck" value="1" scope="session" />
												</c:if>
											</c:forEach> <c:choose>
												<c:when test="${ck==1}">
													<no>ㅡ 예약 중 ㅡ</no>
												</c:when>
												<c:otherwise>
													<input type="button" class="datebutton"
														onclick="todayBooking('${today}',${i},5)" value="예약가능">
												</c:otherwise>
											</c:choose>
										</li>
									</ul>
									<c:set var="ck" value="0" scope="session" />
								</c:forEach></td>
						</c:when>
						<c:otherwise>
							<td colspan="2">
								<h1 style="color: red;">예약불가</h1>
							</td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${map.dt5.sr_situation eq '0'}">
							<td><input type="date" id="date5" name="date"><br>
								<input type="hidden" id="roomNum"> <input type="button"
								onclick="dateCheck(5,date5.value)" class="datebutton"
								value="날짜 선택">
								<div id="timeSelect5"></div></td>

						</c:when>
						<c:otherwise>
							<td colspan="2">
								<h1 style="color: red;">${map.dt5.sr_info}</h1>
							</td>
						</c:otherwise>
					</c:choose>
						<!-- 5------------------------------------------------------------------------------------- -->
				</tr>
			</table>
			<footer>
	<%@ include file="../listfoot.jsp" %>
			</footer>
</body>
</html>