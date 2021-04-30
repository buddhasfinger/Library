<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/notice_list.css">
  
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  
  	<style type="text/css">
  	
.datebutton {
cursor: pointer;
    color: white;
	width: 90px;
	height : 30px;
	border-radius: 5px;
	font-weight:normal;
  border: solid 1px #0066cc;
  background: #0080ff;
  background: -webkit-gradient(linear, left top, left bottom, from(#287CC2), to(#000026));
  background: -moz-linear-gradient(top,  #287CC2,  #000026);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#287CC2', endColorstr='#000026');
}
.datebutton:hover {
	width: 90px;
	height : 30px;
border-radius: 5px;
  background: #f47c20;
  background: -webkit-gradient(linear, left top, left bottom, from(#007BFF), to(#284054));
  background: -moz-linear-gradient(top,  #007BFF,  #284054);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#007BFF', endColorstr='#284054');
}
.datebutton:active {
	width: 90px;
	height : 30px;
border-radius: 5px;
  color: #fcd3a5;
  background: -webkit-gradient(linear, left top, left bottom, from(#f47a20), to(#faa51a));
  background: -moz-linear-gradient(top,  #f47a20,  #faa51a);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f47a20', endColorstr='#faa51a');
}
		yes {}
		no { font-size:medium; font-weight:bold; color: red; }
		input {cursor:pointer; cursor:pointer;}
 		#sideM {font-size: 10px;}
 		#roomdelete{width: 90px; height: 30px; border: 3px solid red; color: red; font-weight: bolder;}
 		#mause{cursor: pointer; color: black;}
 		#orange{color: orange; font-weight:2000; letter-spacing: -2px;}
 		#leftmanu{position: absolute; left: 0px; top: 130px; position : relative; float:left; width: 190px; height: 1300px; text-align: left; border-right: solid 4px orange;}
 		table{ width: 990px;}
 		td{line-height: 130%; height:70px;}
 	</style>
 	
  <script type="text/javascript">
  function delete_check(rb_id) {
		if(confirm("삭제하시겠습니까")){
			$.ajax({
				url:"/mypage/delete",
				type:"post",
				traditional:true,
				data:{
					"rb_id":rb_id,
					"lm_id": <%=session.getAttribute("session_id")%>
				},
				success : function(data) {
						alert("삭제성공");
						location.reload();
				},
				error : function() {
					alert("삭제에러");
				},
			});
		  }
		else{
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
  </script>
</head>
<body>
		<%@ include file="../listhead.jsp" %>
  <section>
    <h1>나의 스터디룸 예약 현황</h1>
    <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
    <a onclick="todayroombooking(${session_id})"><li id="mause">º연장하기 페이지</li></a>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

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
				<th>예약취소</th>
      </tr>
			<c:forEach var="dto" items="${map.list }">
				<tr>
				<td>${dto.rb_id }</td>
				<td>${dto.sr_id }</td>
				<td>${dto.rb_date }＿＿＿＿＿＿＿<br>￣￣￣￣￣￣ 시작시간 ${dto.rb_time } : 00</td>

				<td><input type="button" onclick="delete_check(${dto.rb_id},${map.page})" class="datebutton" value="예약취소"></td>
			
				</tr>
			</c:forEach>
    </table>


<div>
<!--  페이지 넘버링 -->
<ul class="page-num">
      <a href="./myRoomBookig?category=${map.category }&search=${map.search }&page=1"><li class="first"></li></a>
      <c:choose>
        <c:when test="${map.page <= 1 }">
           <li class="prev"></li>
        </c:when>
        <c:otherwise>
           <a href="./myRoomBookig?category=${map.category }&search=${map.search }&page=${map.page-1}"><li class="prev"></li></a>
        </c:otherwise>
      </c:choose>
      <!-- 번호반복 -->
      <c:forEach var="nowpage" begin="${map.startpage }" end="${map.endpage }">
        <c:choose>
          <c:when test="${map.page==nowpage}">
             <li class="num">${nowpage}</li>
          </c:when>
          <c:otherwise>
             <a href="./myRoomBookig?category=${map.category }&search=${map.search }&page=${nowpage}"><li class="num">${nowpage}</li></a>
          </c:otherwise>
        </c:choose>
      </c:forEach>
      <c:choose>
        <c:when test="${map.page >= map.maxpage }">
           <li class="next"></li>
        </c:when>
        <c:otherwise>
           <a href="./myRoomBookig?category=${map.category }&search=${map.search }&page=${map.page+1}"><li class="next"></li></a>
        </c:otherwise>
      </c:choose>
      <a href="./myRoomBookig?category=${map.category }&search=${map.search }&page=${map.maxpage }"><li class="last"></li></a>
    </ul>
</div>
  </section>

	<footer>
		<%@ include file="../listfoot.jsp" %>
	</footer>
</body>
</html>