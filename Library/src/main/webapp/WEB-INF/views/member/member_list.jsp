<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/notice_list.css">
  <style type="text/css">
/*   	A:LINK {text-decoration: none; color: #646464;} */
/*   	A:VISITED {text-decoration: none; color: #646464;} */
/*   	A:ACTIVE {text-decoration: none; color: #646464;} */
/*   	A:HOVER {text-decoration: none; color: #646464;} */
  </style>
  

</head>
<body>
		<%@ include file="../listhead.jsp" %>
	

  <section>
    <h1>회원전체리스트</h1>
    <div class="wrapper">
     <form action="/member/member_list" name="search" method="post">
		<select name="category" id="category">
			<option value="namesearch"${map.category}  selected>이름</option>
		</select>

        <div class="title">
          <input type="text"  name="search" size="16" value="${map.search }">
        </div>
  
        <button type="submit">
        	<i class="fas fa-search"></i>
        </button>
      </form>
    </div>

    <table>
      <colgroup>
        	<col width="12%">
			<col width="17%">
			<col width="17%">
			<col width="17%">
			<col width="10%">
      </colgroup>
      <tr>
        <th>가입일</th>
        <th>아이디</th>
        <th>이름</th>
		<th>전화번호</th>
		<th>생년월일</th>
      </tr>

			<!-- 내용부분 -->
			<c:forEach var="dto" items="${map.list }">
		      	<tr>

			        <td>${dto.lm_date }</td>
			        <td class="table-title">
<%-- 			        <a href="/member/member_view?category=${map.category}&search=${map.search}&lm_id=${dto.lm_id }&page=${map.page}"></a> --%>
			        ${dto.lm_user }
			        </td>
			        <td>
			        ${dto.lm_name }</td>
					<td>${dto.lm_tel1 }</td>
					<td>${dto.lm_birth_year}/${dto.lm_birth_month}/${dto.lm_birth_day}</td>
			      </tr>
			</c:forEach>
   		</table>

   			 <!-- 페이지번호 넣기-->
			<ul class="page-num">
			<a href="/member/member_list?category=${map.category}&search=${map.search}&page=1"><li class="first"></li></a>
			<c:choose>
				<c:when test="${map.page <=1 }">
					<li class="prev"></li>
				</c:when>
				<c:otherwise>
					<a href="/member/member_list?category=${map.category}&search=${map.search}&page=${map.page-1 }"><li class="prev"></li></a>
				</c:otherwise>
			</c:choose>

			<!--번호반복 -->
			<c:forEach var="nowpage" begin="${map.startpage }" end="${map.endpage }">
				<c:choose>
					<c:when test="${map.page==nowpage }">
						<li class="num"><div>${nowpage }</div></li>
					</c:when>
					<c:otherwise>
						<a href="/member/member_list?category=${map.category}&search=${map.search}&page=${nowpage }"><li class="num"><div>${nowpage }</div></li></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!--번호반복 -->

			<c:choose>
				<c:when test="${map.page >= map.maxpage }">
					<li class="next"></li>
				</c:when>
				<c:otherwise>
					<a href="/member/member_list?category=${map.category}&search=${map.search}&page=${map.page+1 }"><li class="next"></li></a>
				</c:otherwise>
			</c:choose>


			<a href="/member/member_list?category=${map.category}&search=${map.search}&page=${map.maxpage }"><li class="last"></li></a>
		</ul>
	</section>

	

   <footer> 
   <%@ include file="../listfoot.jsp" %>
<!--     <div class="wrapper"> -->
<!--       <div class="footer-left"> -->
<!--         <div class="footer-logo"></div> -->
<!--         <div class="copyright">© COOKIT ALL RIGHTS RESERVED</div> -->
<!--       </div> -->
  
<!--       <div class="footer-center"> -->
<!--         <ul class="footer-nav"> -->
<!--           <li class="first-list">이용약관</li> -->
<!--           <li class="green">개인정보처리 방침</li> -->
<!--           <li>법적고지</li> -->
<!--           <li>사업자정보 확인</li> -->
<!--         </ul> -->
  
<!--         <ul class="footer-info"> -->
<!--           <li class="first-list">씨제이제일제당(주)</li> -->
<!--           <li>대표이사 : 손경식,강신호,신현재</li> -->
<!--           <li>사업자등록번호 : 104-86-09535</li> -->
<!--           <li class="first-list">주소 : 서울 중구 동호로 330 CJ제일제당 센터 (우) 04560</li> -->
<!--           <li>통신판매업신고 중구 제 07767호</li> -->
<!--           <li class="first-list">개인정보보호책임자 : 조영민</li> -->
<!--           <li>이메일 : cjon@cj.net</li> -->
<!--           <li>호스팅제공자 : CJ올리브네트웍스㈜</li> -->
<!--         </ul> -->
  
<!--         <div id="check">고객님은 안전거래를 위해 현금등으로 결제시 LG U+ 전자 결제의 매매보호(에스크로) 서비스를 이용하실 수 있습니다. <span class="check">가입 사실 확인</span></div> -->
<!--       </div> -->
  
<!--       <div class="footer-right"> -->
<!--         <div id="shortcut"> -->
<!--           <span>CJ그룹계열사 바로가기</span> -->
<!--           <div class="shortcut"></div> -->
<!--         </div> -->
  
<!--         <div class="call">고객행복센터 1668-1920</div> -->
<!--         <div class="inquery">1:1 문의</div> -->
<!--       </div> -->
  
<!--     </div> -->
   </footer> -
</body>
</html>