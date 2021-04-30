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
   <%@ include file="../listhead.jsp" %>
<section>
    <h1>게시글수정</h1>
    <hr>

    <form action="/hopeboardModify" name="modify" method="post">
      <table>
      <input type="hidden" name="page" value="${map.page }">
      <input type="hidden" name="hb_seq" value="${map.boardDto.hb_seq }">
      <input type="hidden" name="category" value="${map.category }">
      <input type="hidden" name="search" value="${map.search }">
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="hb_user" value="${map.boardDto.hb_user }" readonly>
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="hb_title" value="${map.boardDto.hb_title }">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="hb_content" cols="50" rows="10">
          		 ${map.boardDto.hb_content }
            </textarea>
          </td>
        </tr>
      </table>
      <hr>
      <div class="button-wrapper">
        <button type="submit" class="write">수정완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='/hopebookboard/hopeboard_list'">취소</button>
      </div>
    </form>

  </section>
  <footer> 
   <%@ include file="../listfoot.jsp" %>
   </footer>

</body>
</html>