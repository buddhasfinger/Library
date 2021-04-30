<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/style_join02_info_input.css">

<title>나의 회원정보</title>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">
	table {width:700px; height:400px; margin:0 auto; border-spacing: 10px; margin-top:50px;}
	table tr td {font-size:28px; font-weight:200;  }
	table td {border-bottom: 1px solid black;}
	
</style>


</script>
	<script>
		function openZipSearch() {
		new daum.Postcode({
		oncomplete: function(data) {
		$('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
		$('[name=lmaddress1]').val(data.address);
		$('[name=lmaddress2]').val(data.buildingName);
		}
		}).open();
		}
	</script>	

<script type="text/javascript">
	function modifyGo(){
		var sessionUId = "<%=session.getAttribute("session_id") %>"
		location.href="/member/member_modifyView?lm_id="+sessionUId;
	}
</script>

</head>
<body>
<%@ include file="../listhead.jsp" %>

	<section>
		<form name="joinForm" id="joinForm" method="post" action="/main">
		
		  <input type="hidden" name="page" id="page" value="${map.page }">
	      <input type="hidden" name="lm_id" id="lm_id" value="${map.memberDto.lm_id }">
	      <input type="hidden" name="category" id="category" value="${map.category }">
	      <input type="hidden" name="search" id="search" value="${map.search }">
	      
			<div id="sub_top_area">
				<h3>나의 회원정보</h3>
			</div>

			<fieldset class="fieldset_class">
			<table>
				<tr> 
					<td>이름 </td>
					<td>${map.memberDto.lm_name} </td>
				</tr>
				<tr> 
					<td>아이디 </td>
					<td>${map.memberDto.lm_user} </td>
				</tr>
				<tr> 
					<td>이메일 </td>
					<td>${map.memberDto.lm_email1} <span style="font-size:28px;">@</span> ${map.memberDto.lm_email2} </td>
				</tr>
				<tr> 
					<td>주소 </td>
					<td>${map.memberDto.lm_address1} ${map.memberDto.lm_address2} </td>
				</tr>
				<tr> 
					<td>연락처 </td>
					<td>${map.memberDto.lm_tel1} </td>
				</tr>
				<tr> 
					<td>생년월일 </td>
					<td>${map.memberDto.lm_birth_year}년${map.memberDto.lm_birth_month}월${map.memberDto.lm_birth_day}일 </td>
				</tr>
				<tr> 
					<td>직업 </td>
					<td>${map.memberDto.lm_job} </td>
				</tr>
				<tr> 
					<td>관심도서 </td>
					<td>${map.memberDto.lm_favor} </td>
				</tr>
			</table>
			
			<br><br><br><br>
			<fieldset class="fieldset_class">

			</fieldset>
			<div id="info_input_button">
<!-- 				<input type="reset" style="cursor:pointer;" value="취소하기" />  -->
				<input type="button" onclick="modifyGo()" style="cursor:pointer;"value="수정하기" />
			</div>

		</form>
	</section>

	<footer>
	<%@ include file="../listfoot.jsp" %>
<!-- 		<div id="footer_wrap"> -->
<!-- 			<div id="footer_cont"> -->
<!-- 				<div id="fl_l"> -->
<!-- 					<a href="#"></a> -->
<!-- 					<p>© COOKIT ALL RIGHTS RESERVED</p> -->
<!-- 				</div> -->
<!-- 				<div id="fl_c"> -->
<!-- 					<ul> -->
<!-- 						<li><a href="#">이용약관</a></li> -->
<!-- 						<li><a href="#">개인정보처리 방침</a></li> -->
<!-- 						<li><a href="#">법적고지</a></li> -->
<!-- 						<li><a href="#">사업자정보 확인</a></li> -->
<!-- 					</ul> -->
<!-- 					<div id="fl_c_info"> -->
<!-- 						<p>씨제이제일제당(주)</p> -->
<!-- 						<p>대표이사 : 손경식,강신호,신현재</p> -->
<!-- 						<p>사업자등록번호 : 104-86-09535</p> -->
<!-- 						<p>주소 : 서울 중구 동호로 330 CJ제일제당 센터 (우) 04560</p> -->
<!-- 						<p>통신판매업신고 중구 제 07767호</p> -->
<!-- 						<p>개인정보보호책임자 : 조영민</p> -->
<!-- 						<p>이메일 : cjon@cj.net</p> -->
<!-- 						<p>호스팅제공자 : CJ올리브네트웍스㈜</p> -->
<!-- 						<p> -->
<!-- 							고객님은 안전거래를 위해 현금등으로 결제시 LG U+ 전자 결제의 매매보호(에스크로) 서비스를 이용하실 수 있습니다. -->
<!-- 							<a href="#">가입 사실 확인</a> -->
<!-- 						</p> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div id="fl_r"> -->
<!-- 					<span>cj그룹계열사 바로가기 ▼</span> -->
<!-- 					<dl> -->
<!-- 						<dt>고객행복센터</dt> -->
<!-- 						<dd>1688-1920</dd> -->
<!-- 					</dl> -->
<!-- 					<a href="#">1:1문의</a> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</footer>
	
</body>
</html>