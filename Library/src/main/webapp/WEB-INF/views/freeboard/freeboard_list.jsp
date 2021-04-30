<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FreeboardList</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/notice_list.css">
  <script type="text/javascript">
  	function loginCheck(){
  		alert("로그인을 필요로 합니다.");
  	}
  </script>
</head>
<body>
<%@ include file="../listhead.jsp" %>
 

  <section>
    <h1>자유게시판</h1>
    <div class="wrapper">
      <form action="/freeboard/freeboard_list" name="search" method="post">
        <select name="category" id="category">
 		  <option value="all" ${map.category eq 'all'? 'selected':'' }>전체</option>
          <option value="title" ${map.category eq 'title'? 'selected':'' }>제목</option>
          <option value="content" ${map.category eq 'content'? 'selected':'' }>내용</option>
        </select>

        <div class="title">
          <input type="text" size="16" name="search" value="${map.search}">
        </div>
  
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div>

    <table>
      <colgroup>
        <col width="12%">
        <col width="15%">
        <col width="29%">
        <col width="17%">
        <col width="17%">
        <col width="10%">
      </colgroup>
      <tr>
    	<th>No.</th>
    	<th>사진</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
      <!-- 내용부분 -->
      <c:forEach var="dto" items="${map.list}">
	      <tr>
	        <td><span class="table-notice">${dto.bid }</span></td><!-- 핫게시글은 그냥 번호가 아닌 hot을 집어 넣는다. -->
	        <td><span><img src="/upload/freeboard/${dto.fileName }"width="140" height="105"></span></td><!-- 핫게시글은 그냥 번호가 아닌 hot을 집어 넣는다. -->
	        <td class="table-title">
				<c:forEach  begin="1" end="${dto.bindent }">&gt
				</c:forEach>
				<a href="freeboard_content_view?category=${map.category }&search=${map.search }&page=${map.page }&bid=${dto.bid }">${dto.btitle }</a>
	        </td>
	        <td>${dto.bname}</td>
	        <%-- <td><fmt:formatDate value="${dto.bdate}" pattern="YYYY/MM/dd"/></td> --%>
	        <%-- <fmt:formatDate value="${dto.bdate}" pattern="YYYY/MM/dd"/> --%>
	        <td><fmt:formatDate pattern="yyyy/MM/dd" value="${dto.bdate}"/></td>
	        <td>${dto.bhit}</td>
	      </tr>
       </c:forEach>
    </table>

<ul class="page-num">
      <c:if test="${map.page==1}">
      	<li class="first"></li>
      </c:if>
      <c:if test="${map.page!=1}">
      	<a href="./freeboard_list?category=${map.category }&search=${map.search }&page=1"><li class="first"></li></a>
      </c:if>
      
      <c:choose>
      	<c:when test="${map.page<=1 }">
      		<li class="prev"></li>
      	</c:when>
      	<c:otherwise>
      		<a href="./freeboard_list?category=${map.category }&search=${map.search }&page=${map.page-1 }"><li class="prev"></li></a>
      	
      	</c:otherwise>
      </c:choose>
      
      
      <%-- 번호반복 --%>
      <c:forEach var="nowpage" begin="${map.startpage }" end="${map.endpage }">
      	<c:choose>
    		<c:when test="${map.page==nowpage }">
    			<li class="num"><div>${nowpage }</div></li>
    		</c:when>
    		<c:otherwise>
		      	<a href="./freeboard_list?category=${map.category }&search=${map.search }&page=${nowpage }"><li class="num"><div>${nowpage }</div></li></a>
    		</c:otherwise>  	
      	</c:choose>
      </c:forEach>
      
      <c:choose>
      	<c:when test="${map.page>=map.maxpage }">
      		<li class="next"></li>
      	</c:when>
      	<c:otherwise>
		      <a href="./freeboard_list?category=${map.category }&search=${map.search }&page=${map.page+1 }"><li class="next"></li></a>
      	</c:otherwise>
      </c:choose>
      
      <%-- page가 1인데 maxPage가 0인경우 --%>
      <c:if test="${map.page==map.maxpage}">
      	<li class="last"></li>
      </c:if>
      <c:if test="${map.page!=map.maxpage}">
      	<a href="./freeboard_list?category=${map.category }&search=${map.search }&page=${map.maxpage}"><li class="last"></li></a>
      </c:if>
    </ul>
    	<c:choose>
			<c:when test="${session_flag == null || session_flag =='fail' }">
				<a href="" onclick="loginCheck()"><div class="write">쓰기</div></a>
			</c:when>
			<c:otherwise>
			    <a href="./freeboard_write_view"><div class="write">쓰기</div></a>
			</c:otherwise>
		</c:choose>

  </section>

  <footer>
    <%@ include file="../listfoot.jsp" %>
  </footer>
</body>
</html>