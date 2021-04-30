<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style_header.css">
<link rel="stylesheet" type="text/css"
	href="../css/style_join02_info_input.css">
<link rel="stylesheet" type="text/css" href="../css/style_footer.css">
<title>회원가입 - 회원정보입력</title>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function joinCheck(){
	var form = document.signUp;
	var idPtn = /^[a-zA-Z0-9]{8,12}$/;
	var pwPtn = /^[a-zA-Z0-9]{5,10}$/;
	var telPtn = /^\d{4}\-\d{4}$/;
	var namePtn = /^[가-힣]{1,}$/;
}
if(namePtn.test(form.lmname.value)!=true){
	   alert("이름이 잘못 입력되었습니다.! 확인해주세요!");
	   form.name.focus();
	   return false;
	}   
		
		if(idPtn.test(form.lmid.value) !=true){
			alert('입력이 잘못되었습니다. 다시 입력 해주세요.');
		document.getElementById('idText').innerHTML="8자리 이상 영문으로 입력해주세요."
			form.lmid.focus();
			return false;
		}
		if(form.lmpw1.value!=form.lmpw2.value){
			alert('입력이 잘못되었습니다. 다시 입력 해주세요.');
			document.getElementById('pwText').innerHTML="5자리 이상 숫자,영문으로 입력해주세요."
			form.lmpw1.focus();
			return false;
		}
		if(pwPtn.test(form.lmpw1.value) !=true){
			alert('비밀번호가 틀립니다. 다시 확인해주세요.')
			document.getElementById('pw2Text').innerHTML="비밀번호를 확인해주세요."
			form.lmpw1.focus();
			return false;
		}
		if(telPtn.test(form.tel.value) !=true){
			alert('숫자만 입력가능합니다. 다시 입력해주세요.');
			document.getElementById('telText').innerHTML="-포함한 전화번호를 적어주세요."
			form.lmel.focus();
			return false;
		}
		var chk = false;
		for(var i=0;i<form.lmgender.lenght;i++){
			if(form.lmgender[i].checked){
				chk = true;
			}
		}
		if(chk !=true){
			alert('성별을 선택해 주세요.');
			return false;
		}
		form.submit();

</script>	

