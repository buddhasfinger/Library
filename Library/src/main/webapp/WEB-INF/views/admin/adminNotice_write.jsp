<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html><html lang="ko">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 글쓰기</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
       function writeCheck(){
    	   alert("성공");
    	   /* if($("#btitle").val()==""){
    		   alert("타이틀을 꼭 적으셔야 합니다.");
    		   $("#btitle").focus();
    		   return false;
    	   } */
    	   
    	   $.ajax({
			   url:"/write",
			   type:"post",
			   enctype:"multipart/form-data",
			   data: new FormData($('#writeForm')[0]),
		       processData: false,
		       contentType: false,
		       cache: false,
			   success:function(data){
					alert("게시판 등록이 완료되었습니다.");
					location.href="/admin/adminNotice";
			   },
			   error:function(){
				   alert("에러");
			   }
		   });
    	   
    	   
       }
    
    </script>
  
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/write.css">
</head>

<body>
  	<header>
		<ul>
			<c:choose>
	    		<c:when test="${session_flag==null || session_flag=='fail' }">
	       		 	<li><a href="/lmember/login"><span>로그인</span></a></li>
	        		<li><a href=""><span>회원가입</span></a></li>
	    		</c:when>
	    		<c:otherwise>
		    		<li><a href="/lmember/logout"><span>로그아웃</span></a><span> | </span>
		    		<a href="/admin/adminMain"><span>관리자 페이지</span></a><span> | </span>
		    		<a href="/mypage/mypage"><span>마이페이지</span></a></li>
	    		</c:otherwise>
	 		</c:choose>
		</ul>
	</header>

  <nav>
		<a href="/main">
			<div class="logo"></div>
		</a>
    <div class="nav-menu">
      <ul>
        <li>도서관소개</li>
        <li><a href="/notice/notice_list"><span>공지사항</span></a></li>
        <li>도서검색</li>
        <li><a href="/study/studyRoom"><span>스터디룸예약</span></a></li>
        <li>이용안내</li>
      </ul>   
    </div>
  </nav>

  <section>
    <h1>관리자 글쓰기</h1>
    <hr>

    <form action="/write" method="post" enctype="multipart/form-data" id="writeForm" name="writeForm" >
      <table>
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="nt_title" id="nt_title">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="nt_content" id="nt_content" cols="50" rows="10"></textarea>
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
        <button type="button" onclick="writeCheck()">작성완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='/notice/notice_list'">취소</button>
      </div>
    </form>

  </section>

  <footer>
    <div class="wrapper">
      <div class="footer-left">
        <div class="footer-logo"></div>
        <div class="copyright">© COOKIT ALL RIGHTS RESERVED</div>
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