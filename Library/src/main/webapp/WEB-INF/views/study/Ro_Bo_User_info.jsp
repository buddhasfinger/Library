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
	
</style>

<script type="text/javascript">
function userCheck(){
	alert('아이디중복 확인');
	$.ajax({
		url:"/userCheck",
		type:"post",
		traditional:true,
		data:{
			"lm_user":$("#lm_user").val(),
		},
		success : function(data) {
				alert(data.rs);
		},
		error : function() {
			alert("사용가능한 ID입니다");
		},
	});
}//userCheck
	
function joinCheck(){		

		var namePtn= /^[가-힣a-zA-Z\s]{1,}$/;
	if(namePtn.test($("#lm_name").val()) !=true){
		alert('한 글자 이상의 이름을 넣어주세요');
		$("#lm_name").next().text('다시 입력해주세요');
		$("#lm_name").val("");
		return false;
	}

	
	var idPtn = /^[a-z][a-z0-9]{3,10}$/;
// 	var idPtn = /^[a-z][a-zA-Z]{3,10}$/;
	if(idPtn.test($("#lm_user").val()) !=true){
// 		alert('! 첫글자 반드시 영어 소문자,\n영어 대/소문자 조합의 3~10자리로 입력해 주시기 바랍니다.')
		alert('아이디 첫글자는 반드시 영어 소문자,\n영어 소문자와 숫자 조합의 4~10자리로 입력해 주시기 바랍니다.')
		$("#id").next().text("다시 입력해 주세요");
		$("#id").val("");
		return false;
	}
	
// 	var pwPtn = /^(?=.*[~`!@#$%^&*()_\-+={}\[\]\\\|:;"\'<>,.?\/])(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{4,}$/;
	var pwPtn = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	if(pwPtn.test($("#lm_pw1").val()) !=true ){
// 		alert("특수문자,영문소대문자,숫자 1개이상 포함한 4자리수 이상 비밀번호 설정해주세요");
		alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
		$("#lm_pw1").next().text('다시 입력해 주세요');
		$("#lm_pw1").val("");
		$("#lm_pw1").val("");
		return false;		
	}

// 	//패스워드 일치 확인
	if($("#lm_pw1").val() != $("#lm_pw2").val()){
		alert('비밀번호가 일치하지 않습니다.');
		$("#lm_pw2").val("");
		return false;
	}

	var em1 = $("#lm_email1").val();
	var em2 = $("#lm_email2").val();
	if(em1=='' || em2==''){
		alert('이메일 주소를 넣어주세요');
		$("#lm_email1").focus();
		return false;
	}
	
	var add1 = $("#lm_address1").val();
	var add2 = $("#lm_address1").val();
	if(add1=='' || add2==''){
		alert('주소를 검색해 주세요');
		return false;
	}
	
	var telPtn = /^\d{2,3}\-\d{3,4}\-\d{4}$/;
	if(telPtn.test($("#lm_tel1").val()) != true){
		alert('전화번호(- 포함)를 입력해 주세요!');
		$("#lm_tel1").next().text('다시 입력해 주세요');
		$("#lm_tel1").val("");
		return false;
	}


	$.ajax({
		url:"/joinCheck",
		type:"post",
		traditional:true,
		data:{
			"lm_user":$("#lm_user").val(),
			"lm_pw1":$("#lm_pw1").val(),
			"lm_pw2":$("#lm_pw2").val(),
			"lm_name":$("#lm_name").val(),
			"lm_email1":$("#lm_email1").val(),
			"lm_email2":$("#lm_email2").val(),
			"lm_tel1":$("#lm_tel1").val(),
			"lm_address1":$("#lm_address1").val(),
			"lm_address2":$("#lm_address2").val(),
			"lm_birth_year":$("#lm_birth_year").val(),
			"lm_birth_month":$("#lm_birth_month").val(),
			"lm_birth_day":$("#lm_birth_day").val(),
			"lm_gender":$('input[name="lm_gender"]:checked').val(),
			"lm_job":$("#lm_job").val(),
			"lm_date":$("#lm_date").val(),
			
		},
		success : function(data) {
				alert(data.rs);
				location.href="/main";
		},
		error : function() {
			alert("회원가입이 실패하였습니다. 관리자에게 문의 바랍니다.");
		},
	});
	
}//joinCheck
	

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
		location.href="/member/member_modifyView?lm_id='${map.memberDto.lm_id}'";
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
				<h3>스터디룸 예약자 정보</h3>
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
					<td>${map.memberDto.lm_email1} ${map.memberDto.lm_email2} </td>
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
			
			</table>
			
			<br><br><br><br>
			<fieldset class="fieldset_class">

			</fieldset>
			<div id="info_input_button">
				<input type="reset" value="취소하기" /> 
				<input type="button" onclick="modifyGo()" value="수정하기" />
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