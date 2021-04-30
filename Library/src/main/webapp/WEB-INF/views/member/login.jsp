<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pages - Login</title>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script>
       function loginCheck(){
    	   alert("로그인 하는중입니다.");
		   var sessionUId = "<%=session.getAttribute("session_user") %>";
    	   $.ajax({
			   url:"/loginCheck",
			   type:"get",
			   data:{
				   "lm_user":$("#lm_user").val(),"lm_pw1":$("#lm_pw1").val()
			   },
			   contentType:"application/json",
			   success:function(data){
				   if(data.loginCheck==1){
					   alert(data.message);
					   location.href="../main?lm_user="+sessionUId;
				   }else{
					   alert(data.message);
					   $("#lm_user").focus();
				   }
			   },
			   error:function(){
				   alert("ERROR!!!");
			   }
		   });
       }
    </script>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/login.css">
</head>

<body>

  <%@ include file="../listhead.jsp" %>

   <section>
    <h1>로그인</h1>

<!--     <article id="category">
      <ul>
        <li class="selected">회원 로그인</li>
      </ul>  
    </article> -->

    <form action="" name="loginForm" method="post">
      <div class="id">
        <input type="text" name="lm_user" id="lm_user" size="30">
      </div>
      <div class="pw">
        <input type="password" name="lm_pw1" id="lm_pw1" size="45" >
      </div>

      <div id="save">
        <div class="save"></div>
        <span>아이디 저장</span>
      </div>
  
      <!-- <div id="find">
        <span>아이디 찾기</span> <span class="separator">|</span> <span>비밀번호 찾기</span>
      </div> -->

      <button type="button" onclick="loginCheck()">로그인</button>
    </form>

    <ul class="login-icons">
      <li class="phone"></li>
      <li class="kakao"></li>
      <li class="naver"></li>
      <li class="facebook"></li>
    </ul>

	<div class="sign-up-info">
      <h3>저희 도서관 회원이 아니신가요?</h3>
      <p>도서관 본관에서 회원등록을 도와드립니다.<br><br>도서관의 시설이용 / 도서대출 이용을 원하신다면 신분증을 가지고 도서관을 방문해주세요.
      </p>
    </div>
  </section>

  <footer>
    <div class="wrapper">
      <div class="footer-left">
        <div class="footer-logo"></div>
        <div class="copyright">© LIBRARY ALL RIGHTS RESERVED</div>
      </div>
  
      <div class="footer-center">
        <ul class="footer-nav">
          <li class="first-list">이용약관</li>
          <li class="green">개인정보처리 방침</li>
          <li>법적고지</li>
          <li>사업자정보 확인</li>
        </ul>
  
        <ul class="footer-info">
          <li class="first-list">씨제이제일제당(주)</li>
          <li>대표이사 : 손경식,강신호,신현재</li>
          <li>사업자등록번호 : 104-86-09535</li>
          <li class="first-list">주소 : 서울 중구 동호로 330 CJ제일제당 센터 (우) 04560</li>
          <li>통신판매업신고 중구 제 07767호</li>
          <li class="first-list">개인정보보호책임자 : 조영민</li>
          <li>이메일 : cjon@cj.net</li>
          <li>호스팅제공자 : CJ올리브네트웍스㈜</li>
        </ul>
  
        <div id="check">고객님은 안전거래를 위해 현금등으로 결제시 LG U+ 전자 결제의 매매보호(에스크로) 서비스를 이용하실 수 있습니다. <span class="check">가입 사실 확인</span></div>
      </div>
  
      <div class="footer-right">
        <div id="shortcut">
          <span>CJ그룹계열사 바로가기</span>
          <div class="shortcut"></div>
        </div>
  
        <div class="call">고객행복센터 1668-1920</div>
        <div class="inquery">1:1 문의</div>
      </div>
  
    </div>
  </footer>
</body>
</html>