</head>
<body>
	<header>
		<div id="nav_up">
			<ul>
				 <li><a href="/member/join01">회원가입</a></li>
	 			<li><a href="/member/login">로그인</a></li>
	 			<li><a href="#">고객행복센터</a></li>
	 			<li><a href="#">도서정보검색</a></li>
	 			<li><a href="/admin/admin_login">관리자로그인</a></li>
			</ul>
		</div>
		<nav>
			<a href="#"></a>
			<ul>
				<li><a href="#">COOKIT소개</a></li>
				<li><a href="#">COOKIT메뉴</a></li>
				<li><a href="#">리뷰</a></li>
				<li><a href="#">이벤트</a></li>
				<li><a href="#">MY쿡킷</a></li>
			</ul>
			<ul>
				<li><a href="#"><span>장바구니</span></a></li>
				<li><a href="#"><span>메뉴찾기</span></a></li>
			</ul>
		</nav>
	</header>





	<section>
		<form name="signUp" method="post" action="/joinCheck">
			<div id="subBanner"></div>
			<div id="locationN">
				<ul>
					<li>HOME</li>
					<li>회원가입</li>
					<li>회원정보입력</li>
				</ul>
			</div>

			<div id="sub_top_area">
				<h3>회원가입</h3>
			</div>

			<div id="join_step_div">
				<ul>
					<li><span>STEP.1</span>
						<p>약관동의</p></li>
					<li><span>STEP.2</span>
						<p>회원정보</p></li>
					<li><span>STEP.3</span>
						<p>회원가입완료</p></li>
				</ul>
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
						<input type="text" id="lmname" name="lmname" required />
					</dd>
				</dl>
				<dl id="join_id_dl">
					<dt>
						<div></div>
						<label for="id">아이디</label>
					</dt>
					<dd>
						<input type="text" id="lmid" name="lmid" minlength="4"
							maxlength="16" required />
						<input type="button" id="idCheckBtn" value="중복확인" />
						<span>4~16자리의 영문, 숫자만 사용하실 수 있습니다.</span><p> 
						<span>첫글자는 영문으로 입력해 주세요.</span>
					</dd>
				</dl>
				<dl id="join_pw1_dl">
					<dt>
						<div></div>
						<label for="pw1">비밀번호</label>
					</dt>
					<dd>
						<input type="password" id="lmpw1" name="lmpw1" minlength="8"
							required /> <span>영문, 숫자, 특수문자 중 2종류 조합 시 10자리 이상 입력</span><p> 
							<span>영문,숫자, 특수문자 모두 조합 시 8자리 이상 입력</span>
					</dd>
				</dl>
				<dl id="join_pw2_dl">
					<dt>
						<div></div>
						<label for="pw2">비밀번호 확인</label>
					</dt>
					<dd>
						<input type="password" id="lmpw2" name="lmpw2" minlength="8"
							required /> <span>비밀번호를 다시 한번 입력해 주세요.</span>
					</dd>
				</dl>
				<dl id="join_email1_dl">
					<dt>
						<div></div>
						<label for="mail_id">이메일</label>
					</dt>
					<dd>
						<input type="text" id="lmemail1" name="lmemail1" required /> <span>@</span>
						<input type="text" id="lmemail2" name="lmemail2" required /> 
						<select id="select_email" name="select_email" onchange="selectEmail(this)">
							<option value="1" selected>직접입력</option>
							<option value="gmail.com">지메일</option>
							<option value="naver.com">네이버</option>
							<option value="nate.com">네이트</option>
							<option value="hotmail.com">핫메일</option>
							<option value="korea.com">코리아닷컴</option>
							<option value="empal.com">엠팔</option>
							<option value="yahoo.co.kr">야후</option>
							<option value="dreamwiz.com">드림위즈</option>
							<option value="daum.net">다음</option>
						</select>
					</dd>
				</dl>

				<dl id="join_address_dl">
					<dt>
						<div></div>
						<label for="">주소</label>
					</dt>
					<dd>
						우편번호 : <input type="text" name="zip"
							style="width: 80px; height: 26px;" />
						<button type="button" style="width: 60px; height: 32px;"
							onclick="openZipSearch()">검색</button><br>
						 주소 : <input type="text" id="lmaddress1" name="lmaddress1"
							style="width: 300px; height: 30px;" readonly /><br> 
							상세 : <input type="text" id="lmaddress2" name="lmaddress2"
							style="width: 300px; height: 30px;" />
					</dd>

				</dl>

				<dl id="join_tel_dl">
					<dt>
						<div></div>
						<label for="f_tell">휴대전화</label>
					</dt>
					<dd>
						<input type="text" id="lmtel1" name="lmtel1" maxlength="3"
							required /> <span> - </span> 
							<input type="text" id="lmtel2" name="lmtel2" maxlength="4" required /> <span> - </span> 
							<input type="text" id="lmtel3" name="lmtel3" maxlength="4" required />
					</dd>
				</dl>
				<dl id="join_birth_dl">
					<dt>
						<div></div>
						<label for="birth_year">생년월일</label>
					</dt>
					<dd>
						<select id="lmbirth_year" name="lmbirth_year" required>
							<option selected>선택</option>
							<option value="1980">1980</option>
							<option value="1981">1981</option>
							<option value="1982">1982</option>
							<option value="1983">1983</option>
							<option value="1984">1984</option>
							<option value="1985">1985</option>
							<option value="1986">1986</option>
							<option value="1987">1987</option>
							<option value="1988">1988</option>
							<option value="1989">1989</option>
							<option value="1990">1990</option>
							<option value="1991">1991</option>
							<option value="1992">1992</option>
							<option value="1993">1993</option>
							<option value="1994">1994</option>
							<option value="1995">1995</option>
							<option value="1996">1996</option>
							<option value="1997">1997</option>
							<option value="1998">1998</option>
							<option value="1999">1999</option>
							<option value="2000">2000</option>
							<option value="2001">2001</option>
							<option value="2002">2002</option>
							<option value="2003">2003</option>
						</select> <span>년</span> 
						<select id="lmbirth_month" name="lmbirth_month" required>
							<option selected>선택</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select> <span>월</span> 
						<select id="lmbirth_day" name="lmbirth_day" required>
							<option selected>선택</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select> <span>일</span>
					</dd>
				</dl>
				<dl id="join_gender_dl">
					<dt>
						<div></div>
						<label for="gender">성별</label>
					</dt>
					<dd>
						<div>
							<input type="radio" name="lmgender" id="male" value="male" checked="checked" /> 
							<label for="male">남성</label> 
							<input type="radio" name="lmgender" id="female" value="female" /> 
							<label for="female">여성</label>
						</div>
					</dd>
				</dl>
			</fieldset>

			<fieldset class="fieldset_class">
				<dl id="join_job_dl">
					<dt>
						<label for="job">직업</label>
					</dt>
					<dd>
						<select id="lmjob" name="lmjob">
							<option selected>선택</option>
							<option value="worker">회사원</option>
							<option value="slef">자영업자</option>
							<option value="freelancer">프리랜서</option>
							<option value="housewife">전업주부</option>
							<option value="student">학생</option>
							<option value="etc">기타</option>
						</select>
					</dd>
				</dl>

			</fieldset>
			<div id="info_input_button">
				<input type="reset" value="취소하기" /> 
				
				<input type="submit" class="join_btn" value="가입하기" />
			</div>

		</form>
	</section>

	<footer>
		<div id="footer_wrap">
			<div id="footer_cont">
				<div id="fl_l">
					<a href="#"></a>
					<p>© COOKIT ALL RIGHTS RESERVED</p>
				</div>
				<div id="fl_c">
					<ul>
						<li><a href="#">이용약관</a></li>
						<li><a href="#">개인정보처리 방침</a></li>
						<li><a href="#">법적고지</a></li>
						<li><a href="#">사업자정보 확인</a></li>
					</ul>
					<div id="fl_c_info">
						<p>씨제이제일제당(주)</p>
						<p>대표이사 : 손경식,강신호,신현재</p>
						<p>사업자등록번호 : 104-86-09535</p>
						<p>주소 : 서울 중구 동호로 330 CJ제일제당 센터 (우) 04560</p>
						<p>통신판매업신고 중구 제 07767호</p>
						<p>개인정보보호책임자 : 조영민</p>
						<p>이메일 : cjon@cj.net</p>
						<p>호스팅제공자 : CJ올리브네트웍스㈜</p>
						<p>
							고객님은 안전거래를 위해 현금등으로 결제시 LG U+ 전자 결제의 매매보호(에스크로) 서비스를 이용하실 수 있습니다.
							<a href="#">가입 사실 확인</a>
						</p>
					</div>
				</div>
				<div id="fl_r">
					<span>cj그룹계열사 바로가기 ▼</span>
					<dl>
						<dt>고객행복센터</dt>
						<dd>1688-1920</dd>
					</dl>
					<a href="#">1:1문의</a>
				</div>
			</div>
		</div>
	</footer>
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
</body>
</html>