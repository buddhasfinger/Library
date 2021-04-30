<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("br","<br>"); %>
<% pageContext.setAttribute("cn","\n"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="../css/admin_writecount.css">
<link rel="stylesheet" href="../css/admin_write.css">
<script type="text/javascript">
	function Write(){
		alert('등록');
		var str = $('#bk_content').val();
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br>');
		$('#bk_content').val(str);
		$.ajax({
			url:"./book_write",
			type:"post",
			enctype:"multipart/form-data",
			data: new FormData($('#writeForm')[0]),
			processData: false,
			contentType:false,
			cache:false,
			success:function(data){
    				location.href="../book/book_list";
			},
			error:function(){
				alert("에러");
			}
		});
	}


</script>
</head>

<body>
	<header>
		<div id="header-left">
			LMS <span>ENTERPRISE</span> Type
		</div>
	</header>

	<nav>
		<ul>
      <li><span class="nav1">&emsp;</span> 회원정보</li>
      <li><span class="nav2">&emsp;</span> <a href="/admin/admin_bookwrite">도서등록</a></li>
      <li><span class="nav2">&emsp;</span> <a href="/admin/admin_rbooklist">대여현황</a></li>
      <li><span class="nav2">&emsp;</span> <a href="#">스터디룸현황</a></li>
      <li><span class="nav3">&emsp;</span> <a href="/admin/adminNotice">공지사항</a></li>
      <li><span class="nav4">&emsp;</span> <a href="/admin/admin_eventlist">이벤트</a></li>
    </ul>
	</nav>

	<!-- 여기부터 시작 -->
	<section>
		<h1>관리자 도서등록</h1>
		<hr>
		<form action="" name="writeForm" id="writeForm" enctype="multipart/form-data" method="post">
			<table class="bosub">
				<colgroup>
					<col width="15%">
					<col width="85%">
				</colgroup>
				<tr>
					<th>책이름</th>
					<td><input type="text" name="bk_bookname"></td>
				</tr>
				<tr>
					<th>저자</th>
					<td><input type="text" name="bk_writer"></td>
				</tr>
				<tr>
					<th>출판사</th>
					<td><input type="text" name="bk_pub"></td>
				</tr>
				<tr>
					<th>ISBN</th>
					<td><input type="text" name="bk_isbn"></td>
				</tr>
				<tr>
					<th>도서분류</th>
					<td>
					<div class="category-wrapper">
						<select name="bk_nara" id="bk_nara">
                			<option value="국내도서">국내도서</option>
                			<option value="해외도서">해외도서</option>
              			</select> 
              		</div>
					</td>
				</tr>
				<tr>
					<th>도서 세부분류</th>
					<td>
					<div class="category-wrapper">
						<select name="bk_subcate" id="bk_subcate">
                			<option value="경제">경제</option>
                			<option value="소설">소설</option>
                			<option value="IT/과학">IT/과학</option>
                			<option value="여행">여행</option>
                			<option value="종교">종교</option>
                			<option value="잡지">잡지</option>
              			</select> 
              		</div>
					</td>
				</tr>
				<tr>
					<th>별점</th>
					<td>
					<div class="category-wrapper">
						<select name="bk_star" id="bk_star">
							<option value="">별점을 선택해주세요.</option>
                			<option value="★★★★★">★★★★★</option>
                			<option value="☆★★★★">☆★★★★</option>
                			<option value="☆☆★★★">☆☆★★★</option>
                			<option value="☆☆☆★★">☆☆☆★★</option>
                			<option value="☆☆☆☆★">☆☆☆☆★</option>
              			</select> 
              		</div>
					</td>
				</tr>
				<tr>
					<th>수량</th>
					<td><input type="text" name="bk_amount"></td>
				</tr>
				<tr>
					<th>책내용</th>
					<td><textarea id="bk_content" name="bk_content" cols="50" rows="10"></textarea></td>
				</tr>
 				 <tr>
					<th>추천/비추천</th>
					<td>
					<div class="category-wrapper">
					<select name="bk_hit" id="bk_hit">
                			<option value="추천">추천</option>
                			<option value="비추천">비추천</option>
              		</select>
              		</div>
					</td>
				</tr>
				<tr>
					<th>책이미지</th>
					<td><input type="file" name="file" id="file"></td>
				</tr>
			</table>
			<hr>
			<div class="button-wrapper">
				<button type="button" class="write" onclick="Write()">작성완료</button>
				<button type="button" class="cancel" onclick="location.href='../book/book_list'">취소</button>
			</div>
		</form>
	</section>
	<!-- 여기부터 끝 -->


</body>
</html>