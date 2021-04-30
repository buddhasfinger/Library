<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style_main.css">
</head>
<body>
	<header>
		<%@ include file="header.jsp" %>
	</header>
	<section>
		<div id="top_img">	
		   <div>
				<div class="search_in">
				 <form action="/book/book_list" name="search" method="post">
					<select name="category" id="category">
						<option value="all">전체</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" size="16" name="search">
					<button type="submit">검색</button>
				</form>	
				</div>
	 		</div> 
		</div> 
		<div id="best">
			<h2>베스트 셀러</h2>
			<ul>
			  <c:forEach var="dto" items="${map.list}" varStatus="status">
				<li><a href="#"> <img alt="" src="upload/book/${dto.bk_filename }" width="330" height="400">
						<span>0${status.count}</span>
				</a> <a href="book/book_content_view?category=&search=&page=1&bk_id=${dto.bk_id }"> <span>${dto.bk_bookname }</span><span>${dto.bk_star } <span>/${dto.bk_writer }</span>
					</span>
				</a> <!-- <a href="#"></a> --></li>
			</c:forEach>
			</ul>
		</div>
		<div id="best">
			<h2>신작 도서</h2>
			<ul>
			  <c:forEach var="dto" items="${newBooklist.newBooklist}" varStatus="status">
				<li><a href="#"> <img alt="" src="upload/book/${dto.bk_filename }" width="330" height="400">
						<span>${status.count}</span>
				</a> <a href="book/book_content_view?category=&search=&page=1&bk_id=${dto.bk_id }"> <span>${dto.bk_bookname }</span><span>${dto.bk_star } <span>/${dto.bk_writer }</span>
					</span>
				</a> <!-- <a href="#"></a> --></li>
			</c:forEach>
			</ul>
		</div>
		<div id="best1">
			<h2>맞춤도서</h2>
			<ul>
			  <c:forEach var="dto" items="${favorbook.pickresult}" varStatus="status">
				<li><a href="#"> <img alt="" src="upload/book/${dto.bk_filename }" width="330" height="400">
 						<span>0${status.count}</span> 
				</a> <a href="book/book_content_view?category=&search=&page=1&bk_id=${dto.bk_id }"> <span>${dto.bk_bookname }</span><span>${dto.bk_star } <span>${dto.bk_writer }</span>
					</span>
				</a> <!-- <a href="#"></a> --></li>
			</c:forEach>
			</ul>
		</div>
		<div id="main_notice">
			<a href="#">
				<dl>
					<dt>공지사항</dt>
					<dd>공지사항입니다.</dd>
				</dl>
			</a>
		</div>
	</section>
	<footer>
		<%@ include file="footer.jsp" %>
	</footer>
</body>
</html>