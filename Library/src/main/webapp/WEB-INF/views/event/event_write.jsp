<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pages - Login</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/write.css">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script type="text/javascript">
    	function eventWriteCheck(){
    		
    		$.ajax({
    			url:"./write_Check",
    			type:"post",
    			enctype:"multipart/form-data",
    			data: new FormData($('#eventWrite')[0]),
    			processData: false,
    			contentType:false,
    			cache:false,
    			success:function(data){
	    				alert('게시글이 등록되었습니다.');
	    				location.href="./event";
    			},
    			error:function(){
    				alert("에러");
    			}
    		});
    	}
   </script>
</head>

<body>
  <%@ include file="../listhead.jsp" %>

	
  <section>
    <h1>관리자 글쓰기</h1>
    <hr>

    <form action="" id="eventWrite" name="eventWrite" method="post" enctype="multipart/form-data">
   	  <input type="hidden" name="le_category" value="이벤트">
      <table>
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="le_title">
          </td>
        </tr>
        <tr>
          <th>종료 날짜</th>
          <td>
            <input type="date" name="le_enddate" class="inputdate">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="le_content" cols="50" rows="10"></textarea>
          </td>
        </tr>
        <tr>
          <th>행사 이미지</th>
          <td>
            <input type="file" name="file" id="file">
          </td>
        </tr>
      </table>
      <hr>
      <div class="button-wrapper">
        <button type="button" class="write" onclick="eventWriteCheck()">작성완료</button>
        <button type="button" class="cancel" onclick="location.href='./event'">취소</button>
      </div>
    </form>

  </section>

  <footer>
   <%@ include file="../listfoot.jsp" %>
  </footer>
</body>
</html>