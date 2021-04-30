<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보 상세</title>
	</head>
	<body>
	<h2>회원정보 상세</h2>
	  <form action="" name="form1" method="post">
	    <table border="1">
		    <tr>
		    	<th>아이디</th>
		    	<td><input name="lmid" value="${memberDto.lmid }" readonly="readonly"></td>
		    </tr>
		    <tr>
		    	<th>비밀번호</th>
		    	<td><input type="password" name="lmpw1"></td>
		    </tr>
		    <tr>
		    	<th>비밀번호 확인</th>
		    	<td><input type="password" name="lmpw2"></td>
		    </tr>
		    <tr>
		    	<th>이름</th>
		    	<td><input name="lmname" value="${memberDto.lmname }"></td>
		    </tr>
		    <tr>
		    	<th>이메일</th>
		    	<td><input name="lmemail1" value="${memberDto.lmemail1 }"></td>
		    	<td><input name="lmemail2" value="${memberDto.lmemail2 }"></td>
		    </tr>
		    <tr>
		    	<th>회원가입일자</th>
		    	<td>
		    	  <fmt:formatDate value="${memberDto.lmdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
		    	</td>
		    </tr>
		    <tr>
		    <td>
		    <input type="button" value="뒤로가기">
		    </td>
		    </tr>
	    </table>
	  </form>
	</body>
</html>