<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>글쓰기</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/write.css">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  	<script>
			function writeCheck(){
    		if($("#hb_title").val()==""){
    			alert('제목을 꼭 적어주세요'); 
    			$("#hb_title").focus();
    			return false;
    		}
     		$.ajax({ 
				url:"/hopebookboard/hopeboardWrite1", 
 				type:"post", 
				data:{
					"hb_user":$("#hb_user").val(),
					"hb_title":$("#hb_title").val(),
					"hb_content":$("#hb_content").val()
     			},	
					success:function(data){  //받는 데이터 -->
						alert('신청 완료!'); 
						location.href="./hopeboard_list";
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
    <h1>희망도서 신청 글쓰기</h1>
    <hr>

    <form action="#" id="writeForm"  name="writeForm" method="post" >
      <table>
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="hb_user" id="hb_user" value="${hb_user}" readonly>
          </td>
        </tr>  
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="hb_title" id="hb_title">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="hb_content" id="hb_content" cols="50" rows="10"></textarea>
          </td>
        </tr>
      </table>
      <hr>
      <div class="button-wrapper">
        <button type="button" onclick="writeCheck()" class="write">작성완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='/hopebookboard/hopeboard_list'">취소</button>
      </div>
    </form>

  </section>
	<footer> 
   <%@ include file="../listfoot.jsp" %>
   </footer>
</body>
</html>