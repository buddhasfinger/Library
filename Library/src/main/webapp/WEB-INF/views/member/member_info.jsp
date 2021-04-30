<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/style_header.css">
		<link rel="stylesheet" type="text/css" href="css/style_modifing_member_info.css">
		<link rel="stylesheet" type="text/css" href="css/style_footer.css">
		<title>개인정보수정</title>
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
					<li><a href="/notice_list">게시판</a></li>
					<li><a href="#">MY쿡킷</a></li>
				</ul>
				<ul>
					<li>
						<a href="#"><span>장바구니</span></a>
					</li>
					<li>
						<a href="#"><span>메뉴찾기</span></a>
					</li>
				</ul>
			</nav>
		</header>
		
		
		
		
		
		<section>
			<form name="agree" method="get" action="#">
				<div id="subBanner"></div>
				<div id="locationN">
					<ul>
						<li>HOME</li>
						<li>마이페이지</li>
						<li>개인정보수정</li>
					</ul>
				</div>
				
				<div id="sub_top_area">
					<h3>개인정보수정</h3>
				</div>
				
				<h4>
					필수 정보 입력 
					<span>(* 항목은 필수 항목입니다.)</span>
				</h4>
				<fieldset class="fieldset_class">
					<dl id="modify_name_dl">
						<dt>
							<div></div>
							<label for="name">이름</label>
						</dt>
						<dd>
							홍길동
						</dd>
					</dl>
					<dl id="modify_id_dl">
						<dt>
							<div></div>
							<label for="id">아이디</label>
						</dt>
						<dd>
							honghong
						</dd>
					</dl>
					<dl id="modify_pw1_dl">
						<dt>
							<div></div>
							<label for="pw1">비밀번호</label>
						</dt>
						<dd>
							<input type="password" id="lmpw1" name="lmpw1" minlength="8" required />
							<span>영문, 숫자, 특수문자 중 2종류 조합 시 10자리 이상 입력</span>
							<span>영문, 숫자, 특수문자 모두 조합 시 8자리 이상 입력</span>
						</dd>
					</dl>
					<dl id="modify_pw2_dl">
						<dt>
							<div></div>
							<label for="pw2">비밀번호 확인</label>
						</dt>
						<dd>
							<input type="password" id="lmpw2" name="lmpw2" minlength="8" required />
							<span>비밀번호를 다시 한번 입력해 주세요.</span>
						</dd>
					</dl>
					<dl id="modify_mail_dl">
						<dt>
							<div></div>
							<label for="mail_id">이메일</label>
						</dt>
						<dd>
							<input type="text" id="lmemail1" name="lmemail1" value="aaaa" required />
							<span>@</span>
							<input type="text" id="lmemail2" name="lmemail2" value="gmain.com" required />
							<select>
								<option selected>직접입력</option>
								<option>지메일</option>
								<option>네이버</option>
								<option>네이트</option>
								<option>핫메일</option>
								<option>파란</option>
								<option>엠팔</option>
								<option>야후</option>
								<option>드림위즈</option>
								<option>한메일(다음)</option>
							</select>
						</dd>
					</dl>
					
					<dl id="modify_address_dl">
						<dt> 
							<div></div>
							<label for="">주소</label>
						</dt>
						<dd>
							우편번호 : <input type="text" name="zip"
							style="width: 80px; height: 26px;" />
						<button type="button" style="width: 60px; height: 32px;"
							onclick="openZipSearch()">검색</button><br>
						 주소 : <input type="text" id="lmaddress1" name="address1"
							style="width: 300px; height: 30px;" readonly /><br> 
							상세 : <input type="text" id="lmaddress2" name="address2"
							style="width: 300px; height: 30px;" />
						</dd>
						
					</dl>
					
					<dl id="modify_tell_dl">
						<dt>
							<div></div>
							<label for="f_tell">휴대전화</label>
						</dt>
						<dd>
							<input type="text" id="lmtel1" name="lmtel1" maxlength="3" value="010" required />
							<span> - </span>
							<input type="text" id="lmtel2" name="lmtel2" maxlength="4" value="1234" required />
							<span> - </span>
							<input type="text" id="lmtel3" name="lmtel3" maxlength="4" value="5678" required />
						</dd>
					</dl>
					<dl id="modify_birth_dl">
						<dt>
							<div></div>
							<label for="birth_year">생년월일</label>
						</dt>
						<dd>
							<select id="lmbirth_year" name="lmbirth_year" required>
								<option >선택</option>
								<option value="1988">1988</option>
								<option value="1989">1989</option>
								<option selected value="1990">1990</option>
								<option value="1991">1991</option>
								<option value="1992">1992</option>
								<option value="1993">1993</option>
								<option value="1994">1994</option>
								<option value="1995">1995</option>
								<option value="1996">1996</option>
								<option value="1997">1997</option>
								<option value="1998">1998</option>
								<option value="1988">1999</option>
								<option value="1920">2000</option>
							</select>
							<span>년</span>
							<select id="lmbirth_month" name="lmbirth_month" required>
								<option >선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option selected value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
							<span>월</span>
							<select id="lmbirth_day" name="lmbirth_day" required>
								<option >선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option selected value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select>
							<span>일</span>
							<div>
								<input type="radio" name="calendar" id="lunar" value="lunar" checked="checked"/>
								<label for="lunar">양력</label>
								<input type="radio" name="calendar" id="solar" value="solar" />
								<label for="solar">음력</label>
							</div>
						</dd>
					</dl>
					<dl id="modify_gender_dl">
						<dt>
							<div></div>
							<label for="gender">성별</label>
						</dt>
						<dd>
							<div>
								<input type="radio" name="lmgender" id="male" value="male" checked="checked"/>
								<label for="male">남성</label>
								<input type="radio" name="lmgender" id="female" value="female" />
								<label for="female">여성</label>
							</div>
						</dd>
					</dl>
					<dl id="modify_newsletter_dl">
						<dt>
							<div></div>
							<label for="">뉴스레터 수신여부</label>
						</dt>
						<dd>
							<span>이메일을 통한 상품 및 이벤트 정보 수신에 동의합니다.</span>
							<div>
								<input type="radio" name="newletter" id="newletter_y" value="yes" checked="checked"/>
								<label for="newletter_y">예</label>
								<input type="radio" name="newletter" id="newletter_n" value="no" />
								<label for="newletter_n">아니오</label>
							</div>
						</dd>
					</dl>
					
				</fieldset>
				
				<fieldset class="fieldset_class">
					<dl id="modify_job_dl">
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
								<option selected value="student">학생</option>
								<option value="etc">기타</option>						
							</select>
						</dd>
					</dl>
					
				</fieldset>
				<div id="info_input_button">
					<input type="reset" value="취소하기" />
					<input type="submit" value="수정하기" />
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
							<p>고객님은 안전거래를 위해 현금등으로 결제시 LG U+ 전자 결제의 매매보호(에스크로) 서비스를 이용하실 수 있습니다. <a href="#">가입 사실 확인</a></p>
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
			$('[name=address1]').val(data.address);
			$('[name=address2]').val(data.buildingName);
			}
			}).open();
			}
	</script>
	</body>
</html>