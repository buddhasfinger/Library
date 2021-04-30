<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
Calendar c = Calendar.getInstance(); 
int hour = c.get(Calendar.HOUR_OF_DAY);
int minute = c.get(Calendar.MINUTE);
int second = c.get(Calendar.SECOND);
%>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/notice_list.css">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  
  	<style type="text/css">
		yes {}
		no { font-size:medium; font-weight:bold; color: red; }
		input {cursor:pointer; cursor:pointer;}
 		#sideM {font-size: 10px;}
 		section {position: absolute; left: 200px; top: 200px; z-index : 8; width: 80%; float:left;}
 		#mause{cursor: pointer; color: black;}
 		#orange{color: orange; font-weight:2000; letter-spacing: -2px;}
 		#leftmanu{position: absolute; left: 0px; top: 90px; position : relative; float:left; width: 190px; height: 1300px; text-align: left; border-right: solid 4px orange;}
 		table{ width: 990px;}
 		td{line-height: 130%; height:70px;}
 		/* li{height: 5px;} */
 	</style>
 	
  <script type="text/javascript">
  
  function nextroom(Roomnum,nowtime,date){
	  if(confirm("연장 하시겠습니까?")){
		  $.ajax({
				url:"/nextroombooking",
				type:"post",
				traditional:true,
				data:{
					sr_id:Roomnum, 	//방번호
					rb_time:nowtime,	//예약시간
					rb_date:date, 	//오늘 날짜
					lm_id: <%=session.getAttribute("session_id")%> //회원정보
				},
				success : function(data) {
						alert(data.rs);
						location.reload();
				},
				error : function() {
					alert("실패 하였습니다.");
				},
			});
	  }else{
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
  
  
  </script>
</head>
<body>
		<%@ include file="../listhead.jsp" %>
	<nav id="leftmanu">
<ul>
<li></li>
<li></li>
        <li id="orange">ㅡㅡㅡㅡㅡㅡㅡㅡ</li>
        <li id="mause">º스터디룸 보기</li>
        <li id="orange">ㅡㅡㅡㅡㅡㅡㅡㅡ</li>
        <a href="/study/studyRoom"><li id="mause">º스터디룸 예약</li></a>
        <c:choose>
			<c:when test="${session_user eq 'admin'}">
       			 <li id="orange">ㅡㅡㅡㅡㅡㅡㅡㅡ</li>
       			 <a href="/study/allRoomBookig"><li id="mause">* 전체 스터디룸 예약 현황</li></a>
			</c:when>
			<c:otherwise>
		        <li id="orange">ㅡㅡㅡㅡㅡㅡㅡㅡ</li>
		  		<a onclick="myroompage(${session_id})"><li id="mause">º나의 스터디룸 예약 현황</li></a>
			</c:otherwise>	
		</c:choose>	
        
      </ul> 
</nav>
  <section>
  
    <h1> 스터디룸 연장 </h1>
    <table>
			<colgroup>
				<col width="8%">
				<col width="10%">
				<col width="50%">
				<col width="10%">
      </colgroup>
      <tr>
        		<th>예약번호</th>
				<th>스터디룸</th>
				<th>시간</th>
				<th>연장하기</th>
      </tr>
      <h1>현재 시간 ${map.time } 시</h1> 
			<c:forEach var="dto" items="${map.list }">
				<tr>
				<td>예번 ${dto.rb_id }</td>
				<td>방번 ${dto.sr_id }</td>
				<td>${dto.rb_date }＿＿＿＿＿＿＿<br>￣￣￣￣￣￣ 시작시간 ${dto.rb_time } : 00</td>

        <c:choose>
			<c:when test="${dto.rb_time==map.time}">
			<td><input type="button" onclick="nextroom(${dto.sr_id},${dto.rb_time},'${today}')" class="datebutton" value="연장하기"></td>
				<!-- 스터디룸 번호 / 대여시간 +1 / 오늘날짜 / -->
			</c:when>
			<c:otherwise>
			<td><input type="button" onclick="nextroom(${dto.sr_id},${session_id},'${today}')" class="datebutton" value="연장하기" disabled></td>
			</c:otherwise>	
		</c:choose>	
		
			
				</tr>
			</c:forEach>
    </table>
				<h3 style="text-align: right;">연장 버튼은 해당시간 이용중 활성화 됩니다.</h3>
  </section>

	<footer>
		<%@ include file="../listfoot.jsp" %>
	</footer>
</body>
</html>