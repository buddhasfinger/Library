<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>뷰페이지</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/read.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- <style type="text/css">
.mouseCursor {
	cursor: pointer;
}

A:LINK {
	text-decoration: none;
	color: #646464;
}

A:VISITED {
	text-decoration: none;
	color: #646464;
}

A:ACTIVE {
	text-decoration: none;
	color: #646464;
}

A:HOVER {
	text-decoration: none;
	color: #646464;
}
</style> -->
<!-- 날짜 포맷함수 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript">
	function loginCheck(){
			alert("로그인을 필요로 합니다.");
			return false;
		}
	
	function delete_check() {
		if(${session_user == map.boardDto.hb_user}){
			 if (confirm("삭제하시겠습니까?")) {
				location.href = "/hopebookboard/hopeboardDelete?category=${map.category }&search=${map.search }&page=${map.page}&hb_seq=${map.boardDto.hb_seq}";
			} else {
				return false;
			}
		}else{
			alert("본인의 글만 삭제 할 수 있습니다.");
		} 
	}
	
	function modify_check() {
		if(${session_user == map.boardDto.hb_user}){
			 if (confirm("수정하시겠습니까?")) {
				location.href = "/hopebookboard/hopeboardModify_view?category=${map.category }&search=${map.search }&page=${map.page}&hb_seq=${map.boardDto.hb_seq}";
			} else {
				return false;
			}
		}else{
			alert("본인의 글만 수정할 수 있습니다.");
		} 
	}

	//댓글등록
 	function commentWrite(){
			var html="";
			// 1. 세션 비교.
			var commentFlag = '<%=(String)session.getAttribute("session_flag")%>';
			if(commentFlag!="success"){
				alert("로그인이 필요합니다.");
				return false;
			}
			
			// 2. 성공 했다고 가정하고, 추가 프로세스.
			var commentName = '<%=(String)session.getAttribute("session_user")%>';
			
		  	  $.ajax({
				url:"/hopebookboard/hopeboard_commentWrite_check",
				type:"post",
				data:{
					
					"hrw_Group":${map.boardDto.hb_seq},
					"hrw_User":commentName,
					"hrw_Content":$("#commentContent").val()
				},
				
				success: function(data){	//data.dto.id
					//댓글이 여기서 구현된다.
					alert("댓글 작성에 성공했습니다.");

					//나중에 코멘트를 찾기 위하여 id 를 준다
					html +='<ul hrw_User="'+data.hrwriteDto.hrw_Seq+'">';
					html +='<li class="name">'+data.hrwriteDto.hrw_User+'<span>&nbsp;&nbsp;[ '+moment(data.hrwriteDto.hb_date).format("YYYY-MM-DD")+' ]</span></li>';
					html +='<li class="txt">'+data.hrwriteDto.hrw_Content+'</li>';
					html +='<li class="btn">';
					html +='<a href="" class="rebtn"';
					html +='onclick="commentUpdate('+data.hrwriteDto.hrw_Seq+',\''+data.hrwriteDto.hrw_User+'\',\''+data.hrwriteDto.hrw_Content+'\',\''+data.hrwriteDto.hb_date+'\')">';
					html +='수정</a>';								
					html +='<a href="#" class="rebtn" onclick="commentDelete('+data.hrwriteDto.hrw_Seq+'>삭제</a>';
					html +='</li>';
					html +='</ul>';
					
					$('.replyBox').append(html);		
					$('#commentContent').val('');
				},
				error:function(){
					alert("에러");
				}
			})  
	}
	//댓글 list 출력 ajax 
  </script>
