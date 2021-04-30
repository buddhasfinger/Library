<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/freeboard_read.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 날짜 포맷함수 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<style>
.cursor {
	cursor: pointer;
}
</style>
<script type="text/javascript">
	function loginCheck(){
			alert("로그인을 필요로 합니다.");
			return false;
		}
	
	function delete_check() {
 		if(${session_Name == map.freeboardDto.bname} || ${session_Name == '관리자'}){
 			 if (confirm("삭제하시겠습니까?")) {
 				location.href = "./delete?category=${map.category }&search=${map.search }&page=${map.page}&bid=${map.freeboardDto.bid}";
 			} else {
 				return false;
 			}
		}else{
 			alert("본인의 글만 삭제 할 수 있습니다.");
		} 
	}
	function modify_check() {
 		if(${session_Name == map.freeboardDto.bname}){
 			 if (confirm("수정하시겠습니까?")) {
 				location.href = "./freeboard_modify_view?category=${map.category }&search=${map.search }&page=${map.page}&bid=${map.freeboardDto.bid}";
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
			var commentName = '<%=(String)session.getAttribute("session_Name")%>';
			
			  //컨트롤러에 보내서 저장하기 위해서 ajax를 쓰는것이다
		  	  $.ajax({
				url:"/freeboard/freeboard_commentWrite_check",
				type:"post",
				data:{
					"bid":${map.freeboardDto.bid},
					"commentName":commentName,
					"commentContent":$("#commentContent").val()
				},
				
				success: function(data){	//data.dto.id
					//댓글이 여기서 구현된다.
					alert("댓글 작성을 완료했습니다.");

					//나중에 코멘트를 찾기 위하여 id 를 준다

					html +='<ul id="'+data.commentDto.commentNo+'">';
					html +='<li class="name">'+data.commentDto.commentName+'<span>&nbsp;&nbsp;[ '+moment(data.commentDto.commentDate).format("YYYY-MM-DD HH:mm:ss")+' ]</span></li>';
					html +='<li class="txt">'+data.commentDto.commentContent+'</li>';
					html +='<li class="replyBtn2">';
					html +='<a';
					html +='onclick="commentUpdate('+data.commentDto.commentNo+',\''+data.commentDto.commentName+'\',\''+data.commentDto.commentContent+'\',\''+data.commentDto.commentDate+'\')">';
					html +='수정</a>';								
					html +='<a';
					html +='onclick="commentDelete('+data.commentDto.commentNo+')">';
					html +='삭제</a>';								
					html +='</li>';
					html +='</ul>';
					
					$('.replyBox').prepend(html);		
					$('#commentContent').val('');
					location.reload();
				},
				error:function(){
					alert("에러");
				}
				
			})  
			
	}
 	/* 댓글삭제 체크 */
	 function commentDelete(commentNo){
		 
  		 if(confirm("삭제하시겠습니까?")){
			 $.ajax({
					url:"/freeboard/freeboard_commentDelete",
					type:"post",
					data:{
						"commentNo":commentNo
					},
					success:function(data){   
						 // 해당 태그 삭제
					     $('#'+commentNo).remove();
						 location.reload();
					},
					error:function(){
						alert("에러");
					}
				 }); 
		 }else{
			 return false; 
		 }  
	 }
	 
 /* 댓글수정 체크 */
 		 function commentUpdate(commentNo,commentName){
		 var html="";
  	   $.ajax({
			url:"/freeboard/freeboard_commentUpdate_check",
			type:"post",
			data:{
				"commentNo":commentNo,"commentName":commentName,"commentContent":$("#commentContentUpdate").val()
			},
			success:function(data){   
				//data.dto.id
	 		      //자바스크립트 날짜 포맷 변경 함수 : 상단에 moment날짜함수 선언을 해야 함 
			     html +='<li class="name">'+data.commentDto.commentName+'<span>&nbsp;&nbsp;['+moment(data.commentDto.commentDate).format("YYYY-MM-DD HH:mm:ss")+']</span></li>';
				 html +='<li class="txt">'+data.commentDto.commentContent+'</li>';
				 html +='<li class="replyBtn2">';
				 html +='<a href="#" class="replyBtn2"';
				 html +='onclick="commentUpdate_view('+data.commentDto.commentNo+',\''+data.commentDto.commentName+'\',\''+data.commentDto.commentContent+'\',\''+data.commentDto.commentDate+'\')">';
				 html +='수정</a>';
				 html +='<a href="#" class="replyBtn2" onclick="commentDelete('+data.commentDto.commentNo+')">삭제</a>';
				 html +='</li>'; 
				 
				 $('#'+commentNo).html(html);
				
			},
			error:function(){
				alert("에러");
			}
		 });        
		 
	 } 
	 
	 
	 
	 /* 댓글수정 */
 	 function commentUpdate_view(commentNo,commentName,commentContent,commentDate){
		 var html="";
 		 html +='<li class="name">'+commentName+' <span>&nbsp;&nbsp;['+moment(commentDate).format("YYYY-MM-DD HH:mm:ss")+']</span></li><br>';
		 html +='<li><textarea class="textarea2" id="commentContentUpdate" name="commentContentUpdate">'+commentContent+'</textarea></li>';
		 html +='<li class="cbtn">';
		 html +='<a href="#" class="replyBtn2"';
		 html +='onclick="commentUpdate('+commentNo+',\''+commentName+'\')">';
		 html +='저장</a>';
		 html +='<a href="#" class="replyBtn2" >취소</a>';
		 html +='</li>';
		
		 
		 $('#'+commentNo).html(html); 
		  
		 
	 } 


	//댓글 list 출력 ajax 
</script>

</head>

<body>
	<%@ include file="../listhead.jsp" %>
	<section>
		<h1>자유게시판</h1>

		<table>
			<colgroup>
				<col width="80%">
				<col width="10%">
				<col width="10%">

			</colgroup>
			<tr>
				<th colspan="3">제목 | <span><strong>${map.freeboardDto.btitle }</strong></span></th>
			</tr>
			<tr>
				<td>작성자 | ${map.freeboardDto.bname }</td>
				<td>조회수</td>
				<td id="bname">${map.freeboardDto.bhit }</td>
			</tr>
			<tr>
				<td colspan="3" class="article" id="content_result">${map.freeboardDto.bcontent}</td>
			</tr>
			<tr>
				<td>파일첨부</td>
				<td colspan="2"><a href="/upload/${map.freeboardDto.fileName}"
					download>${map.freeboardDto.fileName }</a></td>
			</tr>
			<tr>
				<td colspan="3" class="article">
				<img alt=""src="/upload/freeboard/${map.freeboardDto.fileName}" width="250" height="250">
				</td>
			</tr>
			<tr>
				<td colspan="3"><strong>다음글</strong> <span class="separator">|</span>
					<a
					href="freeboard_content_view?category=${map.category }&search=${map.search }&page=${map.page }&bid=${map.nextDto.bid }">${map.nextDto.btitle}</a>
				</td>
			</tr>
			<tr>
				<td colspan="3"><strong>이전글</strong> <span class="separator">|</span>
					<a href="freeboard_content_view?category=${map.category }&search=${map.search }&page=${map.page }&bid=${map.preDto.bid }">${map.preDto.btitle }</a>
				</td>
			</tr>
			<tr>
				<td colspan="3" class="article">
					<div class="replyWrite">
						<ul>
							<li class="in">
								<p class="ctxt">
									총 <span class="orange">${map.count}</span> 개의 댓글이 달려있습니다.
								</p>

								<textarea class="replyType" id="commentContent"
									name="commentContent"></textarea>
							</li>
							<li class="btn"><a href="#" onclick="commentWrite()" class="replyBtn">등록</a></li>
						</ul>
					</div>

						<!-- 댓글이 추가되는 곳  -->
					<div class="replyBox">
					
					</div>
					<c:forEach var="commentDto" items="${map.comment_list }">
						<ul id="${commentDto.commentNo}" class="">
							<li class="name">${commentDto.commentName} <span>&nbsp;&nbsp;[<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${commentDto.commentDate}"/>]</span></li>
							<li class="txt">${commentDto.commentContent}</li>
							<li>
							    <!-- if -->
							    <c:if test="${session_Name eq commentDto.commentName}">
									<a href="#" class="replyBtn2" onclick="commentUpdate_view(${commentDto.commentNo},'${commentDto.commentName}','${commentDto.commentContent }','${commentDto.commentDate }')">수정</a>
									<a href="#" class="replyBtn2" onclick="commentDelete(${commentDto.commentNo})">삭제</a>
							    </c:if>
							</li>
						</ul>
				    </c:forEach>
				</td>
			</tr>
		</table>
		<c:choose>
			<c:when test="${session_flag == null || session_flag =='fail'}">
				<a href="freeboard_list?category=${map.category }&search=${map.search }&page=${map.page }"><div class="list">목록</div></a>
			</c:when>
			<c:when test="${session_Name == map.freeboardDto.bname || session_Name == '관리자'}">
				<a href="freeboard_list?category=${map.category }&search=${map.search }&page=${map.page }"><div class="list">목록</div></a>
				<div class="list" onclick="modify_check()">수정</div> 
				<div onclick="delete_check()" class="list cursor">삭제</div>
			</c:when>
			<c:otherwise>
				<a href="freeboard_list?category=${map.category }&search=${map.search }&page=${map.page }"><div class="list" style="cursor: pointer">목록</div></a>
			</c:otherwise>
			
		</c:choose>
		
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