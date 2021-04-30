<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h1>답글</h1>
    <hr>

    <form action="reply" name="reply" method="post" enctype="multipart/form-data">
      <table>
      <input type="hidden" name="bid" value="${map.BoardDto.lid}">
      <input type="hidden" name="bgroup" value="${map.BoardDto.lgroup}">
      <input type="hidden" name="bstep" value="${map.BoardDto.lstep}">
      <input type="hidden" name="bindent" value="${map.BoardDto.lindent}">
      <input type="hidden" name="category" value="${map.category}">
      <input type="hidden" name="page" value="${map.page}">
      <input type="hidden" name="search" value="${map.search}">
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="lname" value="${map.boardDto.lname}">
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="ltitle" value="[답글] ${map.boardDto.ltitle}">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
<textarea name="lContent" cols="50" rows="10">

---------------------------
[답글]
${map.boardDto.lcontent}
</textarea>
          </td>
        </tr>
        <tr>
          <th>이미지 표시</th>
          <td>
            <input type="file" name="file" id="file">
            
          </td>
        </tr>
      </table>
      <hr>
      <div class="button-wrapper">
        <button type="submit" class="write">답변완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='./notice_list'">취소</button>
      </div>
    </form>

  </section>

</body>
</html>