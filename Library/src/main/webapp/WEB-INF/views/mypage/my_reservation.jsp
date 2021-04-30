<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MyBookReservation</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/notice_list.css">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script type="text/javascript">
  	function extendReserv(br_id){
  		var lm_id= ${session_id};
  		$.ajax({
			type:"POST",
			url:"/reservation/my_extendReserv",
			data: {
				'br_id':br_id,"lm_id":lm_id
				},
			success:function(data){
					alert("대여 연장이 완료되었습니다.");
					
			},
			error:function(){
				alert("값 안넘어옴");
			}
			
		}); 
  	}
  </script>
</head>
<body>
  <%@ include file="../listhead.jsp" %>

  <section>
    <h1>나의 대여도서 목록</h1>
    <div class="wrapper">
      <form action="bookReserv" name="bookReserv" method="post">
        <select name="category" id="category">
          <option value="0">전체</option>
          <option value="title">제목</option>
          <option value="content">내용</option>
        </select>

        <div class="title">
          <input type="text" size="16">
        </div>
  
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div>

    <table style="text-align: center;">
    
      <colgroup>
        <col width="10%">
        <col width="10%">
        <col width="20%">
        <col width="10%">
        <col width="20%">
        <col width="20%">
        <col width="20%">
      </colgroup>
      <tr>
        <th>대여번호</th>
        <th>도서번호</th>
        <th>도서명</th>
        <th>대여자명</th>
        <th>대여일</th>
        <th>반납일</th>
        <th>대여연장</th>
      </tr>
      <c:forEach var = "rbookdto" items="${map.list}" varStatus="status">
	      <tr>
	        <td><span class="table-notice" id="br_id">${rbookdto.br_id }</span></td>
	        <td id="bk_id">${rbookdto.bk_id }</td>
	        <td id="bk_bookname">${rbookdto.bk_bookname }</td>
	        <td id="lm_name">${rbookdto.lm_name }</td>
	        <td id="br_sdate">
	        <fmt:parseDate value="${rbookdto.br_sdate }" var="br_sdate" pattern="yyyy-MM-dd"/>
	        <fmt:formatDate value="${br_sdate }" pattern="yyyy-MM-dd"/></td>
	        <td id="br_edate">
	        <fmt:parseDate value="${rbookdto.br_edate }" var="br_edate" pattern="yyyy-MM-dd"/>
	        <fmt:formatDate value="${br_edate }" pattern="yyyy-MM-dd"/></td>
		    <td><div class="admin_button"><a href="" onclick="extendReserv(${rbookdto.br_id})">연장</a></div></td>
	       <%--  <td><div class="admin_button" onclick="admin_bookDelete()"><a href="">취소</a></div></td> --%>
	        <!-- <td><a class="admin_button" href="" name="" id=""><button>수정</button></a></td>
	        <td><a class="admin_button" href="" name="" id=""><button>삭제</button></a></td> -->
			</tr>
      </c:forEach>
    </table>
    

    <!-- <ul class="page-num">
      <li class="first"></li>
      <li class="prev"></li>
      <li class="num">
        <div>1</div>
      </li>
      <li class="next"></li>
      <li class="last"></li>
    </ul> -->

   <!--  <div class="write">쓰기</div> -->
  </section>
   <!-- 여기부터 끝 -->

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