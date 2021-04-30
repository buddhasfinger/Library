<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원탈퇴</title>
	</head>
	<body>
	<fieldset>
		<form action="/member/member_delete" method="post">
			아이디 : <input type="text" name="lmid" value="${libmemberDto.lmid }" readonly><br>
			비밀번호 : <input type="password" name="lmpw"><br>
				<input type="submit" class="btn" value="탈퇴하기">
				<input type="button" class="btn" value="뒤로가기" onclick="location.href='/main'">
		</form>
	</fieldset>
	</body>
</html>