</head>
<body>
<%@ include file="../listhead.jsp" %>
<!-- 	<header> -->
<!-- 		<ul> -->
<!-- 			<li>회원가입</li> -->
<!-- 			<span>|</span> -->
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${session_flag == null || session_flag =='fail' }"> --%>
<!-- 					<li><a href="/member/login">로그인</a></li> -->
<!-- 					<span>|</span> -->
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<!-- 					<li><a href="/member/logout">로그아웃</a></li> -->
<!-- 					<span>|</span> -->
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
<!-- 			<li>고객행복센터</li> -->
<!-- 			<span>|</span> -->
<!-- 			<li>배송정보검색</li> -->
<!-- 			<span>|</span> -->
<!-- 			<li>기프트카드 등록</li> -->
<!-- 		</ul> -->
<!-- 	</header> -->
	<section>
		<h1>희망도서신청게시판</h1>

		<table>
			<colgroup>
				<col width="80%">
				<col width="10%">
				<col width="10%">

			</colgroup>
			<tr>
				<th colspan="3">제목</th>
			</tr>
			<tr>
				<td colspan="3"><strong>${map.boardDto.hb_title }</strong></td>
			</tr>
			<tr>
				<td>${map.boardDto.hb_user }</td>
				<td>조회수</td>
				<td>${map.boardDto.hb_hit }</td>
			</tr>
			<tr>
				<td colspan="3" class="article">${map.boardDto.hb_content }</td>
			</tr>
			<tr>
				<td colspan="3"><strong>다음글</strong> <span class="separator">|</span>
					<a
					href="./content_view?category=${map.category}&search=${map.search}&page=${map.page}&hb_seq=${map.nextDto.hb_seq}">${map.nextDto.hb_title }</a></td>
			</tr>
			<tr>
				<td colspan="3"><strong>이전글</strong> <span class="separator">|</span>
					<a
					href="./content_view?category=${map.category}&search=${map.search}&hb_seq=${map.preDto.hb_seq }&page=${map.page}">
						${map.preDto.hb_title }</a></td>
			</tr>
			<tr>
				<td colspan="3" class="article">
					<div class="replyWrite">
						<ul>
							<li class="in"><textarea class="replyType"
									name="commentContent" id="commentContent"></textarea></li>
							<li class="btn"><a href="#" onclick="commentWrite()"
								class="replyBtn">등록</a></li>
						</ul>
					</div>
					 
				</td>
			</tr>
			<tr> 
				<td>
					<!-- 댓글이 추가되는 곳  -->
					<div class="replyBox">
					<!-- 댓글 반복 -->
					<c:choose>
					   <c:when test="${map.list != null || map.list.size != 0}">
                        <c:forEach var="dto" items="${map.list }">
							<ul id="${dto.hrw_Seq}">					
								<li class="name" style="font-size:16px;">${dto.hrw_User} </li>
								<li class="txt" style="font-size:18px;">${dto.hrw_Content } </li><span>&nbsp;&nbsp;[${dto.hrw_Date }]</span>
								<li class="btn">
								    
								    <!-- if -->
								    <c:if test="${session_user eq dto.hrw_User}">
										<a href="#" class="rebtn" onclick="commentUpdate(${dto.hrw_Seq},'${dto.hrw_User}','${dto.hrw_Content }','${dto.hrw_Date }')">수정</a>
										<a href="#" class="rebtn" onclick="commentDelete(${dto.hrw_Seq})">삭제</a>
								    </c:if>
								</li>
							</ul>
					    </c:forEach>
					    </c:when>
					    <c:otherwise>
					    </c:otherwise>
					    </c:choose>
					    
					  </div>  
				 </td>
			</tr>
		</table>
		<c:choose>
			<c:when test="${session_user == map.boardDto.hb_user}">
				<a
					href="hopeboard_list?category=${map.category }&search=${map.search }&page=${map.page }"><div
						class="list">목록</div></a>
				<div class="list" onclick="modify_check()" style="cursor: pointer">수정</div>
<!-- 				<a -->
<%-- 					href="/hopebookboard/reply_view?category=${map.category}&search=${map.search }&page=${map.page }&hb_seq=${map.boardDto.hb_seq}"><div --%>
<!-- 						class="list">댓글달기</div></a> -->
				<div onclick="delete_check()" class="list cursor"
					style="cursor: pointer">삭제</div>
			</c:when>
			<c:otherwise>
				<a
					href="hopeboard_list?category=${map.category }&search=${map.search }&page=${map.page }"><div
						class="list" style="cursor: pointer">목록</div></a>
			</c:otherwise>
		</c:choose>
	</section>
	<footer> 
   <%@ include file="../listfoot.jsp" %>
   </footer>
</body>
</html>