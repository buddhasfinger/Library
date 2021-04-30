<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>글수정</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/write.css">
</head>
<body>
<section>
    <h1>게시글수정</h1>
    <hr>

    <form action="modify" name="modify" method="post" enctype="multipart/form-data">
      <table>
      <input type="hidden" name="page" value="${map.page}" />
      <input type="hidden" name="lid" value="${map.boardDto.lid}" />
      <input type="hidden" name="category" value="${map.category}" />
      <input type="hidden" name="search" value="${map.search}" />
      <input type="hidden" name="fileName" value="${map.boardDto.fileName}" />
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="lname" value="${map.BoardDto.bname}" readonly>
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="ltitle" value="${map.BoardDto.ltitle}">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="lcontent" cols="50" rows="10">
           	  ${map.BoardDto.lcontent}
            </textarea>
          </td>
        </tr>
        <tr>
          <th>이미지 표시</th>
          <td>
            <input type="file" name="file" id="file"> 
            <img src="/upload/${map.BoardDto.fileName}" />
            <a href="/upload/${map.BoardDto.fileName}" download>${map.BoardDto.fileName }</a>
          </td>
        </tr>
      </table>
      <hr>
      <div class="button-wrapper">
        <button type="submit" class="write">수정완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='./notice_list'">취소</button>
      </div>
    </form>

  </section>

</body>
</html>