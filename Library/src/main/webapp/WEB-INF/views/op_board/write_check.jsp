<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<c:choose>
	   	<c:when test="${flag eq '-1'}">
	      <script type="text/javascript">
		      alert("오류로 인한 저장이 되지 않았습니다 다시 입력해주세요.");
	      </script>
	      <c:redirect url="/write_view.do" />
	   	</c:when>
	   <c:otherwise>
	      <script type="text/javascript">
		      alert("데이터 저장이 완료되었습니다!");
	      </script>
		  <c:redirect url="/list.do" />
	   </c:otherwise>
	</c:choose>
		<meta charset="UTF-8">
		<title>글쓰기 체크</title>
	</head>
	<body>
	
	
	</body>
</html>