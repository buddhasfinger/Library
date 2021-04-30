<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html><html lang="ko">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 내용</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean"rel="stylesheet">
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/read.css">

  <script type="text/javascript">
      function delete_check(){
    	  if(confirm("삭제하시겠습니까?")){
    		  location.href="./delete?page=${map.page}&nt_num=${map.noticeDto.nt_num}&category=${map.category}&search=${map.search}";
    	  }else{
    		  return false; 
    	  }
      }
  </script>
</head>

<body>
		<%@ include file="../listhead.jsp"%>

	<section>
		<h1>공지사항!</h1><h5>${map.noticeDto.nt_date }/조회수${map.noticeDto.nt_hit }</h5>
		

		<table>
			<tr>
				<th><strong>${map.noticeDto.nt_num }번 공지사항<br>${map.noticeDto.nt_title }</strong></th>
			</tr>
			<tr>
				<td>공지내용 : ${map.noticeDto.nt_content }</td>
			</tr>
			<tr>
				<td class="article"></td>
			</tr>
			<!-- <tr>
				<td><strong>다음글</strong> <span class="separator">|</span> [키즈잼]
					2월 프로그램 안내</td>
			</tr>
			<tr>
				<td><strong>이전글</strong> <span class="separator">|</span> [키즈잼]
					2020년 1분기 정기 휴관일 안내</td>
			</tr> -->
		</table>
		
		<c:choose>
	    <c:when test="${session_flag==null || session_flag=='fail' }">
		<a href="/notice/notice_list"><div class="list">목록</div></a>
		</c:when>
	    <c:otherwise>
	    <a href="/notice/notice_list"><div class="list">목록</div></a>
		<div class="list mouseCursor"  onclick="delete_check()">삭제</div>
		<a href="notice_modify?category=${map.category }&search=${map.search }&nt_num=${map.noticeDto.nt_num}&page=${map.page}"><div class="master"><div class="list">수정</div></a>
	    </c:otherwise>
		</c:choose>


		</section>
		
<!-- -------------------------------------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------------------------------------- -->
<!-- 하단부 -->
<!-- -------------------------------------------------------------------------------------------------------------- -->
<!-- -------------------------------------------------------------------------------------------------------------- -->
		

	<footer>
	<%@ include file="../listfoot.jsp" %>
	</footer>
</body>
</html>