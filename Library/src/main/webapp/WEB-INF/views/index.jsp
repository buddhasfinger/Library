<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>project - Library</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main1.css" />
	</head>
	<body class="is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="main2" id="logo">Library <em>Project</em></a></h1>

					<!-- 메뉴 -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="main">Home</a></li>
								<li>
									<a href="#">전체도서</a>
									<ul>
										<li>
											<a href="#">국내도서</a>
											<ul>
												<li><a href="#">테스트1</a></li>
												<li><a href="#">테스트2</a></li>
												<li><a href="#">테스트3</a></li>
												<li><a href="#">테스트4</a></li>
												<li><a href="#">테스트5</a></li>
											</ul>
										</li>
										<li>
											<a href="#">해외도서</a>
											<ul>
												<li><a href="#">테스트1</a></li>
												<li><a href="#">테스트2</a></li>
												<li><a href="#">테스트3</a></li>
												<li><a href="#">테스트4</a></li>
												<li><a href="#">테스트5</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li>
									<a href="#">스터디룸</a>
									<ul>
										<li><a href="#">스터디룸 예약하기</a></li>
										<li><a href="#">나의 스터디룸 보기</a></li>
									</ul>
								</li>
								<li><a href="#">공지사항</a></li>
								<li><a href="#">자유게시판</a></li>
								<li><a href="#">행사안내</a></li>
								<li><a href="#">희망도서신청</a></li>
								<li><a href="#">나의 도서내역</a></li>
							</ul>
						</nav>

				</div>

			<!-- Banner -->
				<section id="banner">
						<div class="banners">
						 <form action="/book/book_list" name="search" method="post">
						 <div class="selectdiv">
							<select name="category" id="category" class="category">
								<option value="all">전체</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select>
						 </div>
						 <div class="inputsdiv">
							<input type="text" size="16" name="search" class="isearch">
							<input type="image" src="../images/searchBtn.png">
						 </div>
						</form>	
						</div>
					<header>
						<h2>Library :&nbsp;<em> The library is a place where you can rent books and study.</em></h2>
						<a href="https://ko.wikipedia.org/wiki/%EB%8F%84%EC%84%9C%EA%B4%80" target="_blank" class="button">Learn More</a>
					</header>
				</section>

			<!-- Highlights -->
				<section class="wrapper style1">
						<div id="best">
							<h2>베스트 셀러</h2>
							<ul>
							  <c:forEach var="dto" items="${map.list}" varStatus="status">
								<li><a href="#"> <img alt="" src="upload/book/${dto.bk_filename }">
										<span>0${status.count}</span>
								</a> <a href="book/book_content_view?category=&search=&page=1&bk_id=${dto.bk_id }"> <span>${dto.bk_bookname }</span><span>${dto.bk_star } <span>/${dto.bk_writer }</span>
									</span>
								</a> <!-- <a href="#"></a> --></li>
							</c:forEach>
							</ul>
						</div>
						<div id="sin">
							<h2>베스트 셀러</h2>
							<ul>
							  <c:forEach var="dto" items="${map.list}" varStatus="status">
								<li><a href="#"> <img alt="" src="upload/book/${dto.bk_filename }">
										<span>0${status.count}</span>
								</a> <a href="book/book_content_view?category=&search=&page=1&bk_id=${dto.bk_id }"> <span>${dto.bk_bookname }</span><span>${dto.bk_star } <span>/${dto.bk_writer }</span>
									</span>
								</a> <!-- <a href="#"></a> --></li>
							</c:forEach>
							</ul>
						</div>
						<div id="reserking">
							<h2>베스트 셀러</h2>
							<ul>
							  <c:forEach var="dto" items="${map.list}" varStatus="status">
								<li><a href="#"> <img class="rs" alt="" src="upload/book/${dto.bk_filename }">
										<span>0${status.count}</span>
								</a> <a href="book/book_content_view?category=&search=&page=1&bk_id=${dto.bk_id }"> <span>${dto.bk_bookname }</span><span>${dto.bk_star } <span>/${dto.bk_writer }</span>
									</span>
								</a> <!-- <a href="#"></a> --></li>
							</c:forEach>
							</ul>
						</div>
				</section>

			<!-- CTA -->
				<section id="cta" class="wrapper style3">
					<div class="container">
						<header>
							<h2>Are you ready to continue your quest?</h2>
							<a href="#" class="button">Insert Coin</a>
						</header>
					</div>
				</section>

			<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>Links to Library</h3>
								<ul class="links">
									<li><a href="#">Mattis et quis rutrum</a></li>
									<li><a href="#">Suspendisse amet varius</a></li>
									<li><a href="#">Sed et dapibus quis</a></li>
									<li><a href="#">Rutrum accumsan dolor</a></li>
									<li><a href="#">Mattis rutrum accumsan</a></li>
									<li><a href="#">Suspendisse varius nibh</a></li>
									<li><a href="#">Sed et dapibus mattis</a></li>
								</ul>
							</section>
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>Links to bookStore</h3>
								<ul class="links">
									<li><a href="#">Duis neque nisi dapibus</a></li>
									<li><a href="#">Sed et dapibus quis</a></li>
									<li><a href="#">Rutrum accumsan sed</a></li>
									<li><a href="#">Mattis et sed accumsan</a></li>
									<li><a href="#">Duis neque nisi sed</a></li>
									<li><a href="#">Sed et dapibus quis</a></li>
									<li><a href="#">Rutrum amet varius</a></li>
								</ul>
							</section>
							<section class="col-6 col-12-narrower">
								<h3>Get In Touch</h3>
								<form>
									<div class="row gtr-50">
										<div class="col-6 col-12-mobilep">
											<input type="text" name="name" id="name" placeholder="Name" />
										</div>
										<div class="col-6 col-12-mobilep">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
										<div class="col-12">
											<textarea name="message" id="message" placeholder="Message" rows="5"></textarea>
										</div>
										<div class="col-12">
											<ul class="actions">
												<li><input type="submit" class="button alt" value="Send Message" /></li>
											</ul>
										</div>
									</div>
								</form>
							</section>
						</div>
					</div>

					<!-- Icons -->
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
							<li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
							<li><a href="#" class="icon brands fa-google-plus-g"><span class="label">Google+</span></a></li>
						</ul>

					<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; Library. All rights reserved</li><li>Project: <a href="main">Library</a></li>
							</ul>
						</div>

				</div>

		</div>

		<!-- Scripts -->
			<script src="../js/jquery.min.js"></script>
			<script src="../js/jquery.dropotron.min.js"></script>
			<script src="../js/browser.min.js"></script>
			<script src="../js/breakpoints.min.js"></script>
			<script src="../js/util.js"></script>
			<script src="../js/main.js"></script>

	</body>
</html>