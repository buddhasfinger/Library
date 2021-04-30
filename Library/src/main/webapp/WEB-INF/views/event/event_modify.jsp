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
    	function eventModify(){
    		alert("수정 완료했습니다.");
    		
    		$.ajax({
    			url:"/event/event_modifyCheck",
    			type:"post",
    			enctype:"multipart/form-data",
    			data: new FormData($('#ModifyForm')[0]),
    			processData: false,
    			contentType:false,
    			cache:false,
    			success:function(data){
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
    <h1>관리자 수정</h1>
    <hr>

    <form action="" id="ModifyForm" name="ModifyForm" method="post" enctype="multipart/form-data">
      <input type="hidden" name="page" value="${map.page }">
	  <input type="hidden" name="le_id" value="${map.dto.le_id }">
   	  <input type="hidden" name="le_category" value="${map.dto.le_category }">
   	  <input type="hidden" name="file" value="${map.dto.le_filename }">
      <table>
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="le_title" value="${map.dto.le_title }">
          </td>
        </tr>
        <tr>
          <th>종료 날짜</th>
          <td>
            <input type="date" name="le_enddate" class="inputdate" >
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="le_content" cols="50" rows="10" >${map.dto.le_content }</textarea>
          </td>
        </tr>
        <tr>
          <th>행사 이미지</th>
          <td>
            <input type="file" name="file" id="file" value="${map.dto.le_filename }">
          </td>
        </tr>
      </table>
      <hr>
      <div class="button-wrapper">
        <button type="button" class="write" onclick="eventModify()">수정완료</button>
        <button type="button" class="cancel" onclick="location.href='./event'">취소</button>
      </div>
    </form>

  </section>

  <footer>
    <%@ include file="../listfoot.jsp" %>
  </footer>
</body>
</html>