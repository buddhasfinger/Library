<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="../css/admin_account.css">
  
 
<style type="text/css">
h1, h4 {text-align: center;}
table {text-align: center;}
tr, td {height: 40px;}
</style>

  <script type="text/javascript">
  function delete_check(del,dol){
	  if(confirm("삭제하시겠습니까?")){
		  location.href="/adminNoticedelete?page="+dol+"&nt_num="+del+"&category=${map.category}&search=${map.search}";
	  }else{
		  return false; 
	  }
  }
  function modify_check(del,dol){
	  if(confirm("수정하시겠습니까?")){
		  location.href="/admin/adminNotice_modify?category=${map.category }&search=${map.search }&page="+dol+"&nt_num="+del+"";
	  }else{
		  return false; 
	  }
  }
      
  </script>


</style>
</head>

<body>
  <header>
    <div id="header-left">
      LMS <span>ENTERPRISE</span> Type
    </div>
  </header>

  <nav>
    <ul>
      <ul>
      <li><span class="nav1">&emsp;</span> 회원정보</li>
      <li><span class="nav2">&emsp;</span> <a href="/admin/admin_bookwrite">도서등록</a></li>
      <li><span class="nav2">&emsp;</span> <a href="/admin/admin_rbooklist">대여현황</a></li>
      <li><span class="nav2">&emsp;</span> <a href="#">스터디룸현황</a></li>
      <li><span class="nav3">&emsp;</span> <a href="/admin/adminNotice">공지사항</a></li>
      <li><span class="nav4">&emsp;</span> <a href="/admin/admin_eventlist">이벤트</a></li>
    </ul>
    </ul>
  </nav>
    <br>
  <br>
  <br>
  <br>
  <h1> 공지사항 관리</h1>
  <h4>
  <table align="center">
      <colgroup>
        <col width="8%">
        <col width="50%">
        <col width="10%">
        <col width="10%">
      </colgroup>
      <tr>
        <th>글번호</th>
        <th>제목</th>
        <th>등록일</th>
        <th>수정/삭제</th>
      </tr>
			<c:forEach var="dto" items="${map.list }">
				<tr>
					<td><span class="table-notice">${dto.nt_num }</span></td>
					<td>${dto.nt_title }</td>
					<td>${dto.nt_date }</td>
					<td>
					<input type="button" onclick="modify_check(${dto.nt_num},${map.page})" value="수정"></a> 
					<input type="button" onclick="delete_check(${dto.nt_num},${map.page})" value="삭제"></a></td>
				</tr>
			</c:forEach>
			<tr>
        <th></th>
        <th></th>
        <th></th>
        <th><a href="/admin/adminNotice_write">글쓰기</a></th>
      </tr>
    </table>
    </h4>

    <ul class="page-num">
      <li class="first"></li>
      <li class="prev"></li>
      <li class="num">
      </li>
      <li class="next"></li>
      <li class="last"></li>
    </ul>

</body>
</html>