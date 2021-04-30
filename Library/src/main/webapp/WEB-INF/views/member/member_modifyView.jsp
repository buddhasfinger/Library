<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/style_join02_info_input.css">

<title>회원정보수정</title>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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
	
function modifyCheck(){		

 		var namePtn= /^[가-힣a-zA-Z\s]{1,}$/;
 	if(namePtn.test($("#lm_name").val()) !=true){
 		alert('한 글자 이상의 이름을 넣어주세요');
 		$("#lm_name").next().text('다시 입력해주세요');
 		$("#lm_name").val("");
 		return false;
 	}
	
 	var idPtn = /^[a-z][a-z0-9]{3,10}$/;
 	if(idPtn.test($("#lm_user").val()) !=true){
 		alert('아이디 첫글자는 반드시 영어 소문자,\n영어 소문자와 숫자 조합의 4~10자리로 입력해 주시기 바랍니다.')
 		$("#id").next().text("다시 입력해 주세요");
 		$("#id").val("");
 		return false;
 	}
	
	 var pwPtn = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	if(pwPtn.test($("#lm_pw1").val()) !=true ){
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

	//관심분야 배열저장
 	var favors = [];
 	$('input[name="lm_favor"]:checked').each(function(i){
 		favors.push($(this).val());
 	});
 	
 	var sessionUId = "<%=session.getAttribute("session_user") %>"

	$.ajax({
		url:"/modifyCheck",
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
			"lm_favor":favors
		},
		success : function(data) {
				alert(data.rs);
				location.href="/main?lm_user="+sessionUId;
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
				<h3>회원정보수정</h3>
			</div>

			<h4>
				필수 정보 입력 <span>(* 항목은 필수 항목입니다.)</span>
			</h4>
			<fieldset class="fieldset_class">
				<dl id="join_name_dl">
					<dt>
						<div></div>
						<label for="name">이름</label>
					</dt>
					<dd>
						<input type="text" id="lm_name" name="lm_name" value="${map.memberDto.lm_name}"readonly />
					</dd>
				</dl>
				<dl id="join_id_dl">
					<dt>
						<div></div>
						<label for="id">아이디</label>
					</dt>
					<dd>
						<input type="text" id="lm_user" name="lm_user" minlength="4"
							maxlength="16" value="${map.memberDto.lm_user}"readonly />
						<span>첫글자 반드시 영어 소문자.</span><p> 
						<span>영어 소문자와 숫자 조합의 4~10자리로 입력해 주시기 바랍니다.</span>
					</dd>
				</dl>
				<dl id="join_pw1_dl">
					<dt>
						<div></div>
						<label for="pw1">비밀번호</label>
					</dt>
					<dd>
						<input type="password" id="lm_pw1" name="lm_pw1" minlength="8"required /> 
						<span>비밀번호는 8자 이상이어야 하며 </span><p> 
						<span>숫자/영어 대,소문자/특수문자를 모두 포함해야 합니다.</span>
					</dd>
				</dl>
				<dl id="join_pw2_dl">
					<dt>
						<div></div>
						<label for="pw2">비밀번호 확인</label>
					</dt>
					<dd>
						<input type="password" id="lm_pw2" name="lm_pw2" minlength="8" required /> 
						<span>비밀번호를 다시 한번 입력해 주세요.</span>
					</dd>
				</dl>
				<dl id="join_email1_dl">
					<dt>
						<div></div>
						<label for="mail_id">이메일</label>
					</dt>
					<dd>
						<input type="text" id="lm_email1" name="lm_email1" value="${map.memberDto.lm_email1}" /> <span>@</span>
						<input type="text" id="lm_email2" name="lm_email2" value="${map.memberDto.lm_email2}"  /> 
					</dd>
				</dl>

				<dl id="join_address_dl">
					<dt>
						<div></div>
						<label for="address">주소</label>
					</dt>
					<dd>
						우편번호 : <input type="text" name="zip" 
							style="width: 80px; height: 26px;" />
						<button type="button" style="width: 60px; height: 32px;"
							onclick="openZipSearch()">검색</button><br>
						 주소 : <input type="text" id="lm_address1" name="lmaddress1" value="${map.memberDto.lm_address1}"
							style="width: 300px; height: 30px;"  /><br> 
							상세 : <input type="text" id="lm_address2" name="lmaddress2" value="${map.memberDto.lm_address2}"
							style="width: 300px; height: 30px;" />
					</dd>

				</dl>

				<dl id="join_tel_dl">
					<dt>
						<div></div>
						<label for="f_tell">연락처</label>
					</dt>
					<dd>
						<input type=tel id="lm_tel1" name="lm_tel1" value="${map.memberDto.lm_tel1}" /> 
					</dd>
				</dl>
				<dl id="join_birth_dl">
					<dt>
						
						<label for="birth_year">생년월일</label> 
					</dt>
					<dd>
					<input type="text" id="lm_birth_year" name="lm_birth_year" class="int" maxlength="4" value="${map.memberDto.lm_birth_year}" readonly>
						<span>년</span> 
					<input type="text" id="lm_birth_month" name="lm_birth_month" class="int" maxlength="2" value="${map.memberDto.lm_birth_month}" readonly>
						 <span>월</span> 
					<input type="text" id="lm_birth_day" name="lm_birth_day" class="int" maxlength="2" value="${map.memberDto.lm_birth_day}" readonly>
						 <span>일</span><p>
						 <span>생년월일을 입력해주세요.</span>
					</dd>
				</dl>
				<dl id="join_gender_dl">
					<dt>
						
						<label for="gender">성별</label>
					</dt>
					<dd>
						<div>
<%-- 						<% --%>
<%-- 				if(lm_gender.equals("남성")){%> --%>
<!-- 					<label><input type="radio" name="gender" value="male" checked>남성</label> -->
<!-- 					<label><input type="radio" name="gender" value="female">여성</label><br> -->

<%-- 					<%}else{%> --%>
<!-- 						<label><input type="radio" name="gender" value="male">남성</label> -->
<!-- 						<label><input type="radio" name="gender" value="female"checked>여성</label><br> -->

<%-- 		<%} --%>
<%-- 			%> --%>
						
							<input type="radio" name="lm_gender" id="lm_gender" value="male"/> 
							<label for="male">남성</label> 
							<input type="radio" name="lm_gender" id="lm_gender" value="female"/> 
							<label for="female">여성</label>
						</div>
					</dd>
				</dl>
				<dl id="join_job_dl">
					<dt>
						<label for="job">직업</label>
						
					</dt>
					<dd>
						<select id="lm_job" name="lm_job">
							<option value="" selected>선택</option>
							<option value="worker">회사원</option>
							<option value="slef">자영업자</option>
							<option value="freelancer">프리랜서</option>
							<option value="housewife">전업주부</option>
							<option value="student">학생</option>
							<option value="etc">기타</option>
						</select>
					</dd>
				</dl>
				<dl id="join_job_dl">
					<dt>
						<label for="job">관심분야</label>
					</dt>
					<dd>
						<input type="checkbox" name="lm_favor" id="lm_favor" value="경제"><label>경제</label>
						<input type="checkbox" name="lm_favor" id="lm_favor" value="소설"><label>소설</label>
						<input type="checkbox" name="lm_favor" id="lm_favor" value="IT과학"><label>IT과학</label>
						<input type="checkbox" name="lm_favor" id="lm_favor" value="여행"><label>여행</label>
						<input type="checkbox" name="lm_favor" id="lm_favor" value="종교"><label>종교</label>
						<input type="checkbox" name="lm_favor" id="lm_favor" value="잡지"><label>잡지</label><br>
					</dd>
				</dl>
			</fieldset>

			<fieldset class="fieldset_class">
				

			</fieldset>
			<div id="info_input_button">
				<input type="reset" value="취소하기" style="cursor:pointer;" /> 
				<input type="button" onclick="modifyCheck()" value="수정하기" style="cursor:pointer;" />
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