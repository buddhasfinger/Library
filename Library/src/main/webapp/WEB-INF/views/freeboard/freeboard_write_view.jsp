<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판 글쓰기</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/write.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<c:choose>
			<c:when test="${session_flag == null || session_flag == 'fail'}"> <!-- sessionScope.session_flag이게 정석이다 -->
				<script type="text/javascript">
					alert('로그인을 필요로 하는 페이지입니다.');
					location.href = "../member/login";
				</script>
			</c:when>
		</c:choose>
<script type="text/javascript">
    	function writeCheck(){
			//{rname:"홍길동",rcontent:"내용"}
			//ajax에서 위에 data는 보내는데이터 
			//아래 success:function(data)는 받는데이터
			//따라서 success전까지 보낼떄 돌고 받고나서 
			//success부터 도는형식
			//var form =$('#writeForm')[0];
			//var formData = new FormData(form);
			
  			var str = $('#bcontent').val();
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br>');
			$('#bcontent').val(str);
				
			/*			if($("#btitle").val()=="" || ("#bcontent").val()=="" ){
				alert("타이틀과 컨텐츠 모두를 꼭 입력하셔야 합니다.");
				$("#btitle").focus();
				return false;
			}	 */ 
			
 			
				$.ajax({
					url:"./write",
					type:"post",
					enctype:"multipart/form-data",
					data: new FormData($('#writeForm')[0]),
					processData: false,
					contentType:false,
					cache: false,
					success:function(data){
						alert("게시판 등록이 완료되었습니다.");
						location.href="./freeboard_list";
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
    <h1>자유게시판 글쓰기</h1>
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
            <input type="text" name="bname" id="bname" value="${session_Name}" readonly>
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="btitle" id="btitle">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="bcontent" cols="50" rows="10" id="bcontent"></textarea>
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
        <button type="button" class="cancel" onclick="javascript:location.href='./freeboard_list'">취소</button>
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

				<div id="check">
					고객님은 안전거래를 위해 현금등으로 결제시 LG U+ 전자 결제의 매매보호(에스크로) 서비스를 이용하실 수 있습니다. <span
						class="check">가입 사실 확인</span>
				</div>
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