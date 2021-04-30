<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html><html lang="ko">
<head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지사항 수정</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/write.css">
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script>
  function modifyCheck(num){
	   alert("성공");
	   $.ajax({
		   url:"/notice_modify",
		   type:"post",
		   enctype:"multipart/form-data",
		   data: new FormData($('#modifyForm')[0]),
	       processData: false,
	       contentType: false,
	       cache: false,
		   success:function(data){
				alert("게시판 수정이 완료되었습니다.");
				location.href="/notice/notice_list";
		   },
		   error:function(){
			   alert("에러");
		   }
	   });
	   
	   
 }
    </script>
</head>

<body>
  	<%@ include file="../listhead.jsp"%>

  <section>
    <h1>공지사항 수정</h1>
    <hr>

    <form action="/notice_modify"id="modifyForm" name="modify" method="post" enctype="multipart/form-data" >
      <table>
      <input type="hidden" name="page" value="${map.page }">
      <input type="hidden" name="nt_num" value="${map.noticeDto.nt_num }">
      <input type="hidden" name="category" value="${map.category }">
      <input type="hidden" name="search" value="${map.search}">
      <input type="hidden" name="fileName" value="${map.noticeDto.fileName}">
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="nt_title" value="${map.noticeDto.nt_title }">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="nt_content" cols="50" rows="10">${map.noticeDto.nt_content }</textarea>
          </td>
        </tr>
        <tr> 
          <th>이미지 표시</th>
          <td>
			<input type="file" name="file" id="file">
			<button type="button" onclick="modifyCheck(${map.noticeDto.nt_num })">작성완료</button>
			<a href="/upload/notice/${map.noticeDto.fileName }" download> ${map.noticeDto.fileName }</a>
          </td>
        </tr>
      </table>
      <hr>
      <div class="button-wrapper">
        <button type="submit" class="write">작성완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='/notice/notice_list'">취소</button>
      </div>
    </form>

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