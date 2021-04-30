<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>글쓰기</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script type="text/javascript">
       function writeCheck(){
         alert("성공!");
         
         $.ajax({
             url:"/write1",
             type:'post',
             enctype:"multipart/form-data",
             data: formData($('#writeForm')[0]),
            processData:false,
            contentType:false,
            cache:false,
             success:function(data){
            	 	 alert("게시판 등록이 완료되었습니다.");
            		 location.href="./notice_list";
             },
             error:function(){
                alert("ERROR😣");
             }
          });
      }    
    </script>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/write.css">
</head>
<body>
<section>
    <h1>관리자 글쓰기</h1>
    <hr>

    <form action="write" id="writeForm" name="writeForm" method="post" enctype="multipart/form-data">
      <table>
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="lname" id="lname">
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="ltitle">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="lcontent" id="lcontent" cols="50" rows="10"></textarea>
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
        <button type="button" onclick="writeCheck()" class="write">작성완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='/notice_list'">취소</button>
      </div>
    </form>

  </section>

</body>
</html>