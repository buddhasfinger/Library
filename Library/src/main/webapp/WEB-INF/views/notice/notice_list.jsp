<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 게시판</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/notice_list.css">
</head>
<body>
	<%@ include file="../listhead.jsp" %>

	<section>
		<h1>공지사항</h1>
		<table>
			<colgroup>
				<col width="18%">
				<col width="60%">
				<col width="18%">
			</colgroup>
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>


<!-- 게시판 목록 출력 ---------------------------------------------------------------------------------->
			<c:forEach var="dto" items="${map.list }">
				<tr>
					<td><span class="table-notice">${dto.nt_num }</span></td>
					<td class="table-title"><a
						href="./notice_read?category=${map.category }&search=${map.search }&page=${map.page}&nt_num=${dto.nt_num }">${dto.nt_title }</a>
					</td>
					<td>${dto.nt_date }</td>
				</tr>
			</c:forEach>
		</table>
<!-- ----------------------------------------------------------------------------------------------->




    <ul class="page-num">
      <a href="./notice_list?category=${map.category }&search=${map.search }&page=1"><li class="first"></li></a>
      <c:choose>
        <c:when test="${map.page <= 1 }">
           <li class="prev"></li>
        </c:when>
        <c:otherwise>
           <a href="./notice_list?category=${map.category }&search=${map.search }&page=${map.page-1}"><li class="prev"></li></a>
        </c:otherwise>
      </c:choose>
      <!-- 번호반복 -->
      <c:forEach var="nowpage" begin="${map.startpage }" end="${map.endpage }">
        <c:choose>
          <c:when test="${map.page==nowpage}">
             <li class="num"><div>${nowpage}</div></li>
          </c:when>
          <c:otherwise>
             <a href="./notice_list?category=${map.category }&search=${map.search }&page=${nowpage}"><li class="num"><div>${nowpage}</div></li></a>
          </c:otherwise>
        </c:choose>
      </c:forEach>
      <c:choose>
        <c:when test="${map.page >= map.maxpage }">
           <li class="next"></li>
        </c:when>
        <c:otherwise>
           <a href="./notice_list?category=${map.category }&search=${map.search }&page=${map.page+1}"><li class="next"></li></a>
        </c:otherwise>
      </c:choose>
      <a href="./notice_list?category=${map.category }&search=${map.search }&page=${map.maxpage }"><li class="last"></li></a>
    </ul>

<c:choose>
	    <c:when test="${session_flag==null || session_flag=='fail' }">

	    </c:when>
	    <c:otherwise>
		<a href="/notice/notice_write"><div class="write">공지사항등록</div></a>

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